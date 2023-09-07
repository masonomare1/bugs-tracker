# frozen_string_literal: true

# this is policy controller
class ProjectPolicy < ApplicationPolicy
  # this is policy controller
  class Scope < Scope
    def resolve
      if user.user_type.in?(%w[qa manager])
        scope.all
      elsif user.user_type.in?(%w[developer])
        @projects_dev = user.projects
        scope.where(title: @projects_dev.pluck(:title))
      else
        scope.where(title: 'c# winform project')
      end
    end
  end

  def index?
    true
  end

  def show?
    true
  end
end
