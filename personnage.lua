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

    function init(x, y, isWalkable)
      personnage.x = x
      personnage.y = y
      personnage.isWalkable = isWalkable
    end

    function update(dt)
      if timer >= dt then
        timer = timer - dt
      else
        timer = 0
      end
    end

    function move(direction)
      local newx = personnage.x
      local newy = personnage.y
      if direction == 0 then
        new.y = new.y - 1
      elseif direction == 1 then
        new.x = new.x + 1
      elseif direction == 2 then
        new.y = new.y + 1
      elseif direction == 3 then
        new.x = new.x - 1
      end
      if personnage.isWalkable(newx, newy) then
        personnage.x = newx
        personnage.y = newy
        personnage.timer = speed
      end
    end

    return personnage
  end

return Personnage
