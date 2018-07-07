local hero = require("hero")
local room = require("room")

function isWalkable(x,y)
  if room.ground[x][y] == 0 then
    return true
  else
    return false
  end
end

function love.load()

  width = love.graphics.getWidth()
  height = love.graphics.getHeight()

  hero.init()
  room.init()
end

function love.update(dt)
  hero.update(dt, isWalkable(hero.x, hero.y))
end

function love.draw()
  room.draw(hero.x, hero.y)
  hero.draw()
end

function love.keypressed(key)

  hero.keypressed(key)
  print(key)

end
