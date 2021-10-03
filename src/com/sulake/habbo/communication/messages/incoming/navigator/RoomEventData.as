package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2032:String;
      
      private var var_380:int;
      
      private var var_2028:String;
      
      private var var_2030:String;
      
      private var var_2031:int;
      
      private var var_2029:String;
      
      private var var_2027:int;
      
      private var var_639:Array;
      
      private var var_1032:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_639 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1032 = false;
            return;
         }
         this.var_1032 = true;
         var_2031 = int(_loc2_);
         var_2028 = param1.readString();
         var_380 = int(param1.readString());
         var_2027 = param1.readInteger();
         var_2032 = param1.readString();
         var_2030 = param1.readString();
         var_2029 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_639.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_2027;
      }
      
      public function get eventName() : String
      {
         return var_2032;
      }
      
      public function get eventDescription() : String
      {
         return var_2030;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_2028;
      }
      
      public function get tags() : Array
      {
         return var_639;
      }
      
      public function get creationTime() : String
      {
         return var_2029;
      }
      
      public function get exists() : Boolean
      {
         return var_1032;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_2031;
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
         this.var_639 = null;
      }
      
      public function get flatId() : int
      {
         return var_380;
      }
   }
}
