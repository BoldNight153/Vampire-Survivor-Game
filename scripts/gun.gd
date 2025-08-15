extends Area2D

var enemies_in_range : Array[Node2D] = []
var target_enemy : CharacterBody2D = null

func _process(delta: float) -> void:
	pass

func  _physics_process(delta: float) -> void:
	enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		target_enemy = enemies_in_range.front() as CharacterBody2D
		look_at(target_enemy.global_position)
	

func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	
	new_bullet.global_position = %Muzzle.global_position
	new_bullet.global_rotation = %Muzzle.global_rotation
	
	%Muzzle.add_child(new_bullet)


func _on_timer_timeout() -> void:
	if enemies_in_range.size() > 0:
		shoot()
