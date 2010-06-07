class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :surveys do |t|
      t.string :email, :limit => 150
      t.string :group, :limit => 150
      t.string :owner_hash, :limit => 32
      t.string :visitor_hash, :limit => 32

      t.timestamps
    end
  end

  def self.down
    drop_table :surveys
  end
end
