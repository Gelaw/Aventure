local Node = {}

  function Node:new()
    local node = {}
    node.x = {}
    node.y = {}
    node.heuristic =  {}
    node.cost =  {}
    node.parent = {}

    function node:init(x, y, heuristic, cost, parent)
      node.x = x
      node.y = y
      node.heuristic = heuristic
      node.cost = cost
      node.parent = parent
    end

    function node:generatePath(path)
      if node.parent == nil then
        path:add(node)
        return
      end
      node.parent:generatePath(path)
      path:add(node)
      return path
    end

    function node:prompt()
      return ("Node : x:"..node.x.." y:"..node.y.." heuristic:"..node.heuristic.." cost:".. node.cost)
    end
    return node
  end
return Node
