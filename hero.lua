local hero = {}

hero.x = 0
hero.y = 0
hero.currX = hero.x
hero.currY = hero.y

hero.width = 50
hero.height = 50
hero.speed = 1
hero.offSetX = hero.width/2
hero.offSetY = hero.height/2



function hero.init()
  hero.x = 5
  hero.y = 5
  --hero.screenX = love.graphics.getWidth()/2
  --hero.screenY = love.graphics.getHeight()/2
end

function hero.update(dt ,isWalkable)
  hero.screenX = width / 2
  hero.screenY = height / 2

  if isWalkable == false then
    hero.x = hero.currX
    hero.y = hero.currY
  elseif isWalkable == true then

  hero.currX = hero.x
  hero.currY = hero.y
  end
end

function hero.draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", hero.screenX , hero.screenY , hero.width, hero.height)

end

function hero.keypressed(key)


  if key == "z" then
    hero.y = hero.y - 1
  end
  if key == "s" then
    hero.y = hero.y + 1

  end
  if key == "d"  then
    hero.x = hero.x + 1

  end
  if key == "q" then
  hero.x = hero.x - 1
  end

end

return hero
