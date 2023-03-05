extends Area2D

var velocity : Vector2 ;
var vp;
var i : int = 0 ;
var j : int = 0 ;
signal asteroid_destroyed;

func _ready():
	randomize();
	rand_dir();
	velocity = Vector2( i * rand_range(50,200), j * rand_range(50,200));
	vp = get_viewport().size;
	
	
func _process(delta):
	position += velocity * delta;
	
	
func wrap():
	if position.x > vp.x :
		position.x = 0;
	if position.x < 0 :
		position.x = vp.x;
	if position.y > vp.y :
		position.y = 0;
	if position.y < 0 :
		position.y = vp.y;
	
func rand_dir():
	i = randi()%10;
	j = randi()%10;
	if i < 5 :
		i = -1;
	else :
		i = 1;
	if j < 5 :
		j = -1;
	else :
		j = 1;


func _on_VisibilityNotifier2D_screen_exited():
	pass # Replace with function body.
	wrap();


func _on_asteroid_body_entered(body):
	pass # Replace with function body.
	get_tree().quit();


func _on_asteroid_area_entered(area):
	pass # Replace with function body.
	if area is Bullet:
		Globalscr.score += 200;
		emit_signal("asteroid_destroyed",position);
		queue_free();
