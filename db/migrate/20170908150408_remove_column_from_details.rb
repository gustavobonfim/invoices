class RemoveColumnFromDetails < ActiveRecord::Migration[5.1]
  def change
    remove_reference :details, :user, foreign_key: true
  end
end
