local hero = {}

hero.x = 0
hero.y = 0
hero.Twidth = 100
hero.Theight = 100
hero.speed = 10

function hero.update(dt)
  if love.keyboard.isDown("z") then
    hero.y = hero.y - hero.speed
  end
  if love.keyboard.isDown("s") then
    hero.y = hero.y + hero.speed
  end
  if love.keyboard.isDown("d") then
    hero.x = hero.x + hero.speed
  end
  if love.keyboard.isDown("q") then
    hero.x = hero.x - hero.speed
  end
end

function hero.draw()
  love.graphics.rectangle("fill", hero.x, hero.y, hero.Twidth, hero.Theight)

end

return hero
