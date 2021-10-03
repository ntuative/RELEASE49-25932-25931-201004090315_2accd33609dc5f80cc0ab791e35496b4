package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1791:Boolean = false;
      
      private var var_1796:Boolean = false;
      
      private var var_1789:String = "";
      
      private var _type:String = "";
      
      private var var_1794:Boolean = false;
      
      private var var_1788:Number = 0;
      
      private var var_1793:Number = 0;
      
      private var var_1790:Number = 0;
      
      private var var_1792:String = "";
      
      private var var_1795:Number = 0;
      
      private var var_1797:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1792 = param2;
         var_1789 = param3;
         var_1793 = param4;
         var_1790 = param5;
         var_1788 = param6;
         var_1795 = param7;
         var_1797 = param8;
         var_1796 = param9;
         var_1794 = param10;
         var_1791 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1797;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1791;
      }
      
      public function get localX() : Number
      {
         return var_1788;
      }
      
      public function get localY() : Number
      {
         return var_1795;
      }
      
      public function get canvasId() : String
      {
         return var_1792;
      }
      
      public function get altKey() : Boolean
      {
         return var_1796;
      }
      
      public function get spriteTag() : String
      {
         return var_1789;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1793;
      }
      
      public function get screenY() : Number
      {
         return var_1790;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1794;
      }
   }
}
