/*
Copyright (C) 2006 Big Spaceship, LLC

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

To contact Big Spaceship, email info@bigspaceship.com or write to us at 45 Main Street #716, Brooklyn, NY, 11201.
*/
package com.bigspaceship.events
{
	import flash.events.Event;

	public class SemaphoreEvent extends Event
	{
		public  static const UNLOCK : String = "onUnlock";
		public  static const RESET  : String = "onReset";
		
		private var _semaphoreid    : String;
		
		public function SemaphoreEvent($event:String, $semid:String = ""):void {
			super($event);
			
			_semaphoreid = $semid;
		};
		
		public function get id():String {
			return _semaphoreid;
		};
	};
};