package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1417:int = 10;
       
      
      private var var_1459:NavigatorSettingsMessageParser;
      
      private var var_1194:int;
      
      private var var_1818:int;
      
      private var var_1820:Boolean;
      
      private var var_1003:Array;
      
      private var var_814:Dictionary;
      
      private var var_1004:Array;
      
      private var var_2304:int;
      
      private var var_1815:int;
      
      private var var_1819:int;
      
      private var var_1817:int;
      
      private var var_579:PublicRoomShortData;
      
      private var var_400:RoomEventData;
      
      private var var_126:MsgWithRequestId;
      
      private var var_1814:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1816:Boolean;
      
      private var var_188:GuestRoomData;
      
      private var var_683:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_1003 = new Array();
         var_1004 = new Array();
         var_814 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_1818;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1816;
      }
      
      public function startLoading() : void
      {
         this.var_683 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1816 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_400 != null)
         {
            var_400.dispose();
         }
         var_400 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_126 != null && var_126 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_126 != null && var_126 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_126 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_188;
      }
      
      public function get allCategories() : Array
      {
         return var_1003;
      }
      
      public function onRoomExit() : void
      {
         if(var_400 != null)
         {
            var_400.dispose();
            var_400 = null;
         }
         if(var_579 != null)
         {
            var_579.dispose();
            var_579 = null;
         }
         if(var_188 != null)
         {
            var_188.dispose();
            var_188 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_126 = param1;
         var_683 = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1459;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_126 = param1;
         var_683 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_579 = null;
         var_188 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_579 = param1.publicSpace;
            var_400 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2304 = param1.limit;
         this.var_1194 = param1.favouriteRoomIds.length;
         this.var_814 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_814[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_126 as PopularRoomTagsData;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_579;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1820;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_126 = param1;
         var_683 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1819 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_188 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_683;
      }
      
      public function get visibleCategories() : Array
      {
         return var_1004;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_1003 = param1;
         var_1004 = new Array();
         for each(_loc2_ in var_1003)
         {
            if(_loc2_.visible)
            {
               var_1004.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_1815;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1817;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1459 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_126 == null)
         {
            return;
         }
         var_126.dispose();
         var_126 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_400;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_814[param1] = !!param2 ? "yes" : null;
         var_1194 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_126 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1819;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_126 != null && var_126 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1820 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1815 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1814 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_188 != null)
         {
            var_188.dispose();
         }
         var_188 = param1;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_188 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1459.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1194 >= var_2304;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1817 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1814;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_188 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1818 = param1;
      }
   }
}
