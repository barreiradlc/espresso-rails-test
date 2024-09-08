class ApplicationService
  def initialize(verb, model)
    ability = Ability.new($current_user)

    @can = ability.can?(verb, model)

    if !@can
      raise CanCan::AccessDenied.new("You don't have permission to access this resource", :create, Category)
    end    
  end
end