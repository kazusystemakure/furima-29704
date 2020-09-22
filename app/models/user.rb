class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  NAME_REGEX = [/\A[ぁ-んァ-ン一-龥]/, /\A[ァ-ヶー－]+\z/]

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: NAME_REGEX[0], message: 'Full-width characters.' }
    validates :last_name, format: { with: NAME_REGEX[0], message: 'full-width characters.' }
    validates :first_name_kana, format: { with: NAME_REGEX[1], message: 'Full-width katakana characters.' }
    validates :last_name_kana, format: { with: NAME_REGEX[1], message: 'Full-width katakana characters.' }
    validates :birth_date
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,10}\z/i, message: 'Include both letters and numbers.' }
end
