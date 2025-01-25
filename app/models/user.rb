class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 必須項目のバリデーション
  validates :nickname, :birth_date, presence: true

  # パスワードのバリデーション
  validates :password, format: {
    with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/
  }

  # 名前に関するバリデーション
  with_options presence: true do
    validates :last_name, format: {
      with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
    }

    validates :first_name, format: {
      with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
    }

    validates :last_name_kana, format: {
      with: /\A[\p{katakana}ー－]+\z/
    }

    validates :first_name_kana, format: {
      with: /\A[\p{katakana}ー－]+\z/
    }
  end
end
