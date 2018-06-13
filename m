Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::22c; helo=mail-ot0-x22c.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mUSkRT5L"; 
 dkim-atps=neutral
Received: from mail-ot0-x22c.google.com (mail-ot0-x22c.google.com
 [IPv6:2607:f8b0:4003:c0f::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 415Yxs0d5dzDrcd
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jun 2018 03:43:12 +1000 (AEST)
Received: by mail-ot0-x22c.google.com with SMTP id r18-v6so3959802otk.1
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jun 2018 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=xTkcGyqgv1RLz68wLvEQjRbUykkzaAjpJBtAgnxPxd8=;
 b=mUSkRT5L396DDhOxNmj1skM3go3phumNOSOpyQ3++er4ZfmgwsHuKk2eTxlqKNTMCi
 RJQQAy0bLyX+XekQZLLtgWJ/OsP+rEQV2M3gO5zLKWEfoXlCRXmzEoeSGAi6ncqx22LI
 3mool034SLYFq5t7Zw30AzjTHRvDyPwVaqDJvWrMSU7/28Rb2DR+KFUytOTfI29GrrYi
 jhPK4lA19iX7OyCd2b38P0QbUzxJ6uSlhS3h/DSsu19oIiBzDgpkJ9533FuOL65dh8zy
 1ep+ViVSTw59I71Nn9E+oc/OsuvZ99mEPDmD34RnUI5xEjiRORHK7fbaOQecH6cZZ4hJ
 3m6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=xTkcGyqgv1RLz68wLvEQjRbUykkzaAjpJBtAgnxPxd8=;
 b=ICpEUY/BqCu4Ve9qny2PpqUlK3vAW9XjTjgV910fBHV/yqtpTSn6T5zaVmXLrEc7bT
 u7+eNhUvfdGNnRJLJ+/LsNRXfDJL5IZoYpSAQZRb12Ynw5HITnTdDGTn9NxFbMFCmJUF
 2KOlbFPGEL+GxBfkroc11jzo9JD28NEupK2uGi87cCbvUMs58t2Qj9PEv+6xa6IR5VtN
 z5+czgKBeuxouU/F392rh1x1bj6LLl2XRWnvYyooMeQ6+Mylx/CZm2vdaDIfw/yfWN96
 xNT3IhMsXmFvy7Y/sc1ZMgLBmbeu5yW8yckwOEZo5nItpQf5sxF/SG3HerOGROBVeIN4
 AvZg==
X-Gm-Message-State: APt69E0EzlpbtvcOX9roedfvznkN1MisCkrkRU6DL//qylsFMdhT3Lwh
 8kZzUbHHOEABnlh43TanxW0=
X-Google-Smtp-Source: ADUXVKLDvTTgrcxNIBp+MwpJPzhY5rJr6kXAlx5dsUPamnusPUBmpu0s/zB/cNRY361q7ssqgAQgKw==
X-Received: by 2002:a9d:16ce:: with SMTP id
 s14-v6mr3454846ots.113.1528911790273; 
 Wed, 13 Jun 2018 10:43:10 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local
 (cpe-72-182-100-19.austin.res.rr.com. [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id u14-v6sm1782485otf.26.2018.06.13.10.43.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Jun 2018 10:43:09 -0700 (PDT)
Subject: Re: License issue: Seems it is risky to use rsyslog which has
 multiple licenses (ex. GPL3+, LGPL3+, Apache 2.0 or open Solaris/CDDL)
To: "Wang, Kuiying" <kuiying.wang@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Cc: "Mihm, James" <james.mihm@intel.com>, "Li, Yong B" <yong.b.li@intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249DABE30@shsmsx102.ccr.corp.intel.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <2addbff9-0b25-f5fb-1aa4-5f42308499d7@gmail.com>
Date: Wed, 13 Jun 2018 12:43:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E77249DABE30@shsmsx102.ccr.corp.intel.com>
Content-Type: multipart/alternative;
 boundary="------------B29A7366A29BD7BC13B90E0B"
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
X-List-Received-Date: Wed, 13 Jun 2018 17:43:14 -0000

This is a multi-part message in MIME format.
--------------B29A7366A29BD7BC13B90E0B
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 6/12/18 2:11 AM, Wang, Kuiying wrote:
>
> Hi,
>
> According to the description, rsyslog “NOT license under a commercial 
> license” and has multiple licenses (ex. GPL3+, LGPL3+, Apache 2.0 or 
> open Solaris/CDDL), there is a big risk for OpenBMC to use rsyslog 
> project right?
>
> Does community aware of this?
>
> https://github.com/rsyslog/rsyslog
>
> /Rsyslog's main sponsor Adiscon tries to fund rsyslog by selling 
> custom development and support contracts. /
>
> /Adiscon does NOT license rsyslog under a commercial license (this is 
> simply impossible for anyone due to rsyslog's license structure)./
>
First off, I am not a lawyer. But, this statement simply means that they 
do not want to sell you a license, not that it is impossible.

Many open source projects are licensed under multiple licenses. It is up 
to the company building a product on an open source project to access 
whether or not the terms are acceptable for them. That said, when 
selecting one project to use over another, license definitely should be 
a factor in the decision process.
>
> //
>
> syslog-ng project should be much more friendly than rsyslog on license.
>
> https://github.com/balabit/syslog-ng/
>
This project is also licensed under multiple licenses: GPL and LGPL.

Kurt Taylor (krtaylor)


--------------B29A7366A29BD7BC13B90E0B
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 6/12/18 2:11 AM, Wang, Kuiying
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:959CAFA1E282D14FB901BE9A7BF4E77249DABE30@shsmsx102.ccr.corp.intel.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]-->
      <style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:SimSun;
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
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
        <p class="MsoNormal"><span style="color:#1F497D">Hi,<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D">According to
            the description, rsyslog “NOT license under a commercial
            license” and has multiple licenses (ex. GPL3+, LGPL3+,
            Apache 2.0 or open Solaris/CDDL), there is a big risk for
            OpenBMC to use rsyslog project right?<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D">Does community
            aware of this?<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D"><a
              href="https://github.com/rsyslog/rsyslog"
              moz-do-not-send="true">https://github.com/rsyslog/rsyslog</a>
            <o:p></o:p></span></p>
        <p class="MsoNormal"><i><span style="font-family:&quot;Segoe
              UI&quot;,sans-serif;color:#24292E;background:white">Rsyslog's
              main sponsor Adiscon tries to fund rsyslog by selling
              custom development and support contracts.
              <o:p></o:p></span></i></p>
        <p class="MsoNormal"><i><span style="font-family:&quot;Segoe
              UI&quot;,sans-serif;color:#24292E;background:white">Adiscon
              does NOT license rsyslog under a commercial license (this
              is simply impossible for anyone due to rsyslog's license
              structure).</span></i></p>
      </div>
    </blockquote>
    First off, I am not a lawyer. But, this statement simply means that
    they do not want to sell you a license, not that it is impossible.<br>
    <br>
    Many open source projects are licensed under multiple licenses. It
    is up to the company building a product on an open source project to
    access whether or not the terms are acceptable for them. That said,
    when selecting one project to use over another, license definitely
    should be a factor in the decision process.<br>
    <blockquote type="cite"
cite="mid:959CAFA1E282D14FB901BE9A7BF4E77249DABE30@shsmsx102.ccr.corp.intel.com">
      <div class="WordSection1">
        <p class="MsoNormal"><i><span style="font-family:&quot;Segoe
              UI&quot;,sans-serif;color:#24292E;background:white"><o:p></o:p></span></i></p>
        <p class="MsoNormal"><span style="color:#1F497D"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D">syslog-ng
            project should be much more friendly than rsyslog on
            license.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D"><a
              href="https://github.com/balabit/syslog-ng/"
              moz-do-not-send="true">https://github.com/balabit/syslog-ng/</a></span></p>
      </div>
    </blockquote>
    This project is also licensed under multiple licenses: GPL and LGPL.<br>
    <br>
    Kurt Taylor (krtaylor)<br>
    <br>
  </body>
</html>

--------------B29A7366A29BD7BC13B90E0B--
