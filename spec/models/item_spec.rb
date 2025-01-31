require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品画像のバリデーション' do
    it '画像がアップロードされていない場合、エラーメッセージが表示される' do
      @item = FactoryBot.build(:item)
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '画像がアップロードされていれば登録できる' do
      @item = FactoryBot.build(:item, :with_image)
      expect(@item).to be_valid
    end
  end

  describe 'カテゴリーのバリデーション' do
    it 'category_idが空では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Category を選択してください'
    end
  end

  describe '商品名と説明のバリデーション' do
    it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end

    it '説明が空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
    end
  end

  describe '商品の状態のバリデーション' do
    it '商品の状態が未選択の場合、登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Condition を選択してください'
    end

    it '商品の状態が選択されていれば登録できる' do
      @item = FactoryBot.build(:item, :with_image)
      expect(@item).to be_valid
    end
  end

  describe '配送情報のバリデーション' do
    it '配送料の負担が選択されていないと登録できない' do
      @item.shipping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Shipping cost を選択してください'
    end

    it '発送元の地域が選択されていないと登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'Prefecture を選択してください'
    end

    it '発送までの日数が選択されていないと登録できない' do
      @item.shipping_time_id = 1
    end
  end

  describe '価格のバリデーション' do
    it '価格が空では登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    it '価格が300円未満では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
    end

    it '価格が9999999円を超えると登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
    end
  end
end
