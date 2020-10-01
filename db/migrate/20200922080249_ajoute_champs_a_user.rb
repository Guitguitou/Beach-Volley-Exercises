class AjouteChampsAUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
    add_column :users, :club, :string
    add_column :users, :pays, :string
  end
end
