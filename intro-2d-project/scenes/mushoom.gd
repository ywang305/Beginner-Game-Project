extends CharacterBody2D

const SPEED = 75
var direction = 1
var health = 3

func _physics_process(delta: float) -> void:
	add_gravity(delta)
	update_position()
	move_and_slide()
	platform_edge()
	reverse_direction()
	mushroom_death()

func add_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
		
func update_position():		
	velocity.x = SPEED * direction
	$AnimatedSprite2D.play("run")
	
func reverse_direction():
	if is_on_wall():
		direction = -direction

func platform_edge():
	if not $RayCast2D.is_colliding():
		direction = -direction
		$RayCast2D.position.x *= -1


func _on_death_zone_body_entered(body: Node2D) -> void:
	if "Player" in body.name: # body.name -> alternative way to identify player, instead of using "Player Group"
		body.velocity.y = -500
		health -= 1

func _on_hurt_player_zone_body_entered(body: Node2D) -> void:
	if "player" in body.name:
		body.hurt()

func mushroom_death():
	if health <= 0:
		$CollisionShape2D.disabled = true
		$HurtPlayerZone.monitoring = false
		$AnimatedSprite2D.play("death")

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == 'death':
		queue_free()
