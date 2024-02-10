require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "メールアドレスが空だと登録できない" do
      
    end
    it "メールアドレスが他ユーザーと被った状態では登録できない" do
    end
    it "@がないとメールアドレスを登録できない" do
    end
    it "パスワードが空だと登録できない" do
    end
    it "パスワードが5文字以下だと登録できない" do
    end
    it "パスワード再確認が空だと登録できない" do
    end
    it "パスワードとパスワード再確認が一致しないと登録できない" do
    end
    it "ユーザー名が空だと登録できない" do
    end
    it "プロフィールが空だと登録できない" do
    end
    it "所属が空だと登録できない" do
    end
    it "役職が空だと登録できない" do
    end
  end
end
