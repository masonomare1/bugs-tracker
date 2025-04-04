# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      # TODO: can title be null?
      # TODO: search on title field is not present in the project?
      # TODO: can there be more than one project with same name?
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
