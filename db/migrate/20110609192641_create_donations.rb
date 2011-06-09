class CreateDonations < ActiveRecord::Migration
  def self.up
    create_table :donations do |t|
      t.integer :user_id
      t.string :charity
      t.decimal :amount, :precision => 9, :scale => 2
      t.datetime :donation_date
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :donations
  end
end
