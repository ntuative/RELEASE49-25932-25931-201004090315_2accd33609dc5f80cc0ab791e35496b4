package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1086:int;
      
      private var var_1364:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1086 = param1;
         var_1364 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1086;
      }
      
      public function get itemName() : String
      {
         return var_1364;
      }
   }
}
