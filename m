Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22a; helo=mail-qt0-x22a.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F8G3zbMo"; 
 dkim-atps=neutral
Received: from mail-qt0-x22a.google.com (mail-qt0-x22a.google.com
 [IPv6:2607:f8b0:400d:c0d::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4202Hc4Kv0zDr5Y
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 18:39:39 +1000 (AEST)
Received: by mail-qt0-x22a.google.com with SMTP id t5-v6so778921qtn.3
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+akt3lGtQkoh4UVqZRo/t2Ks7XzMFFDsaqTSKeXplxg=;
 b=F8G3zbMoy0eOnqDMO59Drx/QZy8Bi8y/gTbv5YQj5NFamy4qRFiqYiYgSnT51NI3hA
 wZ7A3cM7zUEyGGDCnVEly10ugkqERVW4jhQkNWHjE9tsaC/rRTmawfmhWBfH4ZFiOoFP
 nExu8i0C88PfbmviIrpu7gFt4L1Wp4v0D4LIPJn+TxT6CKYzy+G0f2g05u9yt4FUoS3d
 G9AJR218JdwQyEaBtUsCiN3EOdLNhiGD1FuYwAwafg3L9WzjFaWezOZVHs4I86UzLqz5
 035InYzAZBCqMlahRdi70H/M+7r9zs0keU67QpCXPMEqmwWXEI73BJsA+EqUmTS656Um
 PC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+akt3lGtQkoh4UVqZRo/t2Ks7XzMFFDsaqTSKeXplxg=;
 b=SbHQJtC+/A+QWSAhJRL2gtp6RSQOZM6diLOSSxog0kFzAS9+3OKR5e0sPkyBxZpbrL
 f3/mTtPLo+4biM54q/z34QLJKIht8Pcbrf2LEnEP7LORnlLQW9fX8HNs2SYXWOfckBJl
 ySGTI+zcPiV0xAl1Xpsbj66jBz5Ku7pdEb4/vKeabKlRc4nbMR8OEXznwAnzPdu4INk+
 wb7l5fzzw0rQnrVgUdzSkOE/TYL4BDmdi6EN5ss89LjWMzXGieAXKjAZ2e9x8jIEbBFz
 cA8A+NOek91ndbJBfzDwIjO0szsgsP68jHkq2/bccM6ziO0iX2zwsZxwClfksKH4ZB6q
 6PKg==
X-Gm-Message-State: APzg51ArMnCR4qc0bSzVEKbQy0s4jjUQKVfGk4nwuRkPTWFnZ6mjhFnQ
 bp2Kuv62D9+H6kuyXlj09jA7TVmXEl11sOgVl0I=
X-Google-Smtp-Source: ANB0VdaBMpwvw3vxcNrCEE2Xz63QwP1UntTPdsevzXwYyFtkA6FXFf00bOTzgWQDsCXr2lUBnkiILk63cFU8Lr4nWOM=
X-Received: by 2002:a0c:f1cd:: with SMTP id
 u13-v6mr488987qvl.114.1535445576624; 
 Tue, 28 Aug 2018 01:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cDKzx7VpmsrbeBuTQdVfQ7z3AYzGagWP0dKhSib7QkaZg@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E821699345836634@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345836634@ORSMSX114.amr.corp.intel.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Tue, 28 Aug 2018 16:39:25 +0800
Message-ID: <CAG9c7cALf94_127ZhA8a0aHOQeLdADcqi3QaedFa4tc64H5ZbA@mail.gmail.com>
Subject: Re: [IPMBD] ipmbSend handling
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000002ab08e05747ac86b"
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
X-List-Received-Date: Tue, 28 Aug 2018 08:39:41 -0000

--0000000000002ab08e05747ac86b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks to Ed's response.
I could build the 'ipmbbridged' successfully.

I find the ipmbbridged can execute the below steps after rough review.

1. Wait for the incoming IPMB request
from "/sys/bus/i2c/devices/0-1010/slave-mqueue"
2. Decode IPMB request from above 1 into netFn, rsLun, rqSA,
seq, rqLun and cmd.
3. Send the 'ReceivedMessage' signal with netFn, rsLun, rqSA, seq, rqLun
 and cmd.
4. ipmbMessageSend is called after the 'ReceivedMessage' signal is received=
.
5. In ipmbMessageSend(), it encodes the IPMB packet using netFn, rsLun, rqS=
A,
seq, rqLun and cmd.
6. And then send IPMB packet into "/dev/i2c-0"

Some questions about the ipmbbridged  daemon
1. how should I have "/sys/bus/i2c/devices/0-1010/slave-mqueue" in my
openbmc?
2. It doesn't seem any implementation to receive the IPMB response from
"/dev/i2c-0", right?

Thanks.
BRs,
Henbin

Tanous, Ed <ed.tanous@intel.com> =E6=96=BC 2018=E5=B9=B48=E6=9C=8828=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:14=E5=AF=AB=E9=81=93=EF=BC=9A

> This was a change in yocto made to the i2c-tools repo.  It formerly copie=
d
> i2c-dev.h to i2c-dev-user.h to help with the duplication between the two
> headers.  In modern packages, smbus.h should be used, which is part of th=
e
> refactor we=E2=80=99re doing that=E2=80=99s in progress.
>
>
>
> I will update the code review when it=E2=80=99s done, but it might take s=
ome time,
> as we=E2=80=99re tackling several other things at the same time.
>
>
>
> -Ed
>
>
>
> *From:* Henbin Chang [mailto:henbinchang@gmail.com]
> *Sent:* Monday, August 27, 2018 7:02 PM
> *To:* Tanous, Ed <ed.tanous@intel.com>; OpenBMC Maillist <
> openbmc@lists.ozlabs.org>
> *Subject:* [IPMBD] ipmbSend handling
>
>
>
> Hi Ed,
>
>
>
> I tried to build ipmbbridge but got the below error.
>
>
>
> Could you please share where I should get 'linux/i2c-dev-user.h'?
>
>
>
> |....
>
> | ../ipmbbridged.cpp:24:10: fatal error: linux/i2c-dev-user.h: No such
> file or directory
>
> |  #include <linux/i2c-dev-user.h>
>
> |           ^~~~~~~~~~~~~~~~~~~~~~
>
> | compilation terminated.
>
> | ...
>
>
>
> Thanks.
>
> BRs,
>
> Henbin
>

--0000000000002ab08e05747ac86b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks to Ed&#39;s response.<div>I could build the &#39;ip=
mbbridged&#39;=C2=A0successfully.</div><div><br></div><div>I find the ipmbb=
ridged=C2=A0can execute the below steps after rough review.</div><div><br><=
/div><div>1. Wait for the incoming IPMB request from=C2=A0&quot;/sys/bus/i2=
c/devices/0-1010/slave-mqueue&quot;</div><div>2. Decode IPMB request from a=
bove 1 into netFn,=C2=A0rsLun,=C2=A0rqSA, seq,=C2=A0rqLun=C2=A0and=C2=A0cmd=
.</div><div>3. Send the &#39;ReceivedMessage&#39; signal with=C2=A0<span cl=
ass=3D"gmail-gr_ gmail-gr_410 gmail-gr-alert gmail-gr_spell gmail-gr_inline=
_cards gmail-gr_disable_anim_appear gmail-ContextualSpelling gmail-ins-del =
gmail-multiReplace" id=3D"gmail-410" style=3D"display:inline;border-bottom:=
2px solid transparent;background-repeat:no-repeat">netFn</span>,=C2=A0<span=
 class=3D"gmail-gr_ gmail-gr_570 gmail-gr-alert gmail-gr_spell gmail-gr_inl=
ine_cards gmail-gr_run_anim gmail-ContextualSpelling gmail-ins-del gmail-mu=
ltiReplace" id=3D"gmail-570" style=3D"display:inline;border-bottom:2px soli=
d transparent;background-repeat:no-repeat">rsLun</span>,=C2=A0rqSA, seq,=C2=
=A0<span class=3D"gmail-gr_ gmail-gr_436 gmail-gr-alert gmail-gr_spell gmai=
l-gr_inline_cards gmail-gr_disable_anim_appear gmail-ContextualSpelling gma=
il-ins-del gmail-multiReplace" id=3D"gmail-436" style=3D"display:inline;bor=
der-bottom:2px solid transparent;background-repeat:no-repeat">rqLun</span>=
=C2=A0and=C2=A0cmd.</div><div>4.=C2=A0ipmbMessageSend is called after the &=
#39;ReceivedMessage&#39; signal is received.</div><div>5. In ipmbMessageSen=
d(), it encodes the IPMB packet using=C2=A0<span class=3D"gmail-gr_ gmail-g=
r_410 gmail-gr-alert gmail-gr_spell gmail-gr_inline_cards gmail-gr_disable_=
anim_appear gmail-ContextualSpelling gmail-ins-del gmail-multiReplace" id=
=3D"gmail-410" style=3D"display:inline;border-bottom:2px solid transparent;=
background-repeat:no-repeat"><span class=3D"gmail-gr_ gmail-gr_796 gmail-gr=
-alert gmail-gr_spell gmail-gr_inline_cards gmail-gr_disable_anim_appear gm=
ail-ContextualSpelling gmail-ins-del gmail-multiReplace" id=3D"gmail-796" s=
tyle=3D"display:inline;border-bottom:2px solid transparent;background-repea=
t:no-repeat;color:inherit;font-size:inherit">netFn</span></span>,=C2=A0<spa=
n class=3D"gmail-gr_ gmail-gr_570 gmail-gr-alert gmail-gr_spell gmail-gr_in=
line_cards gmail-gr_run_anim gmail-ContextualSpelling gmail-ins-del gmail-m=
ultiReplace" id=3D"gmail-570" style=3D"display:inline;border-bottom:2px sol=
id transparent;background-repeat:no-repeat"><span class=3D"gmail-gr_ gmail-=
gr_619 gmail-gr-alert gmail-gr_spell gmail-gr_inline_cards gmail-gr_disable=
_anim_appear gmail-ContextualSpelling gmail-ins-del gmail-multiReplace" id=
=3D"gmail-619" style=3D"display:inline;border-bottom:2px solid transparent;=
background-repeat:no-repeat;color:inherit;font-size:inherit">rsLun</span></=
span>,=C2=A0rqSA, seq,=C2=A0<span class=3D"gmail-gr_ gmail-gr_436 gmail-gr-=
alert gmail-gr_spell gmail-gr_inline_cards gmail-gr_disable_anim_appear gma=
il-ContextualSpelling gmail-ins-del gmail-multiReplace" id=3D"gmail-436" st=
yle=3D"display:inline;border-bottom:2px solid transparent;background-repeat=
:no-repeat"><span class=3D"gmail-gr_ gmail-gr_620 gmail-gr-alert gmail-gr_s=
pell gmail-gr_inline_cards gmail-gr_disable_anim_appear gmail-ContextualSpe=
lling gmail-ins-del gmail-multiReplace" id=3D"gmail-620" style=3D"display:i=
nline;border-bottom:2px solid transparent;background-repeat:no-repeat;color=
:inherit;font-size:inherit">rqLun</span></span>=C2=A0and=C2=A0cmd.</div><di=
v>6. And then send IPMB packet into=C2=A0&quot;/dev/i2c-0&quot;</div><div><=
br></div><div>Some questions about the=C2=A0<span class=3D"gmail-gr_ gmail-=
gr_60 gmail-gr-alert gmail-gr_spell gmail-gr_inline_cards gmail-gr_disable_=
anim_appear gmail-ContextualSpelling gmail-gr-progress" id=3D"gmail-60" sty=
le=3D"display:inline;border-bottom:2px solid transparent;background-repeat:=
no-repeat">ipmbbridged</span>=C2=A0 daemon</div><div>1. how should I have &=
quot;/sys/bus/i2c/devices/0-1010/slave-<span class=3D"gmail-gr_ gmail-gr_19=
0 gmail-gr-alert gmail-gr_spell gmail-gr_inline_cards gmail-gr_disable_anim=
_appear gmail-ContextualSpelling" id=3D"gmail-190" style=3D"display:inline;=
border-bottom:2px solid transparent;background-repeat:no-repeat">mqueue</sp=
an>&quot; in my openbmc?</div><div>2. It doesn&#39;t seem any implementatio=
n to receive=C2=A0the IPMB response from &quot;/dev/i2c-0&quot;, right?</di=
v><div><br></div><div>Thanks.</div><div>BRs,</div><div>Henbin</div><div><br=
></div><div><div class=3D"gmail_quote"><div dir=3D"ltr">Tanous, Ed &lt;<a h=
ref=3D"mailto:ed.tanous@intel.com">ed.tanous@intel.com</a>&gt; =E6=96=BC 20=
18=E5=B9=B48=E6=9C=8828=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:14=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_4010948474126502912WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">This was a change in yocto made to the i2c-t=
ools repo.=C2=A0 It formerly copied i2c-dev.h to i2c-dev-user.h to help wit=
h the duplication between the two headers.=C2=A0
 In modern packages, smbus.h should be used, which is part of the refactor =
we=E2=80=99re doing that=E2=80=99s in progress.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">I will update the code review when it=E2=80=
=99s done, but it might take some time, as we=E2=80=99re tackling several o=
ther things at the same time.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">-Ed<u></u><u></u></span></p>
<p class=3D"MsoNormal"><a name=3D"m_4010948474126502912__MailEndCompose"><s=
pan style=3D"font-size:11pt;font-family:Calibri,sans-serif;color:rgb(31,73,=
125)"><u></u>=C2=A0<u></u></span></a></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0in 0in 0in 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><a name=3D"m_4010948474126502912______replyseparator=
"></a><b><span style=3D"font-size:11pt;font-family:Calibri,sans-serif">From=
:</span></b><span style=3D"font-size:11pt;font-family:Calibri,sans-serif"> =
Henbin Chang [mailto:<a href=3D"mailto:henbinchang@gmail.com" target=3D"_bl=
ank">henbinchang@gmail.com</a>]
<br>
<b>Sent:</b> Monday, August 27, 2018 7:02 PM<br>
<b>To:</b> Tanous, Ed &lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"=
_blank">ed.tanous@intel.com</a>&gt;; OpenBMC Maillist &lt;<a href=3D"mailto=
:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&g=
t;<br>
<b>Subject:</b> [IPMBD] ipmbSend handling<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Hi Ed,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I tried to build ipmbbridge but got the below error.=
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Could you please share where I should get &#39;linux=
/i2c-dev-user.h&#39;?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">|....<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">| ../ipmbbridged.cpp:24:10: fatal error: linux/i2c-d=
ev-user.h: No such file or directory<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">|=C2=A0 #include &lt;linux/i2c-dev-user.h&gt;<u></u>=
<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~=
~~~~~~~~~~~~<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">| compilation terminated.<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal">| ...<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">BRs,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Henbin<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>

</blockquote></div></div></div>

--0000000000002ab08e05747ac86b--
