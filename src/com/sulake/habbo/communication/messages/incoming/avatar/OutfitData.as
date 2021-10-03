package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_2053:String;
      
      private var var_560:String;
      
      private var var_1415:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1415 = param1.readInteger();
         var_2053 = param1.readString();
         var_560 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_560;
      }
      
      public function get figureString() : String
      {
         return var_2053;
      }
      
      public function get slotId() : int
      {
         return var_1415;
      }
   }
}
