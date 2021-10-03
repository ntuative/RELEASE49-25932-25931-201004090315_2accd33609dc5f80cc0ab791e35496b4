package com.sulake.core.assets
{
   import flash.utils.getQualifiedClassName;
   
   public class UnknownAsset implements IAsset
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_1178:AssetTypeDeclaration;
      
      private var var_941:String;
      
      private var var_18:Object = null;
      
      public function UnknownAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_1178 = param1;
         var_941 = param2;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_1178;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var_18 = param1;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         var_18 = param1.content as Object;
      }
      
      public function get content() : Object
      {
         return var_18;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            var_18 = null;
            var_1178 = null;
            var_941 = null;
         }
      }
      
      public function get url() : String
      {
         return var_941;
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + ": " + var_18;
      }
   }
}
