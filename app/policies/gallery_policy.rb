class GalleryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # display all galleries
      # scope.all
      # display only galleries of the owner
      # scope.where(user: user)
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
