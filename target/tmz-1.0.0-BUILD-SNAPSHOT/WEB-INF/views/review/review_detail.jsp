<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@ include file = "../../templet/header.jsp"%>  
<div class="col-md-12 grid-margin stretch-card my-4">
   <div class="card pb-5">
      <div class="img_wrapper my-4" style="border-radius : 30px; width: 100%; height: 350px;">
         <img src = "${pageContext.request.contextPath }/resources/assets/images/review/img2.jpg" alt = "이미지 없음" class = "rounded" width = "100%" height = "100%"/>
      </div>

         <!--    <div class="d-flex flex-row justify-content-between">
               <h1 class="card-title mb-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 공지사항</h1>
            </div> -->


      <div class="row mx-5 mt-3"
         style="border: 1px solid gray; border-radius: 20px;">
         <div class="card-body col-10 px-5">

    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header" 
                style="white-space: nowrap;" >공지사항 : <c:out value="${review.rv_no}"/> 번 게시물</h3>
        </div>
        
          <div class="card-body col-2">
         <p><i class="mdi mdi-account"></i>작성자 <c:out value="${review.rv_writer}"/> </p>
      </div>
        <%-- /.col-lg-12 --%>
    </div>   


            <div class=" col-lg-12">
               <h4 class="card-title mb-1">제목</h4>
                <input class="form-control" name="rv_title" readonly="readonly" value='<c:out value="${review.rv_title }" />'>
            </div>
            <br>

            <div class="row">
               <div class="col-12">
                  <div class="preview-list">
                     <div class="form-group">
                        <div class="mx-3 mt-3">내용</div>
                           <textarea class="form-control" rows="5" name="rv_content" style="resize: none;"
                      readonly="readonly"><c:out value="${review.rv_content }"/></textarea>

                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="mt-5 mb-4 col-12">
         <!-- 첨부파일 표시 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

							
						<div class="panel-heading">파일첨부</div>
						<%--수정--%>
						<div class="panel-body">
							<div class="form-group file_upload_result">
								<%--첨부파일 목록 표시 div--%>
								<%--div 전체 내용 추가--%>
								<ul>
									<%-- 첨부파일 목록이 표시될 영역 --%>
								</ul>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
            <div class="float-right mr-3">
        	
               <button type="button" id="review_modify_button"
                  class="btn btn-outline-secondary btn-icon-text">
                  <i class="mdi mdi-border-color"></i>수정
               </button>
               <button type="button" id="review_list_button"
                  class="btn btn-outline-primary btn-icon-text ml-1">
                  <i class="mdi mdi-file-check btn-icon-prepend"></i>목록
               </button>
            </div>
         </div>
      </div>
   </div>
</div>


<form name="review_send" id="review_send">
							<input type="hidden" name="rv_no" id="rv_no" value='<c:out value="${review.rv_no }"/>'> 
							<input type="hidden" name="review_page_num" value='${review_pagingDTO.review_page_num}'> 
							<input type="hidden" name="review_page_row_amount_per_page" value='${review_pagingDTO.review_page_row_amount_per_page }'> 
							<input type='hidden' name='review_scope' value='${review_pagingDTO.review_scope}'>
							<input type='hidden' name='review_scope' value='${review_pagingDTO.review_keyword}'>
</form>


