class_name DrawnCard
extends PermanentDrawnBody

func when_drawn() -> void:
	Global.sub_permanent()
	Global.find_secret()

func when_erased() -> void:
	Global.add_permanent()
