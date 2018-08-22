Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::236; helo=mail-qt0-x236.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="h/HVnOAs"; 
 dkim-atps=neutral
Received: from mail-qt0-x236.google.com (mail-qt0-x236.google.com
 [IPv6:2607:f8b0:400d:c0d::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wg7Z6Qg9zDr4h
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 07:06:02 +1000 (AEST)
Received: by mail-qt0-x236.google.com with SMTP id n6-v6so3853534qtl.4
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 14:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fKxQn00+u4HiFL1zc+m67ixK2hiBTE7qjYm5LvIKtn8=;
 b=h/HVnOAswVvIRfs+CnfqePKP234lZEVBNOLINgrsPkhs23NqqHIS9tchYu9z7oQv/V
 9tYucYp234x6LUCoiQMeBLHNn+MWS81IJPBcD10ubFMDgnUOnLZP4mgPx3FKxusd77dE
 epvCMoiySUAYkda4DoEa9flzlsOEXoYtsz3L7Z7dWd6Y70LdHJa2DVQP26RbU05CqNlq
 MIz4unInT12omULTgsiW4NRrh186kZz4NrnLooI8WXMBwU2nSVlwSVMv6ZWJ3dh2sqdD
 ImLsCpfZUPyia9f0R5PY+CM2BPEYorgMN3sTCQf39pQ9izj5kHfAOrqAiXNQvnrSt07f
 ZQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fKxQn00+u4HiFL1zc+m67ixK2hiBTE7qjYm5LvIKtn8=;
 b=WUedAk1WpYLx6tpoqcmzLpBjxpxGq3Nt9nw0rrLqUhnqOvgXFCsXQCpvpb6enGes3Z
 DMmufi5FDyuhl33WkFVCuAlz9Tw8pMZgdrm23v0eVvzS4lDoRHbR8XdeWQtsxqxmsR3f
 /gWGZLj9O0swVABdy1tnH+sWyqbch75/JgjyMWsMC/ARnrUjqVzF+jCcIVyJ5raNpaqj
 xykF0mjKuZ3iRzVe4Nf1WGTipBFuYh1PmoYoeX3yrKBGVkpyUM4TDdd0IQzbjXKtY18y
 VghN73rZrUZqH8jfZjPpd83NokQByQ3gsNCxjnnNUjKibnl6qWpw9MWSHtp6H5MrFNpT
 NF4Q==
X-Gm-Message-State: APzg51CEEL4Qp97w72y/SFtrktgf9k13NEOJ1IpUDl1nACuqnSCGKuL0
 NMbeqOm3thLyQK/VIBu3t3qzLwunDJGcOaXqN1dUWQ==
X-Google-Smtp-Source: ANB0VdapV9XMsh6kJ2yPGcxAx7lYwVVirVaTsRAS/BmThCfrgafPAenhm2qC815lR12IUo34U0y4n+HDBAAzwzPi4eQ=
X-Received: by 2002:a0c:869b:: with SMTP id 27-v6mr4048421qvf.92.1534971959174; 
 Wed, 22 Aug 2018 14:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <920CDBC9D1D84B45ABBD357C997AC084E7AAC885@jtjnmailbox07.home.langchao.com>
 <915AC3F3-FEFC-45B6-B4BB-FD45C4DAF09F@stwcx.xyz>
In-Reply-To: <915AC3F3-FEFC-45B6-B4BB-FD45C4DAF09F@stwcx.xyz>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 22 Aug 2018 14:05:47 -0700
Message-ID: <CAJoAoZ=WgWozfohVf1YfEAHVsLjC_9-NkgK5jjKa_wXH4AWPQw@mail.gmail.com>
Subject: Re: ipmbd
To: Vernon Mauery <vmauery@gmail.com>, Tom Joseph <tomjose@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: =?UTF-8?B?Ik1pY2hhZWwgV2FuZyjnjovpuY8pIg==?= <wangpeng_bj@inspur.com>, 
 bradleyb@fuzziesquirrel.com
Content-Type: multipart/alternative; boundary="0000000000005e9f2705740c8210"
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
X-List-Received-Date: Wed, 22 Aug 2018 21:06:04 -0000

--0000000000005e9f2705740c8210
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

-Patrick, +other maintainers and list

Hi Michael,

It looks like ipmitool itself does have support headers for IPMB, but we
don't have much work done on the IPMB bridge:
https://github.com/openbmc/ipmbbridge

When you say that you need to "access" IPMB i'm a little confused as it's a
transport, not some source of information.  Can you make it a little more
clear what you're trying to do?

Emily

On Tue, Aug 21, 2018 at 3:24 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> Michael,
>
> Sorry, but I've not worked on the project for a significant amount of tim=
e
> now. I believe Emily is one of the maintainers of the IPMI subsystem.
>
> Emily, can you help out?
>
> Patrick
> Sent from my iPhone
>
> On Aug 20, 2018, at 10:04 AM, Michael Wang(=E7=8E=8B=E9=B9=8F) <wangpeng_=
bj@inspur.com>
> wrote:
>
> Hi patrick,
>
> we plan to launch a project on the X86 platform, and need to get
> information from the ME.
>
> I saw that you have implemented ipmb deamon and provided
> 0008-SendMessage_commad_for_IPMB_Communication.patch for
> phosphor-host-ipmid. (ProjectOlympusOpenBMC)
>
> But I found this patch was not appended to SRC_URI in
> phosphor-ipmi-host.bbappend.
>
>
>
> I want to know if ipmbd is already accessible via ipmitool, and if yes,
> please provide ipmitool command format.
>
> Looking forward to your reply.
>
>
>
> Thank you.
>
>
>
> =E7=8E=8B=E9=B9=8F5235
>
> =E9=AB=98=E7=AB=AF=E6=9C=8D=E5=8A=A1=E5=99=A8=E7=A0=94=E5=8F=91=E9=83=A8=
=EF=BC=8C=E7=A0=94=E5=8F=91=E5=85=AB=E5=A4=84
>
> =E6=B5=AA=E6=BD=AE=E9=9B=86=E5=9B=A2=E6=9C=89=E9=99=90=E5=85=AC=E5=8F=B8
>
> =E6=89=8B=E6=9C=BA=EF=BC=9A18866809625
>
> =E5=BA=A7=E6=9C=BA=EF=BC=9A0531-85104753
>
> =E9=82=AE=E7=AE=B1=EF=BC=9Awangpeng_bj@inspur.com
>
> =E5=9C=B0=E5=9D=80=EF=BC=9A=E5=B1=B1=E4=B8=9C=E7=9C=81=E6=B5=8E=E5=8D=97=
=E5=B8=82=E9=AB=98=E6=96=B0=E5=8C=BA=E6=B5=AA=E6=BD=AE=E8=B7=AF1036=E5=8F=
=B7 S05 3=E6=A5=BC
>
>
>
>

--0000000000005e9f2705740c8210
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>-Patrick,=C2=A0+other maintainers and list</div><div>=
<br></div>Hi Michael,<div><br></div><div>It looks like ipmitool itself does=
 have support headers for IPMB, but we don&#39;t have much work done on the=
 IPMB bridge:=C2=A0<a href=3D"https://github.com/openbmc/ipmbbridge">https:=
//github.com/openbmc/ipmbbridge</a><br><br>When you say that you need to &q=
uot;access&quot; IPMB i&#39;m a little confused as it&#39;s a transport, no=
t some source of information.=C2=A0 Can you make it a little more clear wha=
t you&#39;re trying to do?</div><div><br></div><div>Emily</div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr">On Tue, Aug 21, 2018 at 3:24 PM Patrick=
 Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">Michael,=
<div><br></div><div>Sorry, but I&#39;ve not worked on the project for a sig=
nificant amount of time now. I believe Emily is one of the maintainers of t=
he IPMI subsystem.=C2=A0</div><div><br></div><div>Emily, can you help out?<=
br><br><div id=3D"m_3356882396078880623AppleMailSignature">Patrick<div>Sent=
 from my iPhone</div></div><div><br>On Aug 20, 2018, at 10:04 AM, Michael W=
ang(=E7=8E=8B=E9=B9=8F) &lt;<a href=3D"mailto:wangpeng_bj@inspur.com" targe=
t=3D"_blank">wangpeng_bj@inspur.com</a>&gt; wrote:<br><br></div><blockquote=
 type=3D"cite"><div><div class=3D"m_3356882396078880623WordSection1"><p cla=
ss=3D"MsoNormal"><span lang=3D"EN-US">Hi patrick,<u></u><u></u></span></p><=
p class=3D"MsoNormal"><span lang=3D"EN-US">we plan to launch a project on t=
he X86 platform, and need to get information from the ME.<u></u><u></u></sp=
an></p><p class=3D"MsoNormal"><span lang=3D"EN-US">I saw that you have impl=
emented ipmb deamon and provided 0008-SendMessage_commad_for_IPMB_Communica=
tion.patch for phosphor-host-ipmid. (ProjectOlympusOpenBMC)<u></u><u></u></=
span></p><p class=3D"MsoNormal"><span lang=3D"EN-US">But I found this patch=
 was not appended to SRC_URI in phosphor-ipmi-host.bbappend.<u></u><u></u><=
/span></p><p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u><=
/span></p><p class=3D"MsoNormal"><span lang=3D"EN-US">I want to know if ipm=
bd is already accessible via ipmitool, and if yes, please provide ipmitool =
command format.<u></u><u></u></span></p><p class=3D"MsoNormal"><span lang=
=3D"EN-US">Looking forward to your reply.<u></u><u></u></span></p><p class=
=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p><p class=
=3D"MsoNormal"><span lang=3D"EN-US">Thank you.<u></u><u></u></span></p><p c=
lass=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p><p c=
lass=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;\005fae=
\008f6f\0096c5\009ed1&quot;,sans-serif;color:black;background:white">=E7=8E=
=8B=E9=B9=8F<span lang=3D"EN-US">5235<u></u><u></u></span></span></p><p cla=
ss=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;\005fae\0=
08f6f\0096c5\009ed1&quot;,sans-serif;color:black;background:white">=E9=AB=
=98=E7=AB=AF=E6=9C=8D=E5=8A=A1=E5=99=A8=E7=A0=94=E5=8F=91=E9=83=A8=EF=BC=8C=
=E7=A0=94=E5=8F=91=E5=85=AB=E5=A4=84<span lang=3D"EN-US"><u></u><u></u></sp=
an></span></p><p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-fa=
mily:&quot;\005fae\008f6f\0096c5\009ed1&quot;,sans-serif;color:black;backgr=
ound:white">=E6=B5=AA=E6=BD=AE=E9=9B=86=E5=9B=A2=E6=9C=89=E9=99=90=E5=85=AC=
=E5=8F=B8<span lang=3D"EN-US"><u></u><u></u></span></span></p><p class=3D"M=
soNormal"><span style=3D"font-size:9.0pt;font-family:&quot;\005fae\008f6f\0=
096c5\009ed1&quot;,sans-serif;color:black;background:white">=E6=89=8B=E6=9C=
=BA=EF=BC=9A<span lang=3D"EN-US">18866809625<u></u><u></u></span></span></p=
><p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;\0=
05fae\008f6f\0096c5\009ed1&quot;,sans-serif;color:black;background:white">=
=E5=BA=A7=E6=9C=BA=EF=BC=9A<span lang=3D"EN-US">0531-85104753 <u></u><u></u=
></span></span></p><p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;fo=
nt-family:&quot;\005fae\008f6f\0096c5\009ed1&quot;,sans-serif;color:black;b=
ackground:white">=E9=82=AE=E7=AE=B1=EF=BC=9A<span lang=3D"EN-US"><a href=3D=
"mailto:wangpeng_bj@inspur.com" target=3D"_blank"><span style=3D"color:#056=
3c1">wangpeng_bj@inspur.com</span></a><u></u><u></u></span></span></p><p cl=
ass=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span style=3D"f=
ont-size:9.0pt;font-family:&quot;\005fae\008f6f\0096c5\009ed1&quot;,sans-se=
rif;color:black">=E5=9C=B0=E5=9D=80=EF=BC=9A=E5=B1=B1=E4=B8=9C=E7=9C=81=E6=
=B5=8E=E5=8D=97=E5=B8=82=E9=AB=98=E6=96=B0=E5=8C=BA=E6=B5=AA=E6=BD=AE=E8=B7=
=AF<span lang=3D"EN-US">1036</span>=E5=8F=B7<span lang=3D"EN-US"> S05 3</sp=
an>=E6=A5=BC<span lang=3D"EN-US"><u></u><u></u></span></span></p><p class=
=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p></div></=
div></blockquote></div></div></blockquote></div></div>

--0000000000005e9f2705740c8210--
