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
          personnage.timer = 10
          print(personnage.timer)
        end
      end
    end

    return personnage
  end

return Personnage
