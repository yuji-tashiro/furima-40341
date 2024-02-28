class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname,        presence: true
  validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,        presence: true

  # パスワードのカスタムバリデーション
  validate :password_complexity

  private

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}$/

    errors.add :password, 'は半角英字と数字をそれぞれ1文字以上含む必要があります'
  end
end
