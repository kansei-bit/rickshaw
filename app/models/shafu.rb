class Shafu < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  zenkaku = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  zenkaku_katakana = /\A[ァ-ヶー－]+\z/
  validates :birthday, presence: true
  validates :password, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' }
  with_options presence: true, format: { with: zenkaku, message: 'Full-width characters' } do
    validates :lname
    validates :fname
  end
  with_options presence: true, format: { with: zenkaku_katakana, message: 'Full-width katakana characters' } do
    validates :lname_katakana
    validates :fname_katakana
  end
end
