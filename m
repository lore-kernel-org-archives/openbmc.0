Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::232; helo=mail-qk0-x232.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hd/JgFEy"; 
 dkim-atps=neutral
Received: from mail-qk0-x232.google.com (mail-qk0-x232.google.com
 [IPv6:2607:f8b0:400d:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Yrh12jMkzDqnK
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jul 2018 16:10:25 +1000 (AEST)
Received: by mail-qk0-x232.google.com with SMTP id v17-v6so9498987qkb.11
 for <openbmc@lists.ozlabs.org>; Sun, 22 Jul 2018 23:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=OxW70M1AN0lO+g2nRwTVJrkisALa1UV8w2nuqhObNXY=;
 b=hd/JgFEyCHQiOrMQnk4uAnAi0/9KJI0hC9NsoL2HJAEJ2WWgWQ0IY/vTlOmbM7/txD
 RAlaVw+zCpYsK0RTGhS27+PwUZnN+YS8UWZ9rN9VaMGJJUA6nckP4jak1jQQ9hH7+2JN
 CasYwwpg91sits1nV7oqA4AP5IuKUwyNW/z3IdOylz3XG/jqDeTifoUwuXJK6xmmRh8z
 iezg+arhOmWLbAaD68i0UWC6KSmmyV4WS7ynkMzkJ//a71kxV5p/113Lek8fbw0IWFK3
 AI+QlLiGCL5xONrT5AX6CnHj3QVv1qI4jyxV743xP3MnSykXoYUQ6bcM5F4d4M3GzEon
 snYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=OxW70M1AN0lO+g2nRwTVJrkisALa1UV8w2nuqhObNXY=;
 b=a1u4RIYqLPp0rKU3jgVqgJMGUx4+ZST1l3K54UfriT8nyymahG7TAajKtf46jgOZPd
 DTiVUPrTN+Swc0larpGU/ooHQ6LP0h5f2c/oMmri3+A8Xlpr43og8zQdkuIiFIb8mtWT
 QwfEpXTYJVsSe8uM2uNfzUdNYxCLN+0FQ1OgSSptpCqgMWdUMizeOJ8DvGCNgGq43MTz
 BFSsj+vm5j5RJvQiZDaOaj+irofXpCqY04IJQRCTwxEL2/nmTdSLnks7AgBVsy1xw4s4
 iqaPsnI1Xvii4VxabPAX7+jJeVReulfbg8Su4+gnJYyHIeoxx6apwavcDShP2blQmSYf
 Cozw==
X-Gm-Message-State: AOUpUlFnrkuaV8JcsZxVpyuCjoY4Whanyl2yf8UX5wkpWAx6NI+ETLiz
 Xl6U78uC0ikb6jpo4arFDKFY0JWBxa8+1jNMHDw=
X-Google-Smtp-Source: AAOMgpfNzsmV7rHRuRCyZf3pf3NNLAggZdeGLb1KuB4OatEiCOJ7SXS5m1C2VZQ5cWYrlU9LFRdM9fpcW6t7JsI1TEA=
X-Received: by 2002:a37:3692:: with SMTP id
 d140-v6mr9961292qka.385.1532326222410; 
 Sun, 22 Jul 2018 23:10:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP; Sun, 22 Jul 2018 23:10:21
 -0700 (PDT)
In-Reply-To: <AM5PR0501MB24497A59951BF691FD6B0D5DB1510@AM5PR0501MB2449.eurprd05.prod.outlook.com>
References: <CAG9c7cCrNso3WHmGpF+6aPYd=hVXthKDZyXJVAB0uUcT0nh9Bw@mail.gmail.com>
 <AM5PR0501MB244978A9EAA063FB2C393DDAB15C0@AM5PR0501MB2449.eurprd05.prod.outlook.com>
 <CAG9c7cCkEdp_G0VW9ntbfmGAyV9HLGUd6Eta56AKp3vOfisLVg@mail.gmail.com>
 <AM5PR0501MB24497A59951BF691FD6B0D5DB1510@AM5PR0501MB2449.eurprd05.prod.outlook.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Mon, 23 Jul 2018 14:10:21 +0800
Message-ID: <CAG9c7cB109_oyZYRk3P9J5sGepVxR9YQYCaCnAwPcbBXsqqY7g@mail.gmail.com>
Subject: Re: [patch v27 0/4] JTAG driver introduction
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000002ab7a70571a48012"
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
X-List-Received-Date: Mon, 23 Jul 2018 06:10:26 -0000

--0000000000002ab7a70571a48012
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI  Oleksandr,
Sorry I used the mlnx_cpldprog in the master branch previously.
I could build it successfully after I switched to jtag_class_drv branch.

Thanks.
BRs,
Henbin.

2018-07-20 20:38 GMT+08:00 Oleksandr Shamray <oleksandrs@mellanox.com>:

> Hi Henbin.
>
>
>
> https://github.com/sholeksandr/mellanox-bmc-tools/tree/jtag_class_drv
>
>
>
> Today I did small changes in mlnx_cpldprog. But why you think that it is
> too old?
>
>
>
> Best Regards,
>
> Oleksandr Shamray
>
>
>
> *From:* Henbin Chang [mailto:henbinchang@gmail.com]
> *Sent:* 17 =D0=B8=D1=8E=D0=BB=D1=8F 2018 =D0=B3. 13:57
> *To:* Oleksandr Shamray <oleksandrs@mellanox.com>
> *Cc:* OpenBMC Maillist <openbmc@lists.ozlabs.org>
>
> *Subject:* Re: [patch v27 0/4] JTAG driver introduction
>
>
>
> Thanks  Oleksandr's  response.
>
>
>
> I just want to try the mlnx_cpldprog you mentioned.
>
>
>
> But the mlnx_cpldprog on the github is too old to compile with the JTAG
> driver (v27.)
>
> Could you share the revised mlnx_cpldprog ?
>
>
>
> Thanks.
>
>
>
> BRs,
>
> Henbin.
>
>
>
> 2018-07-17 17:19 GMT+08:00 Oleksandr Shamray <oleksandrs@mellanox.com>:
>
> Hi  Henbin.
>
>
>
> > May I know how do you verify the JTAG driver workable?
>
>
>
> I have ultility which progrm CPLD with using this JTAG driver.
>
>
>
> You can see it on github:
>
> https://github.com/sholeksandr/mellanox-bmc-tools/tree/jtag_class_drv/
> mlnx_cpldprog
>
>
>
> Best Regards,
>
> Oleksandr Shamray
>
>
>
> *From:* Henbin Chang [mailto:henbinchang@gmail.com]
> *Sent:* 17 =D0=B8=D1=8E=D0=BB=D1=8F 2018 =D0=B3. 5:55
> *To:* OpenBMC Maillist <openbmc@lists.ozlabs.org>; Oleksandr Shamray <
> oleksandrs@mellanox.com>
> *Subject:* Re: [patch v27 0/4] JTAG driver introduction
>
>
>
> Hi Oleksandr,
>
>
>
> Sorry to bother you.
>
> May I know how do you verify the JTAG driver workable?
>
>
>
> Thanks.
>
> BRs,
>
> Henbin
>
>
>
> When a need raise up to use JTAG interface for system's devices
> programming or CPU debugging, usually the user layer
> application implements jtag protocol by bit-bang or using a
> proprietary connection to vendor hardware.
> This method can be slow and not generic.
>
> We propose to implement general JTAG interface and infrastructure
> to communicate with user layer application. In such way, we can
> have the standard JTAG interface core part and separation from
> specific HW implementation.
> This allow new capability to debug the CPU or program system's
> device via BMC without additional devices nor cost. This patch purpose is
> to add JTAG master core infrastructure by
> defining new JTAG class and provide generic JTAG interface
> to allow hardware specific drivers to connect this interface.
> This will enable all JTAG drivers to use the common interface
> part and will have separate for hardware implementation. The JTAG (Joint
> Test Action Group) core driver provides minimal generic
> JTAG interface, which can be used by hardware specific JTAG master
> controllers. By providing common interface for the JTAG controllers,
> user space device programing is hardware independent.
>
> Modern SoC which in use for embedded system' equipped with
> internal JTAG master interface.
> This interface is used for programming and debugging system's
> hardware components, like CPLD, FPGA, CPU, voltage and
> industrial controllers.
> Firmware for such devices can be upgraded through JTAG interface during
> Runtime. The JTAG standard support for multiple devices programming,
> is in case their lines are daisy-chained together. For example, systems
> which equipped with host CPU, BMC SoC or/and
> number of programmable devices are capable to connect a pin and
> select system components dynamically for programming and debugging,
> This is using by the BMC which is equipped with internal SoC master
> controller.
> For example: BMC JTAG master --> pin selected to CPLDs chain for
> programming (filed
> upgrade, production)
> BMC JTAG master --> pin selected to voltage monitors for programming
> (field upgrade, production)
> BMC JTAG master --> pin selected to host CPU (on-site debugging
> and developers debugging) For example, we can have application in user
> space which using calls
> to JTAG driver executes CPLD programming directly from SVF file
>
> The JTAG standard (IEEE 1149.1) defines the next connector pins:
> - TDI (Test Data In);
> - TDO (Test Data Out);
> - TCK (Test Clock);
> - TMS (Test Mode Select);
> - TRST (Test Reset) (Optional); The SoC equipped with JTAG master
> controller, performs
> device programming on command or vector level. For example
> a file in a standard SVF (Serial Vector Format) that contains
> boundary scan vectors, can be used by sending each vector
> to the JTAG interface and the JTAG controller will execute
> the programming. Initial version provides the system calls set for:
> - SIR (Scan Instruction Register, IEEE 1149.1 Instruction Register scan);
> - SDR (Scan Data Register, IEEE 1149.1 Data Register scan);
> - RUNTEST (Forces the IEEE 1149.1 bus to a run state for a specified
> number of clocks. SoC which are not equipped with JTAG master interface,
> can be built
> on top of JTAG core driver infrastructure, by applying bit-banging of
> TDI, TDO, TCK and TMS pins within the hardware specific driver. Oleksandr
> Shamray (4):
> drivers: jtag: Add JTAG core driver
> drivers: jtag: Add Aspeed SoC 24xx and 25xx families JTAG master
> driver
> Documentation: jtag: Add bindings for Aspeed SoC 24xx and 25xx
> families JTAG master driver
> Documentation: jtag: Add ABI documentation Documentation/ABI/testing/jtag=
-dev
> | 23 +
> .../devicetree/bindings/jtag/aspeed-jtag.txt | 22 +
> Documentation/ioctl/ioctl-number.txt | 2 +
> Documentation/jtag/overview | 27 +
> Documentation/jtag/transactions | 109 +++
> MAINTAINERS | 10 +
> drivers/Kconfig | 2 +
> drivers/Makefile | 1 +
> drivers/jtag/Kconfig | 31 +
> drivers/jtag/Makefile | 2 +
> drivers/jtag/jtag-aspeed.c | 747 ++++++++++++++++++++
> drivers/jtag/jtag.c | 274 +++++++
> include/linux/jtag.h | 41 ++
> include/uapi/linux/jtag.h | 109 +++
> 14 files changed, 1400 insertions(+), 0 deletions(-)
> create mode 100644 Documentation/ABI/testing/jtag-dev
> create mode 100644 Documentation/devicetree/bindings/jtag/aspeed-jtag.txt
> create mode 100644 Documentation/jtag/overview
> create mode 100644 Documentation/jtag/transactions
> create mode 100644 drivers/jtag/Kconfig
> create mode 100644 drivers/jtag/Makefile
> create mode 100644 drivers/jtag/jtag-aspeed.c
> create mode 100644 drivers/jtag/jtag.c
> create mode 100644 include/linux/jtag.h
> create mode 100644 include/uapi/linux/jtag.h
>
>
>

--0000000000002ab7a70571a48012
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">HI=C2=A0

<span style=3D"font-size:14px;text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">Oleksandr,</span><div><span style=
=3D"font-size:14px;text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">Sorry I used the mlnx_cpldprog in the master=
 branch previously.</span></div><div><span style=3D"font-size:14px;text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">I could build it successfully after I switched to=C2=A0</span><span sty=
le=3D"white-space:pre-wrap;font-size:14px">jtag_class_drv branch.</span></d=
iv><div><span style=3D"white-space:pre-wrap;font-size:14px"><br></span></di=
v><div><span style=3D"white-space:pre-wrap;font-size:14px">Thanks.</span></=
div><div><span style=3D"white-space:pre-wrap;font-size:14px">BRs,</span></d=
iv><div><span style=3D"white-space:pre-wrap;font-size:14px">Henbin.</span><=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-0=
7-20 20:38 GMT+08:00 Oleksandr Shamray <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:oleksandrs@mellanox.com" target=3D"_blank">oleksandrs@mellanox.com</a>&=
gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"RU" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-341526297433959713WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi </span>
Henbin<span lang=3D"EN-US">.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/s=
holeksandr/mellanox-bmc-tools/tree/jtag_class_drv" target=3D"_blank">https:=
//github.com/<wbr>sholeksandr/mellanox-bmc-<wbr>tools/tree/jtag_class_drv</=
a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Today I did small changes in
</span><span lang=3D"EN-US" style=3D"font-size:12.0pt;background:white">mln=
x_cpldprog. But why you think that it is too old?
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Oleksandr Shamray<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Henbin Chang [mailto:<a href=3D"mailto:henbinchang@gmail.com" t=
arget=3D"_blank">henbinchang@gmail.com</a>]
<br>
<b>Sent:</b> 17 =D0=B8=D1=8E=D0=BB=D1=8F 2018 =D0=B3. 13:57<br>
<b>To:</b> Oleksandr Shamray &lt;<a href=3D"mailto:oleksandrs@mellanox.com"=
 target=3D"_blank">oleksandrs@mellanox.com</a>&gt;<br>
<b>Cc:</b> OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;</span></p><div><div cla=
ss=3D"h5"><br>
<b>Subject:</b> Re: [patch v27 0/4] JTAG driver introduction<u></u><u></u><=
/div></div><p></p>
</div>
</div><div><div class=3D"h5">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Thanks=C2=A0 <span style=3D"font-size:10.5pt">Oleksa=
ndr&#39;s=C2=A0 response.</span><u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I just want to try the=C2=A0mlnx_cpldprog you mentio=
ned.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">But the mlnx_cpldprog on the github is too old to co=
mpile with the JTAG driver (v27.)<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Could you share the revised=C2=A0<span style=3D"font=
-size:12.0pt;background:white">mlnx_cpldprog=C2=A0?</span><u></u><u></u></p=
>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;background:white">Th=
anks.</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">BRs,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Henbin.<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">2018-07-17 17:19 GMT+08:00 Oleksandr Shamray &lt;<a =
href=3D"mailto:oleksandrs@mellanox.com" target=3D"_blank">oleksandrs@mellan=
ox.com</a>&gt;:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi =C2=A0Henbin.</span><u></u><=
u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; May I know how do you veri=
fy the JTAG driver workable?</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have ultility which progrm CP=
LD with using this JTAG driver.</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">You can see it on github:</span=
><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/s=
holeksandr/mellanox-bmc-tools/tree/jtag_class_drv/mlnx_cpldprog" target=3D"=
_blank">https://github.com/<wbr>sholeksandr/mellanox-bmc-<wbr>tools/tree/jt=
ag_class_drv/<wbr>mlnx_cpldprog</a></span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,</span><u></u><u><=
/u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Oleksandr Shamray</span><u></u>=
<u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0</span><u></u><u></u></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Henbin Chang [mailto:<a href=3D"mailto:henbinchang@gmail.com" t=
arget=3D"_blank">henbinchang@gmail.com</a>]
<br>
<b>Sent:</b> 17 =D0=B8=D1=8E=D0=BB=D1=8F 2018 =D0=B3. 5:55<br>
<b>To:</b> OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;; Oleksandr Shamray &lt;=
<a href=3D"mailto:oleksandrs@mellanox.com" target=3D"_blank">oleksandrs@mel=
lanox.com</a>&gt;<br>
<b>Subject:</b> Re: [patch v27 0/4] JTAG driver introduction</span><u></u><=
u></u></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Hi=C2=A0Oleksandr,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Sorry to bother you.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">May I know how do you verify the JTAG driver workabl=
e?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
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
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal">When a need raise up to use JTAG interface for syste=
m&#39;s devices<br>
programming or CPU debugging, usually the user layer<br>
application implements jtag protocol by bit-bang or using a <br>
proprietary connection to vendor hardware.<br>
This method can be slow and not generic.<br>
<br>
We propose to implement general JTAG interface and infrastructure<br>
to communicate with user layer application. In such way, we can<br>
have the standard JTAG interface core part and separation from<br>
specific HW implementation.<br>
This allow new capability to debug the CPU or program system&#39;s <br>
device via BMC without additional devices nor cost. This patch purpose is t=
o add JTAG master core infrastructure by
<br>
defining new JTAG class and provide generic JTAG interface<br>
to allow hardware specific drivers to connect this interface.<br>
This will enable all JTAG drivers to use the common interface<br>
part and will have separate for hardware implementation. The JTAG (Joint Te=
st Action Group) core driver provides minimal generic<br>
JTAG interface, which can be used by hardware specific JTAG master<br>
controllers. By providing common interface for the JTAG controllers,<br>
user space device programing is hardware independent.<br>
<br>
Modern SoC which in use for embedded system&#39; equipped with<br>
internal JTAG master interface.<br>
This interface is used for programming and debugging system&#39;s<br>
hardware components, like CPLD, FPGA, CPU, voltage and<br>
industrial controllers.<br>
Firmware for such devices can be upgraded through JTAG interface during<br>
Runtime. The JTAG standard support for multiple devices programming,<br>
is in case their lines are daisy-chained together. For example, systems whi=
ch equipped with host CPU, BMC SoC or/and
<br>
number of programmable devices are capable to connect a pin and<br>
select system components dynamically for programming and debugging,<br>
This is using by the BMC which is equipped with internal SoC master<br>
controller.<br>
For example: BMC JTAG master --&gt; pin selected to CPLDs chain for program=
ming (filed<br>
upgrade, production) <br>
BMC JTAG master --&gt; pin selected to voltage monitors for programming <br=
>
(field upgrade, production) <br>
BMC JTAG master --&gt; pin selected to host CPU (on-site debugging <br>
and developers debugging) For example, we can have application in user spac=
e which using calls<br>
to JTAG driver executes CPLD programming directly from SVF file<br>
<br>
The JTAG standard (IEEE 1149.1) defines the next connector pins:<br>
- TDI (Test Data In);<br>
- TDO (Test Data Out);<br>
- TCK (Test Clock);<br>
- TMS (Test Mode Select);<br>
- TRST (Test Reset) (Optional); The SoC equipped with JTAG master controlle=
r, performs<br>
device programming on command or vector level. For example<br>
a file in a standard SVF (Serial Vector Format) that contains<br>
boundary scan vectors, can be used by sending each vector<br>
to the JTAG interface and the JTAG controller will execute<br>
the programming. Initial version provides the system calls set for:<br>
- SIR (Scan Instruction Register, IEEE 1149.1 Instruction Register scan);<b=
r>
- SDR (Scan Data Register, IEEE 1149.1 Data Register scan);<br>
- RUNTEST (Forces the IEEE 1149.1 bus to a run state for a specified<br>
number of clocks. SoC which are not equipped with JTAG master interface, ca=
n be built<br>
on top of JTAG core driver infrastructure, by applying bit-banging of<br>
TDI, TDO, TCK and TMS pins within the hardware specific driver. Oleksandr S=
hamray (4):<br>
drivers: jtag: Add JTAG core driver<br>
drivers: jtag: Add Aspeed SoC 24xx and 25xx families JTAG master<br>
driver<br>
Documentation: jtag: Add bindings for Aspeed SoC 24xx and 25xx<br>
families JTAG master driver<br>
Documentation: jtag: Add ABI documentation Documentation/ABI/testing/<wbr>j=
tag-dev | 23 +<br>
.../devicetree/bindings/jtag/<wbr>aspeed-jtag.txt | 22 +<br>
Documentation/ioctl/ioctl-<wbr>number.txt | 2 +<br>
Documentation/jtag/overview | 27 +<br>
Documentation/jtag/<wbr>transactions | 109 +++<br>
MAINTAINERS | 10 +<br>
drivers/Kconfig | 2 +<br>
drivers/Makefile | 1 +<br>
drivers/jtag/Kconfig | 31 +<br>
drivers/jtag/Makefile | 2 +<br>
drivers/jtag/jtag-aspeed.c | 747 ++++++++++++++++++++<br>
drivers/jtag/jtag.c | 274 +++++++<br>
include/linux/jtag.h | 41 ++<br>
include/uapi/linux/jtag.h | 109 +++<br>
14 files changed, 1400 insertions(+), 0 deletions(-)<br>
create mode 100644 Documentation/ABI/testing/<wbr>jtag-dev<br>
create mode 100644 Documentation/devicetree/<wbr>bindings/jtag/aspeed-jtag.=
txt<br>
create mode 100644 Documentation/jtag/overview<br>
create mode 100644 Documentation/jtag/<wbr>transactions<br>
create mode 100644 drivers/jtag/Kconfig<br>
create mode 100644 drivers/jtag/Makefile<br>
create mode 100644 drivers/jtag/jtag-aspeed.c<br>
create mode 100644 drivers/jtag/jtag.c<br>
create mode 100644 include/linux/jtag.h<br>
create mode 100644 include/uapi/linux/jtag.h<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div></div></div>
</div>
</div>

</blockquote></div><br></div>

--0000000000002ab7a70571a48012--
