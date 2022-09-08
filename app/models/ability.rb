class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can %i[read create], :all
    can :destroy, Group, user: user
    can :destroy, Operation, user: user
    return unless user.admin?

    can :manage, :all
  end
end
