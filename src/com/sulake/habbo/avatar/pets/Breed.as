package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_560:String;
      
      private var _id:int;
      
      private var var_1920:String = "";
      
      private var var_1922:int;
      
      private var var_1921:String;
      
      private var var_1823:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_1922 = parseInt(param1.@pattern);
         var_560 = String(param1.@gender);
         var_1823 = Boolean(parseInt(param1.@colorable));
         var_1920 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_1920;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1823;
      }
      
      public function get gender() : String
      {
         return var_560;
      }
      
      public function get patternId() : int
      {
         return var_1922;
      }
      
      public function get avatarFigureString() : String
      {
         return var_1921;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_1921 = param1;
      }
   }
}
