extends ProgressBar

@onready var energy_bar: Node2D = $EnergyBar
@onready var timer: Timer = $"../Timer"
@onready var label: Label = $"../Label"

var energy = 0 : set = _set_energy

func _set_energy(new_energy):
	var prev_energy = energy
	energy = min(max_value, new_energy)
	value = energy
	
	if energy <= 0:
		on_energy_depleted()

func init_energy(_energy):
	energy = _energy
	max_value = energy
	value = energy

func on_energy_depleted() -> void:
	label.visible = true  # Make the label visible
	get_tree().paused = true
	await get_tree().create_timer(3).timeout
	get_tree().paused = false
	get_tree().reload_current_scene()
