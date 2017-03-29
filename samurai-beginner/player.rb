require 'pry'

# Player
class Player
  def update!(warrior)
    @warrior = warrior
  end

  def i_feel_something?
    true unless @warrior.feel.to_s == 'nothing'
  end

  def i_am_near_death?
    @warrior.health <= 12
  end

  def i_have_taken_damage_recently?
    @warrior.health >= @health.to_i
  end

  def it_is_worth_healing?
    i_am_near_death? && i_have_taken_damage_recently?
  end

  def it_feels_like_a_captive?
    @warrior.feel.captive?
  end

  def play_turn(warrior)
    update! warrior

    if i_feel_something?
      if it_feels_like_a_captive?
        warrior.rescue!
      else
        warrior.attack!
      end
    elsif it_is_worth_healing?
      warrior.rest!
    else
      warrior.walk!
    end

    @health = warrior.health
  end
end
