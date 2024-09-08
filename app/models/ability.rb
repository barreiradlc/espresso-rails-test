# frozen_string_literal: true

class Ability
  def initialize(user)
    return unless user

    if user.admin?
      @ability = AdminAbility.new(user)
    elsif user.employee?
      @ability = EmployeeAbility.new(user)
    else
      raise CanCan::AccessDenied, 'You need a valid account to access the App'
    end
  end

  def can?(action, subject, *extra_args)
    @ability.can?(action, subject, *extra_args)
  end

  def cannot?(action, subject, *extra_args)
    @ability.cannot?(action, subject, *extra_args)
  end
end
