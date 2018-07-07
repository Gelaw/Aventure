local hero = require("hero")
local room = require("room")

function love.load()

  width = love.graphics.getWidth()
  height = love.graphics.getHeight()

  hero.init()
  room.init()
end

function love.update(dt)
  hero.update(dt)
end

function love.draw()
  room.draw(hero.x, hero.y)
  hero.draw()
end

function love.keypressed(key)

  print(key)

end
