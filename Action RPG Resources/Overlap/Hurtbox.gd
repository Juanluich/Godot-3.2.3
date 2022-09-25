extends Area2D

const HitEffect = preload("res://Action RPG Resources/Effects/HitEffect.tscn")

var invincible = false setget set_invincible

onready var timer = $Timer
onready var collisionShape = $CollisionShape2D

signal invicinbility_started
signal invincibility_ended

func set_invincible(value):
	invincible = value
	if invincible == true:
		emit_signal("invicinbility_started")
	else:
		emit_signal("invincibility_ended")
		
func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)

func create_hit_effect(_area):
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position


func _on_Timer_timeout():
	self.invincible = false


func _on_Hurtbox_invicinbility_started():
	collisionShape.set_deferred("monitorable", true)  #No lo llego a enteder

	
func _on_Hurtbox_invincibility_ended():
	collisionShape.disabled = false



