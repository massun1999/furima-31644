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
    end


    context '新規登録がうまくいかないとき' do
      it "nickameが空だと登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "すでに登録されているメールアドレスは登録できない" do
      end
      it "emailには＠が含まれないと登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordは5文字以下だと登録できない" do
      end
      it "passwordが半角英数字混合でないと登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
    end
  end
end