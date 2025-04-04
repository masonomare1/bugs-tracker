# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  has_one :project
  has_and_belongs_to_many :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # TODO: this will set the values to the temp users
  # TODO: where are we storing the role of the user in database?
  # QUESTION: are we using rolify or not?
  User_role = %w[
    manager
    developer
    qa
  ].freeze
  # TODO: user_type or role should be an enum

  def self.ransackable_attributes(_auth_object = nil)
    ['email']
  end

  # TODO: do we need this unless we are not using ransack to retrieve any related data?
  def self.ransackable_associations(_auth_object = nil)
    []
  end
end
