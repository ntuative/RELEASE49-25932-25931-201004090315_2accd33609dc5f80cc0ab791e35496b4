package com.sulake.habbo.avatar.common
{
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   
   public class CategoryData
   {
       
      
      private var var_675:int = -1;
      
      private var var_165:Array;
      
      private var var_186:Array;
      
      private const const_1661:int = 2;
      
      private var var_221:Array;
      
      public function CategoryData(param1:Array, param2:Array)
      {
         super();
         var_165 = param1;
         var_221 = param2;
      }
      
      public function selectPartIndex(param1:int) : AvatarEditorGridPartItem
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!var_165)
         {
            return null;
         }
         if(var_675 >= 0 && var_165.length > var_675)
         {
            _loc2_ = var_165[var_675];
            if(_loc2_)
            {
               _loc2_.isSelected = false;
            }
         }
         if(var_165.length > param1)
         {
            _loc3_ = var_165[param1] as AvatarEditorGridPartItem;
            if(_loc3_)
            {
               _loc3_.isSelected = true;
               var_675 = param1;
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getSelectedColorIds() : Array
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(!var_186 || false)
         {
            return null;
         }
         if(!var_221 || false)
         {
            return null;
         }
         var _loc1_:Array = var_221[0] as Array;
         if(!_loc1_ || _loc1_.length == 0)
         {
            return null;
         }
         var _loc2_:AvatarEditorGridColorItem = _loc1_[0] as AvatarEditorGridColorItem;
         if(!_loc2_ || !_loc2_.partColor)
         {
            return null;
         }
         var _loc3_:int = _loc2_.partColor.id;
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < var_186.length)
         {
            _loc7_ = var_221[_loc5_];
            if(!(!_loc7_ || _loc7_.length <= _loc5_))
            {
               if(_loc7_.length > var_186[_loc5_])
               {
                  _loc8_ = _loc7_["null"] as AvatarEditorGridColorItem;
                  if(_loc8_ && _loc8_.partColor)
                  {
                     _loc4_.push(_loc8_.partColor.id);
                  }
                  else
                  {
                     _loc4_.push(_loc3_);
                  }
               }
               else
               {
                  _loc4_.push(_loc3_);
               }
            }
            _loc5_++;
         }
         var _loc6_:AvatarEditorGridPartItem = getCurrentPart();
         if(!_loc6_)
         {
            return null;
         }
         return _loc4_.slice(0,Math.max(_loc6_.colorLayerCount,1));
      }
      
      public function selectColorIndex(param1:int, param2:int) : AvatarEditorGridColorItem
      {
         var _loc3_:Array = getPalette(param2);
         if(!_loc3_)
         {
            return null;
         }
         if(_loc3_.length <= param1)
         {
            return null;
         }
         deselectColorIndex(var_186[param2],param2);
         var_186[param2] = param1;
         var _loc4_:AvatarEditorGridColorItem = _loc3_[param1] as AvatarEditorGridColorItem;
         if(!_loc4_)
         {
            return null;
         }
         _loc4_.isSelected = true;
         updatePartColors();
         return _loc4_;
      }
      
      private function deselectColorIndex(param1:int, param2:int) : void
      {
         var _loc3_:Array = getPalette(param2);
         if(!_loc3_)
         {
            return;
         }
         if(_loc3_.length <= param1)
         {
            return;
         }
         var _loc4_:AvatarEditorGridColorItem = _loc3_[param1] as AvatarEditorGridColorItem;
         if(!_loc4_)
         {
            return;
         }
         _loc4_.isSelected = false;
      }
      
      public function selectPartId(param1:int) : void
      {
         var _loc3_:* = null;
         if(!var_165)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < var_165.length)
         {
            _loc3_ = var_165[_loc2_];
            if(_loc3_.id == param1)
            {
               selectPartIndex(_loc2_);
               return;
            }
            _loc2_++;
         }
      }
      
      public function getSelectedColor(param1:int) : AvatarEditorGridColorItem
      {
         var _loc2_:Array = getPalette(param1);
         if(!_loc2_ || _loc2_.length <= var_186[param1])
         {
            return null;
         }
         return _loc2_["null"] as AvatarEditorGridColorItem;
      }
      
      public function getPalette(param1:int) : Array
      {
         if(!var_186)
         {
            return null;
         }
         if(!var_221)
         {
            return null;
         }
         if(var_221.length <= param1)
         {
            return null;
         }
         return var_221[param1] as Array;
      }
      
      public function getCurrentPart() : AvatarEditorGridPartItem
      {
         return var_165[var_675] as AvatarEditorGridPartItem;
      }
      
      public function hasClubSelectionsOverLevel(param1:int) : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc2_:Boolean = false;
         var _loc3_:Array = getSelectedColors();
         if(_loc3_)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc3_.length)
            {
               _loc7_ = _loc3_[_loc6_];
               if(_loc7_ && _loc7_.clubLevel > param1)
               {
                  _loc2_ = true;
               }
               _loc6_++;
            }
         }
         var _loc4_:Boolean = false;
         var _loc5_:AvatarEditorGridPartItem = getCurrentPart();
         if(_loc5_ && _loc5_.partSet)
         {
            _loc8_ = _loc5_.partSet;
            if(_loc8_ && _loc8_.clubLevel > param1)
            {
               _loc4_ = true;
            }
         }
         return _loc2_ || _loc4_;
      }
      
      public function getCurrentColorId(param1:int) : int
      {
         var _loc2_:AvatarEditorGridColorItem = getSelectedColor(param1);
         if(_loc2_ && _loc2_.partColor)
         {
            return _loc2_.partColor.id;
         }
         return 0;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_165)
         {
            for each(_loc1_ in var_165)
            {
               _loc1_.dispose();
            }
            var_165 = null;
         }
         if(var_221)
         {
            for each(_loc2_ in var_221 as Array)
            {
               if(_loc2_)
               {
                  for each(_loc3_ in _loc2_)
                  {
                     _loc3_.dispose();
                  }
               }
            }
            var_221 = null;
         }
         var_675 = -1;
         var_186 = null;
      }
      
      public function get parts() : Array
      {
         return var_165;
      }
      
      private function getSelectedColors() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < var_186.length)
         {
            _loc2_ = getSelectedColor(_loc3_);
            if(_loc2_)
            {
               _loc1_.push(_loc2_.partColor);
            }
            else
            {
               _loc1_.push(null);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      private function updatePartColors() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = getSelectedColors();
         for each(_loc2_ in var_165)
         {
            if(_loc2_)
            {
               _loc2_.colors = _loc1_;
            }
         }
      }
      
      public function selectColorIds(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         if(!var_221)
         {
            return;
         }
         if(!param1)
         {
            return;
         }
         var_186 = new Array(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < var_221.length)
         {
            _loc4_ = getPalette(_loc3_);
            if(_loc4_)
            {
               if(param1.length > _loc3_)
               {
                  _loc5_ = param1[_loc3_];
               }
               else
               {
                  _loc7_ = _loc4_[0] as AvatarEditorGridColorItem;
                  if(_loc7_ && _loc7_.partColor)
                  {
                     _loc5_ = _loc7_.partColor.id;
                  }
               }
               _loc6_ = 0;
               while(_loc6_ < _loc4_.length)
               {
                  _loc2_ = _loc4_[_loc6_] as AvatarEditorGridColorItem;
                  if(_loc2_.partColor.id == _loc5_)
                  {
                     var_186[_loc3_] = _loc6_;
                     _loc2_.isSelected = true;
                  }
                  else
                  {
                     _loc2_.isSelected = false;
                  }
                  _loc6_++;
               }
            }
            _loc3_++;
         }
         updatePartColors();
      }
      
      public function stripClubColorsOverLevel(param1:int) : Boolean
      {
         var _loc9_:* = null;
         var _loc2_:Array = new Array();
         var _loc3_:Array = getSelectedColors();
         var _loc4_:Boolean = false;
         var _loc5_:Array = getPalette(0);
         if(!_loc5_ || _loc5_.length == 0)
         {
            return false;
         }
         var _loc6_:AvatarEditorGridColorItem = _loc5_[0] as AvatarEditorGridColorItem;
         if(!_loc6_ || _loc6_.partColor)
         {
            return false;
         }
         var _loc7_:int = _loc6_.partColor.id;
         var _loc8_:int = 0;
         while(_loc8_ < _loc3_.length)
         {
            _loc9_ = _loc3_[_loc8_];
            if(!_loc9_)
            {
               _loc2_.push(_loc7_);
               _loc4_ = true;
            }
            else if(_loc9_.clubLevel > param1)
            {
               _loc2_.push(_loc7_);
               _loc4_ = true;
            }
            else
            {
               _loc2_.push(_loc9_.id);
            }
            _loc8_++;
         }
         if(_loc4_)
         {
            selectColorIds(_loc2_);
         }
         return _loc4_;
      }
      
      public function stripClubItemsOverLevel(param1:int) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:AvatarEditorGridPartItem = getCurrentPart();
         if(_loc2_ && _loc2_.partSet)
         {
            _loc3_ = _loc2_.partSet;
            if(_loc3_.clubLevel > param1)
            {
               _loc4_ = selectPartIndex(0);
               if(_loc4_ && _loc4_.partSet == null)
               {
                  selectPartIndex(1);
               }
               return true;
            }
         }
         return false;
      }
   }
}
