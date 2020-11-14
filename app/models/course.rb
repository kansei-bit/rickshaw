class Course < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1区' },
    { id: 3, name: '特区' },
    { id: 4, name: '貸切' }
  ]

  include ActiveHash::Associations
  has_many :receipts
end
