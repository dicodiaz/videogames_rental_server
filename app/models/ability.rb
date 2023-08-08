class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Videogame
    return unless user.present?

    can :read, :all
    return unless user.admin?

    can :manage, :all
  end
end
