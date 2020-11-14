class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, length: {minimum: 6 }, format: { with: PASSWORD_REGEX, message: '半角英数字混合で入力してください' }
    validates :nickname
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    validates :family_name, format: { with: NAME_REGEX, message: '全角の数字以外を使用してください' }
    validates :first_name, format: { with: NAME_REGEX, message: '全角の数字以外を使用してください' }
    NAME_REGEX_ALIAS = /\A[ァ-ヶー－]+\z/
    validates :family_name_alias, format: { with: NAME_REGEX_ALIAS, message: '全角カタカナを使用してください' }
    validates :first_name_alias, format: { with: NAME_REGEX_ALIAS, message: '全角カタカナを使用してください' }
    validates :birthday
  end
end
