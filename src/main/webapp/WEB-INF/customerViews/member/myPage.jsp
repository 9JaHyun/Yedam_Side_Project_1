<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-02-10
  Time: 오전 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- main -->
<div class="main">
    <div class="mypage">
        <div class="row">

            <div class="col-2">
                <h4 class="fs-2 fw-bold" style="margin-bottom: 30px;">Profile</h4>
                <div class="list-group" id="list-tab" role="tablist">
                    <a class="list-group-item list-group-item-action active" id="list-profile-list" data-bs-toggle="list" href="#list-profile" role="tab" aria-controls="list-profile">내정보</a>
                    <a class="list-group-item list-group-item-action" id="list-history-list" data-bs-toggle="list" href="#list-history" role="tab" aria-controls="list-history">예약 기록</a>
                    <a class="list-group-item list-group-item-action" id="list-settings-list" data-bs-toggle="list" href="#list-settings" role="tab" aria-controls="list-settings">정보 수정</a>
                    <a class="list-group-item list-group-item-action" id="list-update-pw-list" data-bs-toggle="list" href="#list-update-pw" role="tab" aria-controls="list-update-pw">비밀번호 변경</a>
                    <a class="list-group-item list-group-item-action" href="logout.do">로그아웃</a>
                </div>
            </div>

            <div class="col-10" style="padding-top: 64px;">
                <div class="tab-content" id="nav-tabContent">
                    <!-- 내정보 -->
                    <div class="tab-pane fade show active" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
                        <div class="d-flex align-items-center" style="margin-bottom: 20px;">
                            <div class="profile_img"></div>
                            <h4 class="fw-bold" style="margin-left: 20px;">${member.name}</h4>
                        </div>
                        <div style="margin-bottom: 30px;">
                            <p>${member.email}</p>
                            <p>${member.tel}</p>
                            <p>가입일자 : ${member.createdAt}</p>
                        </div>
                        <div>
                            <h4 class="fs-4 fw-bold" style="margin-bottom: 30px;">예약 현황</h4>
                            <ul style="padding: 0; display: none;">
                                <li class="reserve-status-list">
                                    sdas
                                </li>
                                <li class="reserve-status-list">
                                    asd
                                </li>
                            </ul>
                            <p class="">예약 내역이 없습니다.</p>
                        </div>
                    </div>

                    <!-- 기록 -->
                    <div class="tab-pane fade" id="list-history" role="tabpanel" aria-labelledby="list-history-list">
                        <div>
                            <h4 class="fs-4 fw-bold" style="margin-bottom: 30px;">예약 히스토리</h4>
                            <ul style="padding: 0; display: none;">
                                <li class="reserve-status-list">
                                    sdas
                                </li>
                                <li class="reserve-status-list">
                                    asd
                                </li>
                            </ul>
                            <p class="">예약 내역이 없습니다.</p>
                        </div>
                    </div>

                    <!-- 정보수정 -->
                    <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">
                        <form action="memberUpdate.do" method="post" id="updateMemberForm" name="updateMemberForm">
                            <input type="text" value="${member.memberId}" name="memberId" id="memberId" hidden>
                            <div class="d-flex align-items-center" style="margin-bottom: 20px;">
                                <div class="profile_img"></div>
                                <div class="col-sm-4">
                                    <input type="text" name="name" id="name" value="${member.name}" class="form-control fw-bold fs-4" style="margin-left: 20px;" maxlength="100">
                                </div>
                            </div>
                            <div style="margin-bottom: 30px;">
                                <div class="input-group mb-3">
                                    <span class="input-group-text">이메일</span>
                                    <input type="email" name="email" id="email" value="${member.email}" class="form-control col-4"><br>
                                </div>
                                <div class="input-group mb-3">
                                    <span class="input-group-text">전화번호</span>
                                    <input type="text" name="tel" id="password" value="${member.tel}" class="form-control col-4"><br>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">변경사항 저장</button>
                            <button type="button" class="btn btn-danger" onclick="handleWithdrawal()">회원탈퇴</button>
                        </form>

                    </div>

                    <!-- 비밀번호 변경 -->
                    <div class="tab-pane fade" id="list-update-pw" role="tabpanel" aria-labelledby="list-update-pw">
                        <form>
                            <div class="mb-3 col-4">
                                <label for="newPassword1" class="form-label">변결할 비밀번호</label>
                                <input type="password" class="form-control" id="newPassword1" placeholder="비밀번호" style="margin-bottom: 8px;">
                                <input type="password" class="form-control" id="newPassword2" placeholder="비밀번호 확인">
                            </div>
                            <button type="submit" class="btn btn-primary" onclick="handleUpdatePassword()">비밀번호 변경하기</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>

<script>
  function handleWithdrawal(memberId) {
    if (confirm('정말 회원탈퇴 하시겠습니까?')) {
        location.href = 'memberDelete.do?memberId=' + $('#memberId').val();
    }
  }

  function handleUpdatePassword() {
    let pw1 = $("#newPassword1").val();
    let pw2 = $("#newPassword2").val();
    if (pw1 === pw2) {
      $.ajax({
        url: "memberUpdate.do",
        type: 'post',
        data: {
          "memberId": $("#memberId").val(),
          "password": pw1
        },
        success: function(data){
          if (data === "success") {
            alert('비밀번호 변경 완료되었습니다.');
          } else {
            alert('비밀번호 변경 실패하였습니다.');
          }
        },
        error: function (data) {
          alert("서버 에러입니다. 다시 시도 해주세요");
        }
      });
    } else {
      alert('비밀번호가 일치하지 않습니다.');
    }

  }

  let form = $('#updateMemberForm');
  form.submit(function(){
    $.ajax({
      url: "memberUpdate.do?" + form.serialize(),
      type: 'post',
      contentType: "x-www-form-urlencoded; charset=utf-8",
      success: function(data){
        if (data === "success") {
          alert('업데이트 완료되었습니다.');
          location.href = 'myPage.do';
        } else {
          alert('업데이트 실패하였습니다.');
          location.href = 'myPage.do';
        }
      },
      error: function (data) {
        alert("서버 에러입니다. 다시 시도 해주세요");
      }
    });
    return false;
  });
</script>
