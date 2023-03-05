extends Area2D

var velocity:Vector2;
class_name Bullet

func _process(delta):
	position += velocity*delta;


func _on_VisibilityNotifier2D_screen_exited():
	pass # Replace with function body.
	queue_free();


func _on_bullet_area_entered(area):
	pass # Replace with function body.
	queue_free();
