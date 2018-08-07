Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.28; helo=mtaout003-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
Received: from mtaout003-public.msg.strl.va.charter.net
 (mtaout003-public.msg.strl.va.charter.net [68.114.190.28])
 by lists.ozlabs.org (Postfix) with ESMTP id 41lHDZ3VWnzDqD5
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 00:37:49 +1000 (AEST)
Received: from impout001 ([68.114.189.16]) by mtaout003.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20180807143747.RYMU7355.mtaout003.msg.strl.va.charter.net@impout001>
 for <openbmc@lists.ozlabs.org>; Tue, 7 Aug 2018 09:37:47 -0500
Received: from [192.168.2.6] ([97.86.254.207]) by impout001 with charter.net
 id LEdn1y0014VFKzV01EdnNm; Tue, 07 Aug 2018 09:37:47 -0500
X-Authority-Analysis: v=2.2 cv=ffHd8wYF c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
 a=x7bEGLp0ZPQA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8
 a=voM4FWlXAAAA:8 a=pQs5aej7AAAA:8 a=StXR-1uFs5AySUSZK84A:9 a=QEXdDO2ut3YA:10
 a=6PdD7SHbsDhHzGl7WnwA:9 a=fhoq5J8wS2oldxXu:21 a=_W_S_7VecoQA:10
 a=IC2XNlieTeVoXbcui8wp:22
X-Auth-id: am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0
Subject: Re:Re: Phosphor Web-ui: Server unreachable - cross origin request
 blocked
To: openbmc@lists.ozlabs.org
References: <mailman.438.1533636809.2968.openbmc@lists.ozlabs.org>
From: Joseph Reynolds <joseph-reynolds@charter.net>
Message-ID: <a9a4cf9d-bc13-8302-917c-6b6407d2d3a4@charter.net>
Date: Tue, 7 Aug 2018 09:37:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <mailman.438.1533636809.2968.openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative;
 boundary="------------EDB36EEB7C8B99E46C06DCE8"
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2018 14:37:51 -0000

This is a multi-part message in MIME format.
--------------EDB36EEB7C8B99E46C06DCE8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/7/2018 5:13 AM, AKASH wrote:
>
> Message: 4
> Date: Tue, 7 Aug 2018 15:43:21 +0530
> From: AKASH G J <akashgj91@gmail.com>
> To: Ed Tanous <ed.tanous@intel.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Phosphor Web-ui: Server unreachable
> Message-ID:
> 	<CAE33tLHsd5HwrCS9qLXO6Mo_gzka1Mrv7vs3Ofy0AF=YRJdT1w@mail.gmail.com>
> Content-Type: text/plain; charset="utf-8"
>
> Hi Ed,
>
> Sorry for the late reply. I was on leave for last week.
>
> I am hosting phosphor-webui on a different machine and trying to connect
> the BMC board using its IP address. I am using bmcweb platform. When I
> tried to login, the following message appeared in browser console.
>
> Cross-Origin Request Blocked: The Same Origin Policy disallows reading the
> remote resource at https://<BMC-IP>/login. (Reason: CORS request did not
> succeed).
> <unavailable> activity-stream.bundle.js:3170:9
> CSI/tbsd_ cb=gapi.loaded_0:458:127
> CSI/_tbnd cb=gapi.loaded_0:458:127
> CSI/tbsd_ cb=gapi.loaded_0:458:127
> CSI/_tbnd cb=gapi.loaded_0:458:127
See 
https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Origin.
I think the HTTP response header from phosphor-webui needs to include 
"Cross-origin resource sharing" headers such as:
Access-Control-Allow-Origin: <YOUR-WEB-HOSTING-MACHINE-IP>, 
<original-ip>    <-- or use *
   Access-Control-Allow-Credentials: true
   Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE
   Access-Control-Max-Age: 3600
   Access-Control-Allow-Headers: Content-Type, Accept, X-Requested-With, 
remember-me

How would we enhance the phosphor-webui application to produce these 
headers?

> Thanks and Regards,
>
> Akash
> [...snip...]


--------------EDB36EEB7C8B99E46C06DCE8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 8/7/2018 5:13 AM, AKASH wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:mailman.438.1533636809.2968.openbmc@lists.ozlabs.org"><br>
      <pre wrap="">Message: 4
Date: Tue, 7 Aug 2018 15:43:21 +0530
From: AKASH G J <a class="moz-txt-link-rfc2396E" href="mailto:akashgj91@gmail.com">&lt;akashgj91@gmail.com&gt;</a>
To: Ed Tanous <a class="moz-txt-link-rfc2396E" href="mailto:ed.tanous@intel.com">&lt;ed.tanous@intel.com&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>
Subject: Re: Phosphor Web-ui: Server unreachable
Message-ID:
	<a class="moz-txt-link-rfc2396E" href="mailto:CAE33tLHsd5HwrCS9qLXO6Mo_gzka1Mrv7vs3Ofy0AF=YRJdT1w@mail.gmail.com">&lt;CAE33tLHsd5HwrCS9qLXO6Mo_gzka1Mrv7vs3Ofy0AF=YRJdT1w@mail.gmail.com&gt;</a>
Content-Type: text/plain; charset="utf-8"

Hi Ed,

Sorry for the late reply. I was on leave for last week.

I am hosting phosphor-webui on a different machine and trying to connect
the BMC board using its IP address. I am using bmcweb platform. When I
tried to login, the following message appeared in browser console.

Cross-Origin Request Blocked: The Same Origin Policy disallows reading the
remote resource at <a class="moz-txt-link-freetext" href="https://">https://</a>&lt;BMC-IP&gt;/login. (Reason: CORS request did not
succeed).
&lt;unavailable&gt; activity-stream.bundle.js:3170:9
CSI/tbsd_ cb=gapi.loaded_0:458:127
CSI/_tbnd cb=gapi.loaded_0:458:127
CSI/tbsd_ cb=gapi.loaded_0:458:127
CSI/_tbnd cb=gapi.loaded_0:458:127
</pre>
    </blockquote>
    See
<a class="moz-txt-link-freetext" href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Origin">https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Origin</a>.<br>
    I think the HTTP response header from phosphor-webui needs to
    include "Cross-origin resource sharing" headers such as:<br>
      <span class="typ">Access</span><span class="pun">-</span><span
      class="typ">Control</span><span class="pun">-</span><span
      class="typ">Allow</span><span class="pun">-</span><span
      class="typ">Origin</span><span class="pun"></span>:
    &lt;YOUR-WEB-HOSTING-MACHINE-IP&gt;, &lt;original-ip&gt;    &lt;--
    or use *<br>
      Access-Control-Allow-Credentials: true<br>
      Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE<br>
      Access-Control-Max-Age: 3600<br>
      Access-Control-Allow-Headers: Content-Type, Accept,
    X-Requested-With, remember-me<br>
    <br>
    How would we enhance the phosphor-webui application to produce these
    headers?<br>
    <br>
    <blockquote type="cite"
      cite="mid:mailman.438.1533636809.2968.openbmc@lists.ozlabs.org">
      <pre wrap="">
Thanks and Regards,

Akash
[...snip...]
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------EDB36EEB7C8B99E46C06DCE8--
