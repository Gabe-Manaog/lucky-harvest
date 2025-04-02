extends ProgressBar

@onready var timer: Timer = $"../Timer"
@onready var label: Label = $"../Label"

func _ready() -> void:
	self.value = EnergyManager.energy  #  Syncs ProgressBar with energy
	self.max_value =30
func _process(delta:float)-> void:
	self.value = EnergyManager.energy  # Syncs ProgressBar with energy

func _set_energy(new_energy: int) -> void:
	EnergyManager.energy = min(self.max_value, new_energy)
	print(EnergyManager.energy)
	self.value = EnergyManager.energy  # Update ProgressBar's value
	
	if EnergyManager.energy <= 0:
		on_energy_depleted()

func on_energy_depleted() -> void:
	label.visible = true  # Show warning message
	get_tree().paused = true
	await get_tree().create_timer(3).timeout
	get_tree().paused = false
	self.value = 30
	EnergyManager.energy = self.value
	get_tree().reload_current_scene()
	
func sleep_energy() -> void:
	self.value = 30
	EnergyManager.energy_changed.connect(sleep_energy)
