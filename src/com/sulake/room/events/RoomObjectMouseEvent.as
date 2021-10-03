package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1482:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1622:String = "ROE_MOUSE_ENTER";
      
      public static const const_446:String = "ROE_MOUSE_MOVE";
      
      public static const const_1599:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_199:String = "ROE_MOUSE_CLICK";
      
      public static const ROOM_OBJECT_MOUSE_DOWN:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1794:Boolean;
      
      private var var_1791:Boolean;
      
      private var var_1796:Boolean;
      
      private var var_1797:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1796 = param4;
         var_1797 = param5;
         var_1794 = param6;
         var_1791 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1791;
      }
      
      public function get altKey() : Boolean
      {
         return var_1796;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1797;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1794;
      }
   }
}
