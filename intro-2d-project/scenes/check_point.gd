extends Area2D

# We will create our own signal to trigger the flag to fly out. 
# Once the player has collected all of the Strawberries in the level, 
# the player will emit the trigger signal.

signal trigger
var level_complete = false



func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("flag_fly")
	level_complete = true
	

func _on_body_entered(body: Node2D) -> void:
	if level_complete:
		get_tree().quit()

# own custom signal, could be seen in Node -> Signals
func _on_trigger() -> void:
	$AnimatedSprite2D.play("trigger")
