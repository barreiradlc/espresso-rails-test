# frozen_string_literal: true

class EmployeeAbility
  include CanCan::Ability

  def initialize(user)
    return unless user.employee?

    can :read, :all

    # Categories
    can :update, Category, user_id: user.id
    cannot :create, Category, user_id: user.id
  end
end
