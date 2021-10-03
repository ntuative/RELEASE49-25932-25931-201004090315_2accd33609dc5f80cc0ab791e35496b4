package com.sulake.habbo.avatar.common
{
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   
   public class CategoryBaseModel implements IAvatarEditorCategoryModel
   {
       
      
      protected var var_46:HabboAvatarEditor;
      
      protected var _view:IAvatarEditorCategoryView;
      
      protected var var_157:Boolean = false;
      
      protected var var_85:Map;
      
      public function CategoryBaseModel(param1:HabboAvatarEditor)
      {
         super();
         var_46 = param1;
      }
      
      public function hasClubItemsOverLevel(param1:int) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         if(!var_85)
         {
            return false;
         }
         var _loc2_:Boolean = false;
         for each(_loc3_ in var_85)
         {
            if(_loc3_)
            {
               _loc4_ = _loc3_.hasClubSelectionsOverLevel(param1);
               if(_loc4_)
               {
                  _loc2_ = true;
               }
            }
         }
         return _loc2_;
      }
      
      public function stripClubItemsOverLevel(param1:int) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         if(!var_85)
         {
            return false;
         }
         var _loc2_:Array = var_85.getKeys();
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc5_ = _loc2_[_loc4_];
            _loc6_ = var_85[_loc5_];
            _loc7_ = false;
            if(_loc6_.stripClubItemsOverLevel(param1))
            {
               _loc7_ = true;
            }
            if(_loc6_.stripClubColorsOverLevel(param1))
            {
               _loc7_ = true;
            }
            if(_loc7_)
            {
               _loc8_ = _loc6_.getCurrentPart();
               if(_loc8_ && var_46 && false && _loc6_)
               {
                  var_46.figureData.savePartData(_loc5_,_loc8_.id,_loc6_.getSelectedColorIds(),true);
               }
               _loc3_ = true;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(!var_157)
         {
            init();
         }
         if(!_view)
         {
            return null;
         }
         return _view.getWindowContainer();
      }
      
      public function getCategoryData(param1:String) : CategoryData
      {
         if(!var_157)
         {
            init();
         }
         if(!var_85)
         {
            return null;
         }
         return var_85[param1];
      }
      
      public function selectColor(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:CategoryData = var_85[param1];
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.selectColorIndex(param2,param3);
         if(var_46 && false)
         {
            var_46.figureData.savePartSetColourId(param1,_loc4_.getSelectedColorIds(),true);
         }
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         var_157 = false;
         for each(_loc1_ in var_85)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         var_85 = new Map();
         if(_view)
         {
            _view.reset();
         }
      }
      
      protected function init() : void
      {
         if(!var_85)
         {
            var_85 = new Map();
         }
      }
      
      public function switchCategory(param1:String) : void
      {
         if(!var_157)
         {
            init();
         }
         if(_view)
         {
            _view.switchCategory(param1);
         }
      }
      
      public function selectPart(param1:String, param2:int) : void
      {
         var _loc3_:CategoryData = var_85[param1];
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.selectPartIndex(param2);
         var _loc4_:AvatarEditorGridPartItem = _loc3_.getCurrentPart();
         if(!_loc4_)
         {
            return;
         }
         if(_view)
         {
            _view.showPalettes(param1,_loc4_.colorLayerCount);
         }
         if(var_46 && false)
         {
            var_46.figureData.savePartData(param1,_loc4_.id,_loc3_.getSelectedColorIds(),true);
         }
      }
      
      public function get controller() : HabboAvatarEditor
      {
         return var_46;
      }
      
      protected function updateSelectionsFromFigure(param1:String) : void
      {
         if(!var_85 || !var_46 || true)
         {
            return;
         }
         var _loc2_:CategoryData = var_85[param1];
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = var_46.figureData.getPartSetId(param1);
         var _loc4_:Array = var_46.figureData.getColourIds(param1);
         if(!_loc4_)
         {
            _loc4_ = new Array();
         }
         _loc2_.selectPartId(_loc3_);
         _loc2_.selectColorIds(_loc4_);
         if(_view)
         {
            _view.showPalettes(param1,_loc4_.length);
         }
      }
      
      public function dispose() : void
      {
         if(_view != null)
         {
            _view.dispose();
         }
         _view = null;
         var_85 = null;
         var_46 = null;
      }
      
      protected function initCategory(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:CategoryData = var_85[param1];
         if(_loc2_ == null)
         {
            _loc3_ = var_46.generateDataContent(this,param1);
            if(_loc3_)
            {
               var_85[param1] = _loc3_;
               updateSelectionsFromFigure(param1);
            }
         }
      }
   }
}
