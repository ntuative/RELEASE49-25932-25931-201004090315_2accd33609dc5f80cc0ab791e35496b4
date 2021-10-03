package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_2014:int;
      
      private var var_2140:Boolean = false;
      
      private var var_2013:int;
      
      private var var_2011:int;
      
      private var var_2016:int;
      
      private var var_1228:String;
      
      private var var_1236:int;
      
      private var _offerId:int;
      
      private var var_2012:int;
      
      private var var_2017:Boolean;
      
      private var var_2015:Boolean;
      
      private var var_393:ICatalogPage;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         _offerId = param1;
         var_1228 = param2;
         var_1236 = param3;
         var_2015 = param4;
         var_2017 = param5;
         var_2013 = param6;
         var_2016 = param7;
         var_2011 = param8;
         var_2014 = param9;
         var_2012 = param10;
      }
      
      public function get month() : int
      {
         return var_2014;
      }
      
      public function get page() : ICatalogPage
      {
         return var_393;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get vip() : Boolean
      {
         return var_2017;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         var_393 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get priceInPixels() : int
      {
         return 0;
      }
      
      public function get priceType() : String
      {
         return Offer.const_284;
      }
      
      public function get upgrade() : Boolean
      {
         return var_2015;
      }
      
      public function get localizationId() : String
      {
         return var_1228;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_2016;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return var_2140;
      }
      
      public function get day() : int
      {
         return var_2012;
      }
      
      public function get year() : int
      {
         return var_2011;
      }
      
      public function get price() : int
      {
         return var_1236;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         var_2140 = param1;
      }
      
      public function get periods() : int
      {
         return var_2013;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get priceInCredits() : int
      {
         return var_1236;
      }
      
      public function get productCode() : String
      {
         return var_1228;
      }
   }
}
