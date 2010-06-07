class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.string :name, :limit => 150
      t.string :email, :limit => 150
      t.integer :survey_id, :null => false, :options => "CONSTRAINT fk_survey_submissions REFERENCES surveys(id)"
      t.integer :a_0
      t.integer :a_sharp_0
      t.integer :b_0
      t.integer :c_1
      t.integer :c_sharp_1
      t.integer :d_1
      t.integer :d_sharp_1
      t.integer :e_1
      t.integer :f_1
      t.integer :f_sharp_1
      t.integer :g_1
      t.integer :g_sharp_1
      t.integer :a_1
      t.integer :a_sharp_1
      t.integer :b_1
      t.integer :c_2
      t.integer :c_sharp_2
      t.integer :d_2
      t.integer :d_sharp_2
      t.integer :e_2
      t.integer :f_2
      t.integer :f_sharp_2
      t.integer :g_2
      t.integer :g_sharp_2
      t.integer :a_2
      t.integer :a_sharp_2
      t.integer :b_2
      t.integer :c_3
      t.integer :c_sharp_3
      t.integer :d_3
      t.integer :d_sharp_3
      t.integer :e_3
      t.integer :f_3
      t.integer :f_sharp_3
      t.integer :g_3
      t.integer :g_sharp_3
      t.integer :a_3
      t.integer :a_sharp_3
      t.integer :b_3
      t.integer :c_4
      t.integer :c_sharp_4
      t.integer :d_4
      t.integer :d_sharp_4
      t.integer :e_4
      t.integer :f_4
      t.integer :f_sharp_4
      t.integer :g_4
      t.integer :g_sharp_4
      t.integer :a_4
      t.integer :a_sharp_4
      t.integer :b_4
      t.integer :c_5
      t.integer :c_sharp_5
      t.integer :d_5
      t.integer :d_sharp_5
      t.integer :e_5
      t.integer :f_5
      t.integer :f_sharp_5
      t.integer :g_5
      t.integer :g_sharp_5
      t.integer :a_5
      t.integer :a_sharp_5
      t.integer :b_5
      t.integer :c_6
      t.integer :c_sharp_6
      t.integer :d_6
      t.integer :d_sharp_6
      t.integer :e_6
      t.integer :f_6
      t.integer :f_sharp_6
      t.integer :g_6
      t.integer :g_sharp_6
      t.integer :a_6
      t.integer :a_sharp_6
      t.integer :b_6
      t.integer :c_7
      t.integer :c_sharp_7
      t.integer :d_7
      t.integer :d_sharp_7
      t.integer :e_7
      t.integer :f_7
      t.integer :f_sharp_7
      t.integer :g_7
      t.integer :g_sharp_7
      t.integer :a_7
      t.integer :a_sharp_7
      t.integer :b_7
      t.integer :c_8

      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
