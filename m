Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22a; helo=mail-vk0-x22a.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UACDP8XQ"; 
 dkim-atps=neutral
Received: from mail-vk0-x22a.google.com (mail-vk0-x22a.google.com
 [IPv6:2607:f8b0:400c:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLRlD62kCzDqjm
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 06:47:51 +1100 (AEDT)
Received: by mail-vk0-x22a.google.com with SMTP id n184so1368784vka.7
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 12:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Zo2AztxQeKvePPU+UZwwPidykn+BrKW6zYzMjSYWzdQ=;
 b=UACDP8XQeTk/DnGitjZrnzCLNmltKpxMKvKS8nVS/QYI7xyQJ2sXYxWCukTC0RZsRD
 w02nWs5ko/9tf6ZUZ7x9SGYp2hAB2YRWZdxrx8sTK7rXuMH2hs9sdpnx2XJzWOhdkK7e
 VJXXuDIZtkAhxwlNnxFcrbK5F0KQTtQV9b08kjDlntxqS9u7+FE7oPyU3S14cdsRA8Do
 zVSSXMnPA9wVSWOOzCAdA4A4Z4LhIU8NTnUWiTIDk229S+inBmY5GZLraPC3l/NZaxDb
 SP+tBNXR2X44GWnx4IYeCf1Hyog+pOmxzlyi42X0QcpnOV3K6Qddy1I0k0z3Ak2XLTZ2
 a3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Zo2AztxQeKvePPU+UZwwPidykn+BrKW6zYzMjSYWzdQ=;
 b=ZHcZreZSCOYEnSpqexb2SQGYRE37IelOz8VardXC9Ws6LrvIOvMvWiX8OByy+l4Lfs
 9m8p0cwruEd0Y8QN7C3jKec41xAcLVVk4AqSXZpzgOs7c9n3NOWiZMwwz71CDDsQSthI
 TtmSjv57/xCDQkknR6JdMjh6I3dpi9lViScZUHpEgTf4tJ6TUx1HY8fccsVoSuhXKz8k
 +OorEjmMiSl9jic9GNIXh9n2OZTx8LGD/pou8RHjgRvQndEq+bRls/1OVyYFlM60FIf8
 tfat/G/XayLEkyuMmPKaaWZ8spScc/8ASSY62XY/Pd9fz/DgUswlQLo3Kc4HKUQUGgCg
 PY2w==
X-Gm-Message-State: AMCzsaXRsbwXar/RvqWvKS0yVl719XHAmO4egKd0VQUyQhefc6AQBjzy
 eFT0RPa2eZYI3nYLsNLT830zUgthGlfws0TPCVfsDPr5
X-Google-Smtp-Source: ABhQp+Q0bHX5R284Ww4+yIskbXyq71OT2w8jKVj4kNkMKBJ568DQVWWFaXBhmtFg3kkZjVQi0CTFHjdSO+HZUa/+GTI=
X-Received: by 10.31.151.21 with SMTP id z21mr9938362vkd.44.1508788068382;
 Mon, 23 Oct 2017 12:47:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.70.4 with HTTP; Mon, 23 Oct 2017 12:47:47 -0700 (PDT)
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932EAECDD8@ORSMSX105.amr.corp.intel.com>
References: <2971e0b7-6339-35f6-b0e3-1901020ed46a@elsoft.ch>
 <7E9441B1E5EFFD4681F54958E82169932EAECC2A@ORSMSX105.amr.corp.intel.com>
 <CAPLgG=nsq1XiJZ_86nJHYAqOHFmM6i2_=XW+Ls-2iRQsXvu2VQ@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932EAECDD8@ORSMSX105.amr.corp.intel.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 23 Oct 2017 12:47:47 -0700
Message-ID: <CAPLgG=nMCiosGck5=4oQ9yRCkhgsrQ_p7-fMg=75WPTy5UL-UA@mail.gmail.com>
Subject: Re: PECI API?
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: =?UTF-8?Q?David_M=C3=BCller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>, 
 OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a1140e866dbfc46055c3c1863"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Oct 2017 19:47:53 -0000

--001a1140e866dbfc46055c3c1863
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2017 at 12:39 PM, Tanous, Ed <ed.tanous@intel.com> wrote:

> =E2=80=9CRather than a PECI API, would it make any sense to define a an a=
bstract
> concept API, where one implementation of it has a PECI backend?=E2=80=9D
>
>
>
> I don=E2=80=99t think so, but that=E2=80=99s partially why I asked about =
use cases.  PECI
> can be thought of a lot like SMBus, with some fancy protocol level featur=
es
> that make it easier to implement.  It=E2=80=99s a generic interface that =
can be
> used for any number of things, including temperature readings from
> processors and memory.  Our intention was to implement it as a device
> driver (/dev/peci), with (one or several) dbus daemons reading and pushin=
g
> information to dbus using the existing openbmc interfaces (sensor,
> threshold, logging ect).  There was also talk of implementing it as a hwm=
on
> driver, but I think that discussion was deferred, given that the number o=
f
> =E2=80=9Csensors=E2=80=9D needs to be determined at runtime, and that did=
n=E2=80=99t seem to fit in
> the hwmon model.  This work is ongoing, so I don=E2=80=99t have a timefra=
me on
> completion or its level of robustness, but if there=E2=80=99s interest, I=
 can
> probably push the WIP to a branch or a repo somewhere.
>
>
>

hwmon has APIs for dynamically adding sensors at runtime.  For temps,
volts, etc, I prefer an hwmon driver built atop a PECI subsystem.


> =E2=80=9CIs there a kernel subsystem for PECI defined upstream?  I'm not =
aware of
> a PECI device driver for Aspeed upstream.=E2=80=9D
>
> I don=E2=80=99t believe there is one defined upstream, but I believe the =
first
> revision of the driver code we are using was derived from the Aspeed SDK.
>

What happens when Nuvoton sends their driver?


>
>
> -Ed
>
>
>
>
>
> -----Original Message-----
> From: openbmc [mailto:openbmc-bounces+ed.tanous=3Dintel.com@lists.ozlabs.=
org]
> On Behalf Of Brad Bishop
> Sent: Monday, October 23, 2017 12:17 PM
> To: "David M=C3=BCller (ELSOFT AG)" <d.mueller@elsoft.ch>
> Cc: OpenBMC <openbmc@lists.ozlabs.org>
> Subject: Re: PECI API?
>
>
>
>
>
> > On Oct 21, 2017, at 4:57 AM, David M=C3=BCller (ELSOFT AG) <
> d.mueller@elsoft.ch> wrote:
>
> >
>
> > Hello
>
> >
>
> > Is anyone working on an API definition for PECI?
>
> >
>
> >
>
> > Dave
>
>
>
> Full disclosure - the Wikipedia article is the extent of my background on
> PECI.
>
>
>
> Rather than a PECI API, would it make any sense to define a an abstract
> concept API, where one implementation of it has a PECI backend?
>
>
>
> My cursory glance at the Wikipedia article suggests PECI provides
> temperature readings (I=E2=80=99m sure it does much more) but the basic t=
hought
> process I=E2=80=99ve outlined would allow control applications or metric =
gathering
> applications, etc to be re-used irrespective of where the data is coming
> from.
>
>
>
> -brad
>
>
>
>
>
> *From:* Rick Altherr [mailto:raltherr@google.com]
> *Sent:* Monday, October 23, 2017 12:02 PM
> *To:* Tanous, Ed <ed.tanous@intel.com>
> *Cc:* David M=C3=BCller (ELSOFT AG) <d.mueller@elsoft.ch>; OpenBMC <
> openbmc@lists.ozlabs.org>
> *Subject:* Re: PECI API?
>
>
>
> Is there a kernel subsystem for PECI defined upstream?  I'm not aware of =
a
> PECI device driver for Aspeed upstream.
>
>
>
> On Mon, Oct 23, 2017 at 9:44 AM, Tanous, Ed <ed.tanous@intel.com> wrote:
>
> We had looked at building one, and had one prototyped for a simple
> read/write interface, but we were on the fence about whether such a low
> level control (PECI read/write) should be put on dbus at all for security
> reasons, especially when the drivers read/write API isn't that difficult =
to
> use.
>
> What are you looking at doing with it?
>
> -Ed
>
>
> -----Original Message-----
> From: openbmc [mailto:openbmc-bounces+ed.tanous=3Dintel.com@lists.ozlabs.=
org]
> On Behalf Of David M=C3=BCller (ELSOFT AG)
> Sent: Saturday, October 21, 2017 1:57 AM
> To: OpenBMC <openbmc@lists.ozlabs.org>
> Subject: PECI API?
>
> Hello
>
> Is anyone working on an API definition for PECI?
>
>
> Dave
>
>
>

--001a1140e866dbfc46055c3c1863
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Oct 23, 2017 at 12:39 PM, Tanous, Ed <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.tanous@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_5034264857258747810WordSection1">
<p class=3D"m_5034264857258747810MsoPlainText"><span style=3D"color:#1f497d=
">=E2=80=9C</span>Rather than a PECI API, would it make any sense to define=
 a an abstract concept API, where one implementation of it has a PECI backe=
nd?=E2=80=9D<u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">I don=E2=80=99t think so, but that=E2=
=80=99s partially why I asked about use cases.=C2=A0 PECI can be thought of=
 a lot like SMBus, with some fancy protocol level features that make
 it easier to implement.=C2=A0 It=E2=80=99s a generic interface that can be=
 used for any number of things, including temperature readings from process=
ors and memory.=C2=A0 Our intention was to implement it as a device driver =
(/dev/peci), with (one or several) dbus daemons reading
 and pushing information to dbus using the existing openbmc interfaces (sen=
sor, threshold, logging ect).=C2=A0 There was also talk of implementing it =
as a hwmon driver, but I think that discussion was deferred, given that the=
 number of =E2=80=9Csensors=E2=80=9D needs to be determined
 at runtime, and that didn=E2=80=99t seem to fit in the hwmon model.=C2=A0 =
This work is ongoing, so I don=E2=80=99t have a timeframe on completion or =
its level of robustness, but if there=E2=80=99s interest, I can probably pu=
sh the WIP to a branch or a repo somewhere.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0</span></p></div></div><=
/blockquote><div><br></div><div>hwmon has APIs for dynamically adding senso=
rs at runtime.=C2=A0 For temps, volts, etc, I prefer an hwmon driver built =
atop a PECI subsystem.</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div lang=3D"EN-US" link=3D"blue" vlink=3D"purple"><div class=3D"m_5034264=
857258747810WordSection1"><p class=3D"MsoNormal"><span style=3D"font-size:1=
1.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1f497d"><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">=E2=80=9C</span>Is there a kernel sub=
system for PECI defined upstream?=C2=A0 I&#39;m not aware of a PECI device =
driver for Aspeed upstream.=E2=80=9D<u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">I don=E2=80=99t believe there is one =
defined upstream, but I believe the first revision of the driver code we ar=
e using was derived from the Aspeed SDK.</span></p></div></div></blockquote=
><div><br></div><div>What happens when Nuvoton sends their driver?</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div lang=3D"EN-US" link=3D"bl=
ue" vlink=3D"purple"><div class=3D"m_5034264857258747810WordSection1"><p cl=
ass=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif;color:#1f497d"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">-Ed<u></u><u></u></span></p><span cla=
ss=3D"">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"m_5034264857258747810MsoPlainText">-----Original Message-----<b=
r>
From: openbmc [mailto:<a href=3D"mailto:openbmc-bounces%2Bed.tanous" target=
=3D"_blank">openbmc-bounces+ed.<wbr>tanous</a>=3D<a href=3D"mailto:intel.co=
m@lists.ozlabs.org" target=3D"_blank">intel.com@lists.ozlabs.<wbr>org</a>] =
On Behalf Of Brad Bishop<br>
Sent: Monday, October 23, 2017 12:17 PM<br>
To: &quot;David M=C3=BCller (ELSOFT AG)&quot; &lt;<a href=3D"mailto:d.muell=
er@elsoft.ch" target=3D"_blank">d.mueller@elsoft.ch</a>&gt;<br>
Cc: OpenBMC &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blan=
k">openbmc@lists.ozlabs.org</a>&gt;<br>
Subject: Re: PECI API?<u></u><u></u></p>
<p class=3D"m_5034264857258747810MsoPlainText"><u></u>=C2=A0<u></u></p>
<p class=3D"m_5034264857258747810MsoPlainText"><u></u>=C2=A0<u></u></p>
<p class=3D"m_5034264857258747810MsoPlainText">&gt; On Oct 21, 2017, at 4:5=
7 AM, David M=C3=BCller (ELSOFT AG) &lt;<a href=3D"mailto:d.mueller@elsoft.=
ch" target=3D"_blank"><span style=3D"color:windowtext;text-decoration:none"=
>d.mueller@elsoft.ch</span></a>&gt; wrote:<u></u><u></u></p>
<p class=3D"m_5034264857258747810MsoPlainText">&gt; <u></u><u></u></p>
</span><span class=3D""><p class=3D"m_5034264857258747810MsoPlainText">&gt;=
 Hello<u></u><u></u></p>
<p class=3D"m_5034264857258747810MsoPlainText">&gt; <u></u><u></u></p>
<p class=3D"m_5034264857258747810MsoPlainText">&gt; Is anyone working on an=
 API definition for PECI?<u></u><u></u></p>
<p class=3D"m_5034264857258747810MsoPlainText">&gt; <u></u><u></u></p>
<p class=3D"m_5034264857258747810MsoPlainText">&gt; <u></u><u></u></p>
<p class=3D"m_5034264857258747810MsoPlainText">&gt; Dave<u></u><u></u></p>
<p class=3D"m_5034264857258747810MsoPlainText"><u></u>=C2=A0<u></u></p>
</span><p class=3D"m_5034264857258747810MsoPlainText">Full disclosure - the=
 Wikipedia article is the extent of my background on PECI.<u></u><u></u></p=
><span class=3D"">
<p class=3D"m_5034264857258747810MsoPlainText"><u></u>=C2=A0<u></u></p>
<p class=3D"m_5034264857258747810MsoPlainText">Rather than a PECI API, woul=
d it make any sense to define a an abstract concept API, where one implemen=
tation of it has a PECI backend?<u></u><u></u></p>
<p class=3D"m_5034264857258747810MsoPlainText"><u></u>=C2=A0<u></u></p>
<p class=3D"m_5034264857258747810MsoPlainText">My cursory glance at the Wik=
ipedia article suggests PECI provides temperature readings (I=E2=80=99m sur=
e it does much more) but the basic thought process I=E2=80=99ve outlined wo=
uld allow control applications or metric gathering applications, etc to
 be re-used irrespective of where the data is coming from.<u></u><u></u></p=
>
<p class=3D"m_5034264857258747810MsoPlainText"><u></u>=C2=A0<u></u></p>
<p class=3D"m_5034264857258747810MsoPlainText">-brad<u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
</span><p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-famil=
y:&quot;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:=
11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> Rick Altherr [mailto:<a=
 href=3D"mailto:raltherr@google.com" target=3D"_blank">raltherr@google.com<=
/a>]
<br>
<b>Sent:</b> Monday, October 23, 2017 12:02 PM<br>
<b>To:</b> Tanous, Ed &lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"=
_blank">ed.tanous@intel.com</a>&gt;<br>
<b>Cc:</b> David M=C3=BCller (ELSOFT AG) &lt;<a href=3D"mailto:d.mueller@el=
soft.ch" target=3D"_blank">d.mueller@elsoft.ch</a>&gt;; OpenBMC &lt;<a href=
=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs=
.org</a>&gt;<br>
<b>Subject:</b> Re: PECI API?<u></u><u></u></span></p><div><div class=3D"h5=
">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Is there a kernel subsystem for PECI defined upstrea=
m?=C2=A0 I&#39;m not aware of a PECI device driver for Aspeed upstream.=C2=
=A0=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On Mon, Oct 23, 2017 at 9:44 AM, Tanous, Ed &lt;<a h=
ref=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.tanous@intel.com</a=
>&gt; wrote:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal">We had looked at building one, and had one prototype=
d for a simple read/write interface, but we were on the fence about whether=
 such a low level control (PECI read/write) should be put on dbus at all fo=
r security reasons, especially when
 the drivers read/write API isn&#39;t that difficult to use.<br>
<br>
What are you looking at doing with it?<br>
<span style=3D"color:#888888"><br>
<span class=3D"m_5034264857258747810hoenzb">-Ed</span></span><u></u><u></u>=
</p>
<div>
<div>
<p class=3D"MsoNormal"><br>
-----Original Message-----<br>
From: openbmc [mailto:<a href=3D"mailto:openbmc-bounces%2Bed.tanous" target=
=3D"_blank">openbmc-bounces+ed.<wbr>tanous</a>=3D<a href=3D"mailto:intel.co=
m@lists.ozlabs.org" target=3D"_blank">intel.com@lists.ozlabs.<wbr>org</a>] =
On Behalf Of David M=C3=BCller (ELSOFT AG)<br>
Sent: Saturday, October 21, 2017 1:57 AM<br>
To: OpenBMC &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blan=
k">openbmc@lists.ozlabs.org</a>&gt;<br>
Subject: PECI API?<br>
<br>
Hello<br>
<br>
Is anyone working on an API definition for PECI?<br>
<br>
<br>
Dave<u></u><u></u></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div></div></div>
</div>

</blockquote></div><br></div></div>

--001a1140e866dbfc46055c3c1863--
