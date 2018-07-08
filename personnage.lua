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

    function personnage:init(x, y, isWalkable)
      personnage.x = x
      personnage.y = y
      personnage.isWalkable = isWalkable
    end

    function personnage:update(dt)

      if personnage.timer > dt then
        personnage.timer = personnage.timer - dt
        --print(personnage.timer.."/// "..dt)

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
          personnage.timer = 0.3
          --print(personnage.timer)
          return true
        end
        return false
      end
    end

    personnage.path = {}

    function personnage:followPath()
      --print(#personnage.path)
      if personnage.timer ~= 0 or #personnage.path == 0 then
        return
      end
      print(direction)
      local direction = table.remove(personnage.path, 1)
      if personnage:move(direction) == false then
        table.insert(personnage.path, direction, 1)
      end
    end

    function personnage:initPathFinding(xDestination, yDestionation)
      local openList = NodeList:new()
      openList:init()
      local closedList = NodeList:new()
      closedList:init()
      local node = Node:new()
      node:init(personnage.x, personnage.y, math.dist(personnage.x, personnage.y, xDestination, yDestionation),0,nil)
      openList:add(node)
      while openList:isEmpty() == false do
        openList:sort()
        node = openList:getAndRemoveFirst()
        --print(node:prompt())
        if node.x == xDestination and node.y == yDestionation then
          pathNodeList = NodeList:new()
          pathNodeList:init()
          node:generatePath(pathNodeList)
          pathNodeList:prompt("pathNodeList")
          personnage.path = {}
          local previousStep = pathNodeList.getAndRemoveFirst()
          for s = 1, #pathNodeList.list, 1 do
            local direction = {}
            if previousStep.x == pathNodeList.list[s].x - 1 then
              direction = "right"
            elseif previousStep.x == pathNodeList.list[s].x + 1 then
              direction = "left"
            elseif previousStep.y == pathNodeList.list[s].y - 1 then
              direction = "down"
            elseif previousStep.y == pathNodeList.list[s].y + 1 then
              direction = "up"
            else
              print("Path convertion to cardinal instruction failed")
            end
            print(direction)
            table.insert(personnage.path, direction)
            previousStep = step;
          end
          print("Pathfinding successful!")
          return
        end
        closedList:add(node)
        local steps = {{0,1}, {0,-1},{1,0},{-1,0}}
        for n = 1,4 do
          local tPos = {node.x + steps[n][1], node.y + steps[n][2]}
          local exist = false
          --print("tPos: x:"..tPos[1].." y:"..tPos[2])
          for v = 1, #openList.list, 1 do
            if openList.list[v].x == tPos[1] and openList.list[v].y == tPos[2] then
              if openList.list[v].cost < node.cost then
                openList.list[v].cost = node.cost + 1
                openList.list[v].heuristic = openList.list[v].cost + math.dist(openList.list[v].x, openList.list[v].y, xDestination, yDestionation)
                openList.list[v].parent = u
                openList:add(openList.list[v])
                exist = true
              end
            end
          end
          for v = 1, #closedList.list, 1 do
            if closedList.list[v].x == tPos[1] and closedList.list[v].y == tPos[2] then
              if closedList.list[v].cost < node.cost then
                closedList.list[v].cost = node.cost + 1
                closedList.list[v].heuristic = closedList.list[v].cost + math.dist(closedList.list[v].x, closedList.list[v].y, xDestination, yDestionation)
                closedList.list[v].parent = u
                openList:add(closedList.list[v])
                exist = true
              end
            end
          end
          if not exist then
            local new = Node:new()
            new:init(tPos[1], tPos[2], math.dist(tPos[1], tPos[2], xDestination, yDestionation), node.cost + 1, node)
            openList:add(new)
          end
        end
      --  openList:prompt("openList")
      end
      print("Pathfinding failed.")
    end

    return personnage
  end

return Personnage
