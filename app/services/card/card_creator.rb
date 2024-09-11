# frozen_string_literal: true

class CardCreator
  def initialize(card_params)
    @card_params = card_params
  end

  def call
    card = Card.new(@card_params)
    card.save!

    card
  end
end
