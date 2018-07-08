local Node = {}

  local dest = {}

  function Node:new()
    local node = {}
    node.x = {}
    node.y = {}
    node.heuristic =  {}
    node.cost =  {}
    node.parent = {}

    function node:init(x, y, cost, parent)
      node.x = x
      node.y = y
      node.heuristic = math.dist(node.x, node.y, dest.x, dest.y);
      node.cost = cost
      node.parent = parent
    end

    function node:generatePath(path)

      if node.parent == nil then
        print(node:prompt())
        path:add(node)
        return
      end
      node.parent:generatePath(path)
      print(node:prompt())
      path:add(node)
      return path
    end

    function node:prompt()
      return ("Node : x:"..node.x.." y:"..node.y.." heuristic:"..node.heuristic.." cost:".. node.cost)
    end
    return node
  end

  function Node.setDest(destination)
    dest = destination
  end
return Node
