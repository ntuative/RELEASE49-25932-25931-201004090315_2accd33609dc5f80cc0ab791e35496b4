package com.sulake.habbo.avatar.actions
{
   public class ActionType
   {
       
      
      private var var_1241:Array;
      
      private var var_164:int;
      
      private var _id:int;
      
      public function ActionType(param1:XML)
      {
         var_1241 = [];
         super();
         _id = parseInt(param1.@value);
         var_164 = parseInt(param1.@value);
         var _loc2_:String = String(param1.@prevents);
         if(_loc2_ != "")
         {
            var_1241 = _loc2_.split(",");
         }
      }
      
      public function get value() : int
      {
         return var_164;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get prevents() : Array
      {
         return var_1241;
      }
   }
}
