extends PermanentDrawnBody

signal appear
signal disappear

func _process(_delta: float) -> void:
	rotate(0.1)

func when_drawn() -> void:
	appear.emit()

func when_erased() -> void:
	disappear.emit()
