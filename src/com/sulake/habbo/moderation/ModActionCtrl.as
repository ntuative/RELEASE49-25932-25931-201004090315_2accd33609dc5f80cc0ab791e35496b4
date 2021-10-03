package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.INamed;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceData;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModAlertMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModBanMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModKickMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class ModActionCtrl implements IDisposable, TrackedWindow
   {
      
      private static var var_133:Array;
       
      
      private var _disposed:Boolean;
      
      private var var_875:IButtonWindow;
      
      private var var_1277:int;
      
      private var _main:ModerationManager;
      
      private var var_726:OffenceCategoryData;
      
      private var var_436:ITextFieldWindow;
      
      private var var_874:IButtonWindow;
      
      private var var_1278:String;
      
      private var var_299:Boolean = true;
      
      private var var_1423:String;
      
      private var var_873:IDropMenuWindow;
      
      private var var_49:IFrameWindow;
      
      private var var_727:OffenceData;
      
      public function ModActionCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         _main = param1;
         var_1277 = param2;
         var_1423 = param3;
         var_1278 = param4;
         if(var_133 == null)
         {
            var_133 = new Array();
            var_133.push(new BanDefinition("2 hours",2));
            var_133.push(new BanDefinition("4 hours",4));
            var_133.push(new BanDefinition("12 hours",12));
            var_133.push(new BanDefinition("24 hours",24));
            var_133.push(new BanDefinition("2 days",48));
            var_133.push(new BanDefinition("3 days",72));
            var_133.push(new BanDefinition("1 week",168));
            var_133.push(new BanDefinition("2 weeks",336));
            var_133.push(new BanDefinition("3 weeks",504));
            var_133.push(new BanDefinition("1 month",720));
            var_133.push(new BanDefinition("2 months",1440));
            var_133.push(new BanDefinition("1 year",8760));
            var_133.push(new BanDefinition("2 years",17520));
            var_133.push(new BanDefinition("Permanent",100000));
         }
         var_875 = IButtonWindow(_main.getXmlWindow("modact_offence"));
         var_874 = IButtonWindow(_main.getXmlWindow("modact_offencectg"));
      }
      
      public static function hideChildren(param1:IWindowContainer) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            param1.getChildAt(_loc2_).visible = false;
            _loc2_++;
         }
      }
      
      private function onBanButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Ban...");
         if(!isMsgGiven())
         {
            return;
         }
         if(this.var_873.selection < 0)
         {
            _main.windowManager.alert("Alert","You must select ban lenght",0,onAlertClose);
            return;
         }
         _main.connection.send(new ModBanMessageComposer(var_1277,var_436.text,getBanLength(),var_1278));
         this.dispose();
      }
      
      public function getId() : String
      {
         return var_1423;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_204)
         {
            return;
         }
         if(!var_299)
         {
            return;
         }
         var_436.text = "";
         var_299 = false;
      }
      
      private function getBanLength() : int
      {
         var _loc1_:int = this.var_873.selection;
         var _loc2_:BanDefinition = var_133[_loc1_];
         return _loc2_.banLengthHours;
      }
      
      private function prepareBanSelect(param1:IDropMenuWindow) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in var_133)
         {
            _loc2_.push(_loc3_.name);
         }
         param1.populate(_loc2_);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function refreshButtons(param1:String, param2:int, param3:Array, param4:IWindow, param5:Function) : void
      {
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc6_:IWindowContainer = IWindowContainer(var_49.findChildByName(param1));
         hideChildren(_loc6_);
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         for each(_loc11_ in param3)
         {
            _loc12_ = "" + _loc7_;
            _loc13_ = IButtonWindow(_loc6_.findChildByName(_loc12_));
            if(_loc13_ == null)
            {
               _loc13_ = IButtonWindow(param4.clone());
               _loc13_.procedure = param5;
               _loc13_.x = _loc9_ * (param4.width + 5);
               _loc13_.y = _loc8_ * (param4.height + 5);
               _loc13_.name = _loc12_;
               _loc6_.addChild(_loc13_);
            }
            _loc13_.caption = _loc11_.name;
            _loc13_.visible = true;
            _loc7_++;
            _loc9_++;
            if(_loc9_ >= param2)
            {
               _loc9_ = 0;
               _loc8_++;
            }
         }
         _loc6_.height = RoomToolCtrl.getLowestPoint(_loc6_);
         _loc6_.visible = true;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_49 != null)
         {
            var_49.destroy();
            var_49 = null;
         }
         if(var_875 != null)
         {
            var_875.destroy();
            var_875 = null;
         }
         if(var_874 != null)
         {
            var_874.destroy();
            var_874 = null;
         }
         var_873 = null;
         var_436 = null;
         _main = null;
      }
      
      private function onSendCautionButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending caution...");
         if(!isMsgGiven())
         {
            return;
         }
         _main.connection.send(new ModAlertMessageComposer(var_1277,var_436.text,var_1278));
         this.dispose();
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1165;
      }
      
      private function onChangeCategorizationButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(var_727 != null)
         {
            var_727 = null;
         }
         else
         {
            var_726 = null;
         }
         this.refreshCategorization();
      }
      
      private function onOffenceCtgButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = int(param2.name);
         var_726 = _main.initMsg.offenceCategories[_loc3_];
         this.refreshCategorization();
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_49;
      }
      
      private function isMsgGiven() : Boolean
      {
         if(var_299 || false)
         {
            _main.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return false;
         }
         return true;
      }
      
      private function onKickButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Kick...");
         if(!isMsgGiven())
         {
            return;
         }
         _main.connection.send(new ModKickMessageComposer(var_1277,var_436.text,var_1278));
         this.dispose();
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      public function refreshCategorization() : void
      {
         var _loc1_:IWindowContainer = IWindowContainer(var_49.findChildByName("categorization_cont"));
         hideChildren(_loc1_);
         _loc1_.findChildByName("categorization_caption_txt").visible = true;
         _loc1_.findChildByName("change_categorization_but").visible = var_726 != null;
         if(this.var_727 != null)
         {
            var_49.findChildByName("offence_txt").caption = this.var_727.name;
            var_49.findChildByName("offence_category").visible = true;
         }
         else if(this.var_726 != null)
         {
            this.refreshButtons("offences_cont",2,var_726.offences,var_875,onOffenceButton);
         }
         else
         {
            this.refreshButtons("offence_categories_cont",3,_main.initMsg.offenceCategories,var_874,onOffenceCtgButton);
            _loc1_.height = RoomToolCtrl.getLowestPoint(_loc1_);
         }
      }
      
      private function onOffenceButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = int(param2.name);
         var_727 = var_726.offences[_loc3_];
         var_436.text = var_727.msg;
         var_299 = false;
         this.refreshCategorization();
      }
      
      public function show() : void
      {
         var_49 = IFrameWindow(_main.getXmlWindow("modact_summary"));
         var_49.caption = "Mod action on: " + var_1423;
         var_49.findChildByName("send_caution_but").procedure = onSendCautionButton;
         var_49.findChildByName("kick_but").procedure = onKickButton;
         var_49.findChildByName("ban_but").procedure = onBanButton;
         var_49.findChildByName("change_categorization_but").procedure = onChangeCategorizationButton;
         _main.disableButton(_main.initMsg.alertPermission,var_49,"send_caution_but");
         _main.disableButton(_main.initMsg.kickPermission,var_49,"kick_but");
         _main.disableButton(_main.initMsg.banPermission,var_49,"ban_but");
         var_436 = ITextFieldWindow(var_49.findChildByName("message_input"));
         var_436.procedure = onInputClick;
         var_873 = IDropMenuWindow(var_49.findChildByName("banLengthSelect"));
         prepareBanSelect(var_873);
         var _loc1_:IWindow = var_49.findChildByTag("close");
         _loc1_.procedure = onClose;
         refreshCategorization();
         var_49.visible = true;
      }
   }
}
