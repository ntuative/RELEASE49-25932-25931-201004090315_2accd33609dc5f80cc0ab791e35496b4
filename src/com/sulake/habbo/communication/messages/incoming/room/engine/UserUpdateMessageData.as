package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_81:Number = 0;
      
      private var var_218:int = 0;
      
      private var var_2034:int = 0;
      
      private var var_2230:Number = 0;
      
      private var var_2231:Number = 0;
      
      private var var_2229:Number = 0;
      
      private var var_2228:Number = 0;
      
      private var var_2227:Boolean = false;
      
      private var var_82:Number = 0;
      
      private var _id:int = 0;
      
      private var var_204:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_204 = [];
         super();
         _id = param1;
         var_82 = param2;
         _y = param3;
         var_81 = param4;
         var_2228 = param5;
         var_218 = param6;
         var_2034 = param7;
         var_2230 = param8;
         var_2231 = param9;
         var_2229 = param10;
         var_2227 = param11;
         var_204 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_81;
      }
      
      public function get dir() : int
      {
         return var_218;
      }
      
      public function get localZ() : Number
      {
         return var_2228;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2227;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_2034;
      }
      
      public function get targetX() : Number
      {
         return var_2230;
      }
      
      public function get targetY() : Number
      {
         return var_2231;
      }
      
      public function get targetZ() : Number
      {
         return var_2229;
      }
      
      public function get x() : Number
      {
         return var_82;
      }
      
      public function get actions() : Array
      {
         return var_204.slice();
      }
   }
}
