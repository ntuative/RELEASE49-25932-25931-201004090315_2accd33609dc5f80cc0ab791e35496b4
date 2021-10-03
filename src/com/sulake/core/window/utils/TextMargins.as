package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   
   public class TextMargins implements IMargins, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_908:int;
      
      private var _right:int;
      
      private var var_909:int;
      
      private var var_907:int;
      
      private var var_179:Function;
      
      public function TextMargins(param1:int, param2:int, param3:int, param4:int, param5:Function)
      {
         super();
         var_909 = param1;
         var_907 = param2;
         _right = param3;
         var_908 = param4;
         var_179 = param5 != null ? param5 : nullCallback;
      }
      
      public function set bottom(param1:int) : void
      {
         var_908 = param1;
         var_179(this);
      }
      
      public function get left() : int
      {
         return var_909;
      }
      
      public function get isZeroes() : Boolean
      {
         return var_909 == 0 && _right == 0 && var_907 == 0 && var_908 == 0;
      }
      
      public function get right() : int
      {
         return _right;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set top(param1:int) : void
      {
         var_907 = param1;
         var_179(this);
      }
      
      public function get top() : int
      {
         return var_907;
      }
      
      public function set left(param1:int) : void
      {
         var_909 = param1;
         var_179(this);
      }
      
      public function get bottom() : int
      {
         return var_908;
      }
      
      public function clone(param1:Function) : TextMargins
      {
         return new TextMargins(var_909,var_907,_right,var_908,param1);
      }
      
      public function dispose() : void
      {
         var_179 = null;
         _disposed = true;
      }
      
      public function set right(param1:int) : void
      {
         _right = param1;
         var_179(this);
      }
      
      private function nullCallback(param1:IMargins) : void
      {
      }
   }
}
