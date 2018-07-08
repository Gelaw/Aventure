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
    personnage.direction = "right"
    personnage.visionBox = {}

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
    end

    function personnage:setDirection(dir)
      if dir == "up" or dir == "down" or dir == "left" or dir == "right" then
        personnage.direction = dir
      else
        print("Error at direction setting")
      end
    end

    function personnage:drawVision(perso, viewRangeInTile)
      local dir = perso.direction
      local viewRange = viewRangeInTile * 50
      love.graphics.setColor(255, 255, 0,50)
      if dir == "up" then
        --love.graphics.rectangle("fill", perso.x + perso.width/2, perso.y - perso.height/2 - viewRange, viewRange, viewRange)
        personnage.visionBox = love.graphics.rectangle("fill",  width/2 + (perso.width/2)-(viewRange/2), height/2 - viewRange, viewRange, viewRange)

      elseif dir == "down" then
        --love.graphics.rectangle("fill", perso.x - perso.width/2, perso.y - perso.height/2, viewRange, viewRange)
        personnage.visionBox = love.graphics.rectangle("fill",  width/2 + (perso.height/2)-(viewRange/2), height/2 + perso.height, viewRange, viewRange)

      elseif dir == "left" then
        --love.graphics.rectangle("fill", perso.x - perso.width/2 - viewRange, perso.y - perso.height/2, viewRange, viewRange)
        personnage.visionBox = love.graphics.rectangle("fill",  width/2 - viewRange  ,height/2 + (perso.height/2)-(viewRange/2), viewRange, viewRange)

      elseif dir == "right" then
        --love.graphics.rectangle("fill", perso.x + perso.width/2, perso.y - perso.height/2, viewRange, viewRange)
        personnage.visionBox = love.graphics.rectangle("fill",  width/2 + perso.width  , height/2 + (perso.height/2)-(viewRange/2), viewRange, viewRange)

      else
        print("Not a valid direction to draw")
      end
      love.graphics.setColor(255, 255, 255)

    end

    function personnage:move(direction)
      if personnage.timer == 0 then
        local newx = personnage.x
        local newy = personnage.y
        personnage.direction = direction
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
        else
          return false
        end
        return true
      end
    end

    Personnage.path = {}

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
        if node.x == xDestination and node.y == yDestionation then
          pathNodeList = nodeList:new()
          pathNodeList:inti()
          node:generatePath(pathNodeList)
          personnage.path = {}
          local previousStep = pathNodeList.getAndRemoveFirst()
          for step in pathNodeList do
            local direction = {}
            if previousStep.x == step.x - 1 then
              direction = "right"
            elseif previousStep.x == step.x + 1 then
              direction = "left"
            elseif previousStep.y == step.y - 1 then
              direction = "down"
            elseif previousStep.y == step.y + 1 then
              direction = "up"
            else
              print("Path convertion to cardinal instruction failed")
            end
            table.insert(personnage.path, direction)
            previousStep = step;
          end
          print("Pathfinding successful!")
          return
        end
        closedList:add(node)
        local steps = {{0,1}, {0,-1},{1,0},{-1,0}}
        for n = 1,4 do
          local tPos = {node.x + steps[n][1], node.y + steps[n][1]}
          for v = 1, #openList.list, 1 do
            if openList.list[v].x == tPos[1] and openList.list[v].y == tPos[2] then
              if openList.list[v].cost < node.cost then
                openList.list[v].cost = node.cost + 1
                openList.list[v].heuristic = openList.list[v].cost + math.dist(openList.list[v].x, openList.list[v].y, xDestination, yDestionation)
                openList.list[v].parent = u
                openList:add(openList.list[v])
              end
            end
          end
          for v = 1, #closedList.list, 1 do
            if closedList.list[v].x == tPos[1] and closedList.list[v].y == tPos[2] then
              if closedList.list[v].cost < node.cost then
                closedList.list[v].cost = node.cost + 1
                closedList.list[v].heuristic = v.cost + math.dist(closedList.list[v].x, closedList.list[v].y, xDestination, yDestionation)
                closedList.list[v].parent = u
                openList:add(closedList.list[v])
              end
            end
          end
        end
      end
      print("Pathfinding failed.")
    end

    return personnage
  end

return Personnage
