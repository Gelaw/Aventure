local Personnage = {}

  function Personnage:new()
    local personnage = {}
    personnage.x = 0
    personnage.y = 0
    personnage.width = 50
    personnage.height = 50
    personnage.speed = 1
    personnage.timer = 0
    personnage.isWalkable = {}

    function personnage:init(x, y, isWalkable)
      personnage.x = x
      personnage.y = y
      personnage.isWalkable = isWalkable
    end

    function personnage:update(dt)

      if personnage.timer > dt then
        personnage.timer = personnage.timer - dt
        print(personnage.timer.."/// "..dt)

      else
        personnage.timer = 0
      end
    end

    function personnage:move(direction)
      if personnage.timer == 0 then
        local newx = personnage.x
        local newy = personnage.y
        if direction == "up" then
          newy = newy - 1
        elseif direction == "right" then
          newx = newx + 1
        elseif direction == "down" then
          newy = newy + 1
        elseif direction == "left" then
          newx = newx - 1
        end
        if personnage.isWalkable(newx, newy) then
          personnage.x = newx
          personnage.y = newy
          personnage.timer = 0.3
          print(personnage.timer)
        end
      end
    end

    Personnage.path = {}
--[[
    function Personnage:initPathFinding(xDestination, yDestionation)
      local openList = {}
      local closedList = {}
      local node = node:new()
      node:init(Personnage.x, Personnage.y, math.dist(Personnage.x, Personnage.y, xDestination, yDestionation),0,nil)
      table.insert(openList, node)
      while #open > 0 and node.x == not xDestination and node.y == not yDestionation do
        table.sort(openList, function (a,b) return a[3]<b[3] end)
        local bestValue = table.remove(open, 1)
        table.insert(closed, bestValue)
        local neigs = {{0,1}, {0,-1},{1,0},{-1,0}}
        for n = 1,4 do
          local tPos = {bestValue.x + neigs[n][0], bestValue.y+neigs[n][0]}
          for c in openList do
            if c.x == tPos[1] and c.y == tPos[2] then
              if c.cost < bestValue.cost then
                c.cost = bestValue.cost + 1
              end
            end
          end
          for c in closedList do
            if c.x == tPos[1] and c.y == tPos[2] then
              if c.cost < bestValue.cost then
                c.cost = bestValue.cost + 1
                node = node:new()
                node:init()
              end
            end
          end
        end
      end
    end
]]
    return personnage
  end

return Personnage
