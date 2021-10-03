package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_352:Boolean;
      
      private var var_1315:int;
      
      private var var_1552:String;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         var_1315 = param1.readInteger();
         var_1552 = param1.readString();
         var_352 = param1.readBoolean();
      }
      
      public function get visible() : Boolean
      {
         return var_352;
      }
      
      public function get nodeName() : String
      {
         return var_1552;
      }
      
      public function get nodeId() : int
      {
         return var_1315;
      }
   }
}
