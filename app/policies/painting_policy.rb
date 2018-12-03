class PaintingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
   #TODO, only gallery creator can create painting.
  end

  def show?
    return true
  end
  def update?
    record.user == user
  end
  def destroy?
    record.user == user
  end
end
