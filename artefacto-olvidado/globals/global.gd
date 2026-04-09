extends Node

# Nota para el futuro (hoy 24/3/2026) Ver de hacer skins que solo verifiquen
# las estrellas de UN mundo aparte del que verifica de todos los mundos

const draw_limits : Array[Array] = [
	[],
	[2, 5, 5, 4, 1], 
	[2,1]
	]
const erase_limits : Array[Array] = [
	[],
	[1, 0, 1, 1, 0], 
	[1,4]
	]
const initial_permanents_in : Array[Array] = [
	[],
	[6, 5, 4, 16, 10],
	[8, 27]
	]

# Color by world
const color_by_world : Array[Color] = [
	Color8(183,183,255),
	Color8(183,183,255),
	Color8(255,187,187)
]

# Level vars
var last_level_visited : Vector2 
var level_done : Array[Array] = [
	[],
	[false,false,false,false,false],
	[false,false]
	]
var level_done_draw_limit : Array[Array] = [
	[],
	[false,false,false,false,false],
	[false,false]
	]
var level_done_erase_limit : Array[Array] = [
	[],
	[false,false,false,false,false],
	[false,false]
	]
var level_done_erase_all : Array[Array] = [
	[],
	[false,false,false,false,false],
	[false,false]
	]
var level_done_secret : Array[Array] = [
	[],
	[false,false,false,false,false],
	[false,false]
	]
var levels_by_ID : Array[Array] = [
	["res://scenes/levels/main_menu_level.tscn"],
	["res://scenes/levels/level_1.tscn", "res://scenes/levels/level_2.tscn", "res://scenes/levels/level_3.tscn", "res://scenes/levels/level_4.tscn", "res://scenes/levels/level_5.tscn"],
	["res://scenes/levels/level_6.tscn", "res://scenes/levels/level_7.tscn"]
	]

# Other vars
var drawings : int = 0
var erasures : int = 0
var current_permanents_amount : int = 0
var secret_found : bool = false

# Character
var current_character : int = 0

func visit(level_ID : Vector2) -> void:
	last_level_visited = level_ID
	reset_drawings_and_erasures()
	secret_found = false
	if level_ID[0] > 0:
		# La acntidad de permanentes se busca en el array
		current_permanents_amount = initial_permanents_in[int(level_ID[0])][int(level_ID[1])]
	print("visited : " + str(level_ID))
	print(level_done)
	print(level_done_draw_limit)
	print(level_done_erase_limit)
	print(level_done_erase_all)
	print(level_done_secret)


func complete(level_ID : Vector2) -> void:
	if level_ID[0] > 0:
		
		# Completed star
		level_done[int(level_ID[0])][int(level_ID[1])] = true
		
		# Draw limit star
		if drawings <= draw_limits[int(level_ID[0])][int(level_ID[1])]:
			level_done_draw_limit[int(level_ID[0])][int(level_ID[1])] = true
		
		# Erase limit star
		if erasures <= erase_limits[int(level_ID[0])][int(level_ID[1])]:
			level_done_erase_limit[int(level_ID[0])][int(level_ID[1])] = true
		
		# Erase all star (<=1 because of the door)
		if current_permanents_amount <= 1:
			level_done_erase_all[int(level_ID[0])][int(level_ID[1])] = true
		
		# Secret star
		if secret_found:
			level_done_secret[int(level_ID[0])][int(level_ID[1])] = true

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
	
	var array_check : Array[Array]= []
	
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
		for item in elem:
			if not item:
				return false
	
	return true

# Change character
func change_character(ID : int) -> void:
	current_character = ID
