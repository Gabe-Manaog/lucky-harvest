extends ProgressBar

@onready var timer: Timer = $"../Timer"
@onready var label: Label = $"../Label"

var energy: int = 10  # ✅ Default energy set to 10

func _ready() -> void:
	self.max_value = 10  # ✅ Ensures max value is also set to 10
	self.value = energy  # ✅ Syncs ProgressBar with energy

func _set_energy(new_energy: int) -> void:
	energy = min(self.max_value, new_energy)
	self.value = energy  # Update ProgressBar's value
	
	if energy <= 0:
		on_energy_depleted()

func on_energy_depleted() -> void:
	label.visible = true  # Show warning message
	get_tree().paused = true
	await get_tree().create_timer(3).timeout
	get_tree().paused = false
	get_tree().reload_current_scene()
