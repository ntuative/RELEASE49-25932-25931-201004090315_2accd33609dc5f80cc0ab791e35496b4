package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_67:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_1079:int;
      
      private var _color:uint;
      
      private var var_1078:int;
      
      private var var_1702:int;
      
      private var var_30:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_67,param6,param7);
         var_30 = param1;
         var_1702 = param2;
         var_1079 = param3;
         _color = param4;
         var_1078 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_1078;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_1079;
      }
      
      public function get state() : int
      {
         return var_30;
      }
      
      public function get presetId() : int
      {
         return var_1702;
      }
   }
}
