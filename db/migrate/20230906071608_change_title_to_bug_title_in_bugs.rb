# frozen_string_literal: true

class ChangeTitleToBugTitleInBugs < ActiveRecord::Migration[7.0]
  def change
    rename_column :bugs, :title, :bug_title
  end
end
