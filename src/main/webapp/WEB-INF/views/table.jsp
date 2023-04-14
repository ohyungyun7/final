<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
<script>
$(function(){
	$("#btn").on("click", function(){
		text = $("#snow-editor2").text();
	});
	
	
});
</script>

<div class="container-xxl flex-grow-1 container-p-y">

	<!-- Complex Headers -->
	<div class="card yoginunTable">
		<h5 class="card-header">Complex Headers</h5>
		<div class="card-header flex-column flex-md-row">
			<div class="dt-action-buttons text-end pt-3 pt-md-0">
				<div class="dt-buttons btn-group flex-wrap">
					<div class="btn-group">
						<button
							class="btn btn-secondary buttons-collection dropdown-toggle btn-label-primary me-2"
							tabindex="0" aria-controls="DataTables_Table_0" type="button"
							aria-haspopup="dialog" aria-expanded="true">
							<span><i class="bx bx-export me-sm-1"></i> <span
								class="d-none d-sm-inline-block">Export</span></span><span
								class="dt-down-arrow"></span>
						</button>
					</div>
					<button class="btn btn-secondary create-new btn-primary"
						tabindex="0" aria-controls="DataTables_Table_0" type="button">
						<span><i class="bx bx-plus me-sm-1"></i> <span
							class="d-none d-sm-inline-block addNew">Add New Record</span></span>
					</button>
				</div>
			</div>
		</div>
		<div class="card-datatable text-nowrap">
			<div id="DataTables_Table_1_wrapper"
				class="dataTables_wrapper dt-bootstrap5 no-footer">
				<div class="table-responsive">
					<table
						class="dt-complex-header table table-bordered dataTable no-footer"
						id="DataTables_Table_1" aria-describedby="DataTables_Table_1_info"
						style="width: 1336px;">
						
						<thead>
							<tr>
								<th rowspan="2" class="sorting sorting_asc" tabindex="0"
									aria-controls="DataTables_Table_1" colspan="1"
									aria-label="Name: activate to sort column descending"
									aria-sort="ascending" style="width: 158px;">Name</th>
								<th colspan="2" rowspan="1">Contact</th>
								<th colspan="3" rowspan="1">HR Information</th>
								<th rowspan="2" class="sorting_disabled" colspan="1"
									aria-label="Actions" style="width: 62px;">Actions</th>
							</tr>
							<tr>
								<th class="sorting" tabindex="0"
									aria-controls="DataTables_Table_1" rowspan="1" colspan="1"
									aria-label="E-mail: activate to sort column ascending"
									style="width: 226px;">E-mail</th>
								<th class="sorting" tabindex="0"
									aria-controls="DataTables_Table_1" rowspan="1" colspan="1"
									aria-label="City: activate to sort column ascending"
									style="width: 165px;">City</th>
								<th class="sorting" tabindex="0"
									aria-controls="DataTables_Table_1" rowspan="1" colspan="1"
									aria-label="Position: activate to sort column ascending"
									style="width: 226px;">Position</th>
								<th class="sorting" tabindex="0"
									aria-controls="DataTables_Table_1" rowspan="1" colspan="1"
									aria-label="Salary: activate to sort column ascending"
									style="width: 73px;">Salary</th>
								<th class="border-1 sorting" tabindex="0"
									aria-controls="DataTables_Table_1" rowspan="1" colspan="1"
									aria-label="Status: activate to sort column ascending"
									style="width: 112px;">Status</th>
							</tr>
						</thead>
						<tbody>
							<tr class="even">
								<td class="sorting_1">Aliza MacElholm</td>
								<td>amacelholm20@printfriendly.com</td>
								<td>Sosnovyy Bor</td>
								<td>VP Sales</td>
								<td>$16741.31</td>
								<td><span class="badge  bg-label-success">Professional</span></td>
								<td><div class="d-inline-block">
										<a href="javascript:;"
											class="btn btn-sm btn-icon dropdown-toggle hide-arrow"
											data-bs-toggle="dropdown"><i
											class="bx bx-dots-vertical-rounded"></i></a>
										<div class="dropdown-menu dropdown-menu-end m-0">
											<a href="javascript:;" class="dropdown-item">Details</a><a
												href="javascript:;" class="dropdown-item">Archive</a>
											<div class="dropdown-divider"></div>
											<a href="javascript:;"
												class="dropdown-item text-danger delete-record">Delete</a>
										</div>
									</div>
									<a href="javascript:;" class="btn btn-sm btn-icon item-edit"><i
										class="bx bxs-edit"></i></a></td>
							</tr>
							<tr class="odd">
								<td class="sorting_1">Annetta Glozman</td>
								<td>aglozman1r@storify.com</td>
								<td>Pendawanbaru</td>
								<td>Staff Accountant</td>
								<td>$10745.32</td>
								<td><span class="badge  bg-label-info">Applied</span></td>
								<td><div class="d-inline-block">
										<a href="javascript:;"
											class="btn btn-sm btn-icon dropdown-toggle hide-arrow"
											data-bs-toggle="dropdown"><i
											class="bx bx-dots-vertical-rounded"></i></a>
										<div class="dropdown-menu dropdown-menu-end m-0">
											<a href="javascript:;" class="dropdown-item">Details</a><a
												href="javascript:;" class="dropdown-item">Archive</a>
											<div class="dropdown-divider"></div>
											<a href="javascript:;"
												class="dropdown-item text-danger delete-record">Delete</a>
										</div>
									</div>
									<a href="javascript:;" class="btn btn-sm btn-icon item-edit"><i
										class="bx bxs-edit"></i></a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="card yoginunEditor">
	    
	    <div class="card">
	    	<!-- Snow Theme -->
	        <div class="col-12">
	          <div class="card mb-4">
	            <h5 class="card-header">Snow Theme</h5>
	            <div class="card-body">
	              <div id="snow-toolbar2">
	                <span class="ql-formats">
	                  <select class="ql-font"></select>
	                  <select class="ql-size"></select>
	                </span>
	                <span class="ql-formats">
	                  <button class="ql-bold"></button>
	                  <button class="ql-italic"></button>
	                  <button class="ql-underline"></button>
	                  <button class="ql-strike"></button>
	                </span>
	                <span class="ql-formats">
	                  <select class="ql-color"></select>
	                  <select class="ql-background"></select>
	                </span>
	                <span class="ql-formats">
	                  <button class="ql-script" value="sub"></button>
	                  <button class="ql-script" value="super"></button>
	                </span>
	                <span class="ql-formats">
	                  <button class="ql-header" value="1"></button>
	                  <button class="ql-header" value="2"></button>
	                  <button class="ql-blockquote"></button>
	                  <button class="ql-code-block"></button>
	                </span>
	              </div>
	              <div id="snow-editor2">
	              </div>
	            </div>
	          </div>
	        </div>
	        <button type="button" id="btn" name="btn">snow-editor2</button>
	        <!-- /Snow Theme -->
	    </div>
	    
	</div>
	
	<div class="card yoginunAlert">
		
		<!-- SweetAlert Animations -->
		<div class="col-12 mb-4">
		  <div class="card">
		    <h5 class="card-header">Animations</h5>
		    <div class="card-body">
		      <span>
		        Use <code>popup</code> inside <code>showClass</code> parameter to add animation to alert
		      </span>
		      <div class="demo-inline-spacing">
		
		        <button class="btn btn-primary" id="bounce-in-animation">
		          Bounce In
		        </button>
		        <button class="btn btn-primary" id="fade-in-animation">
		          Fade In
		        </button>
		        <button class="btn btn-primary" id="flip-x-animation">
		          Flip In
		        </button>
		        <button class="btn btn-primary" id="tada-animation">
		          Tada
		        </button>
		        <button class="btn btn-primary" id="shake-animation">
		          Shake
		        </button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- /SweetAlert Animations -->
		
		<!-- Primary -->
