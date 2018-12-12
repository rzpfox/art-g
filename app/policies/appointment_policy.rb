class AppointmentPolicy < GalleryPolicy
  class Scope < Scope
    def resolve
      if user
        scope.where(user: user)
      else
        scope.all
      end
    end
  end
end
