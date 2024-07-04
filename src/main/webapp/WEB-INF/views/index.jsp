<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JpaTest</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        const jpaInsert = () => {
            const formData = {
                text: $('#text1').val() // 입력 필드 값
            };

            return new Promise((resolve, reject) => {
                $.ajax({
                    type: "POST",
                    url: "http://localhost:8000/api/jpatest/submit",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(formData), // 객체를 JSON 문자열로 변환
                    success: (response) => {
                        console.log("성공 : ", response);
                        resolve(response);
                    },
                    error: (xhr, status, error) => {
                        console.log("오류 : ", error);
                        reject(error);
                    }
                });
            });
        };

        $(document).ready(() => {
            // 폼 제출 이벤트 가로챔
            $('form').submit((event) => {
                event.preventDefault(); // 기본 폼 제출 동작 막음
                jpaInsert().then((response) => {
                    console.log("성공 : ", response);
                    alert("입력성공 : ", response.text)
                    // 성공
                }).catch((error) => {
                    console.error("오류 : ", error);
                    alert("입력실패 : ", error)
                    // 오류
                });
            });
        });

        const jpaSelect = () => {
            alert("조회버튼 클릭!!")
            return new Promise((resolve, reject) => {
                $.ajax({
                    type: "GET",
                    url: "http://localhost:8000/api/jpatest/list",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(),
                    success: (response) => {
                        console.log("성공 : ", response);
                        selectList(response);
                        resolve(response);
                    },
                    error: (xhr, status, error) => {
                        console.log("오류 : ", error);
                        reject(error);
                    }
                });
            });
        }
        const selectList = (data) => {
            const tableBody = document.getElementById('tableBody');
           tableBody.innerHTML = ''; // 테이블 내용 초기화

            data.forEach(item => {
                const row = document.createElement('tr');
                const idData = document.createElement('td');
                const textData = document.createElement('td');

                idData.textContent = item.id;
                textData.textContent = item.text;

                row.appendChild(idData);
                row.appendChild(textData);
                tableBody.appendChild(row);
            });
        }

    </script>
</head>
<body>
<h1>JPA 데이터 입력</h1>
<form>
    <label for="text1">텍스트:</label>
    <input type="text" id="text1" name="text1" required>
    <button type="submit">제출</button>
    <button type="button" onclick=jpaSelect()>조회</button>
</form>
<h3>조회 결과</h3>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Text</th>
    </tr>
    </thead>
    <tbody id="tableBody">
    </tbody>
</table>
</body>
</html>