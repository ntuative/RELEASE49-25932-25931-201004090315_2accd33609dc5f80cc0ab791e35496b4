package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_961:Boolean;
      
      private var var_960:Boolean;
      
      private var var_962:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_961;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_960;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_962 = param1.readBoolean();
         var_960 = param1.readBoolean();
         var_961 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_962;
      }
      
      public function flush() : Boolean
      {
         var_962 = false;
         var_960 = false;
         var_961 = false;
         return true;
      }
   }
}
