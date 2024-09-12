extends CharacterBody2D

var health : float = 3.0

@onready var player = get_node("/root/Game/Player") as CharacterBody2D

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()
	
func take_damage() -> void:
	health -= 1.0
	print(health)
