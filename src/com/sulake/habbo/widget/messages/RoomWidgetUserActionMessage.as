package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_681:String = "RWUAM_RESPECT_USER";
      
      public static const const_512:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_680:String = "RWUAM_START_TRADING";
      
      public static const const_564:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_599:String = "RWUAM_WHISPER_USER";
      
      public static const const_562:String = "RWUAM_IGNORE_USER";
      
      public static const const_469:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_609:String = "RWUAM_BAN_USER";
      
      public static const const_548:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_430:String = "RWUAM_KICK_USER";
      
      public static const const_634:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_676:String = " RWUAM_RESPECT_PET";
      
      public static const const_367:String = "RWUAM_KICK_BOT";
      
      public static const const_1157:String = "RWUAM_TRAIN_PET";
      
      public static const const_739:String = "RWUAM_PICKUP_PET";
      
      public static const const_532:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_612:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
