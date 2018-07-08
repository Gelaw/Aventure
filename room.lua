local husband = require("husband")
local Personnage = require("personnage")

local room = {}
room.ground = {}
room.tilesize = 0

function room.init()
  room.ground = {
      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
      {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,1,0,1,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}}

  lover = Personnage:new()
  lover:init(5,5,isWalkable)
  husband = Personnage:new()
  husband:init(13,3, isWalkable)


  room.tilesize = 50

--  lover:initPathFinding({x = husband.x, y = husband.y})
  lover.isIA = true
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

  ---------------------
  local mouseX = love.mouse.getX() + lover.x * room.tilesize - width / 2
  local mouseY = love.mouse.getY() + lover.y * room.tilesize - height / 2
  local currColumn = math.floor(mouseX / room.tilesize)
  local currLine = math.floor(mouseY / room.tilesize)
  if currColumn>0 and  currColumn<= #room.ground[1]
    and currLine>0 and currLine<= #room.ground

 then
    local id = room.ground[currLine][currColumn]
    local infosPos = ""
    infosPos = infosPos.."Colonne:"..tostring(currColumn)..",Ligne:"..tostring(currLine).."\tID:"..tostring(id)
    infosPos = infosPos.."TileType: "..tostring(room.ground[currLine][currColumn].."("..tostring(id)..")")
    love.graphics.print(infosPos,0,0)
  else
    love.graphics.print("Hors du tableau",0,0)
  end
  ------------------
end

function room.drawPersonnage(personnage, xCam, yCam)
  if personnage.x > xCam - nbTileWidth / 2 - 1 and personnage.x < xCam + nbTileWidth / 2
   and personnage.y > yCam - nbTileHeight/ 2 - 1 and personnage.y < yCam + nbTileHeight/ 2 then
     love.graphics.rectangle("fill",(personnage.x - xCam)*room.tilesize + width/2, (personnage.y - yCam) * room.tilesize + height/2
                              , room.tilesize, room.tilesize)

     local trueX = (personnage.x - xCam) * room.tilesize + width/2
     local trueY = (personnage.y - yCam) * room.tilesize + height/2

     --test sc
     for i = 0, 0,1 do

       local vx,vy
       vx = math.cos(i* math.pi/180)
       vy = math.sin(i* math.pi/180)
       love.graphics.setColor(255, 0, 0)
       local fX, fY,a,b,x1,x2,y1,y2
       x1 = trueX + room.tilesize/2
       y1 = trueY + room.tilesize/2
       x2 = trueX + personnage.range * vx
       y2 = trueY + personnage.range * vy
       fX = x2
       fY = y2

       a = (y2 - y1) / (x2 - x1)
       b = ((x2*y1)-(x1*y2)) / (x2 - x1)

      local u,v = 1,1
       while u < math.abs(xCam) do
        while v < math.abs(yCam) do
          if room.ground[v][u] == 0 then
            fX = u
            fY = v
            break
          end
          v = v + 1
        end
        u = u + 1
       end

       love.graphics.line(x1, y1,
                          fX, fY)

       love.graphics.setColor(255, 255, 255)
     end
     ----------
  end
end

isWalkable = function (x,y)
  if y <= 0 or y > #room.ground then
    return false
  elseif x <= 0 or x > #room.ground[y] then
    return false
  elseif room.ground[y][x] == 0 then
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
--[[
function love.wheelmoved(x, y)
    if y > 0 then
      room.tilesize = room.tilesize + 10
  elseif y < 0 then
      room.tilesize = room.tilesize - 10
  end
end
]]
return room
