extends CharacterBody2D

const GRAVITY: float = 600.0
const POWER: float = -200.0

@onready var plane: AnimatedSprite2D = $AnimatedSprite2D
@onready var animate_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()
	
	if is_on_floor() == true:
		die()
		
func die() -> void:
	plane.stop()
	set_physics_process(false)

func fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER
		animate_player.play("power")
