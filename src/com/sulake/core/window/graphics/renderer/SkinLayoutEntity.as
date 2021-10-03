package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_257:uint = 1;
      
      public static const const_441:uint = 0;
      
      public static const const_915:uint = 8;
      
      public static const const_259:uint = 4;
      
      public static const const_440:uint = 2;
       
      
      private var var_430:uint;
      
      private var var_2226:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_2225:uint;
      
      private var var_93:Rectangle;
      
      private var var_639:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_93 = param3;
         _color = param4;
         var_430 = param5;
         var_2226 = param6;
         var_2225 = param7;
         var_639 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_2226;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_430;
      }
      
      public function get scaleV() : uint
      {
         return var_2225;
      }
      
      public function get tags() : Array
      {
         return var_639;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_93 = null;
         var_639 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_93;
      }
   }
}
