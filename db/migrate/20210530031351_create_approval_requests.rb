class CreateApprovalRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :approval_requests do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :project_save_id
      t.string :status
      t.integer :element_id

      t.timestamps
    end
  end
end
