extends Node

var last_level_visited : int 

func visit(level_ID : int) -> void:
	last_level_visited = level_ID
	print("visited :")
	print(level_ID)
