require('pry-byebug')
require_relative('models/bounty.rb')

bounty1 = Bounty.new({
  'name' => 'Spock',
  'species' => 'Klingon',
  'bounty_value' => '1000',
  'favourite_weapon' => 'pillow'
  })

bounty1.save()

  bounty2 = Bounty.new({
    'name' => 'Pygar',
    'species' => 'Angel',
    'bounty_value' => '500',
    'favourite_weapon' => 'whisk'
    })

bounty2.save()
