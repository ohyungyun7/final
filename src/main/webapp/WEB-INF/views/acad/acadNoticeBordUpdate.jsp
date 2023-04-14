<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/sneat/assets/js/extended-ui-sweetalert2.js"></script>

<script>

$(function(){
	// 이미지 미리보기 시작 --------------------
	$("#files").on("change", handleImgFileSelect);
	// e: change 이벤트
	function handleImgFileSelect(e){
		$("#imageView").empty();
		// 파일객체에 파일들
		let files = e.target.files;
		// 이미지 배열
		let fileArr = Array.prototype.slice.call(files);
		
		// fileArr에서 하나 꺼내면 f(파일 객체 1개)
		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
			}
			else{
				// 이미지를 읽을 객체
				let reader = new FileReader();
				
				//reader.readAsDataURL(f);의 이벤트
				reader.onload = function(e){
					let img_html = "<img src='" + e.target.result + "' style='width:30%' />";
					$("#imageView").append(img_html);
				}
				
				// 이미지를 읽자
				reader.readAsDataURL(f);
			}
		}); // end forEach
	}
	// 이미지 미리보기 종료 --------------------
});

</script>

<h4 class="fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-flag-alt page-icon"></i>
	<span class="fw-light" onclick="javascript:history.back();" style="cursor:pointer;">학사 공지사항  / </span>
	수정
</h4>

<div class="card" style="height: auto;">
	<div class="card-body">
	<div class="row">
	<div class="col-lg-8 mx-auto">
		<form id="dpNfrm" action="/acadNotice/updatePost" method="post" enctype="multipart/form-data">
			<input type="hidden" id=nbNum name="nbNum" value="${data.nbNum}" />
			<div class="mb-3">
				<label class="form-label" for="basic-default-fullname">공지사항 수준</label>
				<div class="col-md-2">
				  <select id="nbRead" name="nbRead" class="form-select color-dropdown">
				    <option value="" selected>필수선택</option>
				    <option value="1" <c:if test="${data.nbRead == 1}">selected</c:if>>필독</option>
				    <option value="0" <c:if test="${data.nbRead == 0}">selected</c:if>>일반</option>
				  </select>
				</div>
			</div>
			<div class="mb-3">
				<label class="form-label" for="basic-default-fullname">공지사항 종류</label>
				<div class="col-md-2">
				  <select id="nbCate" name="nbCate" class="form-select color-dropdown">
				    <option value="" selected>필수선택</option>
				    <option value="일반" <c:if test="${data.nbCate == '일반'}">selected</c:if>>일반공지</option>
				    <option value="학사" <c:if test="${data.nbCate == '학사'}">selected</c:if>>학사공지</option>
				    <option value="장학" <c:if test="${data.nbCate == '장학'}">selected</c:if>>장학공지</option>
				  </select>
				</div>
			</div>
			<div class="mb-3">
		    <label class="form-label" for="basic-default-company">제목</label>
		    <input type="text" class="form-control" id="nbTitle" name="nbTitle" value="${data.nbTitle}" />
		  </div>
		  <div class="mb-3">
		    <label class="form-label" for="basic-default-message">내용</label>
		    <textarea id="nbContent" name="nbContent" class="form-control" placeholder="내용을 입력해주세요.">${data.nbContent}</textarea>
		  </div>
		  <br />
		  <hr />
		  <label class="form-label" for="email" style="font-weight: bold;">첨부파일 수정 &nbsp;&nbsp;</label>
			
			<c:set var="list" value="${data.fileVOList}" />
			<c:if test="${list == null || list.size() == 0}">
			<p>첨부된 파일이 없습니다.<p>
			<hr />
			</c:if>
		  
		  <c:forEach var="nfVO" items="${data.fileVOList}" varStatus="stat">
		  <div class="mb-3" id="oldimageView">
		  <c:if test="${nfVO.nbfCate == 2}">
		  	<img src="/resources/upload${nfVO.nbfFilenm}" style='width:30%;' />
		  	<input type="hidden" id="dfNum" name="dfNum" value="${nfVO.nbfNum}" />
		  	<button id="fileDBtn" type="button" class="btn btn-xs btn-danger">삭제</button>
		  </c:if>	
          </div>
		  </c:forEach>
		  
		  <c:forEach var="nfVO" items="${data.fileVOList}" varStatus="stat">
		  <div class="mb-3">
		  <c:if test="${nfVO.nbfCate == 1}">
			  <label class="form-label" for="">
			  	${fn:substringAfter(nfVO.nbfFilenm, '_')} &nbsp;&nbsp;
			  </label>
			<input type="hidden" id="dfNum" name="dfNum" value="${nfVO.nbfNum}" />
		  	<button id="fileDBtn" type="button" class="btn btn-xs btn-danger">삭제</button>
		  </c:if>	
          </div>
		  </c:forEach>
		  <hr />
		  <div class="mb-3" id="imageView">
          </div>
		  <div class="mb-3">
            <label class="form-label" for="basic-default-upload-file">파일 첨부</label>
            <input type="file" class="form-control" id="files" name="files" multiple >
          </div>
		  <a style="margin-left: 83%;" href="/acadNotice/list?cate=${data.nbCate}" class="btn btn-sm btn-secondary">목록보기</a>
		  <button type="submit" class="btn btn-sm btn-primary">수정하기</button>
		  <sec:csrfInput/>
		</form>
	</div>
	</div>
	</div>
</div>

<script type="text/javascript">
CKEDITOR.replace('nbContent');

$(function(){
	$(document).on("click", "#fileDBtn", function(){
		btn = $(this);
		nbfNum = $(this).prev().val();
		data = {"nbfNum" : nbfNum};
		$.ajax({
			url : "/acadNotice/delteFile",
			type: "post",
			data : data,
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
					if(result > 0){
						btn.parent().css("display", "none");
						  Swal.fire({
							    title: '파일이 삭제되었습니다.',
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