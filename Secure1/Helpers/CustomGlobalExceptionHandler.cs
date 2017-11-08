using System;
using Serilog;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Secure1.Helpers
{
	public class CustomGlobalExceptionHandler : IExceptionFilter {
		public void OnException(ExceptionContext context) {
			//The error page to use currently is setup in the Startup.Configuration method
			Log.Error(context.Exception, "Global Catch Error");
		}
	}
	public class GlobalAppException : Exception {
		public GlobalAppException() { }

		public GlobalAppException(string message) : base(message) { }

		public GlobalAppException(string message, Exception innerException) : base(message, innerException) { }
	}
}
