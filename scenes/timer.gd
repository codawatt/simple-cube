extends Timer


func _ready():
	reload()


func reload():
	wait_time = randf_range(5,15)