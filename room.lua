--local husband = require("husband")
local Personnage = require("personnage")

local room = {}
room.ground = {}
room.tilesize = 0

function room.init()

    generateVisible()
  room.ground = {
      {1,1,1,5,5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
      {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,1},
      {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,1},
      {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,1,0,1,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}}

  lover = Personnage:new()
  lover:init(11,3,isWalkable)
  husband = Personnage:new()
  husband:init(5,5, isWalkable)
  wife = Personnage:new()
  wife:init(11,4, isWalkable)

  room.tilesize = 10

  husband:initPathFinding({x = lover.x, y = lover.y})
  husband.isIA = true

end

function room.draw()
  local xHero = lover.x
  local yHero = lover.y
  nbTileWidth = width/room.tilesize
  nbTileHeight = height/room.tilesize
  for x = xHero - nbTileWidth / 2, xHero + nbTileWidth / 2, 1 do
    for y = yHero - nbTileHeight/ 2, yHero + nbTileHeight / 2, 1 do
      local transp = 95
      if visible then
        if visible[x] and visible[x][y] == 1 then
          transp = 255
        end
      end
      if y <= 0 or y > #room.ground then
        love.graphics.setColor(0, 0, 0, transp)
      elseif x <= 0 or x > #room.ground[y] then
        love.graphics.setColor(0, 0, 0, transp)
      elseif room.ground[y][x] == 0 then
        love.graphics.setColor(116, 108, 0, transp)
      elseif room.ground[y][x] == 1 then
        love.graphics.setColor(53, 58, 62, transp)
      elseif room.ground[y][x] == 4 then
        love.graphics.setColor(255, 128, 0, transp)
      elseif room.ground[y][x] == 5 then
        love.graphics.setColor(51, 0, 25, transp)
      end

      love.graphics.rectangle("fill", (x - xHero)* room.tilesize + width/2, (y - yHero) * room.tilesize + height /2, room.tilesize, room.tilesize)
    end
  end
  love.graphics.setColor(255, 255, 255)
  room.drawPersonnage(lover, xHero, yHero)
  love.graphics.setColor(255, 0, 0)
  room.drawPersonnage(husband, xHero, yHero)
  love.graphics.setColor(255, 0, 255)
  room.drawPersonnage(wife, xHero, yHero)
  love.graphics.setColor(255, 255, 255)

end

function room.drawPersonnage(personnage, xCam, yCam)
  if personnage.x > xCam - nbTileWidth / 2 - 1 and personnage.x < xCam + nbTileWidth / 2
   and personnage.y > yCam - nbTileHeight/ 2 - 1 and personnage.y < yCam + nbTileHeight/ 2 then
     if visible then
       if visible[personnage.x] and visible[personnage.x][personnage.y] == 1 then
         love.graphics.rectangle("fill",(personnage.x - xCam)*room.tilesize + width/2, (personnage.y - yCam) * room.tilesize + height/2, room.tilesize, room.tilesize)
      end
    end
  end
end

isWalkable = function (x,y)
  if y <= 0 or y > #room.ground then
    return false
  elseif x <= 0 or x > #room.ground[y] then
    return false
  elseif room.ground[y][x] == 0 or room.ground[y][x] == 4 or room.ground[y][x] == 5 then
    return true
  else
    return false
  end
end

function room.update(dt)
    px,py      = lover.x,lover.y
  generateVisible()
  husband:update(dt)
  if visible[husband.x] and visible[husband.x][husband.y] == 1 and room.ground[lover.y][lover.x] < 3 then
      husband:stop()
      husband:initPathFinding({x = lover.x, y = lover.y})
  end
  lover:update(dt)
  if love.keyboard.isDown("z") or love.keyboard.isDown("up") then
    lover:move("up")
  end
  if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
    lover:move("down")
  end
  if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
    lover:move("right")
  end
  if love.keyboard.isDown("q") or love.keyboard.isDown("left") then
    lover:move("left")
  end
end



function love.wheelmoved(x, y)
end

fov = require 'fov'

tw,th      = 8,8
px,py      = 5,5
radius     = 20
radius_type= 'circle'
perm       = 5
angle      = 0
angle_size = 360
delta      = 5
show_help  = true
width      = 98
height     = 60

run_symmetry_test = true
fail_visible      = {}

    function generateVisible()
    	visible = {}

      -- Required callbacks:
    	function isTransparent(x,y)
        if y <= 0 or y > #room.ground then
          return false
        elseif x <= 0 or x > #room.ground[y] then
          return false
        elseif room.ground[y][x] == 0 then
          return true
        else
          return false
        end
    		-- return true if the cell is non-blocking
    	end

    	local onVisible = function(x,y)
    		local dx,dy = x-px,y-py
    		if (dx*dx + dy*dy) > radius*radius + radius and radius_type == 'circle' then
    			return
    		end

    		visible[x]    = visible[x] or {}
    		visible[x][y] = 1
    	end

    	fov(px,py,radius,isTransparent,onVisible,math.rad(angle-angle_size/2),math.rad(angle+angle_size/2),perm)

    	if run_symmetry_test then
    		local ex,ey        = 0,0
    		fail_visible       = {}

    		local onEnemyVision = function(x,y)
    			local dx,dy = x-ex,y-ey
    			if (dx*dx + dy*dy) > radius*radius + radius and radius_type == 'circle' then
    				return
    			end

    			enemyVision[x]    = enemyVision[x] or {}
    			enemyVision[x][y] = 1
    		end

    		for x,t in pairs(visible) do
    			for y,vis in pairs(t) do
    				enemyVision = {}
    				ex,ey       = x,y
    				fov(x,y,radius,isTransparent,onEnemyVision,nil,nil,perm)
    				if not (enemyVision[px] and enemyVision[px][py]) then
    					fail_visible[x]    = fail_visible[x] or {}
    					fail_visible[x][y] = 1
    				end
    			end
    		end
    	end
    end

return room
