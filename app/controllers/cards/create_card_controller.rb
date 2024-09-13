# frozen_string_literal: true

class CreateCardController < ApplicationController
  skip_before_action :verify_authenticity_token

  def call
    Rails.logger.debug 'card_params'
    Rails.logger.debug params
    Rails.logger.debug card_params

    card_creator = CardCreator.new(card_params)
    card = card_creator.call

    render json: { card: card }, status: :created
  rescue StandardError => e
    render json: { error: e }, status: :unauthorized
  end

  private

  def card_params
    params.require(:card).permit(:last_digits, :user_id)
  end
end
