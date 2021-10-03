package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_192:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1912:Boolean = false;
      
      private var var_1908:int = 0;
      
      private var var_1909:int = 0;
      
      private var var_1911:int;
      
      private var var_1910:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_192,param6,param7);
         var_1910 = param1;
         var_1909 = param2;
         var_1908 = param3;
         var_1912 = param4;
         var_1911 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_1911;
      }
      
      public function get pastPeriods() : int
      {
         return var_1908;
      }
      
      public function get periodsLeft() : int
      {
         return var_1909;
      }
      
      public function get daysLeft() : int
      {
         return var_1910;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1912;
      }
   }
}
