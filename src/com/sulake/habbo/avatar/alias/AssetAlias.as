package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_989:Boolean;
      
      private var _name:String;
      
      private var var_1651:String;
      
      private var var_988:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_1651 = String(param1.@link);
         var_988 = Boolean(parseInt(param1.@fliph));
         var_989 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_988;
      }
      
      public function get flipV() : Boolean
      {
         return var_989;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_1651;
      }
   }
}
