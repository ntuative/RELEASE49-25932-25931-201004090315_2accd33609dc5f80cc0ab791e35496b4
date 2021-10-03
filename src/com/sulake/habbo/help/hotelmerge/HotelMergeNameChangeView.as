package com.sulake.habbo.help.hotelmerge
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.help.tutorial.NameSuggestionListRenderer;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   
   public class HotelMergeNameChangeView
   {
      
      private static var var_1482:uint = 13232628;
      
      private static var var_1945:uint = 11129827;
       
      
      private var var_1229:String;
      
      private var _window:IFrameWindow;
      
      private var var_594:IWindowContainer;
      
      private var var_833:NameSuggestionListRenderer;
      
      private var var_284:IWindowContainer;
      
      private var var_351:String;
      
      private var var_1230:IWindowContainer;
      
      private var var_46:HotelMergeUI;
      
      private var var_36:IWindowContainer;
      
      public function HotelMergeNameChangeView(param1:HotelMergeUI)
      {
         super();
         var_46 = param1;
      }
      
      public function setNameAvailableView() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var_46.localization.registerParameter("help.tutorial.name.available","name",var_351);
         _loc1_.text = var_46.localization.getKey("help.tutorial.name.available");
         var _loc2_:ITextFieldWindow = _window.findChildByName("input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = var_351;
         var _loc3_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.visible = false;
      }
      
      private function showView(param1:IWindowContainer) : void
      {
         if(var_36)
         {
            var_36.visible = false;
         }
         var_36 = param1;
         var_36.visible = true;
         if(_window)
         {
            _window.content.width = var_36.width;
            _window.content.height = var_36.height;
         }
      }
      
      private function getName() : String
      {
         var _loc1_:* = null;
         if(_window)
         {
            _loc1_ = _window.findChildByName("input") as ITextFieldWindow;
            if(_loc1_)
            {
               return _loc1_.text;
            }
         }
         return null;
      }
      
      private function nameOut(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.color = var_1482;
         }
      }
      
      private function createWindow(param1:String) : IWindow
      {
         var _loc2_:XmlAsset = var_46.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc2_)
         {
            return null;
         }
         return var_46.windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function nameSelected(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = _loc2_.text;
         setNormalView();
         var _loc4_:ITextFieldWindow = _window.findChildByName("input") as ITextFieldWindow;
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.text = _loc3_;
      }
      
      private function nameOver(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.color = var_1945;
         }
      }
      
      private function showSelectionView() : void
      {
         if(!var_594)
         {
            var_594 = createWindow("hotel_merge_name_selection_xml") as IWindowContainer;
            if(!var_594)
            {
               return;
            }
            _window.content.addChild(var_594);
         }
         _window.caption = var_46.localization.getKey("hotel_merge.name_change.title.select");
         setNormalView();
         showView(var_594);
      }
      
      private function showConfirmationView() : void
      {
         if(!var_284)
         {
            var_284 = createWindow("hotel_merge_name_confirmation_xml") as IWindowContainer;
            if(!var_284)
            {
               return;
            }
            _window.content.addChild(var_284);
         }
         _window.caption = var_46.localization.getKey("hotel_merge.name_change.title.confirm");
         var _loc1_:ITextWindow = var_284.findChildByName("final_name") as ITextWindow;
         if(_loc1_)
         {
            _loc1_.text = var_351;
         }
         showView(var_284);
      }
      
      public function showMainView() : void
      {
         if(!_window)
         {
            _window = createWindow("hotel_merge_name_change_xml") as IFrameWindow;
            _window.center();
            _window.procedure = windowEventHandler;
            var_1230 = _window.content.getChildAt(0) as IWindowContainer;
         }
         var_46.localization.registerParameter("hotel_merge.name_change.current","name",var_46.myName);
         _window.caption = var_46.localization.getKey("hotel_merge.name_change.title.main");
         showView(var_1230);
      }
      
      public function dispose() : void
      {
         disposeWindow();
         if(var_833 != null)
         {
            var_833.dispose();
            var_833 = null;
         }
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "change_name_button":
               showSelectionView();
               break;
            case "keep_name_button":
               var_351 = var_46.myName;
               showConfirmationView();
               break;
            case "check_name_button":
               var_46.checkName(getName());
               break;
            case "select_name_button":
               _loc3_ = getName();
               if(_loc3_.length < 1)
               {
                  return;
               }
               if(var_351 != _loc3_)
               {
                  var_1229 = _loc3_;
                  var_46.checkName(_loc3_);
               }
               else
               {
                  showConfirmationView();
               }
               break;
            case "cancel_selection_button":
               showMainView();
               break;
            case "confirm_name_button":
               var_46.changeName(var_351);
               break;
            case "cancel_confirmation_button":
               showMainView();
               break;
            case "header_button_close":
               disposeWindow();
         }
      }
      
      public function get id() : String
      {
         return TutorialUI.const_220;
      }
      
      public function get view() : IWindowContainer
      {
         return _window;
      }
      
      public function setNameNotAvailableView(param1:int, param2:String, param3:Array) : void
      {
         var _loc8_:* = null;
         if(var_36 != var_594)
         {
            showSelectionView();
         }
         var_1229 = null;
         var_351 = null;
         if(_window == null)
         {
            return;
         }
         var _loc4_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc4_ == null)
         {
            return;
         }
         switch(param1)
         {
            case ChangeUserNameResultMessageEvent.var_940:
               var_46.localization.registerParameter("help.tutorial.name.taken","name",param2);
               _loc4_.text = var_46.localization.getKey("help.tutorial.name.taken");
               break;
            case ChangeUserNameResultMessageEvent.var_936:
               var_46.localization.registerParameter("help.tutorial.name.invalid","name",param2);
               _loc4_.text = var_46.localization.getKey("help.tutorial.name.invalid");
               break;
            case ChangeUserNameResultMessageEvent.var_935:
               break;
            case ChangeUserNameResultMessageEvent.var_938:
               _loc4_.text = var_46.localization.getKey("help.tutorial.name.long");
               break;
            case ChangeUserNameResultMessageEvent.var_937:
               _loc4_.text = var_46.localization.getKey("help.tutorial.name.short");
               break;
            case ChangeUserNameResultMessageEvent.var_1103:
               _loc4_.text = var_46.localization.getKey("help.tutorial.name.change_not_allowed");
               break;
            case ChangeUserNameResultMessageEvent.var_1102:
               _loc4_.text = var_46.localization.getKey("help.tutorial.name.merge_hotel_down");
         }
         var _loc5_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == ChangeUserNameResultMessageEvent.var_1102 || param1 == ChangeUserNameResultMessageEvent.var_1103)
         {
            _loc5_.visible = false;
            return;
         }
         _loc5_.visible = true;
         var_833 = new NameSuggestionListRenderer(var_46);
         var _loc6_:int = var_833.render(param3,_loc5_);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.numChildren)
         {
            _loc8_ = _loc5_.getChildAt(_loc7_);
            _loc8_.color = var_1482;
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,nameSelected);
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,nameOver);
            _loc8_.addEventListener(WindowMouseEvent.const_30,nameOut);
            _loc7_++;
         }
      }
      
      public function set checkedName(param1:String) : void
      {
         var_351 = param1;
         if(var_1229 == var_351)
         {
            showConfirmationView();
            return;
         }
         setNameAvailableView();
      }
      
      public function setNormalView() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.text = var_46.localization.getKey("help.tutorial.name.info");
         var _loc2_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = false;
      }
      
      private function disposeWindow() : void
      {
         var_1230 = null;
         var_594 = null;
         var_284 = null;
         var_36 = null;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
   }
}
