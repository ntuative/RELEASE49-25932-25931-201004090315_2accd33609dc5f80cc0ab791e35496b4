package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PopularTagData
   {
       
      
      private var var_1765:int;
      
      private var var_1841:String;
      
      public function PopularTagData(param1:IMessageDataWrapper)
      {
         super();
         var_1841 = param1.readString();
         var_1765 = param1.readInteger();
      }
      
      public function get tagName() : String
      {
         return var_1841;
      }
      
      public function get userCount() : int
      {
         return var_1765;
      }
   }
}
