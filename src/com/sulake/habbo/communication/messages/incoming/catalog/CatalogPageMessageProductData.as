package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_202:String = "e";
      
      public static const const_83:String = "i";
      
      public static const const_81:String = "s";
       
      
      private var var_1012:String;
      
      private var var_1204:String;
      
      private var var_1206:int;
      
      private var var_2040:int;
      
      private var var_1011:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1204 = param1.readString();
         var_2040 = param1.readInteger();
         var_1012 = param1.readString();
         var_1011 = param1.readInteger();
         var_1206 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1011;
      }
      
      public function get productType() : String
      {
         return var_1204;
      }
      
      public function get expiration() : int
      {
         return var_1206;
      }
      
      public function get furniClassId() : int
      {
         return var_2040;
      }
      
      public function get extraParam() : String
      {
         return var_1012;
      }
   }
}
