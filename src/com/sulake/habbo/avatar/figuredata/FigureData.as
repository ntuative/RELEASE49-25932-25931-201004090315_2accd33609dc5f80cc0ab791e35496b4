package com.sulake.habbo.avatar.figuredata
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   
   public class FigureData
   {
      
      public static const const_1282:String = "U";
      
      public static const const_589:String = "4";
      
      public static const const_84:String = "F";
      
      public static const const_80:String = "M";
      
      public static const const_157:String = "cc";
      
      public static const SHIRT:String = "ch";
      
      public static const const_173:String = "sh";
      
      public static const const_158:String = "ea";
      
      public static const const_234:String = "0";
      
      public static const FACE:String = "hd";
      
      public static const const_983:String = "2";
      
      public static const const_146:String = "hr";
      
      public static const const_992:String = "h";
      
      public static const const_160:String = "wa";
      
      public static const const_164:String = "fa";
      
      public static const const_163:String = "he";
      
      public static const CHEST_ACCESSORIES:String = "ca";
      
      public static const const_170:String = "lg";
      
      public static const const_162:String = "ha";
      
      public static const const_956:String = "std";
       
      
      private var var_560:String = "M";
      
      private var _view:FigureDataView;
      
      private var _colors:Dictionary;
      
      private var _data:Dictionary;
      
      private var var_46:HabboAvatarEditor;
      
      public function FigureData(param1:HabboAvatarEditor)
      {
         super();
         var_46 = param1;
         _view = new FigureDataView(param1.windowManager,param1.assets);
      }
      
      public function get gender() : String
      {
         return var_560;
      }
      
      public function get view() : FigureDataView
      {
         return _view;
      }
      
      public function loadAvatarData(param1:String, param2:String) : void
      {
         _data = new Dictionary();
         _colors = new Dictionary();
         var_560 = param2;
         parseFigureString(param1);
         updateView();
      }
      
      public function getFigureString() : String
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc1_:* = "";
         var _loc2_:* = [];
         for(_loc3_ in _data)
         {
            if(false)
            {
               _loc5_ = "null";
               _loc6_ = _colors[_loc3_] as Array;
               _loc7_ = _loc3_ + "-" + _loc5_;
               if(_loc6_)
               {
                  _loc8_ = 0;
                  while(_loc8_ < _loc6_.length)
                  {
                     _loc7_ += "-" + _loc6_[_loc8_];
                     _loc8_++;
                  }
               }
               _loc2_.push(_loc7_);
            }
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc1_ += _loc2_[_loc4_];
            if(_loc4_ < _loc2_.length - 1)
            {
               _loc1_ += ".";
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      private function savePartSetId(param1:String, param2:int, param3:Boolean = true) : void
      {
         switch(param1)
         {
            case FACE:
            case const_146:
            case const_162:
            case const_163:
            case const_158:
            case const_164:
            case SHIRT:
            case const_157:
            case CHEST_ACCESSORIES:
            case const_170:
            case const_173:
            case const_160:
               if(param2 >= 0)
               {
                  _data[param1] = param2;
               }
               else
               {
                  delete _data[param1];
               }
               break;
            default:
               Logger.log("[FigureData] Unknown partset: " + param1 + ", can not store id: " + param2);
         }
         if(param3)
         {
            updateView();
         }
      }
      
      public function getFigureStringWithFace(param1:int) : String
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc2_:* = [];
         _loc2_.push(FACE);
         var _loc3_:* = "";
         var _loc4_:* = [];
         for each(_loc5_ in _loc2_)
         {
            if(false)
            {
               _loc7_ = 0;
               _loc8_ = _colors[_loc5_] as Array;
               if(_loc5_ == FACE)
               {
                  _loc7_ = param1;
               }
               _loc9_ = _loc5_ + "-" + _loc7_;
               if(_loc7_ >= 0)
               {
                  _loc10_ = 0;
                  while(_loc10_ < _loc8_.length)
                  {
                     _loc9_ += "-" + _loc8_[_loc10_];
                     _loc10_++;
                  }
               }
               _loc4_.push(_loc9_);
            }
         }
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc3_ += _loc4_[_loc6_];
            if(_loc6_ < _loc4_.length - 1)
            {
               _loc3_ += ".";
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      public function getPartSetId(param1:String) : int
      {
         if(false)
         {
            return _data[param1];
         }
         return -1;
      }
      
      private function updateView() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:String = getFigureString();
         var _loc2_:IAvatarImage = var_46.avatarRenderManager.createAvatarImage(_loc1_,AvatarScaleType.const_53,gender);
         if(_loc2_)
         {
            _loc2_.setDirection(AvatarSetType.const_38,int(const_589));
            _loc3_ = _loc2_.getImage(AvatarSetType.const_38,true);
            _view.udpate(_loc3_);
            _loc2_.dispose();
         }
         else
         {
            Logger.log("Unable to create avatar image for the preview in avatar editor!");
            _loc4_ = new BitmapData(1,1);
            _view.udpate(_loc4_);
         }
      }
      
      private function parseFigureString(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1.split("."))
         {
            _loc3_ = _loc2_.split("-");
            if(_loc3_.length > 0)
            {
               _loc4_ = String(_loc3_[0]);
               _loc5_ = parseInt(_loc3_[1]);
               _loc6_ = new Array();
               _loc7_ = 2;
               while(_loc7_ < _loc3_.length)
               {
                  _loc6_.push(_loc3_[_loc7_]);
                  _loc7_++;
               }
               if(_loc6_.length == 0)
               {
                  _loc6_.push(0);
               }
               savePartSetId(_loc4_,_loc5_,false);
               savePartSetColourId(_loc4_,_loc6_,false);
            }
         }
      }
      
      public function savePartSetColourId(param1:String, param2:Array, param3:Boolean = true) : void
      {
         switch(param1)
         {
            case FACE:
            case const_146:
            case const_162:
            case const_163:
            case const_158:
            case const_164:
            case SHIRT:
            case const_157:
            case CHEST_ACCESSORIES:
            case const_170:
            case const_173:
            case const_160:
               _colors[param1] = param2;
               break;
            default:
               Logger.log("[FigureData] Unknown partset: " + param1 + ", can not store color-ids");
         }
         if(param3)
         {
            updateView();
         }
      }
      
      public function savePartData(param1:String, param2:int, param3:Array, param4:Boolean = false) : void
      {
         savePartSetId(param1,param2,param4);
         savePartSetColourId(param1,param3,param4);
      }
      
      public function getColourIds(param1:String) : Array
      {
         if(false)
         {
            return _colors[param1];
         }
         return [var_46.getDefaultColour(param1)];
      }
   }
}