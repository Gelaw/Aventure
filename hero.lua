local hero = {}

hero.x = 0
hero.y = 0


hero.width = 100
hero.height = 100
hero.speed = 10
hero.offSetX = hero.width/2
hero.offSetY = hero.height/2

hero.screenX = hero.width * hero.x
hero.screenY = hero.height * hero.y

function hero.init()
  hero.x = 5
  hero.y = 5
  --hero.screenX = love.graphics.getWidth()/2
  --hero.screenY = love.graphics.getHeight()/2
end

function hero.update(dt)

    if love.keyboard.isDown("z") and hero.screenY - hero.offSetY > 0 then
      hero.screenY = hero.screenY - hero.speed
    end
    if love.keyboard.isDown("s") and hero.screenY + hero.offSetY < height then
      hero.screenY = hero.screenY + hero.speed
    end
    if love.keyboard.isDown("d") and hero.screenX + hero.offSetX< width then
      hero.screenX = hero.screenX + hero.speed
    end
    if love.keyboard.isDown("q") and hero.screenX - hero.offSetX  > 0 then
      hero.screenX = hero.screenX - hero.speed
    end
  end

function hero.draw()
  love.graphics.rectangle("fill", hero.screenX - hero.offSetX, hero.screenY - hero.offSetY , hero.width, hero.height)

end

return hero
