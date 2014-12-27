class User < ActiveRecord::Base

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :notes
  has_many :items
  validates_presence_of :name


  def set_default_role
  	self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :database_authenticatable, :registerable,
  # :recoverable, :rememberable, :trackable, :validatable

  devise :database_authenticatable, :timeoutable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable
end