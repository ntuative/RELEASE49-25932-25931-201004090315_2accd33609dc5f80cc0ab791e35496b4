package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1494:Array;
      
      private var var_1950:int;
      
      private var var_1964:int;
      
      private var var_1967:int;
      
      private var var_1965:int;
      
      private var _dayOffsets:Array;
      
      private var var_1966:int;
      
      private var var_1495:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1494;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_1494 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1964;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1495 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1950 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_1967;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1965;
      }
      
      public function get offerCount() : int
      {
         return var_1966;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1966 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1495;
      }
      
      public function get averagePrice() : int
      {
         return var_1950;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_1965 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_1967 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1964 = param1;
      }
   }
}
