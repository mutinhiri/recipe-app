# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, :all

    return unless user.present?

    can :read, :all
    can :manage, Food, user_id: user.id
  end
end
