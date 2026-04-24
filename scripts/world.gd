extends Node2D
@onready var player = $Player
@onready var panel: Panel = $Panel
@onready var color_rect: ColorRect = $Player/ColorRect
@onready var camera_2d: Camera2D = $Player/Camera2D
@onready var label: Label = $Label

@onready var timercont: Control = $timercont
@onready var istr: Label = $istr

func _ready():
	
	player.set_physics_process(false)
	
	
	
func  _process(delta):
	if Input.is_action_just_pressed("jump"):
		player.set_physics_process(true)
		panel.visible = false
		color_rect.visible = false
		istr. visible = true
		
	
	


func _on_winxone_body_entered(body: Node2D) -> void:
	if body.is_in_group('player'):
		timercont.timer_stop()
		camera_2d.zoom  = camera_2d.zoom * 0.6
		label.visible = true
		
		


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")
