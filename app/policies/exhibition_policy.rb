class ExhibitionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user
        scope.where(user: user)
      else
        scope.all
      end
    end
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def all?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
