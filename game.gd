extends Node2D

@export var cannon_scene: PackedScene

var cannon: Cannon
var cannon_active: bool = false  

func spawn_mob():
	var new_mob = preload("res://characters/enemy/enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func _ready() -> void:
	pass  #
	

func _process(delta: float) -> void:
	if cannon_active and cannon:
		cannon.global_position = get_global_mouse_position()

func _on_timer_timeout() -> void:
	spawn_mob()
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and cannon_active:
		if cannon:
			cannon.global_position = get_global_mouse_position()
			cannon.is_active = true
			cannon_active = false 
			print("Cañón colocado en:", cannon.global_position)

func spawn_cannon() -> void:
	if GameManager.coins >= 5 and not cannon_active: 
		cannon = cannon_scene.instantiate()
		cannon_active = true 
		cannon.is_active = false
		add_child(cannon) 
		print("Monedas restantes:", GameManager.coins)
	pass
	
