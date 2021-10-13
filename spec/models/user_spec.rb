# frozen_string_literal: true

require 'rails_helper'

describe 'USERモデルのテスト' do
  it '有効なユーザ登録の場合は保存されるか' do
    expect(FactoryBot.build(:user)).to be_valid
  end
end