class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.string :name,         :limit => 150
      t.string :email,        :limit => 150
      t.integer :survey_id,   :null => false, :options => "CONSTRAINT fk_survey_submissions REFERENCES surveys(id)"
      t.integer :a_0,         :null => false, :default => 0
      t.integer :a_sharp_0,   :null => false, :default => 0
      t.integer :b_0,         :null => false, :default => 0
      t.integer :c_1,         :null => false, :default => 0
      t.integer :c_sharp_1,   :null => false, :default => 0
      t.integer :d_1,         :null => false, :default => 0
      t.integer :d_sharp_1,   :null => false, :default => 0
      t.integer :e_1,         :null => false, :default => 0
      t.integer :f_1,         :null => false, :default => 0
      t.integer :f_sharp_1,   :null => false, :default => 0
      t.integer :g_1,         :null => false, :default => 0
      t.integer :g_sharp_1,   :null => false, :default => 0
      t.integer :a_1,         :null => false, :default => 0
      t.integer :a_sharp_1,   :null => false, :default => 0
      t.integer :b_1,         :null => false, :default => 0
      t.integer :c_2,         :null => false, :default => 0
      t.integer :c_sharp_2,   :null => false, :default => 0
      t.integer :d_2,         :null => false, :default => 0
      t.integer :d_sharp_2,   :null => false, :default => 0
      t.integer :e_2,         :null => false, :default => 0
      t.integer :f_2,         :null => false, :default => 0
      t.integer :f_sharp_2,   :null => false, :default => 0
      t.integer :g_2,         :null => false, :default => 0
      t.integer :g_sharp_2,   :null => false, :default => 0
      t.integer :a_2,         :null => false, :default => 0
      t.integer :a_sharp_2,   :null => false, :default => 0
      t.integer :b_2,         :null => false, :default => 0
      t.integer :c_3,         :null => false, :default => 0
      t.integer :c_sharp_3,   :null => false, :default => 0
      t.integer :d_3,         :null => false, :default => 0
      t.integer :d_sharp_3,   :null => false, :default => 0
      t.integer :e_3,         :null => false, :default => 0
      t.integer :f_3,         :null => false, :default => 0
      t.integer :f_sharp_3,   :null => false, :default => 0
      t.integer :g_3,         :null => false, :default => 0
      t.integer :g_sharp_3,   :null => false, :default => 0
      t.integer :a_3,         :null => false, :default => 0
      t.integer :a_sharp_3,   :null => false, :default => 0
      t.integer :b_3,         :null => false, :default => 0
      t.integer :c_4,         :null => false, :default => 0
      t.integer :c_sharp_4,   :null => false, :default => 0
      t.integer :d_4,         :null => false, :default => 0
      t.integer :d_sharp_4,   :null => false, :default => 0
      t.integer :e_4,         :null => false, :default => 0
      t.integer :f_4,         :null => false, :default => 0
      t.integer :f_sharp_4,   :null => false, :default => 0
      t.integer :g_4,         :null => false, :default => 0
      t.integer :g_sharp_4,   :null => false, :default => 0
      t.integer :a_4,         :null => false, :default => 0
      t.integer :a_sharp_4,   :null => false, :default => 0
      t.integer :b_4,         :null => false, :default => 0
      t.integer :c_5,         :null => false, :default => 0
      t.integer :c_sharp_5,   :null => false, :default => 0
      t.integer :d_5,         :null => false, :default => 0
      t.integer :d_sharp_5,   :null => false, :default => 0
      t.integer :e_5,         :null => false, :default => 0
      t.integer :f_5,         :null => false, :default => 0
      t.integer :f_sharp_5,   :null => false, :default => 0
      t.integer :g_5,         :null => false, :default => 0
      t.integer :g_sharp_5,   :null => false, :default => 0
      t.integer :a_5,         :null => false, :default => 0
      t.integer :a_sharp_5,   :null => false, :default => 0
      t.integer :b_5,         :null => false, :default => 0
      t.integer :c_6,         :null => false, :default => 0
      t.integer :c_sharp_6,   :null => false, :default => 0
      t.integer :d_6,         :null => false, :default => 0
      t.integer :d_sharp_6,   :null => false, :default => 0
      t.integer :e_6,         :null => false, :default => 0
      t.integer :f_6,         :null => false, :default => 0
      t.integer :f_sharp_6,   :null => false, :default => 0
      t.integer :g_6,         :null => false, :default => 0
      t.integer :g_sharp_6,   :null => false, :default => 0
      t.integer :a_6,         :null => false, :default => 0
      t.integer :a_sharp_6,   :null => false, :default => 0
      t.integer :b_6,         :null => false, :default => 0
      t.integer :c_7,         :null => false, :default => 0
      t.integer :c_sharp_7,   :null => false, :default => 0
      t.integer :d_7,         :null => false, :default => 0
      t.integer :d_sharp_7,   :null => false, :default => 0
      t.integer :e_7,         :null => false, :default => 0
      t.integer :f_7,         :null => false, :default => 0
      t.integer :f_sharp_7,   :null => false, :default => 0
      t.integer :g_7,         :null => false, :default => 0
      t.integer :g_sharp_7,   :null => false, :default => 0
      t.integer :a_7,         :null => false, :default => 0
      t.integer :a_sharp_7,   :null => false, :default => 0
      t.integer :b_7,         :null => false, :default => 0
      t.integer :c_8,         :null => false, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
