package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCatMessageParser implements IMessageParser
   {
       
      
      private var var_380:int;
      
      private var var_1315:int;
      
      public function FlatCatMessageParser()
      {
         super();
      }
      
      public function get flatId() : int
      {
         return var_380;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_380 = param1.readInteger();
         var_1315 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_380 = 0;
         var_1315 = 0;
         return true;
      }
      
      public function get nodeId() : int
      {
         return var_1315;
      }
   }
}
