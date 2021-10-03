package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _password:String;
      
      private var var_2066:int;
      
      private var var_2020:int;
      
      private var var_2064:Boolean;
      
      private var var_2062:Boolean;
      
      private var var_2063:Array;
      
      private var var_2065:Boolean;
      
      private var var_1221:int;
      
      private var _name:String;
      
      private var _roomId:int;
      
      private var var_639:Array;
      
      private var var_1222:String;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get doorMode() : int
      {
         return var_2020;
      }
      
      public function get description() : String
      {
         return var_1222;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_2062;
      }
      
      public function get maximumVisitors() : int
      {
         return var_2066;
      }
      
      public function set description(param1:String) : void
      {
         var_1222 = param1;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_2065 = param1;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_2066 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get categoryId() : int
      {
         return var_1221;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_2063;
      }
      
      public function get tags() : Array
      {
         return var_639;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2065;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_2020 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_2064 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_639 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_2063 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1221 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_2064;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_2062 = param1;
      }
   }
}
