class User < ActiveRecord::Base
  acts_as_paranoid
  default_scope { order ('created_at DESC') }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
end
