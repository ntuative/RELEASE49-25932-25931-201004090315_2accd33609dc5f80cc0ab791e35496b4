package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2189:int;
      
      private var var_381:Boolean;
      
      private var var_2188:Boolean;
      
      private var var_912:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2188 = param1.readBoolean();
         if(var_2188)
         {
            var_2189 = param1.readInteger();
            var_381 = param1.readBoolean();
         }
         else
         {
            var_912 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_912 != null)
         {
            var_912.dispose();
            var_912 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2189;
      }
      
      public function get owner() : Boolean
      {
         return var_381;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2188;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_912;
      }
   }
}
