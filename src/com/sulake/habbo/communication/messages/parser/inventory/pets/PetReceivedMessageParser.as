package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_986:PetData;
      
      private var var_1435:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1435 = param1.readBoolean();
         var_986 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1435 + ", " + var_986.id + ", " + var_986.name + ", " + pet.figure + ", " + var_986.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1435;
      }
      
      public function get pet() : PetData
      {
         return var_986;
      }
   }
}
