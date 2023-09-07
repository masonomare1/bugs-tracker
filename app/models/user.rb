# frozen_string_literal: true

class User < ApplicationRecord
  has_one :project
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # TODO: this will set the values to the temp users
  User_role = %w[
    manager
    developer
    qa
  ].freeze
end
