package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1516:int = 2;
      
      public static const const_1389:int = 4;
      
      public static const const_1214:int = 1;
      
      public static const const_1283:int = 3;
       
      
      private var var_1049:int = 0;
      
      private var var_863:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_1049;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1049 = param1.readInteger();
         if(var_1049 == 3)
         {
            var_863 = param1.readString();
         }
         else
         {
            var_863 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1049 = 0;
         var_863 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_863;
      }
   }
}
