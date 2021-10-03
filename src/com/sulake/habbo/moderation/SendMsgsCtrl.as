package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModMessageMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class SendMsgsCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_1278:String;
      
      private var _disposed:Boolean;
      
      private var var_1423:String;
      
      private var var_1277:int;
      
      private var _main:ModerationManager;
      
      private var var_779:IDropMenuWindow;
      
      private var var_436:ITextFieldWindow;
      
      private var var_49:IFrameWindow;
      
      private var var_299:Boolean = true;
      
      public function SendMsgsCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         _main = param1;
         var_1277 = param2;
         var_1423 = param3;
         var_1278 = param4;
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
      
      public function getFrame() : IFrameWindow
      {
         return var_49;
      }
      
      public function getId() : String
      {
         return var_1423;
      }
      
      private function onSendMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         if(var_299 || false)
         {
            _main.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return;
         }
         _main.connection.send(new ModMessageMessageComposer(var_1277,var_436.text,var_1278));
         this.dispose();
      }
      
      public function show() : void
      {
         var_49 = IFrameWindow(_main.getXmlWindow("send_msgs"));
         var_49.caption = "Msg To: " + var_1423;
         var_49.findChildByName("send_message_but").procedure = onSendMessageButton;
         var_436 = ITextFieldWindow(var_49.findChildByName("message_input"));
         var_436.procedure = onInputClick;
         var_779 = IDropMenuWindow(var_49.findChildByName("msgTemplatesSelect"));
         prepareMsgSelect(var_779);
         var_779.procedure = onSelectTemplate;
         var _loc1_:IWindow = var_49.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_49.visible = true;
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + _main.initMsg.messageTemplates.length);
         param1.populate(_main.initMsg.messageTemplates);
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
         var_779 = null;
         var_436 = null;
         _main = null;
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_60)
         {
            return;
         }
         var _loc3_:String = _main.initMsg.messageTemplates["null"];
         if(_loc3_ != null)
         {
            var_299 = false;
            var_436.text = _loc3_;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1372;
      }
   }
}
