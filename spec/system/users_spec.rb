require 'rails_helper'

RSpec.describe "ユーザー管理機能", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context "ユーザー登録ができる時" do
    it "正しい情報を入力して新規登録できるとトップページに移動できる" do
      #トップページに最初に入る
      visit root_path
      #ページ内には「新規登録」というボタンがある
      expect(page).to have_content("新規登録")
      #新規登録ページに移動する
      visit new_user_registration_path
      #新規登録に必要な情報を入力する
      fill_in "user_email",with: @user.email
      fill_in "user_password",with: @user.password
      fill_in "user_password_confirmation",with: @user.password_confirmation
      fill_in "user_name",with: @user.name
      fill_in "user_profile",with: @user.profile
      fill_in "user_occupation",with: @user.occupation
      fill_in "user_position",with: @user.position
      #登録ボタンを押すとユーザーモデルのカウントが1上がる
      expect{
        find('input[name="commit"]').click
        sleep 1
      }.to change { User.count }.by(1)
      #トップページに移動する
      expect(page).to have_current_path(root_path)
      #トップページ上にログアウトボタンがある
      expect(page).to have_content("ログアウト")
      #新規登録ボタンやログインボタンはブラウザ上に表示されていない。
      expect(page).to have_no_content("新規登録")
      expect(page).to have_no_content("ログイン")
    end 
  end

  context "ユーザー登録ができない時" do
    it "正しく情報が入力されずユーザー登録ができずに新規登録ページに戻される" do
      #トップページに最初に入る
      visit root_path
      #ページ内には「新規登録」というボタンがある
      expect(page).to have_content("新規登録")
      #新規登録ページに移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in "user_email",with: ""
      fill_in "user_password",with: ""
      fill_in "user_password_confirmation",with: ""
      fill_in "user_name",with: ""
      fill_in "user_profile",with: ""
      fill_in "user_occupation",with:""
      fill_in "user_position",with: ""
      #登録ボタンを押すもユーザーモデルのカウントは増えない
      expect{
      find('input[name="commit"]').click
      sleep 1
    }.to change { User.count }.by(0)
      #新規登録ページに戻される
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end
