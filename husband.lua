local husband = {}

husband.x = 5
husband.y = 5
husband.currX = 5
husband.currY = 5

husband.width = 50
husband.height = 50
husband.speed = 1
husband.direction = 0;

function husband.init()
  husband.x = 5
  husband.y = 5
end

function husband.update(dt ,isWalkable)
  if isWalkable == false then
    husband.x = husband.currX
    husband.y = husband.currY
    elseif isWalkable == true then
    husband.currX = husband.x
    husband.currY = husband.y
  end
end

function husband.draw()
  love.graphics.setColor(0, 0, 255)
  love.graphics.rectangle("fill", husband.x * 50,
            husband.y *50, husband.width, husband.height)

end

return husband
