package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1036:int = 31;
      
      private static const const_1035:int = 32;
      
      private static const const_484:int = 30;
      
      private static const const_749:int = 20;
      
      private static const const_483:int = 10;
       
      
      private var var_610:Boolean = false;
      
      private var var_210:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_210 = new Array();
         super();
         super.setAnimation(const_484);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_610 = true;
            var_210 = new Array();
            var_210.push(const_1036);
            var_210.push(const_1035);
            return;
         }
         if(param1 > 0 && param1 <= const_483)
         {
            if(var_610)
            {
               var_610 = false;
               var_210 = new Array();
               if(_direction == 2)
               {
                  var_210.push(const_749 + 5 - param1);
                  var_210.push(const_483 + 5 - param1);
               }
               else
               {
                  var_210.push(const_749 + param1);
                  var_210.push(const_483 + param1);
               }
               var_210.push(const_484);
               return;
            }
            super.setAnimation(const_484);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
