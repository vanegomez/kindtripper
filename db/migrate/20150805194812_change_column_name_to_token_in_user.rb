class ChangeColumnNameToTokenInUser < ActiveRecord::Migration
  def change
    rename_column :users, :oath_token, :token
    rename_column :users, :oauth_token_secret, :token_secret
  end
end
