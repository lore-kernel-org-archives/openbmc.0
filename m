Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::22b; helo=mail-ot0-x22b.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kk4dtwX5"; 
 dkim-atps=neutral
Received: from mail-ot0-x22b.google.com (mail-ot0-x22b.google.com
 [IPv6:2607:f8b0:4003:c0f::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40rb6g54mYzF0sk
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 00:50:50 +1000 (AEST)
Received: by mail-ot0-x22b.google.com with SMTP id l12-v6so25516151oth.6
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=eTWTQ86iF8oE2JgfmFwYwlTqQe2oQfzjy7OpPVSbPBA=;
 b=Kk4dtwX5qYUZjLo0xFzMLoIxkaygeQXzo9PkFpxh0MZi5DViBF6IKpXa10aWTIGhe9
 ftIH/7rT3sGc+83YAuCQwkDoEhrRv7zARiH0LaPayjJ+j2rph8br/w2pJfc7kvVSuWKN
 hyhRNBVYT+Fry53zUtj3uXl2tOWdJrF4r/uW4DmzxAaVjneEoVE2wrYuSz6N/MZ0aew2
 /Bkpi1qqW4CD+Zd74JN7EHdnQ8irnafS1VsMhdKF+hWA3lO2MWErlNzb2g0GNzFFx05D
 KK+CwoAPSgtlmDvQZKsl72PLhW1icOfKEonFnd51WB52+l8ZRJeLte0ksrL1vfJDJLvb
 n49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=eTWTQ86iF8oE2JgfmFwYwlTqQe2oQfzjy7OpPVSbPBA=;
 b=ZqXt0yz2sy9C++NXFDAAWE+ITxe3hQBRbykiYoW/O3h7kbNMAgtQn6SEyUntqKRdB7
 cBKxSA7rjoJaRh3LW0gbX1/dsS9iSlIOZlcV/GgzBI8xwnkByGiDApq7/NjszvCrtM1W
 YXT1o4EqJwrnj3Pk9P7Dq6DAkq0CTTWXvP0qilKA5VF7eKHAIUs7+C0/RLbVGkg2VPrJ
 4/BwrC6ZFJrAfeIWCSZdQjRv42AMjpuue9amPsovyp72KWKe2EdbNux5PaGmcm0pR+a1
 169wG7xv60QTpKNlwnIIEgApe9sHVrUDNl2khb+sEIBqhUhBfaA1x7DAchridC0wfgJO
 fv5Q==
X-Gm-Message-State: ALKqPwcZPPx5up8HIIPeJe63LI/KQY8Z31uCQEfxtPjeLoarUqld4hRh
 MAfBj0ly+XeaPqTz674LaR1EPkhS
X-Google-Smtp-Source: AB8JxZp6oCaowqnfpn35qLmR1MlKDnT0JV4iG4UxqPVk+jGqvlj4xkaarr3azSqKjgc86p7lwRHbuQ==
X-Received: by 2002:a9d:5014:: with SMTP id
 a20-v6mr1818001oth.205.1527087048470; 
 Wed, 23 May 2018 07:50:48 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local
 (cpe-72-182-100-19.austin.res.rr.com. [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id u13-v6sm9474573oia.37.2018.05.23.07.50.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 May 2018 07:50:48 -0700 (PDT)
Subject: Re: please add me into the email lists.
To: "Wang, Kuiying" <kuiying.wang@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <959CAFA1E282D14FB901BE9A7BF4E77249C6F4BA@SHSMSX101.ccr.corp.intel.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <33b199d4-e9b5-c96b-d2d9-5ba2269127ca@gmail.com>
Date: Wed, 23 May 2018 09:50:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E77249C6F4BA@SHSMSX101.ccr.corp.intel.com>
Content-Type: multipart/alternative;
 boundary="------------204933F674462FF53ADE0D9A"
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2018 14:50:52 -0000

This is a multi-part message in MIME format.
--------------204933F674462FF53ADE0D9A
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


On 5/23/18 3:28 AM, Wang, Kuiying wrote:
>
> Hi,
>
> I am working OpenBMC project.
>
> So please help add me into the shis email list, so that I can follow 
> openbmc topics.
>
It is self service - feel free to join: 
https://lists.ozlabs.org/listinfo/openbmc

Lol, I originally just replied to the list, which you would obviously 
not see yet.

Kurt Taylor (krtaylor)
>
> Thanks,
>
> Kuiying.
>


--------------204933F674462FF53ADE0D9A
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 5/23/18 3:28 AM, Wang, Kuiying
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:959CAFA1E282D14FB901BE9A7BF4E77249C6F4BA@SHSMSX101.ccr.corp.intel.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:\5B8B\4F53;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@\5B8B\4F53";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Hi,<o:p></o:p></p>
        <p class="MsoNormal">I am working OpenBMC project.<o:p></o:p></p>
        <p class="MsoNormal">So please help add me into the shis email
          list, so that I can follow openbmc topics.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
    </blockquote>
    It is self service - feel free to join:
    <a class="moz-txt-link-freetext" href="https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><br>
    <br>
    Lol, I originally just replied to the list, which you would
    obviously not see yet.<br>
    <br>
    Kurt Taylor (krtaylor)<br>
    <blockquote type="cite"
cite="mid:959CAFA1E282D14FB901BE9A7BF4E77249C6F4BA@SHSMSX101.ccr.corp.intel.com">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Thanks,<o:p></o:p></p>
        <p class="MsoNormal">Kuiying.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------204933F674462FF53ADE0D9A--
