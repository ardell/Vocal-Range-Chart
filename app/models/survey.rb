class Survey < ActiveRecord::Base
  
  has_many :submissions
  
  validates_presence_of :email, :group, :owner_hash, :visitor_hash
  validates_uniqueness_of :owner_hash, :visitor_hash
  validates_format_of :email,
                      :with => %r{^.*@.*\..*$}i,
                      :message => 'Invalid email address'
  validates_format_of :email,
                      :with => %r{^.{3,150}$}i,
                      :message => 'Email must be between 3 and 150 characters'
  validates_format_of :group,
                      :with => %r{^.{3,150}$}i,
                      :message => 'Group name must be between 3 and 150 characters'
  validates_format_of :owner_hash,
                      :with => %r{^[0-9a-f]{32}$}i,
                      :message => 'We were unable to create your survey'
  validates_format_of :visitor_hash,
                      :with => %r{^[0-9a-f]{32}$}i,
                      :message => 'We were unable to create your survey'
                      
  before_validation :create_hashes
  def create_hashes
    self.owner_hash = Digest::MD5.hexdigest('owner hash salt' + Time.now.strftime("%Y%m%d%H%M%S")) if self.owner_hash == nil
    self.visitor_hash = Digest::MD5.hexdigest('visitor hash salt' + Time.now.strftime("%Y%m%d%H%M%S")) if self.visitor_hash == nil
    
    # Need to return true so we can continue with validation
    return true
  end
  
end
