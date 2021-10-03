package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1327:int;
      
      private var var_1218:int;
      
      private var var_1328:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1327;
      }
      
      public function flush() : Boolean
      {
         var_1218 = 0;
         var_1327 = 0;
         var_1328 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1218;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1327 = param1.readInteger();
         var_1218 = param1.readInteger();
         var_1328 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1328;
      }
   }
}
