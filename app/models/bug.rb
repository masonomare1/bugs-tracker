# frozen_string_literal: true

class Bug < ApplicationRecord
  # belongs_to :user
  # belongs_to :project
  belongs_to :creator, class_name: 'User', optional: true
  belongs_to :developer, class_name: 'User', foreign_key: 'dev_id', optional: true
  belongs_to :project
  self.inheritance_column = :_type_disabled
end
