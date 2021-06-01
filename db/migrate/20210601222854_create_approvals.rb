class CreateApprovals < ActiveRecord::Migration[6.0]
  def change
    create_table :approvals do |t|
      t.integer :approver_id
      t.integer :requester_id
      t.integer :space_id
      t.string :status
      t.string :note

      t.timestamps
    end
  end
end
