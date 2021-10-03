package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1765:int;
      
      private var var_2125:String;
      
      private var var_2124:int;
      
      private var var_2122:int;
      
      private var var_686:Boolean;
      
      private var var_2065:Boolean;
      
      private var var_380:int;
      
      private var var_1222:String;
      
      private var var_2020:int;
      
      private var var_1221:int;
      
      private var _ownerName:String;
      
      private var var_755:String;
      
      private var var_2123:int;
      
      private var var_2121:RoomThumbnailData;
      
      private var var_2022:Boolean;
      
      private var var_639:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_639 = new Array();
         super();
         var_380 = param1.readInteger();
         var_686 = param1.readBoolean();
         var_755 = param1.readString();
         _ownerName = param1.readString();
         var_2020 = param1.readInteger();
         var_1765 = param1.readInteger();
         var_2123 = param1.readInteger();
         var_1222 = param1.readString();
         var_2124 = param1.readInteger();
         var_2022 = param1.readBoolean();
         var_2122 = param1.readInteger();
         var_1221 = param1.readInteger();
         var_2125 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_639.push(_loc4_);
            _loc3_++;
         }
         var_2121 = new RoomThumbnailData(param1);
         var_2065 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2123;
      }
      
      public function get roomName() : String
      {
         return var_755;
      }
      
      public function get userCount() : int
      {
         return var_1765;
      }
      
      public function get score() : int
      {
         return var_2122;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2125;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_2022;
      }
      
      public function get tags() : Array
      {
         return var_639;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2065;
      }
      
      public function get event() : Boolean
      {
         return var_686;
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
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1221;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2124;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2121;
      }
      
      public function get doorMode() : int
      {
         return var_2020;
      }
      
      public function get flatId() : int
      {
         return var_380;
      }
      
      public function get description() : String
      {
         return var_1222;
      }
   }
}
