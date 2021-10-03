package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1883:int;
      
      private var var_1473:int;
      
      private var var_1881:int;
      
      private var var_1880:int;
      
      private var var_1884:int;
      
      private var var_1472:int;
      
      private var var_1886:int;
      
      private var var_1144:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1883;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1473;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1886;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1880;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1884;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1472;
      }
      
      public function get commission() : int
      {
         return var_1881;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1144 = param1.readBoolean();
         var_1881 = param1.readInteger();
         var_1473 = param1.readInteger();
         var_1472 = param1.readInteger();
         var_1880 = param1.readInteger();
         var_1883 = param1.readInteger();
         var_1884 = param1.readInteger();
         var_1886 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1144;
      }
   }
}
