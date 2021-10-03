package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_223:String = "RWUIUE_PEER";
      
      public static const const_217:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1258:String = "BOT";
      
      public static const const_1008:int = 2;
      
      public static const const_1246:int = 0;
      
      public static const const_1007:int = 3;
       
      
      private var var_319:String = "";
      
      private var var_1343:String = "";
      
      private var var_1878:Boolean = false;
      
      private var var_1689:int = 0;
      
      private var var_1690:int = 0;
      
      private var var_1879:Boolean = false;
      
      private var var_1342:String = "";
      
      private var var_1873:Boolean = false;
      
      private var var_781:int = 0;
      
      private var var_1877:Boolean = true;
      
      private var var_1097:int = 0;
      
      private var var_1874:Boolean = false;
      
      private var var_1320:Boolean = false;
      
      private var var_1875:Boolean = false;
      
      private var var_1691:int = 0;
      
      private var var_1871:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_271:Array;
      
      private var var_1321:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1683:int = 0;
      
      private var var_1872:Boolean = false;
      
      private var var_1876:int = 0;
      
      private var var_1692:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_271 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1690;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1690 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_1878;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_1877;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_1877 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_1873 = param1;
      }
      
      public function get motto() : String
      {
         return var_1343;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_1874 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1320;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1343 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_1872;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1692;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1320 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_1871;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1691 = param1;
      }
      
      public function get badges() : Array
      {
         return var_271;
      }
      
      public function get amIController() : Boolean
      {
         return var_1879;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_1879 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_1872 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_1876 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1692 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1342 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_1873;
      }
      
      public function set figure(param1:String) : void
      {
         var_319 = param1;
      }
      
      public function get carryItem() : int
      {
         return var_1691;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1321;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_1874;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_781 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_1876;
      }
      
      public function get realName() : String
      {
         return var_1342;
      }
      
      public function get figure() : String
      {
         return var_319;
      }
      
      public function set webID(param1:int) : void
      {
         var_1683 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_271 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_1875 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_1871 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_781;
      }
      
      public function get webID() : int
      {
         return var_1683;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1097 = param1;
      }
      
      public function get xp() : int
      {
         return var_1689;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_1878 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1097;
      }
      
      public function get canTrade() : Boolean
      {
         return var_1875;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1321 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         var_1689 = param1;
      }
   }
}
