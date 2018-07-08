--additionnal materials
function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end
local clock = os.clock
function sleep(n)
  local t0 = clock()
  while clock() - to <= n do end
end
--require
local room = require("room")

--images
local imgMenu = love.graphics.newImage("images/imgMenu.jpg")

local currScreen = "game"

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  room.init()
end

function love.update(dt)
  if currScreen == "game" then
    room.update(dt)
  end
end

function drawMenu()
  love.graphics.draw(imgMenu, 0, 0,0,0.8,0.9)
end

function love.draw()
  if currScreen == "game" then
    room.draw()
  end
  if currScreen == "menu" then
    drawMenu()
  end


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
  if currScreen == "menu" and key == "space" then
    currScreen = "game"
  end
end
