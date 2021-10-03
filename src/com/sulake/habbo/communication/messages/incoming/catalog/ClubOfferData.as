package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_2014:int;
      
      private var var_1236:int;
      
      private var var_2013:int;
      
      private var _offerId:int;
      
      private var var_2011:int;
      
      private var var_2012:int;
      
      private var var_2017:Boolean;
      
      private var var_2016:int;
      
      private var var_2015:Boolean;
      
      private var var_1228:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1228 = param1.readString();
         var_1236 = param1.readInteger();
         var_2015 = param1.readBoolean();
         var_2017 = param1.readBoolean();
         var_2013 = param1.readInteger();
         var_2016 = param1.readInteger();
         var_2011 = param1.readInteger();
         var_2014 = param1.readInteger();
         var_2012 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return var_2011;
      }
      
      public function get month() : int
      {
         return var_2014;
      }
      
      public function get price() : int
      {
         return var_1236;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get periods() : int
      {
         return var_2013;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_2016;
      }
      
      public function get upgrade() : Boolean
      {
         return var_2015;
      }
      
      public function get day() : int
      {
         return var_2012;
      }
      
      public function get vip() : Boolean
      {
         return var_2017;
      }
      
      public function get productCode() : String
      {
         return var_1228;
      }
   }
}
