package com.sulake.habbo.window.utils
{
   class AlertDialogCaption implements ICaption
   {
       
      
      private var var_352:Boolean;
      
      private var var_198:String;
      
      private var var_1252:String;
      
      function AlertDialogCaption(param1:String, param2:String, param3:Boolean)
      {
         super();
         var_198 = param1;
         var_1252 = param2;
         var_352 = param3;
      }
      
      public function get toolTip() : String
      {
         return var_1252;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_352 = param1;
      }
      
      public function get text() : String
      {
         return var_198;
      }
      
      public function get visible() : Boolean
      {
         return var_352;
      }
      
      public function set toolTip(param1:String) : void
      {
         var_1252 = param1;
      }
      
      public function set text(param1:String) : void
      {
         var_198 = param1;
      }
   }
}
