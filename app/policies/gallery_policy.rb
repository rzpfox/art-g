class GalleryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # display only galleries of the owner
      # scope.where(user: user)
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

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
