package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_702:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_702 = new ByteArray();
         var_702.writeShort(param1);
         var_702.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_702.position = 0;
         if(false)
         {
            _loc1_ = var_702.readShort();
            var_702.position = 0;
         }
         return _loc1_;
      }
   }
}
