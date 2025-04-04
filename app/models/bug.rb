# frozen_string_literal: true

class Bug < ApplicationRecord
  # TODO: do we need these associations
  # belongs_to :user
  # belongs_to :project
  # TODO: you probably don't need do this, you're having this issue because \
  # of the type column. rails uses it by default for managing STIs
  # TODO: if this column is needed you could rename it to category \
  # and then remove this
  self.inheritance_column = :_type_disabled

  # TODO: is creator optional?
  belongs_to :creator, class_name: 'User', optional: true
  belongs_to :developer, class_name: 'User', foreign_key: 'dev_id', optional: true
  belongs_to :project

  # TODO: validations are missing for all fields
  # TODO: shouldn't status be enum?

end
