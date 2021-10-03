package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_2009:int;
      
      private var var_2008:Boolean;
      
      private var _offerId:int;
      
      private var var_1973:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_2008 = param1.readBoolean();
         var_2009 = param1.readInteger();
         var_1973 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1973;
      }
      
      public function get monthsRequired() : int
      {
         return var_2009;
      }
      
      public function get isVip() : Boolean
      {
         return var_2008;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
