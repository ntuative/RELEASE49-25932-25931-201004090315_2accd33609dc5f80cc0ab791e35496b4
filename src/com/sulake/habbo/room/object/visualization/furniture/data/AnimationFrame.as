package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_593:int = -1;
      
      public static const const_823:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_2192:int = -1;
      
      private var var_82:int = 0;
      
      private var var_1349:int = 1;
      
      private var var_920:int = 1;
      
      private var var_2194:Boolean = false;
      
      private var var_2193:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_82 = param2;
         _y = param3;
         var_2194 = param5;
         if(param4 < 0)
         {
            param4 = const_593;
         }
         var_920 = param4;
         var_1349 = param4;
         if(param6 >= 0)
         {
            var_2192 = param6;
            var_2193 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_920 > 0 && param1 > var_920)
         {
            param1 = var_920;
         }
         var_1349 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_920;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2193;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_920 < 0)
         {
            return const_593;
         }
         return var_1349;
      }
      
      public function get activeSequence() : int
      {
         return var_2192;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2194;
      }
      
      public function get x() : int
      {
         return var_82;
      }
   }
}
