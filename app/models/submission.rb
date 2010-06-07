class Submission < ActiveRecord::Base
  
  validates_presence_of :name, :email
  validates_format_of :email,
                      :with => %r{^.*@.*\..*$}i,
                      :message => 'Invalid email address'
  validates_format_of :email,
                      :with => %r{^.{3,150}$}i,
                      :message => 'Email must be between 3 and 150 characters'
  validates_format_of :name,
                      :with => %r{^.{3,150}$}i,
                      :message => 'Name must be between 3 and 150 characters'
  validates_numericality_of :a_0, :a_sharp_0, :b_0,
                        :c_1, :c_sharp_1, :d_1, :d_sharp_1, :e_1, :f_1, :f_sharp_1, :g_1, :g_sharp_1, :a_1, :a_sharp_1, :b_1,
                        :c_2, :c_sharp_2, :d_2, :d_sharp_2, :e_2, :f_2, :f_sharp_2, :g_2, :g_sharp_2, :a_2, :a_sharp_2, :b_2,
                        :c_3, :c_sharp_3, :d_3, :d_sharp_3, :e_3, :f_3, :f_sharp_3, :g_3, :g_sharp_3, :a_3, :a_sharp_3, :b_3,
                        :c_4, :c_sharp_4, :d_4, :d_sharp_4, :e_4, :f_4, :f_sharp_4, :g_4, :g_sharp_4, :a_4, :a_sharp_4, :b_4,
                        :c_5, :c_sharp_5, :d_5, :d_sharp_5, :e_5, :f_5, :f_sharp_5, :g_5, :g_sharp_5, :a_5, :a_sharp_5, :b_5,
                        :c_6, :c_sharp_6, :d_6, :d_sharp_6, :e_6, :f_6, :f_sharp_6, :g_6, :g_sharp_6, :a_6, :a_sharp_6, :b_6,
                        :c_7, :c_sharp_7, :d_7, :d_sharp_7, :e_7, :f_7, :f_sharp_7, :g_7, :g_sharp_7, :a_7, :a_sharp_7, :b_7,
                        :c_8
  
end
