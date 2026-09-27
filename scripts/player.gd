extends CharacterBody2D

@export var push_force: float = 20.0

#followed tutorial on how to move character by following mouse cursor
func _physics_process(delta: float) -> void:
	#track mouse position and subtrack player position
	var vel: Vector2 = (get_global_mouse_position() - global_position)
	#set player's max speed
	#if player is close to the mouse, slows down the player
	if vel.length() > 100:
		vel = vel.normalized() * 100
	
	velocity = vel
	move_and_slide() #moves the CharacterBody2D a.k.a the player
	_push_rigid_bodies()
	
#followed a tutorial on how to move the ball with player body
func _push_rigid_bodies():
	for i in get_slide_collision_count():
		var collision: KinematicCollision2D = get_slide_collision(i)
		var collider: Object = collision.get_collider()
		if collider is RigidBody2D:
			var push_direction: Vector2 = -collision.get_normal()
			collider.apply_central_impulse(push_direction * push_force)
