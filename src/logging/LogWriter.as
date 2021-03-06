package logging 
{
	import mx.logging.*;
	import mx.formatters.DateFormatter;
    import mx.logging.targets.*;
	import flash.net.SharedObject;
	import mx.utils.StringUtil;
	/**
	 * Handles writing logger messages into a file. Due to Flash security measures, logs are saved in a shared object.
	 * @author 
	 */
	public class LogWriter extends TraceTarget  
	{
		//private var logOutputFileName:String = null;
		public var logOutputFile:SharedObject = null; //= SharedObject.getLocal("ppppuXi settings");
		public var outputTraceWhenDebugging:Boolean = true; 
		private var dateFormatter:DateFormatter = new DateFormatter();
		private const DATE_FORMAT_STRING:String = "DD/MM/YYYY";
		private const TIME_FORMAT_STRING:String = "HH:NN:SS.QQQ";
		public function LogWriter(outputFileName:String) 
		{
			super();
			if (outputFileName.length > 0 && outputFileName != "ppppuXi_Settings")
			{
				//logOutputFileName = outputFileName;
				//Create or load the log file
				logOutputFile = SharedObject.getLocal(outputFileName, "/");
				//Clear the log file
				logOutputFile.clear();
				logOutputFile.flush();
				logOutputFile.data.logText = "";
			}
		}
		
		public override function logEvent(event:LogEvent):void
		{
			//Construct the string that will be added to the log test
			if (logOutputFile != null)
			{
				var message:String="";
				var currentDateTime:Date = new Date();
				
				if (includeDate)
				{
					dateFormatter.formatString = DATE_FORMAT_STRING;
					message += dateFormatter.format(currentDateTime) + " ";
				}
				if (includeTime)
				{
					dateFormatter.formatString = TIME_FORMAT_STRING;
					message += dateFormatter.format(currentDateTime) + " ";
				}
				if (includeLevel)
				{
					message += "[X] ".replace("X", LogEvent.getLevelString(event.level));
				}
				if (includeCategory)
				{
					message +=  "*X* ".replace("X", event.target.category);
				}
				var completeMessage:String = message + event.message + "\n";
				logOutputFile.data.logText += completeMessage;
				/*Just in case logs ever need more space, flush after every logevent so the program can
				* ask the user to increase the size shared objects if necessary.*/
				logOutputFile.flush();
				if (outputTraceWhenDebugging == true)	{trace(completeMessage);}
			}
		}
	}

}