local Personnage = {}

  function Personnage:new()
    local personnage = {}
    personnage.x = 0
    personnage.y = 0
    personnage.width = 50
    personnage.height = 50
    personnage.speed = 1

    return personnage
  end

return Personnage
