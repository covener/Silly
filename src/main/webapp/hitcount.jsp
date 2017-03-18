<%@page session="false"%>
<HTML> <HEAD><TITLE>IBM WebSphere Hit Count Demonstration</TITLE></H1> <BODY bgcolor="cornsilk">
<%
    HttpSession session = request.getSession(true);
    boolean isNew = session.isNew();
    Integer sessionCounter= (Integer) session.getAttribute("jspcounter");
    int nextVal = 1;
    if (sessionCounter != null) {
       nextVal = sessionCounter.intValue() + 1;
    }
    session.setAttribute("jspcounter", new Integer(nextVal));
    //out.println("<p>Display Name:" + com.ibm.websphere.runtime.ServerName.getDisplayName());
    out.println("<p>Host Name:" +  java.net.InetAddress.getLocalHost().getHostName());
    out.println("<p>Hit Count value for (" + (isNew ? "new session" : "existing session") + "): " + nextVal);
    out.println("<p>My URL: " + response.encodeURL(request.getServletPath()));

%>

</BODY> </HTML>
