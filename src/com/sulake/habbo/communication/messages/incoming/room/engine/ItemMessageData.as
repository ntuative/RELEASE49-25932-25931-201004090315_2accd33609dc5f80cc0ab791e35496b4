package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_81:Number = 0;
      
      private var _data:String = "";
      
      private var var_1420:int = 0;
      
      private var var_30:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_2240:Boolean = false;
      
      private var var_2394:String = "";
      
      private var _id:int = 0;
      
      private var var_183:Boolean = false;
      
      private var var_218:String = "";
      
      private var var_2241:int = 0;
      
      private var var_2239:int = 0;
      
      private var var_1788:int = 0;
      
      private var var_1795:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_2240 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_183)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_2240;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_183)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_218;
      }
      
      public function get state() : int
      {
         return var_30;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_183)
         {
            var_1788 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_183)
         {
            var_2241 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_183)
         {
            var_2239 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_183)
         {
            var_218 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_183)
         {
            var_1795 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_183)
         {
            var_30 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1788;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_183)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_2241;
      }
      
      public function get wallY() : Number
      {
         return var_2239;
      }
      
      public function get localY() : Number
      {
         return var_1795;
      }
      
      public function setReadOnly() : void
      {
         var_183 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_81;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_183)
         {
            var_81 = param1;
         }
      }
   }
}