<!-- 			<div class="col-md-6 mb-4"> -->
<!-- 			  <label for="select2Primary" class="form-label">Primary</label> -->
<!-- 			  <div class="select2-primary"> -->
<!-- 			    <select id="select2Primary" class="select2 form-select" multiple> -->
<!-- 			      <option value="1" selected>Option1</option> -->
<!-- 			      <option value="2" selected>Option2</option> -->
<!-- 			      <option value="3">Option3</option> -->
<!-- 			      <option value="4">Option4</option> -->
<!-- 			    </select> -->
<!-- 			  </div> -->
<!-- 			</div> -->
			<!-- Basic --> 
<!-- 	          <div class="col-md-6 mb-4"> -->
<!-- 	            <label for="TagifyBasic" class="form-label">Basic</label> -->
<!-- 	            <input id="TagifyBasic" class="form-control" name="TagifyBasic" value="Tag1, Tag2, Tag3" /> -->
<!-- 	          </div> -->
<!-- 	          Multiple -->
<!-- 	          <div class="col-md-6 mb-4"> -->
<!-- 	            <label for="select2Multiple" class="form-label">Multiple</label> -->
<!-- 	            <select id="select2Multiple" class="select2 form-select whyandueh" multiple> -->
<!-- 	              <optgroup label="Alaskan/Hawaiian Time Zone"> -->
<!-- 	                <option value="AK">Alaska</option> -->
<!-- 	              </optgroup> -->
<!-- 	              <optgroup label="Pacific Time Zone"> -->
<!-- 	                <option value="CA">California</option> -->
<!-- 	                <option value="NV">Nevada</option> -->
<!-- 	              </optgroup> -->
<!-- 	              <optgroup label="Mountain Time Zone"> -->
<!-- 	                <option value="AZ">Arizona</option> -->
<!-- 	                <option value="HI">Hawaii</option> -->
<!-- 	              </optgroup> -->
<!-- 	              <optgroup label="Central Time Zone"> -->
<!-- 	                <option value="AL">Alabama</option> -->
<!-- 	                <option value="AR">Arkansas</option> -->
<!-- 	                <option value="IL">Illinois</option> -->
<!-- 	              </optgroup> -->
<!-- 	              <optgroup label="Eastern Time Zone"> -->
<!-- 	                <option value="CT">Connecticut</option> -->
<!-- 	                <option value="DE">Delaware</option> -->
<!-- 	                <option value="FL" selected>Florida</option> -->
<!-- 	                <option value="GA">Georgia</option> -->
<!-- 	              </optgroup> -->
<!-- 	            </select> -->
<!-- 	          </div> -->
			
			
			
	
	</div>

</div>
<script src="/resources/sneat/assets/vendor/libs/sweetalert2/sweetalert2.js" />
<script src="/resources/sneat/assets/js/extended-ui-sweetalert2.js"></script>
<script>
// table
$(document).ready(function () {
    $('#DataTables_Table_1').DataTable();
});
//editor
$(function() {
	
	  const snowEditor = new Quill('#snow-editor2', {
		  bounds: '#snow-editor2',
		  modules: {
		    formula: true,
		    toolbar: '#snow-toolbar2'
		  },
		  theme: 'snow'
		});
	  
	  $('.addNew').on('click',function(){
// 		 debugger;
	  });
	  const bounceInAnimation = document.querySelector('#bounce-in-animation');
	  bounceInAnimation.onclick = function() {
		  Swal.fire({
		    title: '됐나',
		    showClass: {
		      popup: 'animate__animated animate__bounceIn'
		    },
		    customClass: {
		      confirmButton: 'btn btn-primary'
		    },
		    buttonsStyling: false
		  })
		}
 
});
//sweet
	
</script> 
