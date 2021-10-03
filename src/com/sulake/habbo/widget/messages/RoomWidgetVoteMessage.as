package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_114:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1130:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_114);
         var_1130 = param1;
      }
      
      public function get vote() : int
      {
         return var_1130;
      }
   }
}
