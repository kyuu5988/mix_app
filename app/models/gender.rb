class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '回答しない' },
    { id: 2, name: '女性' },
    { id: 3, name: '男性' }
  ]
end
