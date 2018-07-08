local NodeList = {}
  function NodeList:new()
    local nodeList = {}
    nodeList.list = {}


    function nodeList:init()

    end

    function nodeList:sort()
      table.sort(nodeList.list, function (a,b) return a.heuristic>b.heuristic end)
    end

    function nodeList:add(node)
      table.insert(nodeList.list, node)
    end

    function nodeList:isEmpty()
      if #nodeList.list == 0 then
        return true
      else
        return false
      end
    end

    function nodeList:getAndRemoveFirst()
      return table.remove(nodeList.list, 1)
    end

    function nodeList:prompt(name)
      print(name)
      for i = 1, #nodeList.list, 1 do
        if nodeList.list[i] == nil then
          print("   nil")
        else
          print("   " .. nodeList.list[i]:prompt())
        end
      end
    end

    return nodeList
  end

return NodeList
