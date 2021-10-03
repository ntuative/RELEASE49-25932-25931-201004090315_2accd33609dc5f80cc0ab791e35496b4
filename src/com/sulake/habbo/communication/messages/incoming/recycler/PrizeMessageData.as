package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_1556:int;
      
      private var var_2110:String;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_2110 = param1.readString();
         var_1556 = param1.readInteger();
      }
      
      public function get productItemTypeId() : int
      {
         return var_1556;
      }
      
      public function get productItemType() : String
      {
         return var_2110;
      }
   }
}
