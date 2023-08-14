class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Videogame
    return unless user.present?

    can(:manage, Reservation, user:)
    return unless user.admin?

    can :manage, :all
  end
end
