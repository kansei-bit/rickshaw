class Adult < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1' },
    { id: 3, name: '2' },
  ]

  include ActiveHash::Associations
  has_many :receipts
end
