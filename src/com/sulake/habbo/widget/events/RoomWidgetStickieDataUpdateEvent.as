package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_659:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_198:String;
      
      private var var_668:String;
      
      private var var_1433:String;
      
      private var var_153:int = -1;
      
      private var var_46:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_153 = param2;
         var_1433 = param3;
         var_198 = param4;
         var_668 = param5;
         var_46 = param6;
      }
      
      public function get objectType() : String
      {
         return var_1433;
      }
      
      public function get colorHex() : String
      {
         return var_668;
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
