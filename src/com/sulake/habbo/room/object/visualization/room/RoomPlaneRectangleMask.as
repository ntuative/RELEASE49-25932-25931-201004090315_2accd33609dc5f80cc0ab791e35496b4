package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_1653:Number = 0;
      
      private var var_1622:Number = 0;
      
      private var var_1623:Number = 0;
      
      private var var_1652:Number = 0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1622 = param1;
         var_1623 = param2;
         var_1653 = param3;
         var_1652 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1622;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1653;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1623;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1652;
      }
   }
}
