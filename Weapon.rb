class Weapon

  def chooseweapon
    puts 'Choose your weapon - input 1 for take hendgun,2 for gun and 3 for tommygun'
    clip = 0
    startdmg = 0
    weapon_type = gets.chomp
    if weapont_type == 1
      ammount = 12
      type = 'hendgun'
      attack = 5
      else if weapon_type == 2
             ammount = 6
             type = 'gun'
             attack = 10
             else if weapon_type == 3
                    ammount = 30
                    type = 'tommygun'
                    attack = 2
                  else
                    puts 'it was wrong choice'
                  end
           end
    end
  end
  def shoot
    if clip > 0
      puts 'BANG!'
      clip -= 1
      startdmg += attack
      puts 'your make' + startdmg + 'damage'
    else
      puts 'You should reload your weapon'
    end
  end
  def reload
    clip = ammount
  end
end