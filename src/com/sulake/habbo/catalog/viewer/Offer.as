package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_986:String = "price_type_none";
      
      public static const const_429:String = "pricing_model_multi";
      
      public static const const_284:String = "price_type_credits";
      
      public static const const_421:String = "price_type_credits_and_pixels";
      
      public static const const_474:String = "pricing_model_bundle";
      
      public static const const_375:String = "pricing_model_single";
      
      public static const const_510:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1388:String = "pricing_model_unknown";
      
      public static const const_360:String = "price_type_pixels";
       
      
      private var var_1762:int;
      
      private var var_798:int;
      
      private var _offerId:int;
      
      private var var_799:int;
      
      private var var_394:String;
      
      private var var_571:String;
      
      private var var_393:ICatalogPage;
      
      private var var_395:IProductContainer;
      
      private var var_1173:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1173 = param1.localizationId;
         var_798 = param1.priceInCredits;
         var_799 = param1.priceInPixels;
         var_393 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_394;
      }
      
      public function get page() : ICatalogPage
      {
         return var_393;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1762 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_395;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_799;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1173 = "";
         var_798 = 0;
         var_799 = 0;
         var_393 = null;
         if(var_395 != null)
         {
            var_395.dispose();
            var_395 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return var_1762;
      }
      
      public function get priceInCredits() : int
      {
         return var_798;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_394 = const_375;
            }
            else
            {
               var_394 = const_429;
            }
         }
         else if(param1.length > 1)
         {
            var_394 = const_474;
         }
         else
         {
            var_394 = const_1388;
         }
      }
      
      public function get priceType() : String
      {
         return var_571;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_394)
         {
            case const_375:
               var_395 = new SingleProductContainer(this,param1);
               break;
            case const_429:
               var_395 = new MultiProductContainer(this,param1);
               break;
            case const_474:
               var_395 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_394);
         }
      }
      
      public function get localizationId() : String
      {
         return var_1173;
      }
      
      private function analyzePriceType() : void
      {
         if(var_798 > 0 && var_799 > 0)
         {
            var_571 = const_421;
         }
         else if(var_798 > 0)
         {
            var_571 = const_284;
         }
         else if(var_799 > 0)
         {
            var_571 = const_360;
         }
         else
         {
            var_571 = const_986;
         }
      }
   }
}
