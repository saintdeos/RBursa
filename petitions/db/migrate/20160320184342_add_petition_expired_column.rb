class AddPetitionExpiredColumn < ActiveRecord::Migration
  def change
  	add_column :petitions, :expired, :boolean, default: false
  end
end
