class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :properties
  has_many :wish_lists

  scope :agent, -> { where(role: 'Agent') }
  scope :customer,  -> { where(role: 'Customer') }

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



end
