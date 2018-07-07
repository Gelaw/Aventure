local room = {}
room.ground = {}
room.tilesize = 0

function room.init()
  room.ground = {
  {1,1,1,1,1,1,1,1,1,1},
  {1,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1},
  {1,1,1,1,1,1,1,1,1,1}}
  room.tilesize = 50
end

function room.draw(xHero, yHero)
  nbTileWidth = width/room.tilesize
  nbTileHeight = height/room.tilesize
  for x = xHero - nbTileWidth / 2, xHero + nbTileWidth / 2, 1 do
    for y = yHero - nbTileHeight/ 2, yHero + nbTileHeight / 2, 1 do
      if x <= 0 or x > #room.ground[1] or y <= 0 or y > #room.ground then
        love.graphics.setColor(0, 0, 0)
      elseif room.ground[x][y] == 0 then
        love.graphics.setColor(0, 255, 0)
      elseif room.ground[x][y] == 1 then
        love.graphics.setColor(255, 0, 0)
      end
      love.graphics.rectangle("fill", (x - xHero )* room.tilesize, (y - yHero) * room.tilesize, room.tilesize, room.tilesize)
      love.graphics.setColor(255, 255, 255)
    end
  end
end

return room
