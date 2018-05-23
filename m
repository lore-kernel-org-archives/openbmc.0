Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::22e; helo=mail-ot0-x22e.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X1//Kvwj"; 
 dkim-atps=neutral
Received: from mail-ot0-x22e.google.com (mail-ot0-x22e.google.com
 [IPv6:2607:f8b0:4003:c0f::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40rb1r2QmhzF0pl
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 00:46:39 +1000 (AEST)
Received: by mail-ot0-x22e.google.com with SMTP id l12-v6so25498077oth.6
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 07:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=d1C2nsSEWEts6brBXeWLthPZXIRov924tJDFnWJu0vk=;
 b=X1//KvwjwPVY9zKZWTNvfQZlAWrPm4DZxbLjFB19qFtVKBImrYVDGcVkmVfqZ6DDY4
 /N+AZTApYrtpdsEnc52DDzZ1G7QEMEZWhoxpRKAZpni6R0iZAixgmBQeY1uo0sm2KrVk
 sgz1bc9JnDVwO9+RItyDezLP+lNTlbiBeALfNZq3FsQrBp8pdbIE3JWv0rlerMqC/98w
 +t1+MI7hwN2MgEb6cqHUHIwA16URvl1eDma8cv//8U1ZwYTIBY2dQ8NNL1/HxJvdjlIh
 i+Lv0gPumdRxzI/ogM+R6qOCJzLdQFbs4S4+XdPRcbqdgRvEOhaaA78i+0JDymFkAnXr
 L+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=d1C2nsSEWEts6brBXeWLthPZXIRov924tJDFnWJu0vk=;
 b=kEwl3fB9LN7Ek7yH99WM2/G3SumPBVqNZ7ZFFk71XPhxBTTwzr90D5f2oYyLz+zQSt
 gv9cPKLy6l5vDWtuK+PR1rRrjSKTuckjbZ9UqPVkMb8hGInG8JtVPhfcKUIOjB2WmNyw
 qv1ktZmT1prqAq5zrxPCV/YkxaQOA1+uYCvcN3R5XnAaxOvPHD7QwC5zLzV9sjOP3UDM
 KiRhyYdpwnOQ7SflUMChoeLIJZZBi52EhQ8Epeu8QEisLhU+mZ4ufg+1PMx6biJMWtMJ
 PTH+cErT43lHz0hhfy7P3hZj+uWXDp0KzOr3Qz4QntBY5wWHeMDK4hxFSQAjS3JxF9dy
 n1Eg==
X-Gm-Message-State: ALKqPwdp8ZQjx7S+yWzEpKLjSW0R7Jqu8TzRyWocTLDlzQX7iqTMdEat
 kCs/rMZs9pWGgLgjhrshkcSDvC/o
X-Google-Smtp-Source: AB8JxZqEqayKFTz1JySJw/jOzGStAsJX0sFXfS1si7+puEFnhKIVGuRjXkR08ajpZcsa9rcyLw+Pjw==
X-Received: by 2002:a9d:1a68:: with SMTP id
 u37-v6mr2101100otu.233.1527086797092; 
 Wed, 23 May 2018 07:46:37 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local
 (cpe-72-182-100-19.austin.res.rr.com. [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id h11-v6sm11739021ote.72.2018.05.23.07.46.36
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 May 2018 07:46:36 -0700 (PDT)
Subject: Re: please add me into the email lists.
To: openbmc@lists.ozlabs.org
References: <959CAFA1E282D14FB901BE9A7BF4E77249C6F4BA@SHSMSX101.ccr.corp.intel.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <49081897-3f0a-c92b-5211-2d0f78c8872f@gmail.com>
Date: Wed, 23 May 2018 09:46:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E77249C6F4BA@SHSMSX101.ccr.corp.intel.com>
Content-Type: multipart/alternative;
 boundary="------------605A34B03F48F7E55FF3E705"
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
X-List-Received-Date: Wed, 23 May 2018 14:46:41 -0000

This is a multi-part message in MIME format.
--------------605A34B03F48F7E55FF3E705
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

It is self-serve, feel free to join: 
https://lists.ozlabs.org/listinfo/openbmc
>
> Thanks,
>
> Kuiying.
>


--------------605A34B03F48F7E55FF3E705
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
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
      </div>
    </blockquote>
    <br>
    It is self-serve, feel free to join:
    <a class="moz-txt-link-freetext" href="https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><br>
    <blockquote type="cite"
cite="mid:959CAFA1E282D14FB901BE9A7BF4E77249C6F4BA@SHSMSX101.ccr.corp.intel.com">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Thanks,<o:p></o:p></p>
        <p class="MsoNormal">Kuiying.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------605A34B03F48F7E55FF3E705--
