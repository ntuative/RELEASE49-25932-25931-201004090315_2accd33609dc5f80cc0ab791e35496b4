package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.utils.IRectLimiter;
   import com.sulake.core.window.utils.WindowRectLimits;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowModel implements IDisposable
   {
       
      
      protected var _disposed:Boolean = false;
      
      protected var var_374:Rectangle;
      
      protected var _param:uint;
      
      protected var var_141:Rectangle;
      
      protected var _type:uint;
      
      protected var var_1112:Boolean = true;
      
      protected var var_142:Rectangle;
      
      protected var var_546:uint = 16777215;
      
      protected var var_30:uint;
      
      protected var var_545:uint = 10;
      
      protected var var_77:uint;
      
      protected var var_352:Boolean = true;
      
      protected var var_325:String = "";
      
      protected var var_71:WindowRectLimits;
      
      protected var var_1388:uint;
      
      protected var var_638:Boolean = false;
      
      protected var var_430:Number = 1;
      
      protected var var_54:Rectangle;
      
      protected var _id:uint;
      
      protected var _name:String;
      
      protected var var_7:Rectangle;
      
      protected var var_14:WindowContext;
      
      protected var var_639:Array;
      
      public function WindowModel(param1:uint, param2:String, param3:uint, param4:uint, param5:uint, param6:WindowContext, param7:Rectangle, param8:Array = null)
      {
         super();
         _id = param1;
         _name = param2;
         _type = param3;
         _param = param5;
         var_30 = WindowState.const_86;
         var_77 = param4;
         var_639 = param8 == null ? new Array() : param8;
         var_14 = param6;
         var_7 = param7.clone();
         var_374 = param7.clone();
         var_54 = param7.clone();
         var_142 = new Rectangle();
         var_141 = null;
         var_71 = new WindowRectLimits(this as IWindow);
      }
      
      public function getMinHeight() : int
      {
         return var_71.minHeight;
      }
      
      public function testTypeFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (_type & param2 ^ param1) == 0;
         }
         return (_type & param1) == param1;
      }
      
      public function getMinWidth() : int
      {
         return var_71.minWidth;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get param() : uint
      {
         return _param;
      }
      
      public function get state() : uint
      {
         return var_30;
      }
      
      public function getMaximizedWidth() : int
      {
         return var_141.width;
      }
      
      public function getMinimizedHeight() : int
      {
         return var_142.height;
      }
      
      public function get limits() : IRectLimiter
      {
         return var_71;
      }
      
      public function get tags() : Array
      {
         return var_639;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function testStateFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_30 & param2 ^ param1) == 0;
         }
         return (var_30 & param1) == param1;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            var_7 = null;
            var_30 = WindowState.const_378;
            var_639 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get height() : int
      {
         return var_7.height;
      }
      
      public function get position() : Point
      {
         return var_7.topLeft;
      }
      
      public function get background() : Boolean
      {
         return var_638;
      }
      
      public function get context() : IWindowContext
      {
         return var_14;
      }
      
      public function get mouseTreshold() : uint
      {
         return var_545;
      }
      
      public function get style() : uint
      {
         return var_77;
      }
      
      public function invalidate(param1:Rectangle = null) : void
      {
      }
      
      public function testParamFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (_param & param2 ^ param1) == 0;
         }
         return (_param & param1) == param1;
      }
      
      public function testStyleFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_77 & param2 ^ param1) == 0;
         }
         return (var_77 & param1) == param1;
      }
      
      public function getMaxWidth() : int
      {
         return var_71.maxWidth;
      }
      
      public function hasMaxHeight() : Boolean
      {
         return false;
      }
      
      public function get type() : uint
      {
         return _type;
      }
      
      public function get clipping() : Boolean
      {
         return var_1112;
      }
      
      public function setMinWidth(param1:int) : int
      {
         var _loc2_:int = 0;
         var_71.minWidth = param1;
         return _loc2_;
      }
      
      public function get width() : int
      {
         return var_7.width;
      }
      
      public function hasMinHeight() : Boolean
      {
         return false;
      }
      
      public function get blend() : Number
      {
         return var_430;
      }
      
      public function getInitialHeight() : int
      {
         return var_374.height;
      }
      
      public function getMinimizedWidth() : int
      {
         return var_142.width;
      }
      
      public function setMinHeight(param1:int) : int
      {
         var _loc2_:int = 0;
         var_71.minHeight = param1;
         return _loc2_;
      }
      
      public function getInitialWidth() : int
      {
         return var_374.width;
      }
      
      public function getPreviousWidth() : int
      {
         return var_54.width;
      }
      
      public function hasMinWidth() : Boolean
      {
         return false;
      }
      
      public function get color() : uint
      {
         return var_546;
      }
      
      public function setMaxHeight(param1:int) : int
      {
         var _loc2_:int = 0;
         var_71.maxHeight = param1;
         return _loc2_;
      }
      
      public function get caption() : String
      {
         return var_325;
      }
      
      public function get rectangle() : Rectangle
      {
         return var_7;
      }
      
      public function setMaxWidth(param1:int) : int
      {
         var _loc2_:int = 0;
         var_71.maxWidth = param1;
         return _loc2_;
      }
      
      public function get visible() : Boolean
      {
         return var_352;
      }
      
      public function getMaxHeight() : int
      {
         return var_71.maxHeight;
      }
      
      public function get x() : int
      {
         return var_7.x;
      }
      
      public function get y() : int
      {
         return var_7.y;
      }
      
      public function getPreviousHeight() : int
      {
         return var_54.height;
      }
      
      public function hasMaxWidth() : Boolean
      {
         return false;
      }
      
      public function getMaximizedHeight() : int
      {
         return var_141.height;
      }
   }
}
