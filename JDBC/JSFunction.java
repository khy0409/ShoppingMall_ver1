package JDBC;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
	public void JSF(JspWriter out, String alert, String location) throws IOException {
        String js = "<script>"
                + "alert('" + alert + "');"
                + "location.href = '" + location + "';"
                + "</script>";
        out.println(js);
    }
}
