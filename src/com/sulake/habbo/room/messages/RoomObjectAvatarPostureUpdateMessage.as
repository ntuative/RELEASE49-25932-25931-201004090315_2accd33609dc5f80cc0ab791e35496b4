package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2068:String;
      
      private var var_863:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_2068 = param1;
         var_863 = param2;
      }
      
      public function get postureType() : String
      {
         return var_2068;
      }
      
      public function get parameter() : String
      {
         return var_863;
      }
   }
}
