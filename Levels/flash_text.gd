extends RichTextLabel

var time = 0
var sinTime = 0
var _visable = true

@export var speed : int = 5
@export var fade : bool = true

func flash_text():
	if !fade:
		if sinTime > 0:
			_visable = true
		else:
			_visable = false
	else:
		_visable = true
		modulate.a = sinTime

func _physics_process(delta):
	time += delta
	sinTime = sin(time*speed)
	flash_text()
