# frozen_string_literal: true

# this user policy
class UserPolicy < ApplicationPolicy
  # this user policy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  # TODO: here we tell which user can see which post
  def index?
    if user.user_type.in?(%w[qa manager developer])
      scope.all
    else
      scope.where(title: 'c# winform project')
    end
  end

  def show?
    return false unless user.user_type.in?(%w[qa manager developer])

    scope.all

    # user.user_type.in?(%w[qa manager developer])
    # puts "User Roles: #{user.roles.map(&:name).join(', ')}"
    # result = user.user_type.in?(['qa', 'manager', 'developer'])
    # puts user.user_type
    # puts "Authorization Result: #{result}"
    # result
  end
end
