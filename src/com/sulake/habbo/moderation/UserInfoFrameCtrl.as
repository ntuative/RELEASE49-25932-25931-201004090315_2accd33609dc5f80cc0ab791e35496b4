package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class UserInfoFrameCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_850:UserInfoCtrl;
      
      private var _disposed:Boolean;
      
      private var _userId:int;
      
      private var var_49:IFrameWindow;
      
      private var _main:ModerationManager;
      
      public function UserInfoFrameCtrl(param1:ModerationManager, param2:int)
      {
         super();
         _main = param1;
         _userId = param2;
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
         if(var_850 != null)
         {
            var_850.dispose();
            var_850 = null;
         }
         _main = null;
      }
      
      public function getId() : String
      {
         return "" + _userId;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1239;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      public function show() : void
      {
         var_49 = IFrameWindow(_main.getXmlWindow("user_info_frame"));
         var_49.caption = "User Info";
         var _loc1_:IWindow = var_49.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_850 = new UserInfoCtrl(var_49,_main,"",true);
         var_850.load(var_49.content,_userId);
         var_49.visible = true;
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_49;
      }
   }
}
