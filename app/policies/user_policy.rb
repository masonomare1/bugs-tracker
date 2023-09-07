class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    user.user_type.in?(['qa', 'manager', 'developer'])
    # puts "User Roles: #{user.roles.map(&:name).join(', ')}"
    # result = user.user_type.in?(['qa', 'manager', 'developer'])
    # puts user.user_type
    # puts "Authorization Result: #{result}"
    # result
  end
end
