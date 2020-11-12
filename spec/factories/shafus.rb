FactoryBot.define do
  factory :shafu do
    email { Faker::Internet.free_email }
    password = 'abc123'
    password { password }
    password_confirmation { password }
    gimei = Gimei.name
    lname { gimei.last.kanji }
    fname { gimei.first.kanji }
    lname_katakana { gimei.last.katakana }
    fname_katakana { gimei.first.katakana }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 90) }
  end
end
