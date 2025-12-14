extends CharacterBody2D

@export var chase_speed = 1
@export var chase_end_radius = 1
@export var bad = true
var skill_issue = false

func _process(delta):
	
	var mousepos = get_global_mouse_position()
	if global_position.distance_to(mousepos) > chase_end_radius:
		var angle = global_position.angle_to_point(mousepos)
		velocity.x = chase_speed*cos(angle)
		velocity.y = chase_speed*sin(angle)
		move_and_slide()

			
	if !bad:
		var collisions = get_slide_collision_count()
		for i in collisions:
			var coll = get_slide_collision(i)
			if "Bad" in coll.get_collider().get_groups() and !skill_issue:
				%Label.visible = true
				%ButtAssIdiot.visible = true
				%humpscaré.play()
				%ost.stop()
				skill_issue = true
		
		


func _on_ost_finished() -> void:
	if !skill_issue:
		%ost.play()# Replace with function body.
