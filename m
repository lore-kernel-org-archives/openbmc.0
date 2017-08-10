Return-Path: <v.vovchenko@yadro.com>
X-Greylist: delayed 343 seconds by postgrey-1.36 at bilbo;
 Thu, 10 Aug 2017 10:22:44 AEST
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="qJ/kdUTd"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSTP04L0szDqrP
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 10:22:44 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 0E0F8460A8;
 Thu, 10 Aug 2017 00:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-type:content-type:content-language
 :accept-language:in-reply-to:references:message-id:date:date
 :subject:subject:from:from:received:received:received:received
 :received; s=mta-01; t=1502324212; x=1504138613; bh=ClMnzaW8Ixh7
 xB/gTQLkPHNAojaQdRQs3847naePj+g=; b=qJ/kdUTdI0lfj6L0CI0MEUAA/epq
 PX5lyxQVhlJVrQ954axNADYkZlzx/YMbUIc+fPSORxmmYBHWX//3bt1VN3FR0gZP
 ZPQYneSk9p1sp8tnnZjm2aZkhlAxeYrAK2fRVU5rvY39pVpvl08Il6eLS0+9P9Ry
 arJ0ZQGjTTt8FXM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sTQIQJ_YcmUr; Thu, 10 Aug 2017 03:16:52 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 7572F45F54;
 Thu, 10 Aug 2017 03:16:52 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (172.17.10.101) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 10 Aug 2017 03:16:52 +0300
Received: from T-EXCH-02.corp.yadro.com (172.17.10.102) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 10 Aug 2017 03:16:51 +0300
Received: from T-EXCH-02.corp.yadro.com ([fe80::54b6:fc59:bf02:491c]) by
 T-EXCH-02.corp.yadro.com ([fe80::54b6:fc59:bf02:491c%14]) with mapi id
 15.01.0669.032; Thu, 10 Aug 2017 03:16:51 +0300
From: Vlad Vochenko <v.vovchenko@yadro.com>
To: tomjose <tomjose@linux.vnet.ibm.com>, Ilya Kuznetsov <ilya@yadro.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Patrick Williams
 <patrick@stwcx.xyz>
Subject: Re: phosphor-net-ipmid
Thread-Topic: phosphor-net-ipmid
Thread-Index: AQHS9ui5rlnY6CJ3+0aVUcYBjSIWd6J87e3E
Date: Thu, 10 Aug 2017 00:16:51 +0000
Message-ID: <e480ae55aed543da94febf325a0c8713@yadro.com>
References: <201706230720.v5N7K755030029@mactruck.svl.corp.google.com>
 <CAFd5g47f6Cd3GYnrZPKZ+Hnamm1narto9zmGffDpfyKdtAu-7g@mail.gmail.com>,
 <595F2772.1020602@linux.vnet.ibm.com>
In-Reply-To: <595F2772.1020602@linux.vnet.ibm.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.17.1.166]
Content-Type: multipart/alternative;
 boundary="_000_e480ae55aed543da94febf325a0c8713yadrocom_"
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Aug 2017 13:05:18 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Aug 2017 00:22:46 -0000

--_000_e480ae55aed543da94febf325a0c8713yadrocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm gonna implement issue #1855. Is it already assigned to someone?


Have a nice day!


Regards,

Vladislav

________________________________
From: tomjose <tomjose@linux.vnet.ibm.com>
Sent: Friday, July 7, 2017 9:17:22 AM
To: Ilya Kuznetsov
Cc: Vlad Vochenko; openbmc@lists.ozlabs.org; Patrick Williams
Subject: Re: phosphor-net-ipmid


Hello Ilya,

Appreciate your interest in contributing to OpenBMC project!

There is some good progress with the Sensor & SEL commands. The review is u=
p in the
gerrit server, please feel free to take a look.

https://gerrit.openbmc-project.xyz/#/c/5048/
https://gerrit.openbmc-project.xyz/#/c/4162/8

We have started off with the implementation of the DCMI specification which=
 is closely related to IPMI.

https://www.intel.com/content/dam/www/public/us/en/documents/technical-spec=
ifications/dcmi-v1-5-rev-spec.pdf

It would be great if you would be able to lend a helping hand with this epi=
c. The stories are getting
broken down for this epic. If you are interested in this area, i would assi=
gn the following issue.
The issue is updated with the necessary information to carry out the task.

https://github.com/openbmc/openbmc/issues/1855

We can catch up on IRC or on the mailing list to discuss further.

Regards,
Tom

On Saturday 24 June 2017 12:02 AM, Brendan Higgins wrote:
Whoops, looks like you already hopped on the IRC. Anyways, welcome!

On Fri, Jun 23, 2017 at 12:20 AM <<mailto:brendanhiggins@google.com>brendan=
higgins@google.com<mailto:brendanhiggins@google.com>> wrote:
> Hello,
> we would like to help with phosphor-net-ipmid and have volunteer. For us =
main
> priorities are sensors and sel. Obviously work is in progress there and w=
e don't
> want to duplicate it, so please share tasks with us and tell how we can
> contribute?
> Thanks!

Awesome! Always great to see more people getting involved!

The first thing to do would be to hop on the IRC channel: #openbmc on
freenode.net<http://freenode.net> and say hi to everyone.

Next, in order to see what tasks we have going on, install Zenhub:
https://www.zenhub.com/. Then look at https://github.com/openbmc/openbmc#bo=
ards

