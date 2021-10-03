package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_370:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_302:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_914:int;
      
      private var var_278:Boolean;
      
      private var var_2036:Boolean;
      
      private var var_1510:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_914 = param2;
         var_2036 = param3;
         var_278 = param4;
         var_1510 = param5;
      }
      
      public function get position() : int
      {
         return var_914;
      }
      
      public function get isActive() : Boolean
      {
         return var_278;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1510;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_2036;
      }
   }
}
