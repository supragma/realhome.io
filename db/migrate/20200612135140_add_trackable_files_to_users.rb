class AddTrackableFilesToUsers < ActiveRecord::Migration[6.0]
  def change
   change_table :users do |t|
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.datetime :locked_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
    end
    add_index  :users, :confirmation_token, :unique => true 
  end
end
