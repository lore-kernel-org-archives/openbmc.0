Return-Path: <yuenn@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::22f; helo=mail-io0-x22f.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RiQrvK+5"; 
 dkim-atps=neutral
Received: from mail-io0-x22f.google.com (mail-io0-x22f.google.com
 [IPv6:2607:f8b0:4001:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zMZMw3nTVzDqq1
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jan 2018 17:50:19 +1100 (AEDT)
Received: by mail-io0-x22f.google.com with SMTP id 25so23684229ioj.9
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 22:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=nLWe/an/Ea85EWqnhRrvnufHIcZ2cb6GMv3AlqgpvMk=;
 b=RiQrvK+5hKFJ9f9+c0OZIT4P6VpG9tQwUetb21I3BNX8PIVMsEK9jvKWFQ38LxLXK1
 vVs2ouFvComcP76NZdZ5+bcKZXQdH1UlfnBfWKtsD0NT3PpiHmnEYgN79WFNazjBR3L4
 KIT7Hr4mdD8rFs5NaBxrd8q/yxlsH0fglLw4t1PjJw4BXXV4ljZP0vfyQf6BC8DnnUo/
 Dx7jGa6GWOjbUEryUUfUlH6JT6Jz5ShacOs2OgPbjiOo3POwmpq488EmMXhiAXsmCpe4
 vr+rh4v3rfCbAKnhfDTFWj9Hp36K11dj1Uo0YR8Z0KG1w+RhBc0ON4bdi9QWlSiXoOgZ
 mQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nLWe/an/Ea85EWqnhRrvnufHIcZ2cb6GMv3AlqgpvMk=;
 b=qujibjg8kV8CyxbKcla0nNKeOUAPfyYu/n+wNuMTst565jSKo9BG8kKz+HTeYYN5Tv
 S7Fa7KLiLIzUp+cMIkeMqyWmXmH36l2MfkPS6rzkZkIdo2/Xf1iSUBbk7GfeFUZIvivi
 2ylcpnkDO4j20Hig1YBQC8MQ52QYN2M7T1jBd+DpyAoCnB97Fhs673R5DeICjxBdVBqi
 Eup1NpzU1Z82FsDxhW7pE/xfCWNCfK3RS636BgkHsKPSaktaFfOM6uuzc67vBZ+53w0H
 UZ6O6EJvYuePtQdVs/6ioOX7Eu6gZhhLF/HorMYpsFuPkR7Bmfewzt8BQl9fj0jZfqJr
 3fAQ==
X-Gm-Message-State: AKwxyteetQP/H7pT8hiQXCKXzcYwu03Fy96s2iXzwmXOJTORoTzDIt9f
 bdDZsfmRiO2eg/5Csfe+Oo8lwpQpSOCzFbyL9caivjB1
X-Google-Smtp-Source: ACJfBotD5Q98IjGBP2HOvvj5L5UVMaQCKCCzJfnrtp73joP7h+0T3/EYd+9TV8WW5zVjvmDrTFYqo0Us/CDwtuoUdeA=
X-Received: by 10.107.89.11 with SMTP id n11mr4674247iob.154.1516258216039;
 Wed, 17 Jan 2018 22:50:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.36.208 with HTTP; Wed, 17 Jan 2018 22:49:35 -0800 (PST)
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 17 Jan 2018 22:49:35 -0800
Message-ID: <CADfYTpFEwZ6bTwdZz5ea2YoS-Q8bW+ZyDXphi5cv=z-sp0PFzw@mail.gmail.com>
Subject: Summary of OpenBMC Hackathon Event @ Google Jan 2018
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="f4f5e80671985bb9f005630760e4"
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
X-List-Received-Date: Thu, 18 Jan 2018 06:50:21 -0000

--f4f5e80671985bb9f005630760e4
Content-Type: text/plain; charset="UTF-8"

Last week, the my team at Google hosted over 30 people from 9 organizations
for an OpenBMC hackathon at Google's Sunnyvale office.  Don't worry if you
missed this event.  We will be holding another community event in the next
3-6 momths, either a hackathon or a conference or something in between.
Details will be posted to this mailing list when they're available.

There were many great accomplishments during the hackathon.  A few
achievements off the top of my head:

   - Formed the OpenBMC Technical Steering Committee
   <https://github.com/openbmc/docs/blob/master/README.md> (scroll down to
   the bottom)
   - Assembled a preliminary roadmap
   <https://drive.google.com/open?id=1rPbZUmPYcqJRHYzlEn9oJyN_ZM40UVpR3_fXSxaIngg>
    based on the top priorities of participating organizations
   - Facebook brought up OpenBMC on 1 of their 3 platforms  (a second was
   close to booting)
   - Nuvoton worked with IBM's Linux team to fix up and send the Poleg clk
   driver for review
   - IBM and Intel collaborated
   <https://lists.ozlabs.org/pipermail/openbmc/2018-January/010432.html> to
   add Clang format coding standard validation to the CI job and gerrit in
   OpenBMC

There were other accomplishments, please feel free to reply with the ones
that I missed!

We wanted a face to face event to help build relationships and open
communications.  So in addition to hacking projects, we held a series of
technical sessions to help everyone sync on requirements, use cases, and
implementations that are done or in progress.  Here are some sessions we
held, including notes/slides that have been shared with me.

   - Joel Stanley @ IBM: OpenBMC Kernel
   <https://drive.google.com/open?id=1sY3FpzqNzfrtNXY8NfPe_EOdOnLuTM-e3AFiujF0piY>
   , KCS Kernel driver
   <https://drive.google.com/open?id=1IWk51Pq0OpHXooveOzU00SRUkXdMFwzZzhgT51ckL14>
   , firmware updates
   <https://drive.google.com/open?id=1xO3Vl_M5sY3lcCAAM3noBtleH1d9xk-bwqxzVbTX36o>
   - Vernon Mauery @ Intel: KVM and virtual media <https://goo.gl/h4LBtg>
   - James Fiest @ Intel: Runtime Platform Configuration
   <https://github.com/feistjj/docs/blob/master/platform_configuration.md>
   - Andrew Jeffrey @ IBM: Kernel and U-boot Development
   <https://drive.google.com/open?id=1bUGd061DGZEUGGfcum7h-QlLoUBbqCrmPoPhm5ZKmAc>
   , OpenBMC Testing
   <https://drive.google.com/open?id=158n0ZcUGxOv_dHFjix56xBeZyPeBH8ogF_zqx0haOaU>
   , Linux kernel support for BMCs
   <https://drive.google.com/open?id=1VIoaeSjaOyet1ZTBvY3J_Wgx1668Oah6y6RZQsAzup0>
   - Dong Wei @ Arm: PLDM MCTP
   <https://drive.google.com/open?id=1sC3xYFgnBwu1XfhUINcjmTjzZZM6hzLk>
   - Michael Brown @ Dell: Non-root daemons & least priviledge
   <https://lists.ozlabs.org/pipermail/openbmc/2018-January/010446.html>
   - Michael Brown @ Dell: SELinux
   - Brendan Higgins @ Google: gMocks and unit testing

The full schedule can be viewed here <https://goo.gl/xYCLS3>.

Organizations that sent representatives:

   - Arm
   - Aspeed
   - Dell
   - Facebook
   - IBM
   - Intel
   - Microsoft
   - Nuvoton
   - Qualcomm

People traveled from across the US, and as far away as Taiwan, Australia,
and India to attend.  Thank you everyone for making the trip to Google for
the hackathon!

----------
Nancy

--f4f5e80671985bb9f005630760e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr"><div class=3D"=
gmail_quote"><div dir=3D"ltr"><div>Last week, the my team at Google hosted =
over 30 people from 9 organizations for an OpenBMC hackathon at Google&#39;=
s Sunnyvale office.=C2=A0 Don&#39;t worry if you missed this event.=C2=A0 W=
e will be holding another community event in the next 3-6 momths, either a =
hackathon or a conference or something in between.=C2=A0 Details will be po=
sted to this mailing list when they&#39;re available.<br></div><div><br></d=
iv><div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial">There were many great accomplishments during the hackathon.=C2=A0 A =
few achievements off the top of my head:</div><div style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:small;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial"><div><ul><li>Formed the OpenBM=
C<span>=C2=A0</span><a href=3D"https://github.com/openbmc/docs/blob/master/=
README.md" target=3D"_blank" style=3D"color:rgb(17,85,204)">Technical Steer=
ing Committee</a>=C2=A0(scroll down to the bottom)</li><li>Assembled a prel=
iminary<span>=C2=A0</span><a href=3D"https://drive.google.com/open?id=3D1rP=
bZUmPYcqJRHYzlEn9oJyN_ZM40UVpR3_fXSxaIngg" target=3D"_blank" style=3D"color=
:rgb(17,85,204)">roadmap</a><span>=C2=A0</span>based on the top priorities =
of participating organizations</li><li>Facebook brought up OpenBMC on 1 of =
their 3 platforms=C2=A0 (a second was close to booting)</li><li>Nuvoton wor=
ked with IBM&#39;s Linux team to fix up and send the Poleg clk driver for r=
eview</li><li>IBM and Intel<span>=C2=A0</span><a href=3D"https://lists.ozla=
bs.org/pipermail/openbmc/2018-January/010432.html" target=3D"_blank" style=
=3D"color:rgb(17,85,204)">collaborated</a><span>=C2=A0</span>to add Clang f=
ormat coding standard validation to the CI job and gerrit in OpenBMC</li></=
ul></div><div>There were other accomplishments, please feel free to reply w=
ith the ones that I missed!</div></div></div><div><br></div><div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-s=
tyle:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-wei=
ght:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transfo=
rm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,25=
5);text-decoration-style:initial;text-decoration-color:initial"><div>We wan=
ted a face to face event to help build relationships and open communication=
s.=C2=A0 So in addition to hacking projects, we held a series of technical =
sessions to help everyone sync on requirements, use cases, and implementati=
ons that are done or in progress.=C2=A0 Here are some sessions we held, inc=
luding notes/slides that have been shared with me.</div></div><div style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial"><ul><li>Joel S=
tanley @ IBM:<span>=C2=A0</span><a href=3D"https://drive.google.com/open?id=
=3D1sY3FpzqNzfrtNXY8NfPe_EOdOnLuTM-e3AFiujF0piY" style=3D"color:rgb(17,85,2=
04)" target=3D"_blank">OpenBMC Kernel</a>,<span>=C2=A0</span><a href=3D"htt=
ps://drive.google.com/open?id=3D1IWk51Pq0OpHXooveOzU00SRUkXdMFwzZzhgT51ckL1=
4" style=3D"color:rgb(17,85,204)" target=3D"_blank">KCS Kernel driver</a>,<=
span>=C2=A0</span><a href=3D"https://drive.google.com/open?id=3D1xO3Vl_M5sY=
3lcCAAM3noBtleH1d9xk-bwqxzVbTX36o" style=3D"color:rgb(17,85,204)" target=3D=
"_blank">firmware updates</a></li><li>Vernon Mauery @ Intel:<span>=C2=A0</s=
pan><a href=3D"https://goo.gl/h4LBtg" style=3D"color:rgb(17,85,204)" target=
=3D"_blank">KVM and virtual media</a></li><li>James Fiest @ Intel:<span>=C2=
=A0</span><a href=3D"https://github.com/feistjj/docs/blob/master/platform_c=
onfiguration.md" style=3D"color:rgb(17,85,204)" target=3D"_blank">Runtime P=
latform Configuration</a></li><li>Andrew Jeffrey @ IBM:<span>=C2=A0</span><=
a href=3D"https://drive.google.com/open?id=3D1bUGd061DGZEUGGfcum7h-QlLoUBbq=
CrmPoPhm5ZKmAc" style=3D"color:rgb(17,85,204)" target=3D"_blank">Kernel and=
 U-boot Development</a>,<span>=C2=A0</span><a href=3D"https://drive.google.=
