package com.sulake.habbo.avatar.animation
{
   public class SpriteDataContainer implements ISpriteDataContainer
   {
       
      
      private var _id:String;
      
      private var var_1631:IAnimation;
      
      private var var_1632:Boolean;
      
      private var var_1547:int;
      
      private var var_1126:Array;
      
      private var var_1633:String;
      
      private var _dx:Array;
      
      private var var_1127:Array;
      
      public function SpriteDataContainer(param1:IAnimation, param2:XML)
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         super();
         var_1631 = param1;
         _id = String(param2.@id);
         var_1547 = parseInt(param2.@ink);
         var_1633 = String(param2.@member);
         var_1632 = Boolean(parseInt(param2.@directions));
         _dx = [];
         var_1127 = [];
         var_1126 = [];
         for each(_loc3_ in param2.direction)
         {
            _loc4_ = parseInt(_loc3_.@id);
            _dx[_loc4_] = parseInt(_loc3_.@dx);
            var_1127[_loc4_] = parseInt(_loc3_.@dy);
            var_1126[_loc4_] = parseInt(_loc3_.@dz);
         }
      }
      
      public function get animation() : IAnimation
      {
         return var_1631;
      }
      
      public function get hasDirections() : Boolean
      {
         return var_1632;
      }
      
      public function get member() : String
      {
         return var_1633;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function getDirectionOffsetZ(param1:int) : int
      {
         if(param1 < var_1126.length)
         {
            return var_1126[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetX(param1:int) : int
      {
         if(param1 < _dx.length)
         {
            return _dx[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetY(param1:int) : int
      {
         if(param1 < var_1127.length)
         {
            return var_1127[param1];
         }
         return 0;
      }
      
      public function get ink() : int
      {
         return var_1547;
      }
   }
}
