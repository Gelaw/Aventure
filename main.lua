local hero = require("hero")

function love.load()

  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()

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
