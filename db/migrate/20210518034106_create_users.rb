class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :user_type
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :comments_count
      t.integer :projects_count
      t.integer :invitations_sent_count
      t.integer :invitation_requests_count

      t.timestamps
    end
  end
end
