class_name MuteCard
extends PermanentDrawnBody

func when_drawn() -> void:
	AudioServer.set_bus_mute(1, true)

func when_erased() -> void:
	AudioServer.set_bus_mute(1, false)
