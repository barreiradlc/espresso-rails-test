# frozen_string_literal: true

class BadRequestHandler
  def initialize(app)
    @app = app
  end

  def call(env)
    @app.call(env)
  rescue ActionController::ParameterMissing, ActiveRecord::RecordInvalid, ActionController::UnfilteredParameters => e
    [400, { 'Content-Type' => 'application/json' }, [e.message]]
  end
end
