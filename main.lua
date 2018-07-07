local hero = require("hero")

function love.load()

  width = love.graphics.getWidth()
  height = love.graphics.getHeight()

  hero.init()

end

function love.update(dt)
  hero.update(dt)
end

function love.draw()
  hero.draw()
end

function love.keypressed(key)

  print(key)

end
