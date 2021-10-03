package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1407:String;
      
      private var var_1547:String;
      
      private var var_1024:String;
      
      private var var_430:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1407 = String(param1.@align);
         var_1024 = String(param1.@base);
         var_1547 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_430 = Number(_loc2_);
            if(var_430 > 1)
            {
               var_430 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1407;
      }
      
      public function get ink() : String
      {
         return var_1547;
      }
      
      public function get base() : String
      {
         return var_1024;
      }
      
      public function get isBlended() : Boolean
      {
         return var_430 != 1;
      }
      
      public function get blend() : Number
      {
         return var_430;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
