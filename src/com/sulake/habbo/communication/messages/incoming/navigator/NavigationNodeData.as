package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1315:int;
      
      private var var_1552:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1315 = param1;
         var_1552 = param2;
         Logger.log("READ NODE: " + var_1315 + ", " + var_1552);
      }
      
      public function get nodeName() : String
      {
         return var_1552;
      }
      
      public function get nodeId() : int
      {
         return var_1315;
      }
   }
}
