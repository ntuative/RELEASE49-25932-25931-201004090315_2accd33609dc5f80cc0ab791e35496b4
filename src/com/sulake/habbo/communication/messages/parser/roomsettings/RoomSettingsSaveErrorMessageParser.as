package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1560:int = 9;
      
      public static const const_1546:int = 4;
      
      public static const const_1503:int = 1;
      
      public static const const_1200:int = 10;
      
      public static const const_1445:int = 2;
      
      public static const const_1198:int = 7;
      
      public static const const_1193:int = 11;
      
      public static const const_1467:int = 3;
      
      public static const const_1319:int = 8;
      
      public static const const_1358:int = 5;
      
      public static const const_1593:int = 6;
      
      public static const const_1278:int = 12;
       
      
      private var var_2077:String;
      
      private var _roomId:int;
      
      private var var_1218:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_2077;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1218 = param1.readInteger();
         var_2077 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1218;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
