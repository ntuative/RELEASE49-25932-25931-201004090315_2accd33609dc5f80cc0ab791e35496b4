package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2207:Number;
      
      private var var_627:Number = 0;
      
      private var var_2208:Number;
      
      private var var_626:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_2207 = param1;
         var_2208 = param2;
      }
      
      public function update() : void
      {
         var_626 += var_2208;
         var_627 += var_626;
         if(var_627 > 0)
         {
            var_627 = 0;
            var_626 = var_2207 * -1 * var_626;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_626 = param1;
         var_627 = 0;
      }
      
      public function get location() : Number
      {
         return var_627;
      }
   }
}