<%-- 페이지 이동 처리 스크립트--%>
<script>
    var review_send = $("#review_send");

    $("#review_list_button").on("click", function() { // 목록 버튼 클릭시
/*     	review_send.find("rv_no").remove();
 */    	review_send.attr("method", "get");
    	review_send.attr("action", "${contextPath}/review/review-list");
    	review_send.submit();
    });

    $("#review_modify_button").on("click", function() {
    	review_send.attr("method", "get");
    	review_send.attr("action", "${contextPath}/review/review-modify");
    	review_send.submit();
    });
    <%-- 첨부파일 처리 JS --%>
	//업로드 후, 첨부파일 정보 표시 함수
	var rv_no_value = '<c:out value="${review.rv_no}"/>';
	function show_uploaded_files(upload_result) {
	 	console.log("show_uploaded_files 실행: 화면 표시 시작=======================================");
	 	//서버로부터 전달된 파일업로드 결과내용이 없으면, 함수 종료.
	 	if(!upload_result || upload_result.length == 0){
	 		return ;
	 		} 
		 var file_upload_result = $(".file_upload_result ul");
		 var str = "";
		 //전달받은 배열형식 데이터 각각에 대하여
	 	$(upload_result).each(function(i, obj) {
			 if (obj.rfiletype=="F") { //이미지가 아닌 경우, 아이콘 이미지 및 원본 파일이름 표시
				 var called_path_file_name = encodeURIComponent( obj.repoPath + "/" + obj.uploadPath + "/" + //주석처리
				  obj.uuid + "_" + obj.fileName ); //주석처리
				 //console.log("호출된 파일이름: " + calledPathFileName); //주석처리
				
				 //아래의 li 태그를 다음처럼 수정: data-* 속성들 추가
						 str += "<li data-review_repo_path='" + obj.review_repo_path + "'"
						 + " data-ruploadpath='" + obj.ruploadpath + "'"
						 + " data-ruuid='" + obj.ruuid + "'"
						 + " data-rfilename='" + obj.rfilename + "'"
						 + " data-rfiletype='" + obj.rfiletype + "' >"
						 //+ " <a href='${contextPath}/fileDownloadAjax?fileName=" + calledPathFileName + "'>" //주석처리
						 + " <img src='${contextPath}/resources/assets/images/file-icons/512/004-folder-1.png' alt='No Icon' "+ " style='height: 18px; width: 18px;'>"
						 + obj.rfilename
						 //+ " </a>" //주석처리
						 //+ " <span data-filename='" + calledPathFileName + "' data-filetype='F'>[삭제]</span>" //주석처리
						 + "</li>";
				 } else if (obj.rfiletype=="I") {//이미지파일인 경우 썸네일 및 원본 파일이름 표시
					 //전체 경로명이 포함된 썸네일 파일이름을 encodeURIComponent로 처리
					 var thumbnail_file_path = 
					 encodeURIComponent(obj.review_repo_path + "/" + obj.ruploadpath + "/s_" + obj.ruuid + "_" + obj.rfilename);
					 console.log("encodeURIComponent 처리 파일이름: " + thumbnail_file_path);
					 //원본이미지 파일이름(경로포함)
					 //var originPathImageFileName = obj.repoPath + "/" + obj.uploadPath + "/" + obj.uuid //주석처리
					 // + "_" + obj.fileName; //주석처리
					 //originPathImageFileName = originPathImageFileName.replace(new RegExp(/\\/g),"/"); //주석처리
					
					 //아래의 li 태그를 다음처럼 수정: data-* 속성들 추가
					 str += "<li  data-ruploadpath='" + obj.ruploadpath + "'"
					 + " data-ruuid='" + obj.ruuid + "'"
					 + " data-rfilename='" + obj.rfilename + "'"
					 + " data-rfiletype='I' >" //수정: li 요소에 data-XXX 속성으로 필요한 값을 지정
					 + " <img src='${contextPath}/display_thumbnail_file?file_name=" + thumbnail_file_path + "'"
					 + " alt='No Icon' style='height: 50px; width: 50px;'>"
					 + obj.rfilename
					 + "</li>";
		 }
	 });
	 //기존 페이지에 첨부파일 정보 표시를 HTML로 추가
	 file_upload_result.html(str);
	} 
	$(document).ready(function() {//페이지 로딩 시 함수 실행 전체 JavaScript 내용 중 제일 마지막에 위치해야 함
		//첨부파일 정보를 가져오는 Ajax.
		 $.ajax({ 
			 type: 'get',
			 url: '${contextPath}/review/get_files',
			 data: {rv_no: rv_no_value}, //bnoValue는 상단에 정의(댓글구현 시 사용)된 것 사용
			 dataType: 'json',
			 success: function(file_list, status){
				 console.log("첨부파일 목록 수집: " + status);
				 show_uploaded_files(file_list);
			 }
		 }); //ajax end
		/* showCmtList(1); */
	});
  
</script>





<%@ include file = "../../templet/footer.jsp"%>  