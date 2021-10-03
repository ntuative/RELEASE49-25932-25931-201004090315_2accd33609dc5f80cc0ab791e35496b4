package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1753:Array;
      
      private var var_1754:String;
      
      private var var_1756:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1754 = param1;
         var_1753 = param2;
         var_1756 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1754;
      }
      
      public function get yieldList() : Array
      {
         return var_1753;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1756;
      }
   }
}
