<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="profile.html"><img src="https://scontent.fvca1-1.fna.fbcdn.net/v/t1.6435-1/s200x200/119704491_2452680888358246_7917950178992699475_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=7206a8&_nc_ohc=I3ZuFMorLPoAX8RtS3S&_nc_ht=scontent.fvca1-1.fna&tp=7&oh=883769d9db3b2666741cfdf3bf674bdf&oe=608C1FF6" class="img-circle" width="80"></a></p>
          <h5 class="centered">Đỗ Bá Đạt</h5>
          <li class="mt">
            <a class="active" href="<c:url value="/admin/home" />">
              <i class="fa fa-dashboard"></i>
              <span>Trang Chủ Admin</span>
            </a>
          </li>
             <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-tasks"></i>
              <span>Loại Sách</span>
            </a>
            <ul class="sub">
              <li><a href="<c:url value="/admin/category/list" />">Danh sách loại sách</a></li>
              <li><a href="<c:url value="/admin/category/save" />">Thêm mới</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-book"></i>
              <span>Sách</span>
            </a>
            <ul class="sub">
              <li><a href="<c:url value="/admin/book/list" />">Danh Sách Sản Phẩm Sách</a></li>
               <li><a href="<c:url value="/admin/book/save" />">Thêm mới Sách</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-cogs"></i>
              <span>Quản lý Người Dùng</span>
            </a>
            <ul class="sub">
              <li><a href="<c:url value="/admin/user/list" />">Danh Sách Người Dùng</a></li>
               <li><a href="<c:url value="/admin/user/save" />">Thêm Người Dùng</a></li>

            </ul>
          </li>
          
          <li class="sub-menu">
            <a href="javascript:;">
             <i class="fab fa-first-order-alt"></i>
              <span>Quản lý Đơn Hàng</span>
            </a>
            <ul class="sub">
              <li><a href="<c:url value="/admin/order/list" />">Danh Sách Đơn Hàng</a></li>
              

            </ul>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>l>