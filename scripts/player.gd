extends CharacterBody2D

var direction : Vector2 = Vector2.ZERO

var experiance : int = 1

@export var level : int = 1:
	get():
		return level

var core_health : float = 100.0
@export var current_health: float = 100:
	set(new_health):
		current_health = clamp(new_health, 0, core_health)
	get():
		return current_health
var before_dmg_health : float = current_health


func _process(delta: float) -> void:
	flip_node_v($Gun, $Gun/CollisionShape2D/WeaponPivot/Pistol)
	flip_node_v(%HappyBoo, %HappyBoo)
	

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = (direction * 600.0)
	
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()

func flip_node_v(node_ref : Node, node_to_flip : Node):
		
	if "global_rotation_degrees" in node_ref and "flip_v" in node_to_flip:
		if node_ref.global_rotation_degrees > 90 or node_ref.global_rotation_degrees < -90:
			node_to_flip.flip_v = true
		else:
			node_to_flip.flip_v = false
	elif "scale" in node_to_flip:
		if direction.x < 0.0:
			node_to_flip.scale.x = -1
		else:
			node_to_flip.scale.x = 1
			
	else:
		print("cannot flip the node " + node_to_flip.name )
		pass
	
