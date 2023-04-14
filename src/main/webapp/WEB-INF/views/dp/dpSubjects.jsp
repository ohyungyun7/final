<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h4 class="fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-chalkboard page-icon"></i>
	학과 과목 트리
</h4>

<div class="row mb-4">
  <div class="col-12">
  <div class="card">
  
 <div class="card-body">
 
	<div class="d-flex align-items-center lh-1 me-3 mb-3 mb-sm-0" style="font-size: 1.2em;">
		1학년 과목
	</div>
	<hr />
	<c:if test="${g1List == null || g1List.size() == 0}">
		<p>개설과목이 없습니다.</p>
	</c:if>
	
    <div class="row">
    
    <c:if test="${g1List != null && g1List.size() != 0}">
      <div class="col-lg-6 mb-4 mb-xl-0">
        <span class="badge bg-secondary">전공필수</span>
        <div class="demo-inline-spacing mt-3">
          <ul class="list-group list-group-timeline">
          <c:forEach var="subVO" items="${g1List}" varStatus="stat">
          <c:if test="${subVO.sbjRs == 1}">
            <li class="list-group-item list-group-timeline-success">${subVO.sbjTitle}</li>
           </c:if>
           </c:forEach> 
          </ul>
        </div>
      </div>
      
      <div class="col-lg-6 mb-4 mb-xl-0">
        <span class="badge bg-secondary">전공선택</span>
        <div class="demo-inline-spacing mt-3">
          <ul class="list-group list-group-timeline">
          <c:forEach var="subVO" items="${g1List}" varStatus="stat">
          <c:if test="${subVO.sbjRs == 2}">
            <li class="list-group-item list-group-timeline-info">${subVO.sbjTitle}</li>
           </c:if>
           </c:forEach> 
          </ul>
        </div>
      </div>
      </c:if>
      
    </div>
  </div>
 </div>    
 
 <br/>   
    
<div class="card">    
 <div class="card-body">
 
	<div class="d-flex align-items-center lh-1 me-3 mb-3 mb-sm-0" style="font-size: 1.2em;">
		2학년 과목
	</div>
	<hr />
	<c:if test="${g2List == null || g2List.size() == 0}">
		<p>개설과목이 없습니다.</p>
	</c:if>
	
    <div class="row">
    
    <c:if test="${g2List != null && g2List.size() != 0}">
      <div class="col-lg-6 mb-4 mb-xl-0">
        <span class="badge bg-secondary">전공필수</span>
        <div class="demo-inline-spacing mt-3">
          <ul class="list-group list-group-timeline">
          <c:forEach var="subVO" items="${g2List}" varStatus="stat">
          <c:if test="${subVO.sbjRs == 1}">
            <li class="list-group-item list-group-timeline-success">${subVO.sbjTitle}</li>
           </c:if>
           </c:forEach> 
          </ul>
        </div>
      </div>
      
      <div class="col-lg-6 mb-4 mb-xl-0">
        <span class="badge bg-secondary">전공선택</span>
        <div class="demo-inline-spacing mt-3">
          <ul class="list-group list-group-timeline">
          <c:forEach var="subVO" items="${g2List}" varStatus="stat">
          <c:if test="${subVO.sbjRs == 2}">
            <li class="list-group-item list-group-timeline-info">${subVO.sbjTitle}</li>
           </c:if>
           </c:forEach> 
          </ul>
        </div>
      </div>
      </c:if>
      
    </div>
  </div>      
 </div>   
    
  <br/> 
    
<div class="card">    
 <div class="card-body">
 
	<div class="d-flex align-items-center lh-1 me-3 mb-3 mb-sm-0" style="font-size: 1.2em;">
		 3학년 과목
	</div>
	<hr />
	<c:if test="${g3List == null || g3List.size() == 0}">
		<p>개설과목이 없습니다.</p>
	</c:if>
	
    <div class="row">
    
    <c:if test="${g3List != null && g3List.size() != 0}">
      <div class="col-lg-6 mb-4 mb-xl-0">
        <span class="badge bg-secondary">전공필수</span>
        <div class="demo-inline-spacing mt-3">
          <ul class="list-group list-group-timeline">
          <c:forEach var="subVO" items="${g3List}" varStatus="stat">
          <c:if test="${subVO.sbjRs == 1}">
            <li class="list-group-item list-group-timeline-success">${subVO.sbjTitle}</li>
           </c:if>
           </c:forEach> 
          </ul>
        </div>
      </div>
      
      <div class="col-lg-6 mb-4 mb-xl-0">
        <span class="badge bg-secondary">전공선택</span>
        <div class="demo-inline-spacing mt-3">
          <ul class="list-group list-group-timeline">
          <c:forEach var="subVO" items="${g3List}" varStatus="stat">
          <c:if test="${subVO.sbjRs == 2}">
            <li class="list-group-item list-group-timeline-info">${subVO.sbjTitle}</li>
           </c:if>
           </c:forEach> 
          </ul>
        </div>
      </div>
      </c:if>
      
    </div>
  </div>      
 </div>   
 
  <br/> 
 
 <div class="card">    
 <div class="card-body">
 
	<div class="d-flex align-items-center lh-1 me-3 mb-3 mb-sm-0" style="font-size: 1.2em;">
		 4학년 과목
	</div>
	<hr />
	<c:if test="${g4List == null || g4List.size() == 0}">
		<p>개설과목이 없습니다.</p>
	</c:if>
	
    <div class="row">
    
    <c:if test="${g4List != null && g4List.size() != 0}">
      <div class="col-lg-6 mb-4 mb-xl-0">
        <span class="badge bg-secondary">전공필수</span>
        <div class="demo-inline-spacing mt-3">
          <ul class="list-group list-group-timeline">
          <c:forEach var="subVO" items="${g4List}" varStatus="stat">
          <c:if test="${subVO.sbjRs == 1}">
            <li class="list-group-item list-group-timeline-success">${subVO.sbjTitle}</li>
           </c:if>
           </c:forEach> 
          </ul>
        </div>
      </div>
      
      <div class="col-lg-6 mb-4 mb-xl-0">
        <span class="badge bg-secondary">전공선택</span>
        <div class="demo-inline-spacing mt-3">
          <ul class="list-group list-group-timeline">
          <c:forEach var="subVO" items="${g4List}" varStatus="stat">
          <c:if test="${subVO.sbjRs == 2}">
            <li class="list-group-item list-group-timeline-info">${subVO.sbjTitle}</li>
           </c:if>
           </c:forEach> 
          </ul>
        </div>
      </div>
      </c:if>
      
    </div>
  </div>      
 </div>       

</div>
</div>    
    
    
 