using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace TagorManuCRM
{
    public class Global : System.Web.HttpApplication
    {

        /// <summary>
        /// The event occurs just after Initialization of Session, and before Page_Init event
        /// </summary>
        protected void Application_PreRequestHandlerExecute(Object sender, EventArgs e)
        {
            // here it checks if session is reuired, as
            // .aspx requires session, and session should be available there
            // .jpg, or .css doesn't require session so session will be null
            // as .jpg, or .css are also http request in any case
            // even if you implemented URL Rewritter, or custom IHttp Module
            if (Context.Handler is IRequiresSessionState
                   || Context.Handler is IReadOnlySessionState)
            {
                // here is your actual code
                // check if session is new one
                // or any of your logic
                if (Session.IsNewSession
                    || Session.Count < 1)
                {
                    // for instance your login page is default.aspx
                    // it should not be redirected if,
                    // if the request is for login page (i.e. default.aspx)
                    if (!Context.Request.Url.AbsoluteUri.ToLower().Contains("/login.aspx"))
                    {
                        // redirect to your login page
                        Context.Response.Redirect("~/login.aspx");
                    }
                }
            }
        }

        protected void Application_Start(object sender, EventArgs e)
        {
        }
    }
}