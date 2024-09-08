# frozen_string_literal: true

class ApplicationService
  def initialize(verb, model)
    @current_user = RequestStore[:current_user]

    ability = Ability.new(@current_user)

    @can = ability.can?(verb, model)

    return if @can

    raise CanCan::AccessDenied.new("You don't have permission to access this resource", :create, Category)
  end
end
