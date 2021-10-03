package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData
   {
       
      
      private var var_1948:int;
      
      private var var_1236:int;
      
      private var var_1950:int;
      
      private var var_1949:int = -1;
      
      private var var_376:int;
      
      private var var_1846:int;
      
      private var _image:BitmapData;
      
      private var _offerId:int;
      
      private var var_1237:int;
      
      private var var_1845:int;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int = -1)
      {
         super();
         _offerId = param1;
         var_1845 = param2;
         var_1846 = param3;
         var_1236 = param4;
         var_376 = param5;
         var_1950 = param6;
         var_1237 = param7;
      }
      
      public function set imageCallback(param1:int) : void
      {
         var_1948 = param1;
      }
      
      public function get imageCallback() : int
      {
         return var_1948;
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
      
      public function set timeLeftMinutes(param1:int) : void
      {
         var_1949 = param1;
      }
      
      public function dispose() : void
      {
         if(_image)
         {
            _image.dispose();
            _image = null;
         }
      }
      
      public function set price(param1:int) : void
      {
         var_1236 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1237 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get status() : int
      {
         return var_376;
      }
      
      public function get averagePrice() : int
      {
         return var_1950;
      }
      
      public function set offerId(param1:int) : void
      {
         _offerId = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(_image != null)
         {
            _image.dispose();
         }
         _image = param1;
      }
      
      public function get furniId() : int
      {
         return var_1845;
      }
   }
}
