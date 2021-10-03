package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_731:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_1615:BitmapData;
      
      private var var_1616:String;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_731,param3,param4);
         var_1616 = param1;
         var_1615 = param2;
      }
      
      public function get badgeImage() : BitmapData
      {
         return var_1615;
      }
      
      public function get badgeID() : String
      {
         return var_1616;
      }
   }
}
