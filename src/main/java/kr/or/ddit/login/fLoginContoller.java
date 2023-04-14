package kr.or.ddit.login;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.security.KeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.json.Json;
import javax.json.JsonObject;
import javax.management.openmbean.InvalidKeyException;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base32;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.or.ddit.login.service.fLoginService;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class fLoginContoller {
	
	@Autowired
	fLoginService loginService;
	
	@GetMapping("/start")
	public String login() {
		return "login/login";
	}
	
	@PostMapping("/loginCheck")
	public String loginCheck(HttpServletRequest request, @ModelAttribute UserVO userVO, Model model, 
				@RequestParam(required = false , defaultValue = "0") int num) {
		
		String goPage = "";
		
		HttpSession session = request.getSession();
		
		String auth = loginService.getAuth(userVO);
		
		log.info("loginCheck");
		log.info("auth : " + auth);
		log.info("num : " + num);
		
		if(auth == null || auth.equals("")) {
			num += 1;
			model.addAttribute("num", num);
			model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요.");
			return "login/login";
		}else {
			userVO.setAuth(auth);
			goPage = "redirect:/home";
		}
		
		if(auth.equals("ROLE_STU")) {
			userVO = loginService.getStudent(userVO);
			session.setAttribute("userVO", userVO);
		}else if(auth.equals("ROLE_TEA")) {
			userVO = loginService.getTeacher(userVO);
			session.setAttribute("userVO", userVO);
		}else {
			userVO = loginService.getAdmin(userVO);
			session.setAttribute("userVO", userVO);
		}
		
		// 세션 무한 유지
		session.setMaxInactiveInterval(-1);
		
		return goPage;
	}
	
	@GetMapping("/logoutt")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/start";
	}
	
	@ResponseBody
	@PostMapping("/findId")
	public Object findId(@RequestBody Map<String, String> map) {
		
		log.info("findid");
		log.info("map : " + map);
		
		String username = loginService.findId(map);
		
		return username;
	}
	
	@ResponseBody
	@PostMapping("/changePw")
	public Object changePw(@RequestParam Map<String, Object> map) {
		
		log.info("map : " + map);
		int result = loginService.serachUser(map);
		log.info("result : " + result) ;
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/pwUpadate")
	public int pwUpadate(@RequestParam Map<String, Object> map) {
		
		log.info("pw-map :" + map);
		int result = loginService.pwUpdate(map);
		return result;
	}
	
	
	@ResponseBody
	@PostMapping("/VerifyRecaptcha")
	public int VerifyRecaptcha(HttpServletRequest request) {
	    VerifyRecaptcha.setSecretKey("6LeCSJ0kAAAAAP5taB44nECobVSBMWQ9HwKvPUV4\r\n");
	    String gRecaptchaResponse = request.getParameter("recaptcha");
	    try {
	       if(VerifyRecaptcha.verify(gRecaptchaResponse))
	          return 0; // 성공
	       else return 1; // 실패
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1; //에러
	    }
	}
	
	public static class VerifyRecaptcha {
		 public static final String url = "https://www.google.com/recaptcha/api/siteverify";
		    private final static String USER_AGENT = "Mozilla/5.0";
		    private static String secret = ""; //local
		 
		    public static void setSecretKey(String key){
		        secret = key;
		    }
		    
		    public static boolean verify(String gRecaptchaResponse) throws IOException {
		        if (gRecaptchaResponse == null || "".equals(gRecaptchaResponse)) {
		            return false;
		        }
		        
		        try{
		        URL obj = new URL(url);
		        HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
		 
		        // add reuqest header
		        con.setRequestMethod("POST");
		        con.setRequestProperty("User-Agent", USER_AGENT);
		        con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		 
		        String postParams = "secret=" + secret + "&response="
		                + gRecaptchaResponse;
		 
		        // Send post request
		        con.setDoOutput(true);
		        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		        wr.writeBytes(postParams);
		        wr.flush();
		        wr.close();
		 
		        int responseCode = con.getResponseCode();
		        System.out.println("\nSending 'POST' request to URL : " + url);
		        System.out.println("Post parameters : " + postParams);
		        System.out.println("Response Code : " + responseCode);
		 
		        BufferedReader in = new BufferedReader(new InputStreamReader(
		                con.getInputStream()));
		        String inputLine;
		        StringBuffer response = new StringBuffer();
		 
		        while ((inputLine = in.readLine()) != null) {
		            response.append(inputLine);
		        }
		        in.close();
		 
		        // print result
		        System.out.println(response.toString());
		         
		        //parse JSON response and return 'success' value
		        javax.json.JsonReader jsonReader = Json.createReader(new StringReader(response.toString()));
		        JsonObject jsonObject = jsonReader.readObject();
		        jsonReader.close();
		         
		        return jsonObject.getBoolean("success");
		        }catch(Exception e){
		            e.printStackTrace();
		            return false;
		        }
		    }

	}
	
	@ResponseBody
	@PostMapping("/otp")
	public Object otp() throws Exception {

		byte[] buffer = new byte[5 + 5 * 5];
		new Random().nextBytes(buffer);
		Base32 codec = new Base32();
		byte[] secretKey = Arrays.copyOf(buffer, 10); // 16자 이상이여하므로 10으로 설정 필요
		byte[] bEncodedKey = codec.encode(secretKey);

		// 인증키 생성
		String encodedKey = new String(bEncodedKey);
		// 바코드 주소 생성
		String QrUrl = getQRBarcodeURL("miee", "miiiiiii", encodedKey);
		log.info("encodedKey : " + encodedKey);
		log.info("QrUrl : " + QrUrl);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("encodedKey", encodedKey);
		map.put("QrUrl", QrUrl);
		
		log.info("map : " + map);
		

		return map;
	}	

	// OTP 확인 컨트롤러
	@ResponseBody
	@PostMapping("/otpcheck")
	public Object statList(@RequestParam Map<String, String> map) throws Exception {
		
		log.info("otpmap : " + map);
		
		try {
			String code = map.get("code1");
			long codeCheck = Integer.parseInt(code);
			String encodedKey = map.get("encodedKey1");
			long l = new Date().getTime();
			long ll = l / 30000;

			boolean check_code = false;
			check_code = check_code(encodedKey, codeCheck, ll);

			if (!check_code) {
				return 0;	
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return 1;
	}

	// 바코드 생성 함수
	public static String getQRBarcodeURL(String user, String host, String secret) {
		String format = "http://chart.apis.google.com/chart?cht=qr&chs=300x300&chl=otpauth://totp/%s@%s%%3Fsecret%%3D%s&chld=H|0";

		return String.format(format, user, host, secret);
	}

	// 코드 체크 함수
	private static boolean check_code(String secret, long code, long t)
			throws InvalidKeyException, NoSuchAlgorithmException, KeyException {
		Base32 codec = new Base32();
		byte[] decodedKey = codec.decode(secret);

		int window = 3;
		for (int i = -window; i <= window; ++i) {
			long hash = verify_code(decodedKey, t + i);

			if (hash == code) {
				return true;
			}
		}

		return false;
	}

	// 코드 확인 함수
	private static int verify_code(byte[] key, long t)
			throws NoSuchAlgorithmException, InvalidKeyException, KeyException {
		byte[] data = new byte[8];
		long value = t;
		for (int i = 8; i-- > 0; value >>>= 8) {
			data[i] = (byte) value;
		}

		SecretKeySpec signKey = new SecretKeySpec(key, "HmacSHA1");
		Mac mac = Mac.getInstance("HmacSHA1");
		mac.init(signKey);
		byte[] hash = mac.doFinal(data);

		int offset = hash[20 - 1] & 0xF;

		long truncatedHash = 0;
		for (int i = 0; i < 4; ++i) {
			truncatedHash <<= 8;
			truncatedHash |= (hash[offset + i] & 0xFF);
		}

		truncatedHash &= 0x7FFFFFFF;
		truncatedHash %= 1000000;

		return (int) truncatedHash;
	}

}
