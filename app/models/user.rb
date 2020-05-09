# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books

  after_create :send_notification

  def admin?
    user_role == "admin"
  end

  def regular?
    user_role == "regular"
  end

  def guest?
    user_role == "guest"
  end

  def send_notification
    AdminMailer.new_user(self).deliver
  end

  def likes?(book)
    book.likes.where(user_id: id).any?
  end

  private
    def user_role
      role.downcase
    end
end
