class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 必須項目のバリデーション
  validates :nickname, :birth_date, presence: true

  # パスワードのバリデーション
  validates :password, format: {
    with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/,
    message: 'は6文字以上で、英字と数字を両方含めて設定してください'
  }

  # お名前(全角)のバリデーション（漢字・ひらがな・カタカナのみ許可）
  validates :last_name, :first_name, format: {
    with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/

  }

  # お名前カナ(全角)のバリデーション（全角カタカナのみ許可）
  validates :last_name_kana, :first_name_kana, format: {
    with: /\A[\p{katakana}ー－]+\z/
  }
end
