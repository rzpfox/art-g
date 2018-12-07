class AppointmentPolicy < GalleryPolicy
  class Scope < Scope
    def resolve
      # display only appointments of the owner
      # scope.where(user: user)
      scope.where(user: user) if user
    end
  end
end
