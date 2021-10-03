package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_728:IWindowContainer;
      
      private var var_1058:ITextWindow;
      
      private var var_201:RoomSettingsCtrl;
      
      private var var_1283:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var _hideInfoTimer:Timer;
      
      private var var_1281:ITextWindow;
      
      private var var_359:IWindowContainer;
      
      private var var_2091:IWindowContainer;
      
      private var var_2090:ITextWindow;
      
      private var var_879:IWindowContainer;
      
      private var var_1539:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_755:ITextWindow;
      
      private var var_1537:IWindowContainer;
      
      private var var_1287:IWindowContainer;
      
      private var var_877:ITextWindow;
      
      private var var_1059:ITextFieldWindow;
      
      private var var_307:IWindowContainer;
      
      private var var_880:ITextWindow;
      
      private var var_1540:IButtonWindow;
      
      private var var_1060:ITextWindow;
      
      private var var_2330:int;
      
      private var var_1286:IContainerButtonWindow;
      
      private var var_878:IWindowContainer;
      
      private var var_1285:ITextWindow;
      
      private var var_1282:IContainerButtonWindow;
      
      private var var_1536:ITextWindow;
      
      private var var_1538:IButtonWindow;
      
      private var var_803:TagRenderer;
      
      private var var_2032:ITextWindow;
      
      private var var_358:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_729:ITextWindow;
      
      private var var_273:RoomThumbnailCtrl;
      
      private var var_1284:IContainerButtonWindow;
      
      private var var_2092:IWindowContainer;
      
      private var var_274:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_358 = new RoomEventViewCtrl(_navigator);
         var_201 = new RoomSettingsCtrl(_navigator,this,true);
         var_273 = new RoomThumbnailCtrl(_navigator);
         var_803 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_201);
         _hideInfoTimer = new Timer(6000,1);
         _hideInfoTimer.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_201.active = true;
         this.var_358.active = false;
         this.var_273.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1539.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1538.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1537.visible = Util.hasVisibleChildren(var_1537);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_755.text = param1.roomName;
         var_755.height = NaN;
         _ownerName.text = param1.ownerName;
         var_877.text = param1.description;
         var_803.refreshTags(var_359,param1.tags);
         var_877.visible = false;
         if(param1.description != "")
         {
            var_877.height = NaN;
            var_877.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_359,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_359,"thumb_down",_loc3_,onThumbDown,0);
         var_2090.visible = _loc3_;
         var_880.visible = !_loc3_;
         var_1536.visible = !_loc3_;
         var_1536.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_359,"home",param2,null,0);
         _navigator.refreshButton(var_359,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_359,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_755.y,0);
         var_359.visible = true;
         var_359.height = Util.getLowestPoint(var_359);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function dispose() : void
      {
         if(_hideInfoTimer)
         {
            _hideInfoTimer.removeEventListener(TimerEvent.TIMER,hideInfo);
            _hideInfoTimer.reset();
            _hideInfoTimer = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_432,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1540.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1283.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1284.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1286.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1282.visible = _navigator.data.canEditRoomSettings && param1;
         var_1287.visible = Util.hasVisibleChildren(var_1287);
      }
      
      public function open(param1:Boolean) : void
      {
         this._hideInfoTimer.reset();
         this.var_358.active = false;
         this.var_201.active = false;
         this.var_273.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_47,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this._hideInfoTimer.start();
         }
      }
      
      public function toggle() : void
      {
         this._hideInfoTimer.reset();
         this.var_358.active = false;
         this.var_201.active = false;
         this.var_273.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_47,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_432,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_307);
         var_307.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_201.refresh(var_307);
         this.var_273.refresh(var_307);
         Util.moveChildrenToColumn(var_307,["room_details","room_buttons"],0,2);
         var_307.height = Util.getLowestPoint(var_307);
         var_307.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1059.setSelection(0,var_1059.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_274);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_358.refresh(var_274);
         if(Util.hasVisibleChildren(var_274) && !this.var_273.active)
         {
            Util.moveChildrenToColumn(var_274,["event_details","event_buttons"],0,2);
            var_274.height = Util.getLowestPoint(var_274);
            var_274.visible = true;
         }
         else
         {
            var_274.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_358.active = true;
         this.var_201.active = false;
         this.var_273.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         _hideInfoTimer.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_1058.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1058.height = NaN;
         var_1281.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1281.height = NaN;
         Util.moveChildrenToColumn(var_728,["public_space_name","public_space_desc"],var_1058.y,0);
         var_728.visible = true;
         var_728.height = Math.max(86,Util.getLowestPoint(var_728));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "AvatarImagePartContainer";
         if(_loc1_ && true && true && true)
         {
            var_878.visible = true;
            var_1059.text = this.getEmbedData();
         }
         else
         {
            var_878.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this._hideInfoTimer.reset();
         this.var_201.load(param1);
         this.var_201.active = true;
         this.var_358.active = false;
         this.var_273.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_201.active = false;
         this.var_358.active = false;
         this.var_273.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_71,false);
         _window.setParamFlag(HabboWindowParam.const_1393,true);
         _window.visible = false;
         var_307 = IWindowContainer(find("room_info"));
         var_359 = IWindowContainer(find("room_details"));
         var_728 = IWindowContainer(find("public_space_details"));
         var_2092 = IWindowContainer(find("owner_name_cont"));
         var_2091 = IWindowContainer(find("rating_cont"));
         var_1287 = IWindowContainer(find("room_buttons"));
         var_755 = ITextWindow(find("room_name"));
         var_1058 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_877 = ITextWindow(find("room_desc"));
         var_1281 = ITextWindow(find("public_space_desc"));
         var_1060 = ITextWindow(find("owner_caption"));
         var_880 = ITextWindow(find("rating_caption"));
         var_2090 = ITextWindow(find("rate_caption"));
         var_1536 = ITextWindow(find("rating_txt"));
         var_274 = IWindowContainer(find("event_info"));
         var_879 = IWindowContainer(find("event_details"));
         var_1537 = IWindowContainer(find("event_buttons"));
         var_2032 = ITextWindow(find("event_name"));
         var_729 = ITextWindow(find("event_desc"));
         var_1283 = IContainerButtonWindow(find("add_favourite_button"));
         var_1284 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1286 = IContainerButtonWindow(find("make_home_button"));
         var_1282 = IContainerButtonWindow(find("unmake_home_button"));
         var_1540 = IButtonWindow(find("room_settings_button"));
         var_1539 = IButtonWindow(find("create_event_button"));
         var_1538 = IButtonWindow(find("edit_event_button"));
         var_878 = IWindowContainer(find("embed_info"));
         var_1285 = ITextWindow(find("embed_info_txt"));
         var_1059 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1283,onAddFavouriteClick);
         Util.setProcDirectly(var_1284,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1540,onRoomSettingsClick);
         Util.setProcDirectly(var_1286,onMakeHomeClick);
         Util.setProcDirectly(var_1282,onUnmakeHomeClick);
         Util.setProcDirectly(var_1539,onEventSettingsClick);
         Util.setProcDirectly(var_1538,onEventSettingsClick);
         Util.setProcDirectly(var_1059,onEmbedSrcClick);
         _navigator.refreshButton(var_1283,"favourite",true,null,0);
         _navigator.refreshButton(var_1284,"favourite",true,null,0);
         _navigator.refreshButton(var_1286,"home",true,null,0);
         _navigator.refreshButton(var_1282,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_307,onHover);
         Util.setProcDirectly(var_274,onHover);
         var_1060.width = var_1060.textWidth;
         Util.moveChildrenToRow(var_2092,["owner_caption","owner_name"],var_1060.x,var_1060.y,3);
         var_880.width = var_880.textWidth;
         Util.moveChildrenToRow(var_2091,["rating_caption","rating_txt"],var_880.x,var_880.y,3);
         var_1285.height = NaN;
         Util.moveChildrenToColumn(var_878,["embed_info_txt","embed_src_txt"],var_1285.y,2);
         var_878.height = Util.getLowestPoint(var_878) + 5;
         var_2330 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_2032.text = param1.eventName;
         var_729.text = param1.eventDescription;
         var_803.refreshTags(var_879,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_729.visible = false;
         if(param1.eventDescription != "")
         {
            var_729.height = NaN;
            var_729.y = Util.getLowestPoint(var_879) + 2;
            var_729.visible = true;
         }
         var_879.visible = true;
         var_879.height = Util.getLowestPoint(var_879);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_859,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
