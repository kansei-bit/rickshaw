require 'rails_helper'

RSpec.describe Shafu, type: :model do
  describe '俥夫新規登録' do
    before do
      @shafu = FactoryBot.build(:shafu)
    end

    it "全ての情報を正しく入力していれば登録できる" do
      expect(@shafu).to be_valid
    end
    it "emailが空では登録できない" do
      @shafu.email = nil
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include("Email can't be blank")
    end
    it "既に登録されているemailでは登録できない" do
      another_shafu = FactoryBot.create(:shafu)
      @shafu.email = another_shafu.email
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include('Email has already been taken')
    end
    it "@を含まないemailでは登録できない" do
      @shafu.email.delete!('@')
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include('Email is invalid')
    end
    it "passwordが空では登録できない" do
      @shafu.password = nil
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが6文字以上であれば登録できる" do
      password = '123abc'
      @shafu.password = password
      @shafu.password_confirmation = password
      @shafu.valid?
      expect(@shafu).to be_valid
    end
    it "passwordが6文字未満なら登録できない" do
      password = '123ab'
      @shafu.password = password
      @shafu.password_confirmation = password
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it "passwordが半角数字だけでは登録できない" do
      password = '123456'
      @shafu.password = password
      @shafu.password_confirmation = password
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it "passwordが半角英字だけでは登録できない" do
      password = 'abcdefg'
      @shafu.password = password
      @shafu.password_confirmation = password
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it "password_confirmationが空では登録できない" do
      @shafu.password_confirmation = ''
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationの値が一致していなければ登録できない" do
      @shafu.password_confirmation = '123abc'
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "lnameが空では登録できない" do
      @shafu.lname = nil
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include("Lname can't be blank")
    end
    it "fnameが空では登録できない" do
      @shafu.fname = nil
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include("Fname can't be blank")
    end
    it "lnameが全角でなければ登録できない" do
      @shafu.lname = Faker::Name.name
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include('Lname Full-width characters')
    end
    it "fnameが全角でなければ登録できない" do
      @shafu.fname = Faker::Name.name
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include('Fname Full-width characters')
    end
    it "lname_katakanaが空では登録できない" do
      @shafu.lname_katakana = nil
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include("Lname katakana can't be blank")
    end
    it "fname_katakanaが空では登録できない" do
      @shafu.fname_katakana = nil
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include("Fname katakana can't be blank")
    end
    it "lname_katakanaは全角カタカナでなければ登録できない" do
      @shafu.lname_katakana = Faker::Name.name
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include('Lname katakana Full-width katakana characters')
    end
    it "fname_katakanaは全角カタカナでなければ登録できない" do
      @shafu.fname_katakana = Faker::Name.name
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include('Fname katakana Full-width katakana characters')
    end
    it "birthdayが空では登録できない" do
      @shafu.birthday = nil
      @shafu.valid?
      expect(@shafu.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
