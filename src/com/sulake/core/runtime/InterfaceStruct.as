package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_401:uint;
      
      private var var_1006:IUnknown;
      
      private var var_1195:String;
      
      private var var_1005:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_1005 = param1;
         var_1195 = getQualifiedClassName(var_1005);
         var_1006 = param2;
         var_401 = 0;
      }
      
      public function get iid() : IID
      {
         return var_1005;
      }
      
      public function get disposed() : Boolean
      {
         return var_1006 == null;
      }
      
      public function get references() : uint
      {
         return var_401;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_401) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1006;
      }
      
      public function get iis() : String
      {
         return var_1195;
      }
      
      public function reserve() : uint
      {
         return ++var_401;
      }
      
      public function dispose() : void
      {
         var_1005 = null;
         var_1195 = null;
         var_1006 = null;
         var_401 = 0;
      }
   }
}
