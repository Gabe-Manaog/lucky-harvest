extends ProgressBar

@onready var energy_bar: Node2D = $EnergyBar

var energy = 0 : set = _set_energy

func _set_energy(new_energy):
	var prev_energy = energy
	energy = min(max_value, new_energy)
	value = energy
	
	if energy <= 0:
		queue_free()

func init_energy(_energy):
	energy = _energy
	max_value = energy
	value = energy
	
