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

  before_validation :default_values
  def default_values
    # Set all default values to 0
    self.a_0 = 0        unless self.a_0
    self.a_sharp_0 = 0  unless self.a_sharp_0
    self.b_0 = 0        unless self.b_0
    self.c_1 = 0        unless self.c_1
    self.c_sharp_1 = 0  unless self.c_sharp_1
    self.d_1 = 0        unless self.d_1
    self.d_sharp_1 = 0  unless self.d_sharp_1
    self.e_1 = 0        unless self.e_1
    self.f_1 = 0        unless self.f_1
    self.f_sharp_1 = 0  unless self.f_sharp_1
    self.g_1 = 0        unless self.g_1
    self.g_sharp_1 = 0  unless self.g_sharp_1
    self.a_1 = 0        unless self.a_1
    self.a_sharp_1 = 0  unless self.a_sharp_1
    self.b_1 = 0        unless self.b_1
    self.c_2 = 0        unless self.c_2
    self.c_sharp_2 = 0  unless self.c_sharp_2
    self.d_2 = 0        unless self.d_2
    self.d_sharp_2 = 0  unless self.d_sharp_2
    self.e_2 = 0        unless self.e_2
    self.f_2 = 0        unless self.f_2
    self.f_sharp_2 = 0  unless self.f_sharp_2
    self.g_2 = 0        unless self.g_2
    self.g_sharp_2 = 0  unless self.g_sharp_2
    self.a_2 = 0        unless self.a_2
    self.a_sharp_2 = 0  unless self.a_sharp_2
    self.b_2 = 0        unless self.b_2
    self.c_3 = 0        unless self.c_3
    self.c_sharp_3 = 0  unless self.c_sharp_3
    self.d_3 = 0        unless self.d_3
    self.d_sharp_3 = 0  unless self.d_sharp_3
    self.e_3 = 0        unless self.e_3
    self.f_3 = 0        unless self.f_3
    self.f_sharp_3 = 0  unless self.f_sharp_3
    self.g_3 = 0        unless self.g_3
    self.g_sharp_3 = 0  unless self.g_sharp_3
    self.a_3 = 0        unless self.a_3
    self.a_sharp_3 = 0  unless self.a_sharp_3
    self.b_3 = 0        unless self.b_3
    self.c_4 = 0        unless self.c_4
    self.c_sharp_4 = 0  unless self.c_sharp_4
    self.d_4 = 0        unless self.d_4
    self.d_sharp_4 = 0  unless self.d_sharp_4
    self.e_4 = 0        unless self.e_4
    self.f_4 = 0        unless self.f_4
    self.f_sharp_4 = 0  unless self.f_sharp_4
    self.g_4 = 0        unless self.g_4
    self.g_sharp_4 = 0  unless self.g_sharp_4
    self.a_4 = 0        unless self.a_4
    self.a_sharp_4 = 0  unless self.a_sharp_4
    self.b_4 = 0        unless self.b_4
    self.c_5 = 0        unless self.c_5
    self.c_sharp_5 = 0  unless self.c_sharp_5
    self.d_5 = 0        unless self.d_5
    self.d_sharp_5 = 0  unless self.d_sharp_5
    self.e_5 = 0        unless self.e_5
    self.f_5 = 0        unless self.f_5
    self.f_sharp_5 = 0  unless self.f_sharp_5
    self.g_5 = 0        unless self.g_5
    self.g_sharp_5 = 0  unless self.g_sharp_5
    self.a_5 = 0        unless self.a_5
    self.a_sharp_5 = 0  unless self.a_sharp_5
    self.b_5 = 0        unless self.b_5
    self.c_6 = 0        unless self.c_6
    self.c_sharp_6 = 0  unless self.c_sharp_6
    self.d_6 = 0        unless self.d_6
    self.d_sharp_6 = 0  unless self.d_sharp_6
    self.e_6 = 0        unless self.e_6
    self.f_6 = 0        unless self.f_6
    self.f_sharp_6 = 0  unless self.f_sharp_6
    self.g_6 = 0        unless self.g_6
    self.g_sharp_6 = 0  unless self.g_sharp_6
    self.a_6 = 0        unless self.a_6
    self.a_sharp_6 = 0  unless self.a_sharp_6
    self.b_6 = 0        unless self.b_6
    self.c_7 = 0        unless self.c_7
    self.c_sharp_7 = 0  unless self.c_sharp_7
    self.d_7 = 0        unless self.d_7
    self.d_sharp_7 = 0  unless self.d_sharp_7
    self.e_7 = 0        unless self.e_7
    self.f_7 = 0        unless self.f_7
    self.f_sharp_7 = 0  unless self.f_sharp_7
    self.g_7 = 0        unless self.g_7
    self.g_sharp_7 = 0  unless self.g_sharp_7
    self.a_7 = 0        unless self.a_7
    self.a_sharp_7 = 0  unless self.a_sharp_7
    self.b_7 = 0        unless self.b_7
    self.c_8 = 0        unless self.c_8
  end
  
end
