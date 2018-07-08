local Node = require "node"
local NodeList = require "nodeList"

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
    personnage.isIA = false
    personnage.range = 300

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
      if personnage.isIA == true then
        personnage:followPath()
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
        if personnage.isWalkable(newx, newy) and (newx ~= personnage.x or newy ~= personnage.y) then
          personnage.x = newx
          personnage.y = newy
          personnage.timer = 0.1
          --print(personnage.timer)
          return true
        end
        return false
      end
    end

    personnage.path = {}
    personnage.pathIndex = 1

    function personnage:followPath()
      --print(#personnage.path)
      if personnage.timer ~= 0 then
        return
      end
      if  #personnage.path +1  == personnage.pathIndex then
        personnage.path = {}
        personnage.pathIndex = 1
      end
      local direction = personnage.path[personnage.pathIndex]
      --print(direction)
      if personnage:move(direction) == true then
        personnage.pathIndex = personnage.pathIndex + 1
      end
    end

    function personnage:initPathFinding(destination)
      if(personnage.x == destination.x and personnage.y == destination.y) then
        return
      end
      Node.setDest(destination)
      local openList = NodeList:new()
      local closedList = NodeList:new()
      local node = Node:new()
      node:init(personnage.x, personnage.y,0,nil)
      openList:add(node)
      while openList:isEmpty() == false do
        openList:sort()
        node = openList:getAndRemoveFirst()
        closedList:add(node)
        print("Removed node:"..node:prompt())
        if node.x == destination.x and node.y == destination.y then
          personnage:generatePath(node)
          return
        end
        local steps = {{0,1}, {0,-1},{1,0},{-1,0}}
        for n = 1,4 do
          local tPos = {x = node.x + steps[n][1],y = node.y + steps[n][2]}
          local res = openList:nodeAt(tPos)
          if res ~= false then
            if res.cost > node.cost then
              res.cost = node.cost + 1
              res.heuristic = res.cost + math.dist(res.x, res.y, destination.x, destination.y)
            end
          end
          res = closedList:nodeAt(tPos)
          if res ~= false then
            if res.cost > node.cost then
              res.cost = node.cost + 1
              res.heuristic = res.cost + math.dist(res.x, res.y, destination.x, destination.y)
              openList.add(res)
            end
          end
          if res == false then
            if personnage.isWalkable(tPos.x, tPos.y) then
              local new = Node:new()
              new:init(tPos.x, tPos.y, node.cost + 1, node)
              openList:add(new)
            end
          end
        end
      end
    end

    function personnage:generatePath(node)
      pathNodeList = NodeList:new()
      node:generatePath(pathNodeList)
      personnage.path = {}
      personnage.pathIndex = 1
      local previousStep = pathNodeList.getAndRemoveFirst()
      for s = 1, #pathNodeList.list, 1 do
        local direction = {}
        if previousStep.x == pathNodeList.list[s].x - 1 and previousStep.y == pathNodeList.list[s].y then
          direction = "right"
        elseif previousStep.x == pathNodeList.list[s].x + 1 and previousStep.y == pathNodeList.list[s].y then
          direction = "left"
        elseif previousStep.y == pathNodeList.list[s].y - 1 and previousStep.x == pathNodeList.list[s].x then
          direction = "down"
        elseif previousStep.y == pathNodeList.list[s].y + 1 and previousStep.x == pathNodeList.list[s].x then
          direction = "up"

        else
        end
        table.insert(personnage.path, direction)
        previousStep = pathNodeList.list[s];
      end
    end

    return personnage
  end




return Personnage
