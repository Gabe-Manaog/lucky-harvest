extends ProgressBar

@onready var energy_bar: Node2D = $EnergyBar

var energy = 0 : set = _set_energy

func _set_energy(new_energy):
	var prev_energy = energy
	energy = min(max_value, new_energy)
	value = energy
	
	if energy <= 0:
		on_energy_depleted()
		queue_free()

func init_energy(_energy):
	energy = _energy
	max_value = energy
	value = energy

func on_energy_depleted() -> void:
	print("Energy depleted! Player dies.")
	get_tree().reload_current_scene()
