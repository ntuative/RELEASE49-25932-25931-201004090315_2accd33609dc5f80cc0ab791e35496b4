package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_653:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1725:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_653);
         var_1725 = param1;
      }
      
      public function get tag() : String
      {
         return var_1725;
      }
   }
}
