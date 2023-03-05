extends KinematicBody2D

var bulletpath = preload("res://bullet.tscn");

var ro_dir : int = 0;
var ro_speed : int = 3;
var velocity : Vector2 = Vector2.ZERO;
var speed : int= 200;
var vp : Vector2;
var time = false;

func _ready():
	pass
	vp = get_viewport().size;
	
	

func _process(delta):
	pass
	get_input();
	rotation += ro_dir * ro_speed * delta;
	position += velocity * delta;
	position.x = clamp(position.x,0,vp.x);
	position.y = clamp(position.y,0,vp.y);
	velocity = Vector2.ZERO;
	
	
func get_input():
	ro_dir = 0;
	if Input.is_action_pressed("left"):
		ro_dir = -1;
	if Input.is_action_pressed("right"):
		ro_dir = 1;
	if Input.is_action_pressed("up"):
		velocity = Vector2(0,-speed).rotated(rotation);
	if Input.is_action_pressed("down"):
		velocity = Vector2(0,speed).rotated(rotation);
	if Input.is_action_pressed("shoot") and time:
		time = false;
		shoot_bullet();
	
func shoot_bullet():
	pass
	var bullet = bulletpath.instance();
	
	bullet.position = $Position2D.global_position;
	bullet.velocity = Vector2(0,-400).rotated(rotation);
	
	get_parent().add_child(bullet);
	
	
	
func _on_Timer_timeout():
	pass # Replace with function body.
	time = true;

func _exit_tree():
	queue_free();





