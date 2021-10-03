package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1776:String;
      
      private var var_319:String;
      
      private var var_560:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         var_319 = param1;
         var_560 = param2;
         var_1776 = param3;
      }
      
      public function get race() : String
      {
         return var_1776;
      }
      
      public function get figure() : String
      {
         return var_319;
      }
      
      public function get gender() : String
      {
         return var_560;
      }
   }
}
