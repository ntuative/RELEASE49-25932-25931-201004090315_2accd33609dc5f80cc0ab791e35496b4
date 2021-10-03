package com.sulake.habbo.communication.messages.outgoing.users
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class GetUserTagsMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_27:Array;
      
      public function GetUserTagsMessageComposer(param1:int)
      {
         var_27 = [];
         super();
         this.var_27.push(int(param1));
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return this.var_27;
      }
      
      public function dispose() : void
      {
         this.var_27 = null;
      }
   }
}
