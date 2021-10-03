package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1335:int = 4;
      
      public static const const_732:int = 3;
      
      public static const const_611:int = 2;
      
      public static const const_862:int = 1;
       
      
      private var var_1767:String;
      
      private var _disposed:Boolean;
      
      private var var_1765:int;
      
      private var var_1763:Boolean;
      
      private var var_806:String;
      
      private var var_801:PublicRoomData;
      
      private var var_1768:int;
      
      private var _index:int;
      
      private var var_1764:String;
      
      private var _type:int;
      
      private var var_1725:String;
      
      private var var_800:GuestRoomData;
      
      private var var_1766:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_1767 = param1.readString();
         var_1766 = param1.readString();
         var_1763 = param1.readInteger() == 1;
         var_1764 = param1.readString();
         var_806 = param1.readString();
         var_1768 = param1.readInteger();
         var_1765 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_862)
         {
            var_1725 = param1.readString();
         }
         else if(_type == const_732)
         {
            var_801 = new PublicRoomData(param1);
         }
         else if(_type == const_611)
         {
            var_800 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_1768;
      }
      
      public function get popupCaption() : String
      {
         return var_1767;
      }
      
      public function get userCount() : int
      {
         return var_1765;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1763;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_862)
         {
            return 0;
         }
         if(this.type == const_611)
         {
            return this.var_800.maxUserCount;
         }
         if(this.type == const_732)
         {
            return this.var_801.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1766;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_800 != null)
         {
            this.var_800.dispose();
            this.var_800 = null;
         }
         if(this.var_801 != null)
         {
            this.var_801.dispose();
            this.var_801 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_800;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_1764;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_801;
      }
      
      public function get picRef() : String
      {
         return var_806;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1725;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
