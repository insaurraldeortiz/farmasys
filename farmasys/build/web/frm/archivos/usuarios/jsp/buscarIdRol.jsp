
<%@page import="controladores.RolesControlador"%>
<%@page import="modelos.Roles"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%
    int id_rol = Integer.parseInt(request.getParameter("id_rol"));
    
    String tipo = "error";
    String mensaje = "Datos no encontrados.";
    String nuevo = "true";
    Roles rol = new Roles();
    rol.setId_rol(id_rol);
    
   RolesControlador.buscarId(rol);
    if (rol.getId_rol()!=0){
        tipo = "success";
        mensaje = "Datos encontrados.";
        nuevo = "false";
    }
    
    JSONObject obj = new JSONObject();
    obj.put("tipo", tipo);
    obj.put("mensaje", mensaje);
    obj.put("nuevo", nuevo);
    obj.put("id_rol", rol.getId_rol());
    obj.put("nombre_rol", rol.getNombre_rol());
    out.print(obj);
    out.flush();
%>
