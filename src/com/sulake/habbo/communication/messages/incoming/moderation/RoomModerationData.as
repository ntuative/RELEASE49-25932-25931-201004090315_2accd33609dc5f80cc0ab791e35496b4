package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_110:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1765:int;
      
      private var var_380:int;
      
      private var var_686:RoomData;
      
      private var var_2054:int;
      
      private var _ownerName:String;
      
      private var var_2155:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_380 = param1.readInteger();
         var_1765 = param1.readInteger();
         var_2155 = param1.readBoolean();
         var_2054 = param1.readInteger();
         _ownerName = param1.readString();
         var_110 = new RoomData(param1);
         var_686 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_1765;
      }
      
      public function get event() : RoomData
      {
         return var_686;
      }
      
      public function get room() : RoomData
      {
         return var_110;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_110 != null)
         {
            var_110.dispose();
            var_110 = null;
         }
         if(var_686 != null)
         {
            var_686.dispose();
            var_686 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_380;
      }
      
      public function get ownerId() : int
      {
         return var_2054;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_2155;
      }
   }
}
