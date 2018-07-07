local hero = require("hero")
local room = require("room")

function love.load()

  width = love.graphics.getWidth()
  height = love.graphics.getHeight()

  hero.init()
  room.init()
end

function love.update(dt)
  room.upodate(dt)
  hero.update(dt, room.isWalkable(hero.x, hero.y))
end

function love.draw()
  room.draw(hero.x, hero.y)
  hero.draw()
end

function love.keypressed(key)

  hero.keypressed(key)
  print(key)

end
