extends Node

const draw_limits : Array[int] = [2, 5, 5, 4, 1]
const erase_limits : Array[int] = [1, 0, 1, 1, 0]
const initial_permanents_in : Array[int] = [
	6,
	5,
	4,
	16,
	10
]

# Level vars
var last_level_visited : int 
var level_done : Array[bool] = [false,false,false,false,false]
var level_done_draw_limit : Array[bool] = [false,false,false,false,false]
var level_done_erase_limit : Array[bool] = [false,false,false,false,false]
var level_done_erase_all : Array[bool] = [false,false,false,false,false]
var level_done_secret : Array[bool] = [false,false,false,false,false]
var levels_by_ID : Array[StringName] = [
	"res://scenes/levels/main_menu_level.tscn",
	"res://scenes/levels/level_1.tscn",
	"res://scenes/levels/level_2.tscn",
	"res://scenes/levels/level_3.tscn",
	"res://scenes/levels/level_4.tscn",
	"res://scenes/levels/level_5.tscn"]

# Other vars
var drawings : int = 0
var erasures : int = 0
var current_permanents_amount : int = 0
var secret_found : bool = false

# Character
var current_character : int = 0

func visit(level_ID : int) -> void:
	last_level_visited = level_ID
	reset_drawings_and_erasures()
	secret_found = false
	if level_ID > 0:
		current_permanents_amount = initial_permanents_in[level_ID-1]
	print("visited : " + str(level_ID))
	print(level_done)
	print(level_done_draw_limit)
	print(level_done_erase_limit)
	print(level_done_erase_all)
	print(level_done_secret)


func complete(level_ID : int) -> void:
	if level_ID > 0:
		var level = level_ID-1
		
		# Completed star
		level_done[level] = true
		
		# Draw limit star
		if drawings <= draw_limits[level]:
			level_done_draw_limit[level] = true
		
		# Erase limit star
		if erasures <= erase_limits[level]:
			level_done_erase_limit[level] = true
		
		# Erase all star (<=1 because of the door)
		if current_permanents_amount <= 1:
			level_done_erase_all[level] = true
		
		# Secret star
		if secret_found:
			level_done_secret[level] = true

# Draw and erase limit handling
func add_drawing() -> void:
	drawings += 1

func add_erasure() -> void:
	erasures += 1

func reset_drawings_and_erasures() -> void:
	drawings = 0
	erasures = 0

# Erase_all handling
func add_permanent() -> void:
	current_permanents_amount += 1

func sub_permanent() -> void:
	current_permanents_amount -= 1

# Secret handling
func find_secret() -> void:
	secret_found = true

# Check unlocked characters
func check_completion(ID : int) -> bool:
	
	var array_check : Array[bool]= []
	
	match ID:
		1:
			array_check = level_done
		2:
			array_check = level_done_draw_limit
		3:
			array_check = level_done_erase_limit
		4:
			array_check = level_done_erase_all
		5:
			array_check = level_done_secret
		6:
			if check_completion(1) and check_completion(2) and check_completion(3) and check_completion(4):
				return true
			else: return false
	
	for elem in array_check:
		if not elem:
			return false
	
	return true

# Change character
func change_character(ID : int) -> void:
	current_character = ID
