<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
td{
	font-size: 1rem;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-street-view page-icon"></i>
	<span class="fw-light" >학적변동 신청 / </span>학적변동 신청내역
</h4>

<div class="card">
	<div class="card-header">
		<h5 class="title">
			<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="#" class="s">학적변동 신청내역</a>
		</h5>

		acaList : ${acaList}

	</div>
	<div class="card-body">
		<div class="card">

			<div class="card-body overflow-hidden ps ps--active-y">
			<div class="row">
			  <!-- 신청사항 select -->
	          <div class="col-md-1 mb-3">
<!-- 	              <label for="smallSelect" class="form-label">Small select</label> -->
				  <select id="smallSelect" class="form-select form-select-sm">
				    <option>선택</option>
				    <option value="1">휴학</option>
				    <option value="2">복학</option>
				    <option value="3">조기졸업</option>
				  </select>
	          </div>
	          <div class="col-md-2 mb-3">
	          	<input id="smallInput" class="form-control form-control-sm" type="text" placeholder="검색어" />
	          </div>
	         </div>
				<div class="table-responsive text-nowrap h-px-800" style="overflow:auto;" id="">
					<table class="table" style="padding:20px; text-align:center;" >
						<caption align="top"><i class='bx bxs-square'></i>학적변동 신청내역 &#91; 0 건 &#93;</caption>
						<thead class="table-active">
							<tr class="text-nowrap">
								<th>번호</th>
								<th>상태</th>
								<th>학번</th>
								<th>학과</th>
								<th>이름</th>
								<th>신청사항</th>
								<th>신청사유</th>
								<th>첨부파일</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						  <c:forEach var="acaMap" items="${acaList}" varStatus="stat">
							<tr>
								<td>${stat.count}</td>
								<td><span class="badge rounded-pill bg-label-info">승인</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>졸업유예</td>
								<td></td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
						  </c:forEach>
							<tr>
								<td>2</td>
								<td><span class="badge rounded-pill bg-label-success">대기</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>3</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>4</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>5</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>6</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>7</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>8</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>9</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>10</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>11</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>12</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>13</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>14</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동이지라</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>15</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동이어라</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>16</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>17</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>18</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>19</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>20</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>21</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>22</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
							<tr>
								<td>23</td>
								<td><span class="badge rounded-pill bg-label-dark" >거절</span></td>
								<td>201901010</td>
								<td>소프트웨어공학과</td>
								<td>홍길동</td>
								<td>휴학</td>
								<td>개인사정</td>
								<td><i class='bx bxs-file-blank'></i></td>
								<td>
									<button type="button" class="btn btn-info btn-sm">승인</button>
									<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">거절</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="card-footer">
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalCenter" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalCenterTitle">반려 사유 입력</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

		<div class="row g-2 w-px-500">
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="emailSlideTop" class="col-form-label col text-center">학번</label>
				   <input type="text" id="emailSlideTop" class="form-control col mb-0 form-control-sm" value="201901010" readonly>
			   </div>
		   </div>
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="dobSlideTop" class="col-form-label col text-center">이름</label>
				   <input type="text" id="dobSlideTop" class="form-control col md-3 form-control-sm" value="홍길동" readonly>
			   </div>
		   </div>
		 </div>
		<div class="row g-2 w-px-500">
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="emailSlideTop" class="col-form-label col text-center">신청사항</label>
				   <input type="text" id="emailSlideTop" class="form-control col mb-0 form-control-sm" value="휴학" readonly>
			   </div>
		   </div>
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="dobSlideTop" class="col-form-label col text-center">신청사유</label>
				   <input type="text" id="dobSlideTop" class="form-control col md-3 form-control-sm" value="개인사정" readonly>
			   </div>
		   </div>
		 </div>
        <hr/>
        <div class="row">
          <div class="col mb-3">
            <label for="nameWithTitle" class="form-label">반려 사유</label>
            <input type="text" id="nameWithTitle" class="form-control" placeholder="반려사유">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-dark">반려</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
// 	$("#select2Primary").select2();
// new PerfectScrollbar(document.getElementById('vertical-example'), {
// 	  wheelPropagation: false
// 	});
</script>