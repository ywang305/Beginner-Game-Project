extends CharacterBody2D

const SPEED = 75
var direction = 1
var health = 1

func _physics_process(delta: float) -> void:
	add_gravity(delta)
	update_direction()
	move_and_slide()
	reverse_direction()

func add_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
		
func update_direction():
	velocity.x = SPEED * direction
	
func reverse_direction():
	if is_on_wall():
		direction = -direction
