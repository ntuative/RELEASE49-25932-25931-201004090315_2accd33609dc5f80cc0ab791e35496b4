package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_847:Array;
      
      private var var_798:int;
      
      private var var_1173:String;
      
      private var _offerId:int;
      
      private var var_799:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1173 = param1.readString();
         var_798 = param1.readInteger();
         var_799 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_847 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_847.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_847;
      }
      
      public function get priceInCredits() : int
      {
         return var_798;
      }
      
      public function get localizationId() : String
      {
         return var_1173;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_799;
      }
   }
}
