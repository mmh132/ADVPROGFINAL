extends Camera2D

@onready 
var tiles = $TileMap

func _ready():
	set_camera_limits()

func set_camera_limits():
	var map_limits = tiles.get_used_rect()
	var map_cellsize = tiles.cell_size
	limit_left = map_limits.position.x * map_cellsize.x
	limit_right = map_limits.end.x * map_cellsize.x
	limit_top = map_limits.position.y * map_cellsize.y
	limit_bottom = map_limits.end.y * map_cellsize.y
