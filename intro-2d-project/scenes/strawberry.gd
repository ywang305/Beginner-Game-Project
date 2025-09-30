extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play('idle')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player Group'):
		body.add_score(1)
		queue_free() # The built-in queue_free() function deletes a node from memory at the end of the current frame as soon as it is safe to do so. It is the recommended method for removing nodes from the scene.
