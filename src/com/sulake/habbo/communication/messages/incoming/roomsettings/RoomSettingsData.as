package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_452:int = 0;
      
      public static const const_126:int = 2;
      
      public static const const_156:int = 1;
      
      public static const const_686:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_2064:Boolean;
      
      private var var_2062:Boolean;
      
      private var var_2197:int;
      
      private var var_2063:Array;
      
      private var var_2198:int;
      
      private var var_2065:Boolean;
      
      private var var_1222:String;
      
      private var var_2066:int;
      
      private var var_2020:int;
      
      private var var_1221:int;
      
      private var _roomId:int;
      
      private var var_639:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_2066;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_2066 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_639;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2065;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_2198 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_2063 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_639 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_2064;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_2062;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_2197;
      }
      
      public function get categoryId() : int
      {
         return var_1221;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_2065 = param1;
      }
      
      public function get controllerCount() : int
      {
         return var_2198;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_2063;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_2020 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_2064 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_2062 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_2197 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_2020;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1221 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1222 = param1;
      }
      
      public function get description() : String
      {
         return var_1222;
      }
   }
}
