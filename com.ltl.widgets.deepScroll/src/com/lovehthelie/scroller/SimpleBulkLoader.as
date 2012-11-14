package  com.lovehthelie.scroller{	import flash.display.Bitmap;	import flash.display.Loader;	import flash.events.Event;	import flash.events.IOErrorEvent;	import flash.net.URLRequest;	import flash.utils.Dictionary;	public class SimpleBulkLoader	{		private var loaderIds : Dictionary = new Dictionary(true);		private var loaderURLKey : Dictionary = new Dictionary(true);		private var contentLoaderKey : Dictionary = new Dictionary(true);		private var loaders : Array = [];		private var amountOfLoadersComplete : int;		private var allItemsLoadedCallback : Function;		public function addItem(loaderURL : String, loaderID : * ) : void		{			var loader : Loader = new Loader();						loaderIds[loaderID] = loader;			loaderURLKey[loader] = loaderURL;			loaders.push(loader);			contentLoaderKey[loader.contentLoaderInfo] = loader;		}		public function loadAllItems(allItemsLoadedCallback : Function) : void		{			this.allItemsLoadedCallback = allItemsLoadedCallback;						for each (var loader : Loader in loaders) 			{				var url : String = loaderURLKey[loader];				loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, catchError);				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onItemLoaded);								loader.load(new URLRequest(url));			}		}		private function onItemLoaded(event : Event) : void		{				var totalAmountOfLoaders : int = loaders.length - 1;				if(amountOfLoadersComplete != totalAmountOfLoaders)			{				amountOfLoadersComplete++;			}			else			{				allItemsLoadedCallback();				cleanListeners();										}		}		private function cleanListeners() : void		{			for each(var loader:Loader in loaders)			{				loader.removeEventListener(IOErrorEvent.IO_ERROR, catchError);				loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onItemLoaded);			}		}				private function catchError(event : IOErrorEvent) : void		{			//fail silently		}		public function getLoader(pId : *) : Loader		{			return loaderIds[pId];		}		public function getBitmap(pLoaderId : *) : Bitmap		{			return Loader(loaderIds[pLoaderId])  .contentLoaderInfo.content as Bitmap;					}		public function dispose() : void		{			cleanListeners();					for each (var item : * in loaders) 			{				item = null; 			}			for each (var item1 : * in loaderIds) 			{				item1 = null; 			}			for each (var item2 : * in loaderURLKey) 			{				item2 = null; 			}			for each (var item3 : * in contentLoaderKey) 			{				item3 = null; 			}						loaderIds = null;			loaderURLKey = null;			contentLoaderKey = null;			loaders = null;			allItemsLoadedCallback = null;		}	}}