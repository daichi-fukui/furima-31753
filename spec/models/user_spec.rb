require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、password_confirmation、family_name、first_name、family_name_alias、first_name_alias、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で半角英数字混合であれば登録できる" do
        @user.password = "0a0a0a"
        @user.password_confirmation = "0a0a0a"
        expect(@user).to be_valid
      end
      it "family_nameが全角の数字以外であれば登録できる" do
        @user.family_name = "あア亜"
        expect(@user).to be_valid
      end
      it "first_nameが全角の数字以外であれば登録できる" do
        @user.first_name = "あア亜"
        expect(@user).to be_valid
      end
      it "family_name_aliasが全角カタカナであれば登録できる" do
        @user.family_name = "カタカナ"
        expect(@user).to be_valid
      end
      it "first_name_aliasが全角カタカナであれば登録できる" do
        @user.family_name = "カタカナ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "Passwordが半角英数字混合でなければ登録できない" do
        @user.password = "０００あア亜"
        @user.password_confirmation = "０００あア亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力してください")
      end
      it "family_nameが数字だと登録できない" do
        @user.family_name = "0"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角の数字以外を使用してください")
      end
      it "family_nameが半角だと登録できない" do
        @user.family_name = "ｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角の数字以外を使用してください")
      end
      it "first_nameが数字だと登録できない" do
        @user.first_name = "0"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角の数字以外を使用してください")
      end
      it "first_nameが半角だと登録できない" do
        @user.family_name = "ｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角の数字以外を使用してください")
      end
      it "family_name_aliasが数字だと登録できない" do
        @user.family_name_alias = "0"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name alias 全角カタカナを使用してください")
      end
      it "family_name_ariasがひらがなだと登録できない" do
        @user.family_name_alias = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name alias 全角カタカナを使用してください")
      end
      it "family_name_ariasが漢字だと登録できない" do
        @user.family_name_alias = "亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name alias 全角カタカナを使用してください")
      end
      it "family_name_ariasが半角だと登録できない" do
        @user.family_name_alias = "ｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name alias 全角カタカナを使用してください")
      end
      it "first_name_ariasが数字だと登録できない" do
        @user.first_name_alias = "0"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name alias 全角カタカナを使用してください")
      end
      it "first_name_ariasがひらがなだと登録できない" do
        @user.first_name_alias = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name alias 全角カタカナを使用してください")
      end
      it "first_name_ariasが漢字だと登録できない" do
        @user.first_name_alias = "亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name alias 全角カタカナを使用してください")
      end
      it "first_name_ariasが半角だと登録できない" do
        @user.first_name_alias = "ｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name alias 全角カタカナを使用してください")
      end
      it "Birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
