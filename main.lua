function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end


local hero = require("hero")
local room = require("room")

function love.load()

  width = love.graphics.getWidth()
  height = love.graphics.getHeight()

  hero.init()
  room.init()
end

function love.update(dt)
  room.update(dt)
  hero.update(dt, room.isWalkable(hero.x, hero.y))
end

function love.draw()
  room.draw(hero.x, hero.y)
  hero.draw()

--[[ affiche distance hero to cell
  for x = -10, 10, 1 do
    for y = -10, 10, 1 do
      --print("hx"..hero.x - x.."hy"..hero.y - y)
      if hero.y + y <= 0 or hero.y + y > #room.ground then
     elseif hero.x + x <= 0 or hero.x + x > #room.ground[hero.y + y] then
      elseif room.ground[hero.y + y][hero.x + x] == 0 then
            love.graphics.setColor(255, 0, 0)
            local dist =10 * math.floor(math.dist(hero.x, hero.y, hero.x - x, hero.y - y))
            print(dist)
            love.graphics.print(100-dist ,width /2 + x * 50 +23, height / 2 + y * 50 +23 )
            love.graphics.setColor(0, 0, 0)
      end
    end
  end
--]]

end

function love.keypressed(key)

  hero.keypressed(key)
  print(key)

end
