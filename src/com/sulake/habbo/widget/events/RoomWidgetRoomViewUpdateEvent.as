package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_525:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_708:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_256:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1441:Point;
      
      private var var_1442:Rectangle;
      
      private var var_205:Number = 0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1442 = param2;
         var_1441 = param3;
         var_205 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1442 != null)
         {
            return var_1442.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_205;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1441 != null)
         {
            return var_1441.clone();
         }
         return null;
      }
   }
}
