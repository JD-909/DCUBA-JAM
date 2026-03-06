extends Node

const draw_limits : Array[int] = []
const erase_limits : Array[int] = []

var last_level_visited : int 
var level_done : Array[bool] = [false,false,false,false]
var level_done_draw_limit : Array[bool] = [false,false,false,false]
var level_done_erase_limit : Array[bool] = [false,false,false,false]
var level_done_erase_all : Array[bool] = [false,false,false,false]
var level_done_secret : Array[bool] = [false,false,false,false]

func visit(level_ID : int) -> void:
	last_level_visited = level_ID
	print("visited :")
	print(level_ID)
