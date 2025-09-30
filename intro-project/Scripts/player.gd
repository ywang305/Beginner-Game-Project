extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GreetingsLabel.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		$GreetingsLabel.show()
		if event.button_index == MOUSE_BUTTON_LEFT:
			$GreetingsLabel.text = "Hi Folks!"
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			$GreetingsLabel.text = "Godot is Good!"
			
	elif event is InputEventKey:
		if event.keycode == KEY_ENTER:
			$GreetingsLabel.show()
			$GreetingsLabel.text = "Hello World!"
			
