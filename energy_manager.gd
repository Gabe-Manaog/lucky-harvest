extends Node

var energy: int = 30
var max_energy: int = 30
signal energy_changed

func set_energy(new_energy: int) -> void:
	energy = min(max_energy, new_energy)
	
	# You can emit a signal here if other scripts need to react to energy changes
	# For example:
	# emit_signal("energy_changed", energy)
	
	if energy <= 0:
		energy_depleted()
	energy_changed.emit()

func energy_depleted() -> void:
	# You can handle the energy depleted logic here or emit a signal
	emit_signal("energy_depleted")
	
