package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1095:int = 0;
      
      private var var_1272:int = 0;
      
      private var var_2076:String = "";
      
      private var var_1094:int = 0;
      
      private var var_2072:String = "";
      
      private var var_2075:int = 0;
      
      private var var_1597:String = "";
      
      private var var_2073:int = 0;
      
      private var var_2074:int = 0;
      
      private var var_2071:String = "";
      
      private var var_2070:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_2073 = param1;
         var_2071 = param2;
         var_1597 = param3;
         var_2076 = param4;
         var_2072 = param5;
         if(param6)
         {
            var_1272 = 1;
         }
         else
         {
            var_1272 = 0;
         }
         var_2075 = param7;
         var_2074 = param8;
         var_1094 = param9;
         var_2070 = param10;
         var_1095 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2073,var_2071,var_1597,var_2076,var_2072,var_1272,var_2075,var_2074,var_1094,var_2070,var_1095];
      }
      
      public function dispose() : void
      {
      }
   }
}
