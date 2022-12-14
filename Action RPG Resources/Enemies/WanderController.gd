extends Node2D

export(int) var wander_range = 32

onready var start_position = global_position
onready var target_position = global_position

onready var timer = $Timer

func _ready():
	update_target_position() #Para que vuelvan a su posición después de seguirte

func update_target_position():
	var target_vector = Vector2(rand_range(-wander_range,wander_range), rand_range(-wander_range,wander_range))
	target_position = start_position + target_vector #Así el target porsition siempre será relativo al start position

func get_time_left():
	return timer.time_left

func start_wander_timer(duration):
	timer.start(duration)

func _on_Timer_timeout():
	update_target_position()
