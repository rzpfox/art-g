class AppointmentPolicy < GalleryPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
