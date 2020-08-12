class Day < ActiveHash::Base
  self.data = [
   { id: 1, name: '--' },
   { id: 2, name: '１〜２日の発送' },
   { id: 3, name: '２〜３日の発送' },
   { id: 4, name: '４〜７日の発送' }
  ]
end
