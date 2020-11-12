require 'rails_helper'

RSpec.describe Shafu, type: :model do
  describe '俥夫新規登録' do
    it "全ての情報を正しく入力していれば登録できる" do
    end
    it "" do
    end
    it "emailが空では登録できない" do
    end
    it "既に登録されているemailでは登録できない" do
    end
    it "@を含まないemailでは登録できない" do
    end
    it "passwordが空では登録できない" do
    end
    it "passwordが6文字以上であれば登録できる" do
    end
    it "passwordが6文字未満なら登録できない" do
    end
    it "passwordが半角英字だけでは登録できない" do
    end
    it "password_confirmationが空では登録できない" do
    end
    it "passwordとpassword_confirmationの値が一致していなければ登録できない" do
    end
    it "lnameが空では登録できない" do
    end
    it "fnameが空では登録できない" do
    end
    it "lnameが全角でなければ登録できない" do
    end
    it "fnameが全角でなければ登録できない" do
    end
    it "lname_katakanaが空では登録できない" do
    end
    it "fname_katakanaが空では登録できない" do
    end
    it "lname_katakanaは全角カタカナでなければ登録できない" do
    end
    it "fname_katakanaは全角カタカナでなければ登録できない" do
    end
    it "birthdayが空では登録できない" do
    end
  end
end
