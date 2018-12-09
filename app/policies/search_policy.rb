class SearchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user
        scope.where(user: user)
      else
        scope.all
      end
    end
  end

  def show?
    return true
  end
end
