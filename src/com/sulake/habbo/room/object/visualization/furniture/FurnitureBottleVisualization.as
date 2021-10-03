package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1035:int = -1;
      
      private static const const_749:int = 20;
      
      private static const const_483:int = 9;
       
      
      private var var_610:Boolean = false;
      
      private var var_210:Array;
      
      public function FurnitureBottleVisualization()
      {
         var_210 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_610 = true;
            var_210 = new Array();
            var_210.push(const_1035);
            return;
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_610)
            {
               var_610 = false;
               var_210 = new Array();
               var_210.push(const_749);
               var_210.push(const_483 + param1);
               var_210.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
         {
            if(false)
            {
               super.setAnimation(var_210.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
