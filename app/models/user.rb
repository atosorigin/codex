class User < ActiveRecord::Base

  belongs_to :account

  attr_accessor :password

  validates_presence_of :username
  validates_length_of :username, :within => 3..20
  validates_length_of :password, :within => 6..30

  before_save :hash_password

  validates_confirmation_of :password, :if => :perform_password_validation?
  validates_presence_of :password, :if => :perform_password_validation?

  before_save :hash_password
  attr_accessor :password

  # Returns true if the password passed matches the password in the DB
  def valid_password?(password)
    self.password_hash == self.class.hash_password(password)
  end

  # Performs the actual password encryption. You want to change this salt to something else.
  def self.hash_password(password, salt = "YodelAIHooooooo")
    Digest::SHA1.hexdigest(password, salt)
  end

  private

  # Sets the hashed version of self.password to password_hash, unless it's blank.
  def hash_password
    self.password_hash = self.class.hash_password(self.password) unless self.password.blank?
  end

  # Assert wether or not the password validations should be performed. Always on new records, only on existing
  # records if the .password attribute isn't blank.
  def perform_password_validation?
    self.new_record? ? true : !self.password.blank?
  end

end
