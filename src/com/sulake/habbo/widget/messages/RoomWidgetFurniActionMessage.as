package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_267:String = "RWFAM_MOVE";
      
      public static const const_526:String = "RWFUAM_ROTATE";
      
      public static const const_543:String = "RWFAM_PICKUP";
       
      
      private var var_1845:int = 0;
      
      private var var_2214:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_1845 = param2;
         var_2214 = param3;
      }
      
      public function get furniId() : int
      {
         return var_1845;
      }
      
      public function get furniCategory() : int
      {
         return var_2214;
      }
   }
}
