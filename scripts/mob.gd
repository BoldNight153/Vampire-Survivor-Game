extends CharacterBody2D

var health : float = 10.0
var direction : Vector2 = Vector2.ZERO
var distance_to_player : float = 0.0
var level : int = 1

@onready var player = get_node("/root/Game/Player") as CharacterBody2D

func _ready() -> void:
	var player_level : int = 1
	if has_method("get_level"):
		player_level = player.level.get()
	
	var higher_lvl_chance = randf()
	
	var rand_lvl : int = int(randfn(player_level, 5.0))
	
	level = rand_lvl
	

func _physics_process(delta: float) -> void:
	distance_to_player = global_position.distance_to(player.global_position)
	direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	if distance_to_player > 104:
		move_and_slide()
	
func take_damage() -> void:
	health -= 1.0
	if health <= 0.0:
		get_parent().remove_child(self)
		queue_free()
