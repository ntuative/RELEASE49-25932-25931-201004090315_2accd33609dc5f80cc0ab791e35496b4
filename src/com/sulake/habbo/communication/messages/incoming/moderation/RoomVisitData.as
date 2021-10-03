package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_755:String;
      
      private var var_2107:int;
      
      private var var_1443:Boolean;
      
      private var _roomId:int;
      
      private var var_2108:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1443 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_755 = param1.readString();
         var_2108 = param1.readInteger();
         var_2107 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1443;
      }
      
      public function get roomName() : String
      {
         return var_755;
      }
      
      public function get enterMinute() : int
      {
         return var_2107;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_2108;
      }
   }
}
