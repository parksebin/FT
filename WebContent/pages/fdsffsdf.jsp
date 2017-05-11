<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
	function maxLengthCheck(maxSize, lineSize, obj, remainObj){ 
	 var temp;
	 var f = obj.value.length;
	 var msglen = parseInt(maxSize);
	 var tmpstr = "";
	 var enter = 0;
	 var strlen;

	 if (f == 0)//남은 글자 byte 수 보여 주기
	 {  
	  if (remainObj != null)//null 옵션이 아닐 때 만 보여준다.
	  {
	   remainObj.value = msglen;
	  }  
	 }
	 else{
	  for(k = 0; k < f ; k++){
	   temp = obj.value.charAt(k);

	   if(temp =="\n"){
	    enter++;
	   }
	   if(escape(temp).length > 4)
	    msglen -= 2;
	   else
	    msglen--;
	   
	   if(msglen < 0){
	    alert("총 영문 "+(maxSize*2)+"자 한글 "+maxSize+"자 까지 쓰실 수 있습니다.");
	    obj.value = tmpstr;
	    break;
	   }
	   else if (lineSize != null & enter > parseInt(lineSize))// lineSize 옵션이 nulldl 아닐 때만 사용
	   {
	    alert("라인수 "+lineSize+"라인을 넘을 수 없습니다.")
	    enter = 0;
	    strlen = tmpstr.length -1;
	    obj.value = tmpstr.substring(0, strlen);
	    break;
	   }
	   else{
	    if (remainObj != null)
	    {
	     remainObj.value = msglen;
	    }      
	    tmpstr += temp;
	   }
	  }  
	 }
	} 
</script>
	 



</head>
<body>
 <textarea name="intro" checkNull="컨텐츠 소개글을 입력하세요" rows="5" style="width:99%;" onChange="javascript:maxLengthCheck('100', null, this, remain_intro);" onKeyup="javascript:maxLengthCheck('100', null, this, remain_intro);"></textarea>
※글자는 최대 4000자 까지만 입력이가능합니다                                               남은글자수는<input type="text" size="8" name="remain_intro" value="100">



</body>
</html>