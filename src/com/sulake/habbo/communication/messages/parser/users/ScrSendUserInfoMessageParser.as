package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1383:int = 2;
      
      public static const const_1518:int = 1;
       
      
      private var var_2266:int;
      
      private var var_2263:int;
      
      private var var_1748:Boolean;
      
      private var var_2264:int;
      
      private var var_1330:String;
      
      private var var_2265:Boolean;
      
      private var var_2262:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2263;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1748;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2262;
      }
      
      public function get memberPeriods() : int
      {
         return var_2264;
      }
      
      public function get productName() : String
      {
         return var_1330;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2265;
      }
      
      public function get responseType() : int
      {
         return var_2266;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1330 = param1.readString();
         var_2263 = param1.readInteger();
         var_2264 = param1.readInteger();
         var_2262 = param1.readInteger();
         var_2266 = param1.readInteger();
         var_2265 = param1.readBoolean();
         var_1748 = param1.readBoolean();
         return true;
      }
   }
}
