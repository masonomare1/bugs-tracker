# frozen_string_literal: true

class ChangeTitleToBugTitleInBugs < ActiveRecord::Migration[7.0]
  def change
    # TODO: why renamed this to bug_title?
    rename_column :bugs, :title, :bug_title
  end
end
