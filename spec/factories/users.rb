FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.email }
    password { 'abc123' }
    password_confirmation { 'abc123' }
    last_name { '斎藤' }
    first_name { '太郎' }
    last_name_kana { 'サイトウ' }
    first_name_kana { 'タロウ' }
    birth_date { '2000-01-01' }
  end
end
