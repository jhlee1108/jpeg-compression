classdef dlnode < handle
   properties
      Intensity
      Data
      Code
   end
   properties(SetAccess = private)
      Left = dlnode.empty;
      Right = dlnode.empty;
   end
   
   methods
      function node = dlnode(Intensity, Data)
         if nargin > 0
            node.Intensity = Intensity;
            node.Data = Data;
            node.Code = '';
         end
      end
      
      function insertLeft(newNode, rootNode)
         rootNode.Left = newNode;
      end
      
      function insertRight(newNode, rootNode)
         rootNode.Right = newNode;
      end
      
      function setCode(code, node)
          node.Code = code;
      end
   end
   
end