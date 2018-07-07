local room = {}
room.ground = {
{1,1,1,1,1,1,1,1,1,1,1},
{1,0,0,0,0,0,0,0,0,0,1},
{1,0,0,0,0,0,0,0,0,0,1},
{1,0,0,0,0,0,0,0,0,0,1},
{1,0,0,0,0,0,0,0,0,0,1},
{1,0,0,0,0,0,0,0,0,0,1},
{1,0,0,0,0,0,0,0,0,0,1},
{1,0,0,0,0,0,0,0,0,0,1},
{1,0,0,0,0,0,0,0,0,0,1},
{1,1,1,1,1,1,1,1,1,1,1}}
room.tilesize = 50

function room.draw(xHero, yHero)
  nbTileWidth = width/room.tilesize
  nbTileHeight = height/room.tilesize
  for x = xHero - (nbTileWidth + 1) / 2, xHero + (nbTileWidth + 1), 1 do
    for y = yHero - (nbTileHeight + 1)/ 2, yHero + (nbTileHeight + 1), 1 do
      if x < 0 or x > #room.ground[0] or y < 0 or y > #room.ground then
        love.graphics.setColor(255, 255, 255, 0)
      else if room.ground[x][y] == 0 then
        love.graphics.setColor(0, 255, 0, 0)
      else if room.ground[x][y] == 1 then
        love.graphics.setColor(255, 0, 0, 0)
      end
      love.graphics.rectangle("fill", x * tilesize, y * tilesize, tilesize, tilesize)
      love.graphics.setColor(0, 0, 0, 0)
    end
  end
end

return room
