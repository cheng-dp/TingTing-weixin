package tingting.cdp;

import org.springframework.web.bind.annotation.*;

/**
 * Created by cdp on 2018/1/2.
 */
@RestController
@RequestMapping("/tingting/weixin")
public class WeixinController {

    @RequestMapping(method=RequestMethod.GET)
    public String tokenCertification(@RequestParam String signature, @RequestParam String timestamp,
                                     @RequestParam String nonce, @RequestParam String echostr){
        return echostr;
    }

}
