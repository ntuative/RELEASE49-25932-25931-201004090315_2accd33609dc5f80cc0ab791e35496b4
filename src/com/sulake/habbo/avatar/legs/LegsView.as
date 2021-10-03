package com.sulake.habbo.avatar.legs
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.common.AvatarEditorGridView;
   import com.sulake.habbo.avatar.common.CategoryBaseView;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.utils.Dictionary;
   
   public class LegsView extends CategoryBaseView implements IAvatarEditorCategoryView
   {
       
      
      public function LegsView(param1:IAvatarEditorCategoryModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super(param2,param3,param1);
      }
      
      public function switchCategory(param1:String) : void
      {
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         if(var_140 == param1)
         {
            return;
         }
         inactivateTab(var_42);
         switch(param1)
         {
            case FigureData.const_170:
               var_42 = "tab_pants";
               break;
            case FigureData.const_173:
               var_42 = "tab_shoes";
               break;
            case FigureData.const_160:
               var_42 = "tab_belts";
               break;
            default:
               throw new Error("[LegsView] Unknown item category: \"" + param1 + "\"");
         }
         var_140 = param1;
         activateTab(var_42);
         if(!var_157)
         {
            init();
         }
         updateGridView();
      }
      
      override public function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!_window)
         {
            _loc1_ = _assetLibrary.getAssetByName("avatareditor_legs_base") as XmlAsset;
            if(_loc1_)
            {
               _window = IWindowContainer(_windowManager.buildFromXML(_loc1_.content as XML));
               _window.visible = false;
               _window.procedure = windowEventProc;
            }
         }
         if(!var_33)
         {
            var_33 = new Dictionary();
            var_33["null"] = new AvatarEditorGridView(_model,FigureData.const_170,_windowManager,_assetLibrary);
            var_33["null"] = new AvatarEditorGridView(_model,FigureData.const_173,_windowManager,_assetLibrary);
            var_33["null"] = new AvatarEditorGridView(_model,FigureData.const_160,_windowManager,_assetLibrary);
         }
         else
         {
            for each(_loc2_ in var_33)
            {
               _loc2_.initFromList();
            }
         }
         var_157 = true;
         attachImages();
         if(_model && var_140 == "")
         {
            _model.switchCategory(FigureData.const_170);
         }
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "tab_pants":
                  switchCategory(FigureData.const_170);
                  break;
               case "tab_shoes":
                  switchCategory(FigureData.const_173);
                  break;
               case "tab_belts":
                  switchCategory(FigureData.const_160);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            switch(param2.name)
            {
               case "tab_pants":
               case "tab_shoes":
               case "tab_belts":
                  activateTab(param2.name);
            }
         }
         else if(param1.type == WindowMouseEvent.const_30)
         {
            switch(param2.name)
            {
               case "tab_pants":
               case "tab_shoes":
               case "tab_belts":
                  if(var_42 != param2.name)
                  {
                     inactivateTab(param2.name);
                  }
            }
         }
      }
   }
}
