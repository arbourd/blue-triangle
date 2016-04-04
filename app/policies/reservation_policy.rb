class ReservationPolicy < ApplicationPolicy
  def show?
    user.id == record.member.id
  end

  def destroy?
    show?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.where(member: user)
    end
  end
end
