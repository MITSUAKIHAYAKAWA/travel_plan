class Transportation < ActiveHash::Base
  self.data = [
    { id: 1,
      name: '---' }, { id: 2, name: '車' }, { id: 3, name: '徒歩' }, { id: 4, name: 'バス' }, { id: 5, name: '船' }, { id: 6, name: 'タクシー' }
  ]
  include ActiveHash::Associations
  has_many :travels
end
