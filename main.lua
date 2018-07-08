--additionnal materials
function math.dist(x1,y1, x2,y2) return (math.abs(x2-x1)+math.abs(y2-y1)) end
local clock = os.clock
function sleep(n)
  local t0 = clock()
  while clock() - t0 <= n do end
end
--require
local room = require("room")

--images
local imgMenu = love.graphics.newImage("images/imgMenu.jpg")
local imgGameOver = love.graphics.newImage("images/imgGameOver.jpg")
local imgVictory = love.graphics.newImage("images/imgVictory.jpg")

local currScreen = "menu"

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  room.init()
end

function love.update(dt)
  if currScreen == "game" then
    room.update(dt)
  end
  if lover.x == husband.x and lover.y == husband.y then
    loose()
  end

end

local font = love.graphics.newFont("fonts/Sonika.ttf", 20)

function drawMenu()
  love.graphics.draw(imgMenu, 0, 0,0,1.5,2)
  love.graphics.setFont(font)
  love.graphics.setColor(255, 0, 0)
  love.graphics.print("AVENTURE",90,40,0.4,4,4)
  love.graphics.setColor(255, 165, 0)
  love.graphics.print("Press space to start", width/2-200, height-100,0,2,2)
  love.graphics.setColor(238, 130, 238)
end
function drawGameOver()
  love.graphics.draw(imgGameOver, 0, 0,0,0.8,0.9)
end
function drawVictory()
  love.graphics.setColor(0, 255, 0,200)
  love.graphics.draw(imgVictory, 0, 0,0,1.6,1)
  love.graphics.setColor(255, 255, 255)
  love.graphics.setFont(font)
  love.graphics.print("You escaped, GJ filthy bastard", 100, height-100,0,2,2)
end
function love.draw()
  if currScreen == "game" then
    room.draw()
  end
  if currScreen == "menu" then
    drawMenu()
  end
  if currScreen == "gameOver" then
    drawGameOver()
  end
  if currScreen == "victory" then
    drawVictory()
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
function loose()
  currScreen = "gameOver"
end
function win()
  currScreen = "victory"
end
function reset()
  currScreen = "menu"
  room.init()
end
function love.keypressed(key)
  if currScreen == "menu" and key == "space" then
    currScreen = "game"
  end
  if currScreen == "victory" or currScreen == "gameOver" and key == "space" then
    reset()
  end

end
