<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>

<section id="hero">
    <div class="hero-container">
      <div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">

        <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

        <div class="carousel-inner" role="listbox">

          <!-- Slide 1 -->
          <div class="carousel-item active" style="background: url(assets/img/slide/slide-1.jpg);">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown"><span>Restaurant</span> Delicious</h2>
                <p class="animate__animated animate__fadeInUp">No hay personas mejores que aquellas a quienes les encanta la buena comida.<div>
                  
                </div>
              </div>
            </div>
          </div>

          <!-- Slide 2 -->
          <div class="carousel-item" style="background: url(assets/img/slide/slide-2.jpg);">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">Cocinamos con amor</h2>
                <p class="animate__animated animate__fadeInUp">Todo lo que necesitas es amor. Pero un poco de chocolate de vez en cuando, no hace daño. (Charles M. Schulz)<div>
                  
                </div>
              </div>
            </div>
          </div>

          <!-- Slide 3 -->
          <div class="carousel-item" style="background: url(assets/img/slide/slide-3.jpg);">
            <div class="carousel-background"><img src="assets/img/slide/slide-3.jpg" alt=""></div>
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">No dejes para despues lo que puedes comer hoy</h2>
                <p class="animate__animated animate__fadeInUp">El mayor secreto del exito es lograr comer lo que más te gusta y permitir que la comida haga su lucha en tu interior. <div>
                  
                </div>
              </div>
            </div>
          </div>

        </div>

        <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon icofont-simple-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>

        <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon icofont-simple-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>

      </div>
    </div>
  </section>

<section id="about" class="about" style="background-color:#FFF4EC;">
      <div class="container-fluid">

       <!-- <div class="row"> -->
 <div align="center">
  <h1>Registrate</h1>
  <form action="<%= request.getContextPath()%>/registerServlet" method="post">
   <table style="with: 80%">
    <tr>
     <td>Nombre</td>
     <td><input type="text" name="firstName" /></td>
  
    </tr>
    <tr>
     <td>Apellido</td>
     <td><input type="text" name="lastName" /></td>
    </tr>
    <tr>
     <td>Usuario</td>
     <td><input type="text" name="username" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password" /></td>

    </tr>
    <tr>
     <td>dirección</td>
     <td><input type="text" name="address" /></td>

    </tr>
    <tr>
     <td>Contacto</td>
     <td><input type="text" name="contact" /></td>

    </tr>
   </table>
   <input class="btn btn-primary" type="submit" value="Submit">
  </form>
 </div>
 </div>
 </section>
<%@include file="footer.jsp" %>