package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_590:int = 2;
      
      public static const const_1023:int = 6;
      
      public static const const_607:int = 1;
      
      public static const const_666:int = 3;
      
      public static const const_1009:int = 4;
      
      public static const const_497:int = 5;
       
      
      private var var_2236:String;
      
      private var var_1000:int;
      
      private var var_2182:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1000 = param2;
         var_2182 = param3;
         var_2236 = param4;
      }
      
      public function get time() : String
      {
         return var_2236;
      }
      
      public function get senderId() : int
      {
         return var_1000;
      }
      
      public function get messageText() : String
      {
         return var_2182;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
