class_name Cannon
extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var lighthouse = get_node("/root/Game/Lighthouse")

@export var bullet_scene: PackedScene
@export var death_particle: PackedScene

@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D

var enemies: Array[Enemy] = []
var is_attacking: bool = false 
var is_active: bool = true

func _ready() -> void:
	$AttackArea.enemy_entered.connect(_on_enemy_entered)
	$AttackArea.enemy_exited.connect(_on_enemy_exited)
	
	var direction = global_position.direction_to(lighthouse.global_position)
	
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true

func _on_enemy_entered(enemy: Enemy) -> void:
	enemies.append(enemy)
	_attack_enemy() #

func _on_enemy_exited(enemy: Enemy) -> void:
	enemies.erase(enemy)

func _attack_enemy() -> void:
	if enemies.size() > 0 and not is_attacking and is_active:
		is_attacking = true  
		
		cpu_particles_2d.emitting = true
		
		var enemy: Enemy = enemies.front()
		var bullet: Bullet = bullet_scene.instantiate()
		add_child(bullet)
		bullet.set_direction(global_position.direction_to(enemy.global_position))
		
		await get_tree().create_timer(1.0).timeout 
		
		is_attacking = false
		cpu_particles_2d.emitting = false
		enemies.erase(enemy) 
		
		_attack_enemy() 
