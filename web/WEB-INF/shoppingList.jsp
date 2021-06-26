<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="UTF-8">
  </head>
  <body>
    <h1>Shopping List</h1>
    Hello, ${username}
    <a href="?action=logout">Logout</a>
    <form method="GET">
      <input type="hidden" name="action" value="add">
      <label for="item">Add item:</label>
      <input id="item" name="item" type="text" required value="">
      <input type="submit" value="Add">
    </form>
    
    <%-- Test if collection is non-empty:
      Answer by Stack Overflow @ Martlark;
      On Stack Overflow;
      Creative Commons Attribution-ShareAlike 4.0 International license:
      https://stackoverflow.com/a/851947
    --%>
    <c:if test="${not empty items}">
      <form method="GET">
        <input type="hidden" name="action" value="delete">
        <%-- forEach with index:
          Answer by Stack Overflow @ newuser (original) and Stack Overflow @ Paul Gray (edit);
          On Stack Overflow;
          Creative Commons Attribution-ShareAlike 3.0 Unported license:
          https://stackoverflow.com/a/18826043
        --%>
        <c:forEach items="${items}" varStatus="_forEach_" var="_item_" >
          <div>
            <input id="item[${_forEach_.index}]" name="item" type="radio" required value="${_forEach_.index}">
            <label for="item[${_forEach_.index}]">${_item_}</label>
          </div>
        </c:forEach>
        <input type="submit" value="Delete">
      </form>
    </c:if>
  </body>
</html>