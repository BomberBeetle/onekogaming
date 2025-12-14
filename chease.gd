extends Area2D

var cheazes = 0


func _ready() -> void:
	teleport()

func _process(delta: float) -> void:
	global_position += Vector2(0.01, 0.01)
	
func teleport():
	global_position = Vector2(randi_range(%start.global_position.x, %end.global_position.x), randi_range(%start.global_position.y, %end.global_position.y))
	
func collect():
	cheazes+=1
	%CHeasesLabel.text= "you have %.2f cheazy points" % [1.5**cheazes]
	teleport()


func _on_body_entered(body: Node2D) -> void:
	if body == %Good:
		collect()
	elif body == %House:
		teleport()
	