com/open?id=3D158n0ZcUGxOv_dHFjix56xBeZyPeBH8ogF_zqx0haOaU" style=3D"color:=
rgb(17,85,204)" target=3D"_blank">OpenBMC Testing</a>,<span>=C2=A0</span><s=
pan style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:sma=
ll;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:left;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline"><a href=3D"https://drive.google.com/open?id=3D1VIoae=
SjaOyet1ZTBvY3J_Wgx1668Oah6y6RZQsAzup0" style=3D"color:rgb(17,85,204)" targ=
et=3D"_blank">Linux kernel support for BMCs</a></span></li><li>Dong Wei @ A=
rm:<span>=C2=A0</span><a href=3D"https://drive.google.com/open?id=3D1sC3xYF=
gnBwu1XfhUINcjmTjzZZM6hzLk" style=3D"color:rgb(17,85,204)" target=3D"_blank=
">PLDM MCTP</a></li><li>Michael Brown @ Dell:<span>=C2=A0</span><a href=3D"=
https://lists.ozlabs.org/pipermail/openbmc/2018-January/010446.html" style=
=3D"color:rgb(17,85,204)" target=3D"_blank">Non-root daemons &amp; least pr=
iviledge</a></li><li>Michael Brown @ Dell: SELinux</li><li>Brendan Higgins =
@ Google: gMocks and unit testing</li></ul></div><div style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial"><div style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;text-decoration-style:initial;text-decoration-co=
lor:initial">The full schedule can be viewed<span>=C2=A0</span><a href=3D"h=
ttps://goo.gl/xYCLS3" style=3D"color:rgb(17,85,204)" target=3D"_blank">here=
</a>.</div></div></div><div><div><br></div><div style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:small;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">Organizations that sent representatives:<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l"><ul><li>Arm<br></li><li>Aspeed<br></li><li>Dell<br></li><li>Facebook<br>=
</li><li>IBM<br></li><li>Intel<br></li><li>Microsoft<br></li><li>Nuvoton<br=
></li><li>Qualcomm</li></ul></div></div><div style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:small;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;text-decoration-style:initial;text-decoration-color:init=
ial"><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al">People traveled from across the US, and as far away as Taiwan, Australi=
a, and India to attend.=C2=A0 Thank you everyone for making the trip to Goo=
gle for the hackathon!<br></div><br></div><div><div><div class=3D"m_1242765=
945499903401m_-2859788697005205518m_5821226900386423306m_-89840550292649232=
70m_-7665154368639989987m_-3057741678825984286m_-376106763124913210m_722945=
8256858516514m_-1815439812335273257m_4277441715708386753m_-4615960793691845=
02m_-1132867944998596037m_2509795597067950428m_-2085883210178090222gmail_si=
gnature" data-smartmail=3D"gmail_signature">----------<br>Nancy</div></div>=
</div></div></div></div></div></div></div>

--f4f5e80671985bb9f005630760e4--
