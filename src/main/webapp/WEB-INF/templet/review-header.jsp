<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value = "${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Corona Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${contextPath }/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="${contextPath }/resources/assets/vendors/select2/select2.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/assets/vendors/jvectormap/jquery-jvectormap.css">
    <link rel="stylesheet" href="${contextPath }/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/assets/vendors/owl-carousel-2/owl.carousel.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/assets/vendors/owl-carousel-2/owl.theme.default.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${contextPath }/resources/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${contextPath }/resources/assets/images/favicon.png" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  </head>
<body>
<div class = "container-scroller">
		<nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
          <a class="sidebar-brand brand-logo" href="friend-list"><!-- 로고: 메인페이지 URL -->
          	<h3 style="color:white">Travle ZZang</h3>
          </a>
          <a class="sidebar-brand brand-logo-mini" href="friend-list"></a>
        </div>
        <ul class="nav mt-4">
          <li class="nav-item profile">
            <div class="profile-desc">
              <div class="profile-pic">

                <div class="profile-name">                
	               	<sec:authorize access="hasRole('ROLE_ADMIN')">
	               		<sec:authentication property="principal" var = "principal"/><br>
	               		${principal.username }
	                	<span>Admin</span>
	               	</sec:authorize>
	               	
	               	<sec:authorize access="hasRole('ROLE_USER')">
	               		<sec:authentication property="principal" var = "principal"/><br>
	               		${principal.username }
	                	<span>User</span>
	               	</sec:authorize>               	
                </div>
                
              </div>

            </div>
          </li>
          <li class="nav-item nav-category">
            <span class="nav-link">Menu</span>
          </li>
          <li class="nav-item menu-items">
            <a class="nav-link" href="${contextPath }/main">
              <span class="menu-icon">
                <i class="mdi mdi-home"></i>
              </span>
              <span class="menu-title">홈</span>
            </a>
          </li>
          <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-icon">
                <i class="mdi mdi-newspaper"></i>
              </span>
              <span class="menu-title">공지사항</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">Buttons</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/dropdowns.html">Dropdowns</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">Typography</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item menu-items">
            <a class="nav-link" href="${contextPath }/friend/friend-list">
              <span class="menu-icon">
                <i class="mdi mdi-file-find"></i>
              </span>
              <span class="menu-title">동행 찾기</span>
            </a>
          </li>
          <li class="nav-item menu-items">
            <a class="nav-link" href="friend-list"><!-- 후기 페이지 URL -->
              <span class="menu-icon">
                <i class="mdi mdi-tooltip-outline"></i>
              </span>
              <span class="menu-title">후기</span>
            </a>
          </li>
          <li class="nav-item menu-items">
            <a class="nav-link" href="pages/charts/chartjs.html">
              <span class="menu-icon">
                <i class="mdi mdi-chart-bar"></i>
              </span>
              <span class="menu-title">관리자 페이지</span>
            </a>
          </li>
          <li class="nav-item menu-items">
            <a class="nav-link" href="pages/icons/mdi.html">
              <span class="menu-icon">
                <i class="mdi mdi-contacts"></i>
              </span>
              <span class="menu-title">내 정보</span>
            </a>
          </li>
          <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <span class="menu-icon">
                <i class="mdi mdi-security"></i>
              </span>
              <span class="menu-title">중고나라</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/samples/blank-page.html"> Blank Page </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html"> Login </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/register.html"> Register </a></li>
              </ul>
            </div>
          </li>

        </ul>
      </nav>
      <div class = "container-fluid page-body-wrapper">
      	<nav class="navbar p-0 fixed-top d-flex flex-row">
          <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
            <a class="navbar-brand brand-logo-mini" href="index.html"></a>
          </div>
          <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
              <span class="mdi mdi-menu"></span>
            </button>
            <ul class="navbar-nav w-100">
              <li class="nav-item w-100">
              </li>
            </ul>
            <ul class="navbar-nav navbar-nav-right">
              
              <li class="nav-item dropdown">
                <a class="nav-link" id="profileDropdown" data-toggle="dropdown">
                  <div class="navbar-profile">
                    
                    <p class="mb-0 d-none d-sm-block navbar-profile-name">
                    <sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.username"/>
					</sec:authorize>
					<sec:authorize access="isAnonymous()"><span>로그인해주세요</span></sec:authorize>                    
                    </p>
                    
                    <i class="mdi mdi-menu-down d-none d-sm-block"></i>
                  </div>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="profileDropdown">
                  <h6 class="p-3 mb-0">Profile</h6>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-settings text-success"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">My Page</p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>
                  <sec:authorize access="isAuthenticated()">
	                  <a class="dropdown-item preview-item" id="button_logout">
	                    
	                    <div class="preview-thumbnail">
	                      <div class="preview-icon bg-dark rounded-circle">
	                        <i class="mdi mdi-logout text-danger"></i>
	                      </div>
	                    </div>
	                    
	                    <div class="preview-item-content">
							<i class="fa fa-sign-in fa-fw"></i>Log out<%-- a 링크 수정, Sign in 으로 수정 --%>
	                    </div>
	                   </a>
                  </sec:authorize>
                  
                  <sec:authorize access="isAnonymous()">
 					<a class="dropdown-item preview-item" href="${contextPath}/login">
	                    
	                    <div class="preview-thumbnail">
	                      <div class="preview-icon bg-dark rounded-circle">
	                        <i class="mdi mdi-logout text-danger"></i>
	                      </div>
	                    </div>
	                    
	                    <div class="preview-item-content">
							<i class="fa fa-sign-in fa-fw"></i>Log in<%-- a 링크 수정, Sign in 으로 수정 --%>
	                    </div>
	                   </a>
				  </sec:authorize>
				  
                </div>
              </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
              <span class="mdi mdi-format-line-spacing"></span>
            </button>
          </div>
        </nav>
        
        <div class = "main-panel">
        <img src = "${pageContext.request.contextPath }/resources/assets/images/review/img20.png" alt = "이미지 없음" class = "rounded" width = "100%" height = "350px"/>
        <div class = "content-wrapper">
        <div class = "row">
        <div class = "tmz-wrapper col-10" style = "float : none; margin : auto;">
        
        <form role="form" id="user_logout" action="${contextPath}/logout" method='post'>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<fieldset>
			</fieldset>
		</form>