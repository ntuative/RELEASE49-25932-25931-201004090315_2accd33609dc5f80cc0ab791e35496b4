package com.sulake.habbo.toolbar
{
   public class StateItem
   {
       
      
      private var var_1341:Boolean;
      
      private var var_1733:String;
      
      private var _frames:XMLList;
      
      private var var_1033:String = "-1";
      
      private var var_638:String;
      
      private var var_161:int = 120;
      
      private var var_1165:String = "-1";
      
      private var var_1164:String;
      
      private var var_1734:Boolean;
      
      private var var_1425:String = "-1";
      
      private var _id:String;
      
      public function StateItem(param1:XML, param2:String)
      {
         super();
         _id = param1.@id;
         if(param1.attribute("loop").length() > 0)
         {
            var_1341 = Boolean(param1.@loop);
         }
         if(param1.attribute("bounce").length() > 0)
         {
            var_1734 = Boolean(param1.@loop);
         }
         if(param1.attribute("timer").length() > 0)
         {
            var_161 = int(param1.@timer);
         }
         if(param1.attribute("namebase").length() > 0)
         {
            var_1164 = param1.@namebase;
         }
         else
         {
            var_1164 = param2;
         }
         if(param1.attribute("state_over").length() > 0)
         {
            var_1033 = param1.@state_over;
         }
         if(param1.attribute("nextState").length() > 0)
         {
            var_1165 = param1.@nextState;
         }
         else
         {
            var_1165 = _id;
         }
         if(param1.attribute("state_default").length() > 0)
         {
            var_1425 = param1.@state_default;
         }
         if(param1.attribute("tooltip").length() > 0)
         {
            var_1733 = param1.@tooltip;
         }
         if(param1.attribute("background").length() > 0)
         {
            var_638 = param1.@background;
         }
         var _loc3_:XMLList = param1.elements("frame");
         if(_loc3_.length() > 0)
         {
            _frames = _loc3_;
         }
      }
      
      public function get hasStateOver() : Boolean
      {
         return var_1033 != "-1";
      }
      
      public function get bounce() : Boolean
      {
         return var_1734;
      }
      
      public function get defaultState() : String
      {
         return var_1425;
      }
      
      public function get hasDefaultState() : Boolean
      {
         return var_1425 != "-1";
      }
      
      public function get tooltip() : String
      {
         return var_1733;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get timer() : int
      {
         return var_161;
      }
      
      public function get loop() : Boolean
      {
         return var_1341;
      }
      
      public function get nextState() : String
      {
         return var_1165;
      }
      
      public function get frames() : XMLList
      {
         return _frames;
      }
      
      public function get background() : String
      {
         return var_638;
      }
      
      public function get stateOver() : String
      {
         return var_1033;
      }
      
      public function get nameBase() : String
      {
         return var_1164;
      }
   }
}
