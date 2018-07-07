local hero = {}

hero.x = 0
hero.y = 0


hero.width = 100
hero.height = 100
hero.speed = 1
hero.offSetX = hero.width/2
hero.offSetY = hero.height/2



function hero.init()
  hero.x = 5
  hero.y = 5
  --hero.screenX = love.graphics.getWidth()/2
  --hero.screenY = love.graphics.getHeight()/2
end

function hero.update(dt)
  hero.screenX = width / 2
  hero.screenY = height / 2
  end

function hero.draw()
  love.graphics.rectangle("fill", hero.screenX , hero.screenY , hero.width, hero.height)

end

function hero.keypressed(key)
  if key == "z" then
    --hero.screenY = hero.screenY - hero.speed
    hero.y = hero.y - 1
  end
  if key == "s" then
  --  hero.screenY = hero.screenY + hero.speed
    hero.y = hero.y + 1

  end
  if key == "d"  then
  --hero.screenX = hero.screenX + hero.speed
    hero.x = hero.x + 1

  end
  if key == "q" then
  --  hero.screenX = hero.screenX - hero.speed
  hero.x = hero.x - 1

  end
end

return hero
