local husband = require("husband")
local Personnage = require("personnage")

local room = {}
room.ground = {}
room.tilesize = 0

function room.init()
  lover = Personnage:new()
  lover:init(5,5,isWalkable)
  husband = Personnage:new()
  husband:init(20,16, isWalkable)

  room.ground = {
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}}
  room.tilesize = 50

  --lover:initPathFinding(20,15)

end

function room.draw()
  local xHero = lover.x
  local yHero = lover.y
  nbTileWidth = width/room.tilesize
  nbTileHeight = height/room.tilesize
  for x = xHero - nbTileWidth / 2, xHero + nbTileWidth / 2, 1 do
    for y = yHero - nbTileHeight/ 2, yHero + nbTileHeight / 2, 1 do
      if y <= 0 or y > #room.ground then
        love.graphics.setColor(0, 0, 0)
      elseif x <= 0 or x > #room.ground[y] then
        love.graphics.setColor(0, 0, 0)
      elseif room.ground[y][x] == 0 then
        love.graphics.setColor(116, 108, 0)
      elseif room.ground[y][x] == 1 then
        love.graphics.setColor(53, 58, 62)
      end
      love.graphics.rectangle("fill", (x - xHero)* room.tilesize + width/2, (y - yHero) * room.tilesize + height /2, room.tilesize, room.tilesize)
    end
  end
  love.graphics.setColor(255, 0, 0)
  room.drawPersonnage(husband, xHero, yHero)
  love.graphics.setColor(255, 255, 255)
  room.drawPersonnage(lover, xHero, yHero)
  love.graphics.setColor(255, 255, 255)

  lover:drawVision(lover,3)
end

function room.drawPersonnage(personnage, xCam, yCam)
  if personnage.x > xCam - nbTileWidth / 2 - 1 and personnage.x < xCam + nbTileWidth / 2
   and personnage.y > yCam - nbTileHeight/ 2 - 1 and personnage.y < yCam + nbTileHeight/ 2 then
     love.graphics.rectangle("fill",(personnage.x - xCam)*room.tilesize + width/2, (personnage.y - yCam) * room.tilesize + height/2, room.tilesize, room.tilesize)
  end
end

isWalkable = function (x,y)
  if room.ground[y][x] == 0 then
    return true
  else
    return false
  end
end

function room.update(dt)
  husband:update(dt)
  lover:update(dt)
  if love.keyboard.isDown("z") or love.keyboard.isDown("up") then
    lover:move("up")
  end
  if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
    lover:move("down")
  end
  if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
    lover:move("right")
  end
  if love.keyboard.isDown("q") or love.keyboard.isDown("left") then
    lover:move("left")
  end
end

return room
