class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :surveys do |t|
      t.string :email
      t.string :group
      t.string :owner_hash
      t.string :visitor_hash

      t.timestamps
    end
  end

  def self.down
    drop_table :surveys
  end
end
