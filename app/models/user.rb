class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} do
          validates :last_name
          validates :first_name
         end
         with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/} do
           validates :last_name_ruby
           validates :first_name_ruby
         end
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: { with: PASSWORD_REGEX }
         validates :email, uniqueness: true
         validates :birthday, presence: true

end