Probably also a good idea to talk to Patrick and Tom (I CC'ed them). I am p=
retty
sure they are more familiar with that codebase than anyone else.

Once you know what you want to work on, or even if you just need some help,
either start a conversation on the IRC channel or send an email to the list=
.

phosphor-net-ipmid is not something I work on or am likely to work on in th=
e
near future, but I think I know most of the people on the list, so feel fre=
e to
CC me on future emails and I will try to make sure the right people are inv=
olved
in the conversation.

Cheers!


--_000_e480ae55aed543da94febf325a0c8713yadrocom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body text=3D"#000000" bgcolor=3D"#FFFFFF">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Arial,Helvetica,sans-serif;">
<p>Hello,<br>
<br>
I'm gonna implement issue #1855. Is it already assigned to someone?</p>
<p><br>
</p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt; color:#000000; ba=
ckground-color:#FFFFFF; font-family:Calibri,Arial,Helvetica,sans-serif">
<p>Have a nice day!</p>
<p><br>
</p>
<p>Regards,</p>
<p>Vladislav</p>
</div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> tomjose &lt;tomjose@l=
inux.vnet.ibm.com&gt;<br>
<b>Sent:</b> Friday, July 7, 2017 9:17:22 AM<br>
<b>To:</b> Ilya Kuznetsov<br>
<b>Cc:</b> Vlad Vochenko; openbmc@lists.ozlabs.org; Patrick Williams<br>
<b>Subject:</b> Re: phosphor-net-ipmid</font>
<div>&nbsp;</div>
</div>
<div><br>
Hello Ilya,<br>
<br>
Appreciate your interest in contributing to OpenBMC project!<br>
<br>
There is some good progress with the Sensor &amp; SEL commands. The review =
is up in the<br>
gerrit server, please feel free to take a look.<br>
<br>
<a class=3D"moz-txt-link-freetext" href=3D"https://gerrit.openbmc-project.x=
yz/#/c/5048/">https://gerrit.openbmc-project.xyz/#/c/5048/</a><br>
<a class=3D"moz-txt-link-freetext" href=3D"https://gerrit.openbmc-project.x=
yz/#/c/4162/8">https://gerrit.openbmc-project.xyz/#/c/4162/8</a><br>
<br>
We have started off with the implementation of the DCMI specification which=
 is closely related to IPMI.
<br>
<br>
<a class=3D"moz-txt-link-freetext" href=3D"https://www.intel.com/content/da=
m/www/public/us/en/documents/technical-specifications/dcmi-v1-5-rev-spec.pd=
f">https://www.intel.com/content/dam/www/public/us/en/documents/technical-s=
pecifications/dcmi-v1-5-rev-spec.pdf</a><br>
<br>
It would be great if you would be able to lend a helping hand with this epi=
c. The stories are getting<br>
broken down for this epic. If you are interested in this area, i would assi=
gn the following issue.<br>
The issue is updated with the necessary information to carry out the task.<=
br>
<br>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openbmc/openb=
mc/issues/1855">https://github.com/openbmc/openbmc/issues/1855</a><br>
<br>
We can catch up on IRC or on the mailing list to discuss further.<br>
<br>
Regards,<br>
Tom<br>
<br>
<div class=3D"moz-cite-prefix">On Saturday 24 June 2017 12:02 AM, Brendan H=
iggins wrote:<br>
</div>
<blockquote cite=3D"mid:CAFd5g47f6Cd3GYnrZPKZ&#43;Hnamm1narto9zmGffDpfyKdtA=
u-7g@mail.gmail.com" type=3D"cite">
<div dir=3D"ltr">Whoops, looks like you already hopped on the IRC. Anyways,=
 welcome!</div>
<br>
<div class=3D"gmail_quote">
<div dir=3D"ltr">On Fri, Jun 23, 2017 at 12:20 AM &lt;<a moz-do-not-send=3D=
"true" href=3D"mailto:brendanhiggins@google.com"></a><a class=3D"moz-txt-li=
nk-abbreviated" href=3D"mailto:brendanhiggins@google.com">brendanhiggins@go=
ogle.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; Hello,<br>
&gt; we would like to help with phosphor-net-ipmid and have volunteer. For =
us main<br>
&gt; priorities are sensors and sel. Obviously work is in progress there an=
d we don't<br>
&gt; want to duplicate it, so please share tasks with us and tell how we ca=
n<br>
&gt; contribute?<br>
&gt; Thanks!<br>
<br>
Awesome! Always great to see more people getting involved!<br>
<br>
The first thing to do would be to hop on the IRC channel: #openbmc on<br>
<a moz-do-not-send=3D"true" href=3D"http://freenode.net" rel=3D"noreferrer"=
 target=3D"_blank">freenode.net</a> and say hi to everyone.<br>
<br>
Next, in order to see what tasks we have going on, install Zenhub:<br>
<a moz-do-not-send=3D"true" href=3D"https://www.zenhub.com/" rel=3D"norefer=
rer" target=3D"_blank">https://www.zenhub.com/</a>. Then look at
<a moz-do-not-send=3D"true" href=3D"https://github.com/openbmc/openbmc#boar=
ds" rel=3D"noreferrer" target=3D"_blank">
https://github.com/openbmc/openbmc#boards</a><br>
<br>
Probably also a good idea to talk to Patrick and Tom (I CC'ed them). I am p=
retty<br>
sure they are more familiar with that codebase than anyone else.<br>
<br>
Once you know what you want to work on, or even if you just need some help,=
<br>
either start a conversation on the IRC channel or send an email to the list=
.<br>
<br>
phosphor-net-ipmid is not something I work on or am likely to work on in th=
e<br>
near future, but I think I know most of the people on the list, so feel fre=
e to<br>
CC me on future emails and I will try to make sure the right people are inv=
olved<br>
in the conversation.<br>
<br>
Cheers!<br>
</blockquote>
</div>
</blockquote>
<br>
</div>
</body>
</html>

--_000_e480ae55aed543da94febf325a0c8713yadrocom_--
