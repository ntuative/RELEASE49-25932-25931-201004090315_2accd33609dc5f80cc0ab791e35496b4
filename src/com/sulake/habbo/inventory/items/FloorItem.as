package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_2277:Boolean;
      
      protected var var_1420:Number;
      
      protected var var_2278:Boolean;
      
      protected var _type:int;
      
      protected var var_2279:Boolean;
      
      protected var var_1674:int;
      
      protected var var_2276:Boolean;
      
      protected var var_1385:String;
      
      protected var var_1706:int;
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var var_1415:String;
      
      protected var var_1703:Boolean;
      
      protected var _category:int;
      
      protected var var_1707:int;
      
      protected var var_2288:int;
      
      protected var var_1710:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         _id = param1;
         _type = param2;
         _ref = param3;
         _category = param4;
         var_1703 = param5;
         var_2276 = param6;
         var_2277 = param7;
         var_2278 = param8;
         var_1385 = param9;
         var_1420 = param10;
         var_2288 = param11;
         var_1710 = param12;
         var_1707 = param13;
         var_1706 = param14;
         var_1415 = param15;
         var_1674 = param16;
      }
      
      public function get locked() : Boolean
      {
         return var_2279;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get extra() : Number
      {
         return var_1420;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2279 = param1;
      }
      
      public function get ref() : int
      {
         return _ref;
      }
      
      public function get songId() : int
      {
         return var_1674;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get sellable() : Boolean
      {
         return var_2278;
      }
      
      public function get slotId() : String
      {
         return var_1415;
      }
      
      public function get expires() : int
      {
         return var_2288;
      }
      
      public function get creationYear() : int
      {
         return var_1706;
      }
      
      public function get creationDay() : int
      {
         return var_1710;
      }
      
      public function get stuffData() : String
      {
         return var_1385;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2276;
      }
      
      public function get groupable() : Boolean
      {
         return var_1703;
      }
      
      public function get creationMonth() : int
      {
         return var_1707;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2277;
      }
   }
}
