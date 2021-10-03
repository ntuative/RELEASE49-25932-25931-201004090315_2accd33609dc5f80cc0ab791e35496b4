package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_143:int = 1;
      
      public static const const_1217:int = 3;
      
      public static const const_456:int = 2;
       
      
      private var var_1930:int;
      
      private var var_1832:int;
      
      private var var_1932:int;
      
      private var var_1641:int;
      
      private var var_30:int;
      
      private var var_380:int;
      
      private var var_1363:int;
      
      private var var_1680:int;
      
      private var var_1055:int;
      
      private var _roomResources:String;
      
      private var var_1929:int;
      
      private var var_1936:int;
      
      private var var_1931:String;
      
      private var var_1928:String;
      
      private var var_1933:int = 0;
      
      private var var_1279:String;
      
      private var _message:String;
      
      private var var_1839:int;
      
      private var var_1934:String;
      
      private var var_1221:int;
      
      private var var_755:String;
      
      private var var_1935:String;
      
      private var var_1424:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1055 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1933 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1936;
      }
      
      public function set roomName(param1:String) : void
      {
         var_755 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1929 = param1;
      }
      
      public function get state() : int
      {
         return var_30;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_755;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1641 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_30 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1832;
      }
      
      public function get priority() : int
      {
         return var_1930 + var_1933;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1680 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1928;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1424) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1221;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1936 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1363;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1931 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1929;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1641;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1935 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1279 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1680;
      }
      
      public function set priority(param1:int) : void
      {
         var_1930 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1832 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1931;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1932 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1928 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1839 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1279;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1363 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1932;
      }
      
      public function set flatId(param1:int) : void
      {
         var_380 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1221 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1424 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1839;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1934 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1424;
      }
      
      public function get reportedUserId() : int
      {
         return var_1055;
      }
      
      public function get flatId() : int
      {
         return var_380;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1935;
      }
      
      public function get reporterUserName() : String
      {
         return var_1934;
      }
   }
}
