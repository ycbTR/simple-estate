class User < ActiveRecord::Base
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :properties
  has_many :wish_lists
  validates :firstname, :lastname, :description, :presence => true

  scope :agent, -> { where(role: 'Agent') }
  scope :customer,  -> { where(role: 'Customer') }

  before_save :set_role

  def customer?
    self.role == 'Customer'
  end

  def admin?
    self.role == 'Admin'
  end

  def agent?
    self.role == 'Agent'
  end

  def self.current
    Thread.current[:user]
  end

  def self.current=(u)
    Thread.current[:user] = u
  end

  def fullname
    "#{self.firstname} #{self.lastname}"
  end

  private

  def set_role
    if self.role == 'Admin' && User.current.present? && !User.current.admin?
      self.role = 'Customer'
    end
  end



end
