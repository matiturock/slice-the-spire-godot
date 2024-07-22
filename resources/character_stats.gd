class_name CharacterStats extends Stats

@export var starting_deck: CardPile
@export var cards_per_turn: int
@export var max_mana: int

var mana: int:
	set(value):
		mana = value
		stats_changed.emit()
var deck: CardPile
var discard: CardPile
var draw_pile: CardPile


func reset_mana() -> void:
	self.mana = max_mana


func can_play_card(card: Card) -> bool:
	return self.mana >= card.cost


func create_instance() -> Resource:
	var instance: CharacterStats = self.duplicate() as CharacterStats
	instance.health = max_health
	instance.block = 0
	instance.reset_mana()
	instance.deck = instance.starting_deck.duplicate()
	instance.draw_pile = CardPile.new()
	instance.discard = CardPile.new()
	return instance
