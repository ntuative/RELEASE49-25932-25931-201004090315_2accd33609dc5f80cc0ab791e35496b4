package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1412:String;
      
      private var var_941:String;
      
      private var var_1414:String;
      
      private var var_1413:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1413 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1412 = _loc5_[0];
         var_1414 = _loc5_[1];
         _name = param2;
         var_941 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1412;
      }
      
      public function get languageCode() : String
      {
         return var_1413;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_941;
      }
      
      public function get encoding() : String
      {
         return var_1414;
      }
      
      public function get id() : String
      {
         return var_1413 + "_" + var_1412 + "." + var_1414;
      }
   }
}
