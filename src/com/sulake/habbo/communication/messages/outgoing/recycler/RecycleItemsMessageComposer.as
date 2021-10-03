package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_876:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_876 = new Array();
         var_876.push(param1.length);
         var_876 = var_876.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_876;
      }
   }
}
