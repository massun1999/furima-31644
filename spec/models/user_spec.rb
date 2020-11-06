require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき'do
      it "全ての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上の半角英数混合であれば登録できる" do
       @user.password = "yamada123"
       expect(@user).to be_valid
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
       @user.first_name = "太ろウ"
       expect(@user).to be_valid
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）で登録できる" do
       @user.last_name = "やマ田"
       expect(@user).to be_valid
      end
      it "first_name_rubyが全角（カタカナ）であれば登録できる" do
        @user.first_name_ruby = "カタカナ"
        expect(@user).to be_valid
      end
      it "last_name_rubyが全角（カタカナ）であれば登録ができる" do
        @user.last_name_ruby = "カタカナ"
        expect(@user).to be_valid
      end
      it "birthdayがあれば登録できる" do
        @user.birthday = "2020-01-01"
        expect(@user).to be_valid
      end
    end


    context '新規登録がうまくいかないとき' do
      it "nickameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "すでに登録されているメールアドレスは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailには＠が含まれないと登録できない" do
        @user.email = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordは5文字以下だと登録できない" do
        @user.password = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英字だけでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが数字だけでは登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "paaawordに全角漢字かなカナ記号が含まれると登録できない" do
        @user.password = "あイ右ab.3"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameに半角英字が含まれると登録できない" do
        @user.first_name = "やマda"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "first_nameに数字が含まれると登録できない" do
        @user.first_name = "やマ田3"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "first_nameに記号が含まれると登録できない" do
        @user.first_name = "やマ.田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameに半角英字が含まれると登録できない" do
        @user.last_name = "太ro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "last_nameに数字が含まれると登録できない" do
        @user.last_name = "太ろウ3"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "last_nameに記号が含まれると登録できない" do
        @user.last_name = "太.ろウ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_name_rubyが空だと登録できない" do
        @user.first_name_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby can't be blank")
      end
      it "first_name_rubyに半角英字が含まれると登録できない" do
        @user.first_name_ruby = "ヤマda"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby is invalid")
      end
      it "first_name_rubyに数字が含まれると登録できない" do
        @user.first_name_ruby = "ヤマダ1"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby is invalid")
      end
      it "first_name_rubyに全角漢字かなが含まれると登録できない" do
        @user.first_name_ruby = "やマ田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby is invalid")
      end
      it "last_name_rubyが空だと登録できない" do
        @user.last_name_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
      end
      it "last_name_rubyに半角英字が含まれると登録できない" do
        @user.last_name_ruby = "ヤマda"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby is invalid")
      end
      it "last_name_rubyに数字が含まれると登録できない" do
        @user.last_name_ruby = "ヤマダ1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby is invalid")
      end
      it "last_name_rubyに全角漢字かなが含まれると登録できない" do
        @user.last_name_ruby = "やマ田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end