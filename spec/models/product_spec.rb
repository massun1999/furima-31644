require 'rails_helper'

RSpec.describe Product, type: :model do
  describe Product do
    before do
      @product = FactoryBot.build(:product)
    end

    describe '商品出品機能' do

      context '商品出品がうまくいくとき' do
        it "全ての項目が入力されていると出品できる" do
          expect(@product).to be_valid
        end
        it "販売価格が半角数字であれば出品できる" do
          @product.price = 5000
          expect(@product).to be_valid
        end
        it "価格の範囲が¥300から¥9,999,999であれば出品できる" do
          @product.price = 5000
          expect(@product).to be_valid
        end
      end

      context '出品ができないとき' do
        it "nameが空だと登録できない" do
          @product.name = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Name can't be blank")
        end
        it "explanationが空だと登録できない" do
          @product.explanation = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Explanation can't be blank")
        end
        it "ctegory_idが空だと登録できない" do
          @product.category_id = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Category is not a number")
        end
        it "condition_idが空だと登録できない" do
          @product.condition_id = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Condition is not a number")
        end
        it "postage_idが空だと登録できない" do
          @product.postage_id = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Postage is not a number")
        end
        it "source_idが空だと登録できない" do
          @product.source_id = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Source is not a number")
        end
        it "shipping_day_idが空だと登録できない" do
          @product.shipping_day_id = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Shipping day is not a number")
        end
        it "priceが空だと登録できない" do
          @product.price = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Price can't be blank")
        end
        it "priceが全角漢字だと登録できない" do
          @product.price = "山田"
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is not a number")
        end
        it "priceが全角かなだと登録できない" do
          @product.price = "やまだ"
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is not a number")
        end
        it "priceが全角カナだと登録できない" do
          @product.price = "ヤマダ"
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is not a number")
        end
        it "priceが半角英字だと登録できない" do
          @product.price = "yamada"
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is not a number")
        end
        it "priceに記号が含まれていると登録できない" do
          @product.price = "300#.5"
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is not a number")
        end
        it "priceが300未満だと登録できない" do
          @product.price = 299
          @product.valid?
          expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it "priceが¥10,000,000以上だと登録できない" do
          @product.price = 10000000
          @product.valid?
          expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
        it "userが紐づいていないと登録できない " do
          @product.user = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("User must exist")
        end
        it "ctegory_idが1だと登録できない" do
          @product.category_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Category must be other than 1")
        end
        it "condition_idが1だと登録できない" do
          @product.condition_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Condition must be other than 1")
        end
        it "postage_idが1だと登録できない" do
          @product.postage_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Postage must be other than 1")
        end
        it "source_idが1だと登録できない" do
          @product.source_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Source must be other than 1")
        end
        it "shipping_day_idが1だと登録できない" do
          @product.shipping_day_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Shipping day must be other than 1")
        end
      end
    end
  end
end
