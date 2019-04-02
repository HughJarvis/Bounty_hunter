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

Bounty.all()

bounty2.favourite_weapon = 'slotted spoon'

bounty2.update()

binding.pry

bounty1.delete_one

Bounty.find_by_name('Pygar')

p "hugh"
