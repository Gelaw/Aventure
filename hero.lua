local hero = {}

hero.x = 0
hero.y = 0

hero.width = 100
hero.height = 100
hero.speed = 10
hero.offSetX = hero.width/2
hero.offSetY = hero.height/2

function hero.init()
  hero.x = love.graphics.getWidth()/2
  hero.y = love.graphics.getHeight()/2
end

function hero.update(dt)

    if love.keyboard.isDown("z") and hero.x - hero.offSetX > 0 then
      hero.y = hero.y - hero.speed
    end
    if love.keyboard.isDown("s") and hero.x + hero.offSetX < width then
      hero.y = hero.y + hero.speed
    end
    if love.keyboard.isDown("d") and hero.y + hero.offSetY < height then
      hero.x = hero.x + hero.speed
    end
    if love.keyboard.isDown("q") and hero.y - hero.offSetY > 0 then
      hero.x = hero.x - hero.speed
    end
  end

function hero.draw()
  love.graphics.rectangle("fill", hero.x - hero.offSetX, hero.y - hero.offSetY , hero.width, hero.height)

end

return hero
