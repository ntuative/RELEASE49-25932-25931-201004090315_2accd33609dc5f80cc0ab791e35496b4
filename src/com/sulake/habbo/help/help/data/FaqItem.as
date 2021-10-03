package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1347:int;
      
      private var var_1346:String;
      
      private var var_1800:String;
      
      private var _index:int;
      
      private var var_1799:Boolean = false;
      
      private var _category:FaqCategory;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         var_1347 = param1;
         var_1800 = param2;
         _index = param3;
         _category = param4;
      }
      
      public function get answerText() : String
      {
         return var_1346;
      }
      
      public function get questionId() : int
      {
         return var_1347;
      }
      
      public function get questionText() : String
      {
         return var_1800;
      }
      
      public function set answerText(param1:String) : void
      {
         var_1346 = param1;
         var_1799 = true;
      }
      
      public function get hasAnswer() : Boolean
      {
         return var_1799;
      }
      
      public function get category() : FaqCategory
      {
         return _category;
      }
      
      public function get index() : int
      {
         return _index;
      }
   }
}
