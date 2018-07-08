local Node = {}

  function node:new()
    node.x = {}
    node.y = {}
    node.value =  {}
    node.cost =  {}
    node.parent = {}

    function node:init(x, y, value, cost, parent)
      node.x = x
      node.y = y
      node.value = value
      node.cost = cost
      node.parent = parent
    end

    

    return node
  end

return Node
