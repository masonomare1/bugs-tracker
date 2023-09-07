class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.user_type.in?(['manager', 'developer'])
        scope.all
      else
        scope.where('title':"c# winform projects")
      end

    end
  end
  def index
  end

end
