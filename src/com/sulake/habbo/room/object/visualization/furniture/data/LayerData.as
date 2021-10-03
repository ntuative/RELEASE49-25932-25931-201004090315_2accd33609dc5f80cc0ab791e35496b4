package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_472:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_464:int = 0;
      
      public static const const_950:int = 2;
      
      public static const const_807:int = 1;
      
      public static const const_721:Boolean = false;
      
      public static const const_514:String = "";
      
      public static const const_471:int = 0;
      
      public static const const_405:int = 0;
      
      public static const const_357:int = 0;
       
      
      private var var_2143:int = 0;
      
      private var var_1725:String = "";
      
      private var var_1547:int = 0;
      
      private var var_2141:int = 0;
      
      private var var_2142:Number = 0;
      
      private var var_1722:int = 255;
      
      private var var_2144:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_2143;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1547 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_2142;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_2141 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_2143 = param1;
      }
      
      public function get tag() : String
      {
         return var_1725;
      }
      
      public function get alpha() : int
      {
         return var_1722;
      }
      
      public function get ink() : int
      {
         return var_1547;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_2142 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_2141;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_2144 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_2144;
      }
      
      public function set tag(param1:String) : void
      {
         var_1725 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1722 = param1;
      }
   }
}
