package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1619:String;
      
      private var var_1259:String;
      
      private var var_1618:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1618 = param1;
         var_1259 = param2;
         var_1619 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1618,var_1259,var_1619];
      }
      
      public function dispose() : void
      {
      }
   }
}
