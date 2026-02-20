extends CSGBox3D

var speed:Vector3 = Vector3.ZERO
@onready var timer = %Timer

func _ready():
	random_speeds()

func _process(delta):
	rotation.x += speed.x * delta
	rotation.y += speed.y * delta
	rotation.z += speed.z * delta

	scale.x = 1 + speed.x * 0.5
	scale.y = 1 + speed.y * 0.5
	scale.z = 1 + speed.z * 0.5


func _on_timer_timeout() -> void:
	random_speeds()
	timer.reload() 

func random_speeds():
	speed.x = randf_range(-1,1)
	speed.y = randf_range(-1,1)
	speed.z = randf_range(-1,1)
