local husband = {}

husband.x = 0
husband.y = 0


husband.width = 100
husband.height = 100
husband.speed = 10
husband.offSetX = husband.width/2
husband.offSetY = husband.height/2

husband.screenX = husband.width * husband.x
husband.screenY = husband.height * husband.y

function husband.init()
  husband.x = 5
  husband.y = 5
  --husband.screenX = love.graphics.getWidth()/2
  --husband.screenY = love.graphics.getHeight()/2
end

function husband.update(dt)

  end

function husband.draw()

  love.graphics.rectangle("fill", husband.screenX - husband.offSetX,
            husband.screenY - husband.offSetY , husband.width, husband.height)

end

return husband
