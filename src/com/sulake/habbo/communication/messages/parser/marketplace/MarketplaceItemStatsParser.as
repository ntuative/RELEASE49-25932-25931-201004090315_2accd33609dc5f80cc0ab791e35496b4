package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1494:Array;
      
      private var var_1950:int;
      
      private var var_1964:int;
      
      private var var_1965:int;
      
      private var var_1967:int;
      
      private var _dayOffsets:Array;
      
      private var var_1966:int;
      
      private var var_1495:Array;
      
      public function MarketplaceItemStatsParser()
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
      
      public function get furniTypeId() : int
      {
         return var_1964;
      }
      
      public function get historyLength() : int
      {
         return var_1967;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1965;
      }
      
      public function get offerCount() : int
      {
         return var_1966;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1495;
      }
      
      public function get averagePrice() : int
      {
         return var_1950;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1950 = param1.readInteger();
         var_1966 = param1.readInteger();
         var_1967 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1494 = [];
         var_1495 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1494.push(param1.readInteger());
            var_1495.push(param1.readInteger());
            _loc3_++;
         }
         var_1965 = param1.readInteger();
         var_1964 = param1.readInteger();
         return true;
      }
   }
}
