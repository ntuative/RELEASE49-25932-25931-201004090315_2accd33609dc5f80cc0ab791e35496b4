package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage
   {
      
      public static const const_583:String = "RWCM_MESSAGE_SELECT_EFFECT";
      
      public static const const_709:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
      
      public static const const_733:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";
       
      
      private var var_2079:int;
      
      public function RoomWidgetSelectEffectMessage(param1:String, param2:int = -1)
      {
         super(param1);
         var_2079 = param2;
      }
      
      public function get effectType() : int
      {
         return var_2079;
      }
   }
}
