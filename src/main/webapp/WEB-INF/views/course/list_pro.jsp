<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.card:hover{
   transition-duration: 0.4s;
   box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
</style>

	<h5 class="title">
		<i class="bx bx-collection page-icon"></i>
		강의목록
<!-- 		<a href="#" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="#" class="categoryBar">강의목록</a> -->
	</h5>
	<br/>

	<div class="row mb-5">
		<c:forEach var="courseVO" items="${data}" varStatus="stat">
			<div class="col-md-6 col-lg-4 mb-3">
				<div class="card h-100 sub-card">
					<div class="card-body">
						<h5 class="card-title">${courseVO.sbjTitle}</h5>
						<a href="/course/studentList?sbjNum=${courseVO.sbjNum}&&sbjTitle=${courseVO.sbjTitle}" class="btn btn-outline-primary">상세보기</a>
					</div>
				</div>
			</div>
		</c:forEach>



	</div>
