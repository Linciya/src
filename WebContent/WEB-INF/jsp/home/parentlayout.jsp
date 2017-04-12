<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
  <head>   
  </head>
  <body style="margin-left:10%;margin-right:10%;">
        <table>
      <tr>
        <td colspan="2">
          <tiles:insertAttribute name="header" />
        </td>        
      </tr>
      <tr style="width:100%;">
        <td style="width:100%;">
          <tiles:insertAttribute name="body"/>
        </td>        
      </tr>
      <tr>
        <td colspan="2">
          <tiles:insertAttribute name="footer" />
        </td>
      </tr>
    </table>
  </body>
</html>