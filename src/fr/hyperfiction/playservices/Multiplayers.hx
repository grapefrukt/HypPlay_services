package fr.hyperfiction.playservices;

import fr.hyperfiction.playservices.StatusCode;
import haxe.Json;

/**
 * ...
 * @author shoe[box]
 */
@:build( ShortCuts.mirrors( ) )
class Multiplayers{

	static public var onEvent		: String->RoomDesc->Status->Void;
	static public var onInvitation	: String->InvitationDesc->Status->Void;

	public static inline var ON_INVITATION	: String = "HypPS_ON_INVITATION";
	public static inline var INVITE_CANCEL	: String = "HypPS_INVITE_CANCEL";
	public static inline var ROOM_CONNECTED	: String = "HypPS_ROOM_CONNECTED";
	public static inline var ROOM_CREATED	: String = "HypPS_ROOM_CREATED";
	public static inline var ROOM_JOINED	: String = "HypPS_ROOM_JOINED";
	public static inline var ROOM_LEFT		: String = "HypPS_ROOM_LEFT";

	// -------o constructor

		/**
		* constructor
		*
		* @param
		* @return	void
		*/
		public function new() {

		}

	// -------o public

		/**
		* Initialize the multiplayer client
		*
		* @public
		* @return	void
		*/
		static public function initialize( ) : Void {
			_setCallback( _onMultiplayer_event );
		}

		/**
		* Listen for ingame notifications
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function listenFor_invitations( ) : Void {
			trace("listenFor_invitations");
		}

		/**
		* Stop listening for ingames notifications
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function stopListen_for_invitations( ) : Void {

		}

		/**
		* Check for notifications
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function checkFor_invitations( ) : String {
			return null;
		}

		/**
		* Accept an invitation by it's ID
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function acceptInvitation( sInvitation_id : String ) : Void {

		}

		/**
		* Open the invitations INBOX
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function openInvitations_inbox( ) : Void{

		}

		/**
		* Launch a quick game
		*
		* @public
		* @param iMin : minimal opponents count ( Int )
		* @param iMin : maximal opponents count ( Int )
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function quickGame( iMin : Int , iMax : Int ) : Void {

		}

		/**
		* Invite player
		*
		* @public
		* @param iMin : minimal opponents count ( Int )
		* @param iMin : maximal opponents count ( Int )
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function invitePlayers( iMin : Int , iMax : Int ) : Void{
			trace("invitePlayers");
		}

		/**
		* Open the waiting room.
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		static public function showWaiting_room( ) : Void {

		}

	// -------o protected

		/*
		*
		*
		* @private
		* @return	void
		*/
		#if cpp
		@CPP("HypPlayServices","HypPlayServices_set_event_callback_multiplayers")
		#end
		static private function _setCallback( cb : Dynamic ) : Void{

		}

		/**
		*
		*
		* @private
		* @return	void
		*/
		static private function _onMultiplayer_event( sEvent : String , sArg : String , iCode : Int ) : Void{
			trace("_onMultiplayer_event ::: "+sEvent);

			var s : Status = StatusCode.translate( iCode );
			trace("s ::: "+s);
			switch( sEvent ){

				case ON_INVITATION:
					trace("onInvitation ::: "+sArg);
					onInvitation( sEvent , Json.parse( sArg ) , s );

				case INVITE_CANCEL:
					trace("INVITE_CANCEL ::: "+s);

				case ROOM_CREATED:
					trace( ROOM_CREATED+" = "+sArg);
					onEvent( sEvent , Json.parse( sArg) , s );

				default:


			}
		}

	// -------o misc

}

typedef RoomDesc={
	public var createId			: String;
	public var creationtimestamp	: Int;
	public var description		: String;
	public var participants		: Array<String>;
	public var roomId			: String;
	public var status			: Int;
	public var variant			: Int;
}

typedef InvitationDesc={
	public var from			: InvitationFrom;
	public var sInvitation_id	: String;
	public var sTimestamp		: String;
}

typedef InvitationFrom={
	public var bConnected_to_room	: Bool;
	public var iStatus			: Int;
	public var sFrom_icon_uri	: String;
	public var sFrom_id			: String;
	public var sFrom_image_uri	: String;
	public var sFrom_name		: String;
}