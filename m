Return-Path: <bill@opencompute.org>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=opencompute.org
 (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=bill@opencompute.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=opencompute.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=opencompute-org.20150623.gappssmtp.com
 header.i=@opencompute-org.20150623.gappssmtp.com header.b="ogMJRm/X"; 
 dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FK2V1fwJzF3JC
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 09:29:18 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id b129-v6so1756604pga.13
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 16:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=opencompute-org.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=C4MuPUaEX6ZzBvYi8syIj6No4LsBPdMkSw0oBN5lcw0=;
 b=ogMJRm/XH+cJ5xqwYI/iU7ApV6SShKjBa61UQQHKbSmZhwTN97xTDQG7RlTanZbyK3
 VGtmtdiqwhHm4ojA33JYAlB5TmmCRZMeqP5X3Xbj/ylNsU4gZdGU234jqFKqi4WBU9/T
 Yhmhp2n91qo7x7mmbg4r0yId6KlGm4jhC+jLBfKFL0NiZYwWZ07mnTWPLauku8JMrTwd
 t4JWsqxPVH2KDURWM2TLO1hcczjR0o4LIzEvQfsVLrvKDZHWk3RRwjWwviDxyMLYxMIx
 rzuk9KJsqOSARYnrn4fRysGDzUcb5e62HJddHjgcuPkzd3CqQdq57Fvh2fqWwmkTLAc5
 7MIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=C4MuPUaEX6ZzBvYi8syIj6No4LsBPdMkSw0oBN5lcw0=;
 b=q1H1oUEUvTTx8E3Iid5HgtJ8SzoOqm1S92O6BFZn4SlXB7ySYN0aDLpNHnHGWdnlrZ
 FADJx71JDuaXVm7seJmBIt9+UHiO4UAvQBtQSCUJ9QT1XT9AKRfBaB7YrNgBp6ctX6l5
 GuwjwojD40f6X8SgJyhXN3bVYAWyAYGvcHc0Lt9rZan7jzxWAEN5xPZp0EvFG3jBJ7NT
 vJs6lc2HD1DVGuRc8M1dh0dANVVnocsb/u+Piy7jqpem+xewZkR5dZC4sleMKOT2zpfl
 TwyoyWSd2zJXlqTc2VHKPw+9mHoJ2LEfCTUL2kEQkvoIogoFGrdK2EVMwm2i7W+WStx1
 rHqA==
X-Gm-Message-State: APzg51BCiF38nxUDAsTEN+CITA3sXAeWFtdgrmDYeDdF3c3TgWex/MC1
 6i3hR84ldp3wSCqFYP6bvuyhyA==
X-Google-Smtp-Source: ANB0VdZ+w3Xlp28/7VRjtaaybK1vJDpp8wYVI40ny0rWTzCRStkNv135YHzJHbBAt+BfuxviryPFzg==
X-Received: by 2002:a63:91c2:: with SMTP id
 l185-v6mr30302758pge.321.1537313355807; 
 Tue, 18 Sep 2018 16:29:15 -0700 (PDT)
Received: from [10.180.0.142] ([45.56.155.240])
 by smtp.gmail.com with ESMTPSA id n22-v6sm35734320pfj.68.2018.09.18.16.29.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Sep 2018 16:29:15 -0700 (PDT)
From: William Carter <bill@opencompute.org>
Message-Id: <EA2B3E04-0939-4E61-819D-B1AC31DB77CE@opencompute.org>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_C16F65F8-2166-4F25-B5E6-BBABFA5E2AE8"
Mime-Version: 1.0 (Mac OS X Mail 11.4 \(3445.8.2\))
Subject: Re: OpenBMC Hackathon @ OpenPower Summit
Date: Wed, 19 Sep 2018 07:29:11 +0800
In-Reply-To: <F14EC3A3-3D10-481C-965F-86006FA6AD6D@fb.com>
Cc: Joseph Reynolds <jrey@us.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
To: Sai Dasari <sdasari@fb.com>
References: <F14EC3A3-3D10-481C-965F-86006FA6AD6D@fb.com>
X-Mailer: Apple Mail (2.3445.8.2)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2018 23:29:24 -0000


--Apple-Mail=_C16F65F8-2166-4F25-B5E6-BBABFA5E2AE8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

The OCP summit presentations are all recorded and available on youtube.  =
May be able to link to those. =20

Engineering Workshop: OpenBMC

OpenBMC Hardware Platform Development Guideline, Robert Feng - video =
<http://www.youtube.com/watch?v=3DeldXTI0x-DI>, slides =
<https://www.opencompute.org/files/OCP18-OCP-HW-Robert-Feng-v3.2.pdf>
Google's Work on OpenBMC, Nancy Yuen - video =
<http://www.youtube.com/watch?v=3D3sGZu7Io6Yo>, slides =
<https://www.opencompute.org/files/OpenBMC-in-Google-Platforms-2018.pdf>
OpenBMC on Project Olympus, Ali Larijani - video =
<http://www.youtube.com/watch?v=3DRT0YKrBDgfs>, slides =
<https://www.opencompute.org/files/OCP18-ProjectOlympus-OpenBMC.PDF>
Facebook OpenBMC Updates, Sai Dasari; Christopher Covington - video =
<http://www.youtube.com/watch?v=3DI_rVVmOMmeU>, slides =
<https://www.opencompute.org/files/OCP18-Facebook-OpenBMC-v6.pdf>
OpenBMC End User Features and Function, Andrew Geissler - video =
<http://www.youtube.com/watch?v=3DGfzHtHUA1SE>, slides =
<https://www.opencompute.org/files/OCP18-OpenBMC-End-User-Features.pdf>
State of OpenBMC Development, Brad Bishop - video =
<http://www.youtube.com/watch?v=3DseVW9hU32GI>, slides =
<https://www.opencompute.org/files/OCP18-OpenBMC-State-of-Development.pdf>=

Intel=E2=80=99s Journey with OpenBMC, James Mihm - video =
<http://www.youtube.com/watch?v=3DIh4QQ-OjweM>, slides =
<https://www.opencompute.org/files/Intels-Journey-w-OpenBMCJamesMihm-OCP18=
.pdf>

Bill


> On Sep 19, 2018, at 5:23 AM, Sai Dasari <sdasari@fb.com> wrote:
>=20
> >>- Can some the presentations or sessions be written up and added to =
the openbmc/docs repo?  It is sometimes hard to find presentations after =
they are done.  It is also much easier to keep details up to date when =
they are in a plain text format (compared to powerpoint).
> =20
> Great idea! Most of the presentations we do are in powerpoint (or =
converted to pdf for distribution). Is there a standard practice on how =
to share these in openbmc/docs repo? i.e open a gerrit request for =
review and add? We have few presentations from last OCP summit =
(March=E2=80=9918) and another one upcoming OCP summit in Oct=E2=80=9918.=20=

> =20
> >>- As a thought experiment, how much of your presentations can you =
give by simply referring to existing OpenBMC documentation, such as is =
in the repos under github.com/openbmc? <http://github.com/openbmc?>  If =
you need to explain more, can that information be added to the OpenBMC =
docs?
> Some of the presentation material is essential background/context on =
BMC=E2=80=99s use cases. Besides that the content should reflect the =
openbmc community work i.e. existing design/implementation,  describing =
workgroup, features planned for next release, features pending etc.


--Apple-Mail=_C16F65F8-2166-4F25-B5E6-BBABFA5E2AE8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">The =
OCP summit presentations are all recorded and available on youtube. =
&nbsp;May be able to link to those. &nbsp;<div class=3D""><br =
class=3D""></div><div class=3D""><p style=3D"box-sizing: inherit; =
margin: 0px 0px 1.5rem; color: rgb(95, 96, 98); font-family: =
franklin-gothic-urw, -apple-system, system-ui, &quot;Segoe UI&quot;, =
Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 18px; =
font-variant-ligatures: normal; orphans: 2; widows: 2;" class=3D""><span =
style=3D"box-sizing: inherit;" class=3D"">Engineering Workshop: =
OpenBMC</span></p><ul style=3D"box-sizing: inherit; margin: 0px 0px =
1.5rem; padding-left: 1.11111rem; color: rgb(95, 96, 98); font-family: =
franklin-gothic-urw, -apple-system, system-ui, &quot;Segoe UI&quot;, =
Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 18px; =
font-variant-ligatures: normal; orphans: 2; widows: 2;" class=3D""><li =
style=3D"box-sizing: inherit;" class=3D"">OpenBMC Hardware Platform =
Development Guideline, Robert Feng -&nbsp;<a =
href=3D"http://www.youtube.com/watch?v=3DeldXTI0x-DI" target=3D"_blank" =
style=3D"box-sizing: inherit; color: rgb(141, 198, 63); transition: all =
0.15s ease 0s; text-decoration: none;" class=3D"">video</a>,&nbsp;<a =
href=3D"https://www.opencompute.org/files/OCP18-OCP-HW-Robert-Feng-v3.2.pd=
f" target=3D"_blank" style=3D"box-sizing: inherit; color: rgb(141, 198, =
63); transition: all 0.15s ease 0s; text-decoration: none;" =
class=3D"">slides</a></li><li style=3D"box-sizing: inherit;" =
class=3D"">Google's Work on OpenBMC, Nancy Yuen -&nbsp;<a =
href=3D"http://www.youtube.com/watch?v=3D3sGZu7Io6Yo" target=3D"_blank" =
style=3D"box-sizing: inherit; color: rgb(141, 198, 63); transition: all =
0.15s ease 0s; text-decoration: none;" class=3D"">video</a>,&nbsp;<a =
href=3D"https://www.opencompute.org/files/OpenBMC-in-Google-Platforms-2018=
.pdf" target=3D"_blank" style=3D"box-sizing: inherit; color: rgb(141, =
198, 63); transition: all 0.15s ease 0s; text-decoration: none;" =
class=3D"">slides</a></li><li style=3D"box-sizing: inherit;" =
class=3D"">OpenBMC on Project Olympus, Ali Larijani -&nbsp;<a =
href=3D"http://www.youtube.com/watch?v=3DRT0YKrBDgfs" target=3D"_blank" =
style=3D"box-sizing: inherit; color: rgb(141, 198, 63); transition: all =
0.15s ease 0s; text-decoration: none;" class=3D"">video</a>,&nbsp;<a =
href=3D"https://www.opencompute.org/files/OCP18-ProjectOlympus-OpenBMC.PDF=
" target=3D"_blank" style=3D"box-sizing: inherit; color: rgb(141, 198, =
63); transition: all 0.15s ease 0s; text-decoration: none;" =
class=3D"">slides</a></li><li style=3D"box-sizing: inherit;" =
class=3D"">Facebook OpenBMC Updates, Sai Dasari; Christopher Covington =
-&nbsp;<a href=3D"http://www.youtube.com/watch?v=3DI_rVVmOMmeU" =
target=3D"_blank" style=3D"box-sizing: inherit; color: rgb(141, 198, =
63); transition: all 0.15s ease 0s; text-decoration: none;" =
class=3D"">video</a>,&nbsp;<a =
href=3D"https://www.opencompute.org/files/OCP18-Facebook-OpenBMC-v6.pdf" =
target=3D"_blank" style=3D"box-sizing: inherit; color: rgb(141, 198, =
63); transition: all 0.15s ease 0s; text-decoration: none;" =
class=3D"">slides</a></li><li style=3D"box-sizing: inherit;" =
class=3D"">OpenBMC End User Features and Function, Andrew Geissler =
-&nbsp;<a href=3D"http://www.youtube.com/watch?v=3DGfzHtHUA1SE" =
target=3D"_blank" style=3D"box-sizing: inherit; color: rgb(141, 198, =
63); transition: all 0.15s ease 0s; text-decoration: none;" =
class=3D"">video</a>,&nbsp;<a =
href=3D"https://www.opencompute.org/files/OCP18-OpenBMC-End-User-Features.=
pdf" target=3D"_blank" style=3D"box-sizing: inherit; color: rgb(141, =
198, 63); transition: all 0.15s ease 0s; text-decoration: none;" =
class=3D"">slides</a></li><li style=3D"box-sizing: inherit;" =
class=3D"">State of OpenBMC Development, Brad Bishop -&nbsp;<a =
href=3D"http://www.youtube.com/watch?v=3DseVW9hU32GI" target=3D"_blank" =
style=3D"box-sizing: inherit; color: rgb(141, 198, 63); transition: all =
0.15s ease 0s; text-decoration: none;" class=3D"">video</a>,&nbsp;<a =
href=3D"https://www.opencompute.org/files/OCP18-OpenBMC-State-of-Developme=
nt.pdf" target=3D"_blank" style=3D"box-sizing: inherit; color: rgb(141, =
198, 63); transition: all 0.15s ease 0s; text-decoration: none;" =
class=3D"">slides</a></li><li style=3D"box-sizing: inherit;" =
class=3D"">Intel=E2=80=99s Journey with OpenBMC, James Mihm -&nbsp;<a =
href=3D"http://www.youtube.com/watch?v=3DIh4QQ-OjweM" target=3D"_blank" =
style=3D"box-sizing: inherit; color: rgb(141, 198, 63); transition: all =
0.15s ease 0s; text-decoration: none;" class=3D"">video</a>,&nbsp;<a =
href=3D"https://www.opencompute.org/files/Intels-Journey-w-OpenBMCJamesMih=
m-OCP18.pdf" target=3D"_blank" style=3D"box-sizing: inherit; color: =
rgb(141, 198, 63); transition: all 0.15s ease 0s; text-decoration: =
none;" class=3D"">slides</a></li><li class=3D""></li></ul><div =
class=3D""><br class=3D""></div><div class=3D"">Bill</div><div =
class=3D""><br class=3D""><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">On Sep 19, 2018, at 5:23 AM, Sai Dasari =
&lt;<a href=3D"mailto:sdasari@fb.com" class=3D"">sdasari@fb.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"WordSection1" style=3D"page: WordSection1; caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><span =
style=3D"font-size: 10.5pt; font-family: Arial, sans-serif;" =
class=3D"">&gt;&gt;- Can some the presentations or sessions be written =
up and added to the openbmc/docs repo?&nbsp; It is sometimes hard to =
find presentations after they are done.&nbsp; It is also much easier to =
keep details up to date when they are in a plain text format (compared =
to powerpoint).<o:p class=3D""></o:p></span></div><div style=3D"margin: =
0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">Great idea! Most of the presentations we do are in powerpoint =
(or converted to pdf for distribution). Is there a standard practice on =
how to share these in openbmc/docs repo? i.e open a gerrit request for =
review and add? We have few presentations from last OCP summit =
(March=E2=80=9918) and another one upcoming OCP summit in Oct=E2=80=9918.<=
span class=3D"Apple-converted-space">&nbsp;</span><o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></div><div class=3D""><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><span style=3D"font-size: 10.5pt; font-family: Arial, =
sans-serif;" class=3D"">&gt;&gt;- As a thought experiment, how much of =
your presentations can you give by simply referring to existing OpenBMC =
documentation, such as is in the repos under<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://github.com/openbmc?" style=3D"color: purple; =
text-decoration: underline;" class=3D"">github.com/openbmc?</a>&nbsp; If =
you need to explain more, can that information be added to the OpenBMC =
docs?<o:p class=3D""></o:p></span></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">Some of the presentation material is essential =
background/context on BMC=E2=80=99s use cases. Besides that the content =
should reflect the openbmc community work i.e. existing =
design/implementation, &nbsp;describing workgroup, features planned for =
next release, features pending =
etc.</div></div></div></div></blockquote></div><br =
class=3D""></div></div></body></html>=

--Apple-Mail=_C16F65F8-2166-4F25-B5E6-BBABFA5E2AE8--
