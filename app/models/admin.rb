class Admin < ActiveRecord::Base

  ROLES = {full_access: 0, restrited_access: 1}

  enum role: ROLES

  scope :filter_full_access, -> { all }
  scope :filter_restrited_access, -> { where(role: ROLES[:restrited_access]) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
