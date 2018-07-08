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
      if parent == nil then
        path:add(self)
        return
      end
      parent:generatePath(path)
      path:add(self)
      return path
    end

    function node:prompt()
      return ("Node : x:"..node.x.." y:"..node.y.." heuristic:"..node.heuristic.." cost:".. node.cost)
    end
    return node
  end
return Node
