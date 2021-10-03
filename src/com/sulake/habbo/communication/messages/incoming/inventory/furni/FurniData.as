package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1385:String;
      
      private var var_1086:String;
      
      private var var_1822:Boolean;
      
      private var var_1420:int;
      
      private var var_1671:int;
      
      private var var_1821:Boolean;
      
      private var var_1415:String = "";
      
      private var var_1675:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1133:int;
      
      private var var_1669:Boolean;
      
      private var var_1674:int = -1;
      
      private var var_1670:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1671 = param1;
         var_1086 = param2;
         _objId = param3;
         var_1133 = param4;
         _category = param5;
         var_1385 = param6;
         var_1822 = param7;
         var_1675 = param8;
         var_1669 = param9;
         var_1821 = param10;
         var_1670 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1415;
      }
      
      public function get extra() : int
      {
         return var_1420;
      }
      
      public function get classId() : int
      {
         return var_1133;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_1821;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_1822;
      }
      
      public function get stripId() : int
      {
         return var_1671;
      }
      
      public function get stuffData() : String
      {
         return var_1385;
      }
      
      public function get songId() : int
      {
         return var_1674;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1415 = param1;
         var_1420 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1086;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1670;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1669;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1675;
      }
   }
}
