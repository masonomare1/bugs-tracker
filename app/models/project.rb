# frozen_string_literal: true

# this user policy
class Project < ApplicationRecord
  belongs_to :user
  has_many :bugs
  has_and_belongs_to_many :users

  # TODO: validations missing for all fields
end
