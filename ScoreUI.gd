extends Control

func _ready():
	$score.text = str(Globalscr.score);


func _on_Restart_timeout():
	pass # Replace with function body.
	Globalscr.ast_c += 5;
	get_tree().change_scene("res://Main.tscn");
