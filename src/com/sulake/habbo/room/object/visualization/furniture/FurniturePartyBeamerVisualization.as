package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import flash.geom.Point;
   
   public class FurniturePartyBeamerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_790:int = 15;
      
      private static const const_1131:int = 2;
      
      private static const const_346:int = 2;
      
      private static const const_791:int = 31;
      
      private static const const_1130:int = 1;
       
      
      private var var_1090:Array;
      
      private var var_1089:Array;
      
      private var var_1087:Array;
      
      private var _animOffsetIndex:Array;
      
      private var var_1088:Array;
      
      public function FurniturePartyBeamerVisualization()
      {
         _animOffsetIndex = new Array();
         super();
      }
      
      override protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         if(param1 == 2 || param1 == 3)
         {
            if(false)
            {
               return _animOffsetIndex[param1 - 2].x;
            }
         }
         return super.getSpriteYOffset(param1,param2,param3);
      }
      
      override protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         if(param1 == 2 || param1 == 3)
         {
            if(false)
            {
               return _animOffsetIndex[param1 - 2].y;
            }
         }
         return super.getSpriteYOffset(param1,param2,param3);
      }
      
      private function getNewPoint(param1:int, param2:Number) : Point
      {
         var _loc7_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         if(param2 == 32)
         {
            _loc7_ = const_790;
         }
         else
         {
            _loc7_ = const_791;
         }
         if(Math.abs(_loc3_ + _loc4_ * _loc5_) >= _loc7_)
         {
            _loc4_ = -_loc4_;
            var_1089[param1] = _loc4_;
         }
         var _loc8_:Number = (_loc7_ - Math.abs(_loc3_)) * _loc6_;
         var _loc9_:Number = _loc4_ * Math.sin(Math.abs(_loc3_ / 4)) * _loc8_;
         if(_loc4_ > 0)
         {
            _loc9_ -= _loc8_;
         }
         else
         {
            _loc9_ += _loc8_;
         }
         _loc3_ += _loc4_ * _loc5_;
         var_1087[param1] = _loc3_;
         if(int(_loc9_) == 0)
         {
            var_1088[param1] = getRandomAmplitudeFactor();
         }
         return new Point(_loc3_,_loc9_);
      }
      
      private function initItems(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 == 32)
         {
            _loc2_ = const_790;
         }
         else
         {
            _loc2_ = const_791;
         }
         var_1087 = new Array();
         var_1087.push(Math.random() * _loc2_ * 1.5);
         var_1087.push(Math.random() * _loc2_ * 1.5);
         var_1089 = new Array();
         var_1089.push(1);
         var_1089.push(-1);
         var_1090 = new Array();
         var_1090.push(const_1131);
         var_1090.push(const_1130);
         var_1088 = new Array();
         var_1088.push(getRandomAmplitudeFactor());
         var_1088.push(getRandomAmplitudeFactor());
      }
      
      private function getRandomAmplitudeFactor() : Number
      {
         return Math.random() * 30 / 100 + 0.15;
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         var _loc2_:* = null;
         if(var_1090 == null)
         {
            initItems(param1);
         }
         _loc2_ = getSprite(2);
         if(_loc2_ != null)
         {
            _animOffsetIndex[0] = getNewPoint(0,param1);
         }
         _loc2_ = getSprite(3);
         if(_loc2_ != null)
         {
            _animOffsetIndex[1] = getNewPoint(1,param1);
         }
         return super.updateAnimation(param1);
      }
   }
}
