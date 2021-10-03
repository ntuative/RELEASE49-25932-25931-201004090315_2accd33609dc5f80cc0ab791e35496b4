package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1803:Class;
      
      private var var_1801:Class;
      
      private var var_1802:String;
      
      private var var_1186:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1802 = param1;
         var_1801 = param2;
         var_1803 = param3;
         if(rest == null)
         {
            var_1186 = new Array();
         }
         else
         {
            var_1186 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1803;
      }
      
      public function get assetClass() : Class
      {
         return var_1801;
      }
      
      public function get mimeType() : String
      {
         return var_1802;
      }
      
      public function get fileTypes() : Array
      {
         return var_1186;
      }
   }
}
