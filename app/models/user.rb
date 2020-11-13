class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, length: {minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i, message: '半角英数字混合で入力してください' }
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角の数字以外を使用してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角の数字以外を使用してください' }
    validates :family_name_alias, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' }
    validates :first_name_alias, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' }
    validates :birthday
  end
end
