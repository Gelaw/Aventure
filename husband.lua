local husband = {}

husband.x = 0
husband.y = 0


husband.width = 50
husband.height = 50
husband.speed = 1

function husband.init()
  husband.x = 5
  husband.y = 5
end

function husband.update(dt)

  end

function husband.draw()
  love.graphics.setColor(0, 0, 255)
  love.graphics.rectangle("fill", husband.x,
            husband.y , husband.width, husband.height)

end

return husband
