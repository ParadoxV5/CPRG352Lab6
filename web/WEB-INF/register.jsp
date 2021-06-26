<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="UTF-8">
  </head>
  <body>
    <h1>Shopping List</h1>
    <form method="GET">
      <input type="hidden" name="action" value="register">
      <label for="username">Username:</label>
      <input id="username" name="username" type="text" autocomplete="username" required value="${username}">
      <input type="submit" value="Register name">
    </form>
  </body>
</html>