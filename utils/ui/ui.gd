extends CanvasLayer

@onready var button: Button = $Main/Button
@export var coins_label: Label
@onready var game_scene = get_node("/root/Game")

func _ready() -> void:
	GameManager.update_coins.connect(update_coins)

func _physics_process(delta: float) -> void:
	button.disabled = (GameManager.coins < 5)

func update_coins(coins: int) -> void:
	coins_label.text = str(coins)
	
func _on_button_pressed() -> void:
	game_scene.spawn_cannon() 
	GameManager.buy_cannon()

	pass
