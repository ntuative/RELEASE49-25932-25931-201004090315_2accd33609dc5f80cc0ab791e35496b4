package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UniqueMachineIDParser implements IMessageParser
   {
       
      
      private var var_930:String;
      
      public function UniqueMachineIDParser()
      {
         super();
         var_930 = "";
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_930 = param1.readString();
         return true;
      }
      
      public function get machineID() : String
      {
         return var_930;
      }
      
      public function flush() : Boolean
      {
         var_930 = "";
         return true;
      }
   }
}
