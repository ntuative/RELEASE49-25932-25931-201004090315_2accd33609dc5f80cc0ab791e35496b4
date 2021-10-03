package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetEcotronBoxDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_82:String = "RWEBDUE_CONTENTS";
      
      public static const const_66:String = "RWEBDUE_PACKAGEINFO";
       
      
      private var var_198:String;
      
      private var var_1676:BitmapData;
      
      private var var_153:int = -1;
      
      private var var_46:Boolean;
      
      public function RoomWidgetEcotronBoxDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_153 = param2;
         var_198 = param3;
         var_46 = param4;
         var_1676 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_1676;
      }
      
      public function get text() : String
      {
         return var_198;
      }
      
      public function get objectId() : int
      {
         return var_153;
      }
      
      public function get controller() : Boolean
      {
         return var_46;
      }
   }
}
