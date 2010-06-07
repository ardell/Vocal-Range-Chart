class Survey < ActiveRecord::Base
  
  validates_presence_of :email, :group, :owner_hash, :visitor_hash
  validates_uniqueness_of :owner_hash, :visitor_hash
  validates_format_of :email,
                      :with => %r{^.*@.*\..*$}i,
                      :message => 'Invalid email address, please try again'
  validates_format_of :group,
                      :with => %r{^.{3,100}$}i,
                      :message => 'Name must be between 3 and 100 characters, please try again'
  validates_format_of :owner_hash,
                      :with => %r{^[0-9a-f]{32}$}i,
                      :message => 'We were unable to create your survey, please try again'
  validates_format_of :visitor_hash,
                      :with => %r{^[0-9a-f]{32}$}i,
                      :message => 'We were unable to create your survey, please try again'
  
end
