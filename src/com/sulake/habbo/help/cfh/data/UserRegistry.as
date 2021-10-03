package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1119:int = 80;
       
      
      private var var_527:Map;
      
      private var var_755:String = "";
      
      private var var_1339:Array;
      
      public function UserRegistry()
      {
         var_527 = new Map();
         var_1339 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_527.getValue(var_1339.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_755;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_527.getValue(param1) != null)
         {
            var_527.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_755);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_755 == "")
         {
            var_1339.push(param1);
         }
         var_527.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_527;
      }
      
      public function unregisterRoom() : void
      {
         var_755 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_527.length > const_1119)
         {
            _loc1_ = var_527.getKey(0);
            var_527.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_755 = param1;
         if(var_755 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
