require 'rails_helper'
describe Sale do
  describe '#create' do
    context '有効な値' do
      it "有効な情報では登録可能" do
        user = build(:user)
        sale = build(:sale, seller_id: user.id)
        expect(sale).to be_valid
      end
    end

    context '名前欄' do
      it "名前が空では登録不可能" do
        sale = build(:sale, name: "")
        sale.valid?
        expect(sale.errors[:name]).to include("を入力してください")
      end
      it "名前が空白文字では登録不可能" do
        sale = build(:sale, name: "   ")
        sale.valid?
        expect(sale.errors[:name]).to include("を入力してください")
      end

      it "名前が40文字では登録可能" do
        sale = build(:sale ,name: "a"*40)
        expect(sale).to be_valid
      end
      it "名前が41文字では登録不可能" do
        sale = build(:sale, name: "a"*41)
        sale.valid?
        expect(sale.errors[:name]).to include("は40文字以内で入力してください")
      end
    end

    context '詳細欄' do
      it "詳細が空では登録不可能" do
        sale = build(:sale, detail: "")
        sale.valid?
        expect(sale.errors[:detail]).to include("を入力してください")
      end
      it "詳細が空白文字では登録不可能" do
        sale = build(:sale, detail: "   ")
        sale.valid?
        expect(sale.errors[:detail]).to include("を入力してください")
      end
      it "詳細が1000文字では登録可能" do
        sale = build(:sale ,detail: "a"*1000)
        expect(sale).to be_valid
      end
      it "詳細が1001文字では登録不可能" do
        sale = build(:sale, detail: "a"*1001)
        sale.valid?
        expect(sale.errors[:detail]).to include("は1000文字以内で入力してください")
      end
    end

    context 'セレクタ系' do
        it "商品状態がnilでは登録不可能" do
        sale = build(:sale, condition_id: nil)
        sale.valid?
        expect(sale.errors[:condition_id]).to include("を入力してください")
      end
      it "送料支払いがnilでは登録不可能" do
        sale = build(:sale, delivery_payer_id: nil)
        sale.valid?
        expect(sale.errors[:delivery_payer_id]).to include("を入力してください")
      end
      it "発送元がnilでは登録不可能" do
        sale = build(:sale, prefecture_id: nil)
        sale.valid?
        expect(sale.errors[:prefecture_id]).to include("を入力してください")
      end
      it "配送までの日数がnilでは登録不可能" do
        sale = build(:sale, prep_days_id: nil)
        sale.valid?
        expect(sale.errors[:prep_days_id]).to include("を入力してください")
      end
    end
  end
end