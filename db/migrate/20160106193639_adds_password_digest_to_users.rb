class AddsPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column(:users, :password_digest, :text)
    remove_column(:users, :password)
  end
end
