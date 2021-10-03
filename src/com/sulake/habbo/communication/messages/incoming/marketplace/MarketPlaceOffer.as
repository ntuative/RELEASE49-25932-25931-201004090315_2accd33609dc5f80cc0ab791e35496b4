package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1236:int;
      
      private var var_1949:int = -1;
      
      private var var_376:int;
      
      private var var_1950:int;
      
      private var var_1846:int;
      
      private var _offerId:int;
      
      private var var_1237:int;
      
      private var var_1845:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         var_1845 = param2;
         var_1846 = param3;
         var_1236 = param4;
         var_376 = param5;
         var_1949 = param6;
         var_1950 = param7;
         var_1237 = param8;
      }
      
      public function get status() : int
      {
         return var_376;
      }
      
      public function get price() : int
      {
         return var_1236;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1949;
      }
      
      public function get offerCount() : int
      {
         return var_1237;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1846;
      }
      
      public function get averagePrice() : int
      {
         return var_1950;
      }
      
      public function get furniId() : int
      {
         return var_1845;
      }
   }
}
