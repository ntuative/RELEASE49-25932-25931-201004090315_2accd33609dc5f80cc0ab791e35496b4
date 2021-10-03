package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_319:String;
      
      private var var_1660:int;
      
      private var var_2206:String;
      
      private var var_1085:int;
      
      private var var_1182:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1182;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1182 = param1.readInteger();
         var_2206 = param1.readString();
         var_1660 = param1.readInteger();
         var_319 = param1.readString();
         var_1085 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2206;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_319;
      }
      
      public function get petType() : int
      {
         return var_1085;
      }
      
      public function get level() : int
      {
         return var_1660;
      }
   }
}
