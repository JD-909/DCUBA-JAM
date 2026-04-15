class_name MuteCard
extends PermanentDrawnBody

@export var bus_mute : int

func when_drawn() -> void:
	AudioServer.set_bus_mute(bus_mute, true)

func when_erased() -> void:
	AudioServer.set_bus_mute(bus_mute, false)
