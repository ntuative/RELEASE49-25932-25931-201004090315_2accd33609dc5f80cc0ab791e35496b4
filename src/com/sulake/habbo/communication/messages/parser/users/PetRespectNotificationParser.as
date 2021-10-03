package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_2056:int;
      
      private var var_1316:PetData;
      
      private var var_2218:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_2056;
      }
      
      public function get petData() : PetData
      {
         return var_1316;
      }
      
      public function flush() : Boolean
      {
         var_1316 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_2218;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_2056 = param1.readInteger();
         var_2218 = param1.readInteger();
         var_1316 = new PetData(param1);
         return true;
      }
   }
}
