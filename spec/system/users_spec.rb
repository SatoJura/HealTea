# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザ新規登録のテスト' do
  before do
    visit new_user_registration_path
  end

  context '表示内容の確認' do
    it 'URLが正しい' do
      expect(current_path).to eq '/users/sign_up'
    end
    it '「新規登録」と表示される' do
      expect(page).to have_content '新規登録'
    end
    it 'nicknameフォームが表示される' do
      expect(page).to have_field 'user[nickname]'
    end
    it 'emailフォームが表示される' do
      expect(page).to have_field 'user[email]'
    end
    it 'passwordフォームが表示される' do
      expect(page).to have_field 'user[password]'
    end
    it 'password_confirmationフォームが表示される' do
      expect(page).to have_field 'user[password_confirmation]'
    end
    it '登録ボタンが表示される' do
      expect(page).to have_button '登録'
    end
  end

  context '新規登録成功のテスト' do
    before do
      fill_in 'user[nickname]', with: Faker::Lorem.characters(number: 10)
      fill_in 'user[email]', with: Faker::Internet.email
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
    end

    it '正しく新規登録される' do
      expect { click_button '登録' }.to change(User.all, :count).by(1)
    end
  end
end