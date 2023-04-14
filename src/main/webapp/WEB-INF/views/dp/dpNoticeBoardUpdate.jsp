<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>

<script>

</script>

<h4 class="fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-chalkboard page-icon"></i>
	<span class="fw-light" onclick="javascript:history.back();" style="cursor:pointer;">학과 공지사항  / </span>
	수정하기
</h4>

<div class="card" style="height: auto;">
	<div class="card-body">
	<div class="row">
	<div class="col-lg-8 mx-auto">
		<form id="dpNfrm" action="/dpNotieBoard/updatePost" method="post" enctype="multipart/form-data">
			<input type="hidden" id="dnNum" name="dnNum" value="${data.dnNum}" />
			<div class="mb-3">
				<label class="form-label" for="basic-default-fullname">공지사항 종류</label>
				<div class="col-md-2">
				  <select id="dnRead" name="dnRead" class="form-select color-dropdown">
				    <option value="">필수선택</option>
				    <option value="1" <c:if test="${data.dnRead == 1}">selected</c:if>>필독</option>
				    <option value="0" <c:if test="${data.dnRead == 0}">selected</c:if>>일반</option>
				  </select>
				</div>
			</div>
			<div class="mb-3">
		    <label class="form-label" for="basic-default-company">제목</label>
		    <input type="text" class="form-control" id="dnTitle" name="dnTitle" value="${data.dnTitle}" />
		  </div>
		  <div class="mb-3">
		    <label class="form-label" for="basic-default-message">내용</label>
		    <textarea id="dnContent" name="dnContent" class="form-control">${data.dnContent}</textarea>
		  </div>
		  <br />
		  <hr />
			<label class="form-label" for="email" style="font-weight: bold;">첨부파일 수정 &nbsp;&nbsp;</label>
			<c:set var="list" value="${data.dfVOList}" />
			<c:if test="${list == null || list.size() == 0}">
			<p>첨부된 파일이 없습니다.<p>
			</c:if>
			<c:forEach var="dfVO" items="${data.dfVOList}" varStatus="stat">
			<div class="col-md-12">
			  <label class="form-label" for="">
			  	${fn:substringAfter(dfVO.dfNm, '_')} &nbsp;&nbsp;
			  </label>
			  <input type="hidden" id="dfNum" name="dfNum" value="${dfVO.dfNum}" />
			  <button id="fileDBtn" type="button" class="btn btn-xs btn-danger">삭제</button>
			</div>
			</c:forEach>
			<hr />
		  <div class="mb-3">
            <label class="form-label" for="basic-default-upload-file">파일추가</label>
            <input type="file" class="form-control" id="files" name="files" multiple >
            <input type="hidden"  id="chk" value="" >
          </div>
		  <a style="margin-left: 75%;" id="a" href="/dpNotieBoard/dpNoticeBoardList" class="btn btn-secondary">목록보기</a>
		  <button type="submit" class="btn btn-primary">수정하기</button>
		  <sec:csrfInput/>
		</form>
	</div>
	</div>
	</div>
</div>

<script type="text/javascript">
CKEDITOR.replace('dnContent');

$(function(){
	$(document).on("click", "#fileDBtn", function(){
		btn = $(this);
		dfNum = $(this).prev().val();
		data = {"dfNum" : dfNum};
		
		$.ajax({
			url : "/dpNotieBoard/delteFile",
			type: "post",
			data : data,
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
					if(result > 0){
						btn.parent().css("display", "none");
						Swal.fire({
							title: '삭제되었습니다.',
							showClass: {
								popup: 'animate__animated animate__bounceIn'
							},
							icon: 'success',
							customClass: {
								confirmButton: 'btn btn-primary'
							},
							buttonsStyling: false
						});
					}
				}
		});
	});
});
</script>