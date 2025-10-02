extends Node2D
@onready var player = $Player
@onready var collectibles_node = $Collectibles

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.level_strawberries = collectibles_node.get_child_count()
