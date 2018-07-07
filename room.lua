local husband = require("husband")

local room = {}
room.ground = {}
room.tilesize = 0

function room.init()
  husband.init()

  room.ground = {
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
  {1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
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
end

function room.draw(xHero, yHero)
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
  if husband.x > xHero - nbTileWidth / 2 - 1 and husband.x < xHero + nbTileWidth / 2
   and husband.y > yHero - nbTileHeight/ 2 - 1 and husband.y < yHero + nbTileHeight/ 2 then
     love.graphics.rectangle("fill",(husband.x - xHero)*room.tilesize + width/2, (husband.y - yHero) * room.tilesize + height/2, room.tilesize, room.tilesize)
  end
  love.graphics.setColor(255, 255, 255)
end

function room.isWalkable(x,y)
  if room.ground[y][x] == 0 then
    return true
  else
    return false
  end
end

function room.update(dt)
  husband.update(dt, room.isWalkable(husband.x, husband.y))
end

return room
