# frozen_string_literal: true

class CreateSessionController < ApplicationController
  skip_before_action :verify_authenticity_token

  def call
    user_shower_by_email = UserShowerByEmail.new(params[:email])
    user = user_shower_by_email.call

    return render json: { error: 'Unauthorized' }, status: :unauthorized unless user

    if user&.authenticate(params[:password])
      session_authentication_encoder = SessionJwtEncoder.new(user_id: user.id)
      token = session_authentication_encoder.call

      render json: { token: token }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
