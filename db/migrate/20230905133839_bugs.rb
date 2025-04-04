# frozen_string_literal: true

# TODO: migration name is incorrect, this should be create_bugs

# this user policy
class Bugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      # TODO: can this be null?
      t.text :title
      # TODO: can this be null?
      t.datetime :deadline
      # TODO: can this be null?
      t.datetime :time
      t.string :type
      # TODO: can this be null?
      t.string :status
      # TODO: why not use t.references instead?
      # TODO: change it to use t.references instead
      t.integer :creator_id
      t.integer :dev_id
      t.integer :project_id

      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :bugs, :users, column: :creator_id, primary_key: :id
    add_foreign_key :bugs, :users, column: :dev_id, primary_key: :id
    add_foreign_key :bugs, :projects, column: :project_id, primary_key: :id
  end
end
