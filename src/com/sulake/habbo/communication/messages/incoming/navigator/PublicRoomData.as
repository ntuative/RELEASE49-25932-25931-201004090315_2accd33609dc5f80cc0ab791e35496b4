package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1832:int;
      
      private var var_1833:String;
      
      private var var_1641:int;
      
      private var _disposed:Boolean;
      
      private var var_1834:int;
      
      private var var_1640:String;
      
      private var var_1315:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1640 = param1.readString();
         var_1832 = param1.readInteger();
         var_1641 = param1.readInteger();
         var_1833 = param1.readString();
         var_1834 = param1.readInteger();
         var_1315 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_1834;
      }
      
      public function get worldId() : int
      {
         return var_1641;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1640;
      }
      
      public function get unitPort() : int
      {
         return var_1832;
      }
      
      public function get castLibs() : String
      {
         return var_1833;
      }
      
      public function get nodeId() : int
      {
         return var_1315;
      }
   }
}
