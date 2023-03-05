extends Node2D

var asteroidpath = preload("res://asteroid.tscn");
var asteroid1path = preload("res://asteroid1.tscn");
var asteroid_max : int = Globalscr.ast_c;
var asteroid_count : int;
var vp;

func _exit_tree():
	queue_free();

func _ready():
	vp = get_viewport().size
	gen_asteroids();
	
func _process(delta):
	if Globalscr.count == 0:
		get_tree().change_scene("res://ScoreUI.tscn");
	

func gen_asteroids():
	randomize();
	var ast : int = randi()%(asteroid_max/2) + 1;
	for i in range(ast):
		var asteroid = asteroidpath.instance();
		asteroid.connect("asteroid_destroyed",self,"_on_asteroid_destroyed");
		asteroid.position = get_rand_pos();
		add_child(asteroid);
	for i in range(asteroid_max - ast):
		var asteroid1 = asteroid1path.instance();
		asteroid1.position = get_rand_pos();
		add_child(asteroid1);
		
	
	Globalscr.count = ast * 2 + (asteroid_max - ast);
	
	

func get_rand_pos() -> Vector2:
	var pos : Vector2;
	randomize();
	var x : int = randi()%10;
	var y : int = randi()%10;
	if x < 5:
		pos.x = 0;
	else:
		pos.x = vp.x;
	if y < 5:
		pos.y = 0;
	else:
		pos.y = vp.y;
	return pos;

func _on_asteroid_destroyed(pos:Vector2):
	for i in range(2):
		var asteroid1 = asteroid1path.instance();
		asteroid1.position = pos;
		get_node(".").call_deferred("add_child",asteroid1);
	
