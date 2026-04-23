extends CharacterBody2D
@onready var jump_count = 0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jumpaudio: AudioStreamPlayer = $jumpaudio


const SPEED = 1000.0
const JUMP_VELOCITY = -1500.0

@onready var doublejump: AudioStreamPlayer = $doublejump

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 3.3
		
	else:
		jump_count = 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jump_count < 2:
		
		jump_count += 1
	
		velocity.y = JUMP_VELOCITY 
		if jump_count >0:
			jumpaudio.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction > 0 :
		animated_sprite_2d.flip_h = false
	elif direction < 0 :
		animated_sprite_2d.flip_h = true
		
	if is_on_floor():
		
		
		if direction == 0:
			animated_sprite_2d.play("idel")
		else:
			animated_sprite_2d.play("walking")
			
	else: 
		
		if jump_count > 1:
			animated_sprite_2d.play("doube jump")
			doublejump.play()
			
			
			JUMP_VELOCITY + 50
		
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
