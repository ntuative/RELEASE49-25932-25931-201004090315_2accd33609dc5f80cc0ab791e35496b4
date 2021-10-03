package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1007:Boolean;
      
      private var var_1348:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1007 = param1.readInteger() > 0;
         var_1348 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_1007;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1348;
      }
      
      public function flush() : Boolean
      {
         var_1007 = false;
         var_1348 = false;
         return true;
      }
   }
}
