Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EiYncAf5"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41V4d62kk8zF35Y
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 12:54:48 +1000 (AEST)
Received: by mail-qt0-x241.google.com with SMTP id f18-v6so34761964qtp.10
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 19:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=BFwEl/sd92aTgeI9N1/ZjCueSAUjTcVcWeeZ39hwptA=;
 b=EiYncAf5yi9EmZn6hhAKnLxPguF1HpVO1RJfFfZ8nhyezURaZs5wkOHcqHCOCrquUi
 zvByh0IGXrKeW5K+YfFJ34DDNIqxonEvI8s8sy0Bv8/ClD84opSRht4lNvSiv7TQmEE9
 Y6iiEgXQeS8UXS1P5tSvPzvacdWgv9RUkRCT089L2pcQz7yNj76EsGm+HEThbWwqwO5O
 lryHDGKslZCoISZj6xHiKPcmfWCAd98HHwlqKG1r0AHhyIywMpvXrsTQXQrJwUadVkTM
 aux9NdiRDSYksgeu6EmkjsBHimf7xNqzTkzJRH4c4/6zwWXL+ajt+anGcmpfWIMACt9U
 iN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BFwEl/sd92aTgeI9N1/ZjCueSAUjTcVcWeeZ39hwptA=;
 b=iEf/1JCTkR+FWfOGvvUA3lOq0w6YrxiWUXGEu/1A43k7y5Ot+MLP4Kky22iBD43aAQ
 Llj/5vpL/hqkcCFX5vyEAk2N7IBdqC2zSGBSfz0NW592zJuC5wq7VbObWCKarHIjMudY
 AYN3azvFsJEHynDMr1OgbOy87Lg/IEZp9c87I6Adr5th4MJMUvDsCGGPuYtkz26NvcOX
 JFnFOYv05QD0gqo19RMHKZrESC4PeIJUC8TxstoPwstftPXz/jhjWGYgGI359z+UNBtq
 6O3yO/ydxHxPSljJVpsMUC4MDN6PvQ7NnwCm9P6t6z9aESISzvxwuzrFxiueKQlR8zvT
 jv5A==
X-Gm-Message-State: AOUpUlGEjxHqSHhSrW501j6s4Pm4JTGlLzmjYMCoWzq7501Mo2eIyOL6
 v8G6dzEgqqFYZffJq/9kRsafIgwYLiZ17RWZMRMBog==
X-Google-Smtp-Source: AAOMgpcpBZimp48lpqI49MfQ2SJX+M7hMNLT7GCCtQyCkstefKLepsJUm8rEqyRkMjIHg5BFJOWIf9fNCd8lBTEMfrE=
X-Received: by 2002:a0c:aa81:: with SMTP id
 f1-v6mr21037421qvb.80.1531796085902; 
 Mon, 16 Jul 2018 19:54:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 19:54:45
 -0700 (PDT)
From: Henbin Chang <henbinchang@gmail.com>
Date: Tue, 17 Jul 2018 10:54:45 +0800
Message-ID: <CAG9c7cCrNso3WHmGpF+6aPYd=hVXthKDZyXJVAB0uUcT0nh9Bw@mail.gmail.com>
Subject: Re: [patch v27 0/4] JTAG driver introduction
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, oleksandrs@mellanox.com
Content-Type: multipart/alternative; boundary="00000000000091924d0571291146"
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
X-List-Received-Date: Tue, 17 Jul 2018 02:54:51 -0000

--00000000000091924d0571291146
Content-Type: text/plain; charset="UTF-8"

 Hi Oleksandr,

Sorry to bother you.
May I know how do you verify the JTAG driver workable?

Thanks.
BRs,
Henbin


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
> Documentation: jtag: Add ABI documentation
> Documentation/ABI/testing/jtag-dev | 23 +
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

--00000000000091924d0571291146
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<div>Hi=C2=A0Oleksandr,</div><div><br></div><div>Sorry to bother you.</div>=
<div>May I know how do you verify the JTAG driver workable?</div><div><br><=
/div><div>Thanks.</div><div>BRs,</div><div>Henbin</div><div>=C2=A0</div><bl=
ockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex" class=3D"gmail_quote">When a need raise up to use =
JTAG interface for system&#39;s devices<br>programming or CPU debugging, us=
ually the user layer<br>application implements jtag protocol by bit-bang or=
 using a <br>proprietary connection to vendor hardware.<br>This method can =
be slow and not generic.<br> <br>We propose to implement general JTAG inter=
face and infrastructure<br>to communicate with user layer application. In s=
uch way, we can<br>have the standard JTAG interface core part and separatio=
n from<br>specific HW implementation.<br>This allow new capability to debug=
 the CPU or program system&#39;s <br>device via BMC without additional devi=
ces nor cost.=20
This patch purpose is to add JTAG master core infrastructure by <br>definin=
g new JTAG class and provide generic JTAG interface<br>to allow hardware sp=
ecific drivers to connect this interface.<br>This will enable all JTAG driv=
ers to use the common interface<br>part and will have separate for hardware=
 implementation.
The JTAG (Joint Test Action Group) core driver provides minimal generic<br>=
JTAG interface, which can be used by hardware specific JTAG master<br>contr=
ollers. By providing common interface for the JTAG controllers,<br>user spa=
ce device programing is hardware independent.<br> <br>Modern SoC which in u=
se for embedded system&#39; equipped with<br>internal JTAG master interface=
.<br>This interface is used for programming and debugging system&#39;s<br>h=
ardware components, like CPLD, FPGA, CPU, voltage and<br>industrial control=
lers.<br>Firmware for such devices can be upgraded through JTAG interface d=
uring<br>Runtime. The JTAG standard support for multiple devices programmin=
g,<br>is in case their lines are daisy-chained together.
For example, systems which equipped with host CPU, BMC SoC or/and <br>numbe=
r of programmable devices are capable to connect a pin and<br>select system=
 components dynamically for programming and debugging,<br>This is using by =
the BMC which is equipped with internal SoC master<br>controller.<br>For ex=
ample:
BMC JTAG master --&gt; pin selected to CPLDs chain for programming (filed<b=
r>upgrade, production) <br>BMC JTAG master --&gt; pin selected to voltage m=
onitors for programming <br>(field upgrade, production) <br>BMC JTAG master=
 --&gt; pin selected to host CPU (on-site debugging <br>and developers debu=
gging)
For example, we can have application in user space which using calls<br>to =
JTAG driver executes CPLD programming directly from SVF file<br> <br>The JT=
AG standard (IEEE 1149.1) defines the next connector pins:<br>- TDI (Test D=
ata In);<br>- TDO (Test Data Out);<br>- TCK (Test Clock);<br>- TMS (Test Mo=
de Select);<br>- TRST (Test Reset) (Optional);
The SoC equipped with JTAG master controller, performs<br>device programmin=
g on command or vector level. For example<br>a file in a standard SVF (Seri=
al Vector Format) that contains<br>boundary scan vectors, can be used by se=
nding each vector<br>to the JTAG interface and the JTAG controller will exe=
cute<br>the programming.
Initial version provides the system calls set for:<br>- SIR (Scan Instructi=
on Register, IEEE 1149.1 Instruction Register scan);<br>- SDR (Scan Data Re=
gister, IEEE 1149.1 Data Register scan);<br>- RUNTEST (Forces the IEEE 1149=
.1 bus to a run state for a specified<br>  number of clocks.
SoC which are not equipped with JTAG master interface, can be built<br>on t=
op of JTAG core driver infrastructure, by applying bit-banging of<br>TDI, T=
DO, TCK and TMS pins within the hardware specific driver.
Oleksandr Shamray (4):<br>  drivers: jtag: Add JTAG core driver<br>  driver=
s: jtag: Add Aspeed SoC 24xx and 25xx families JTAG master<br>    driver<br=
>  Documentation: jtag: Add bindings for Aspeed SoC 24xx and 25xx<br>    fa=
milies     JTAG master driver<br>  Documentation: jtag: Add ABI documentati=
on
 Documentation/ABI/testing/jtag-dev                 |   23 +<br> .../device=
tree/bindings/jtag/aspeed-jtag.txt       |   22 +<br> Documentation/ioctl/i=
octl-number.txt               |    2 +<br> Documentation/jtag/overview     =
                   |   27 +<br> Documentation/jtag/transactions            =
        |  109 +++<br> MAINTAINERS                                        |=
   10 +<br> drivers/Kconfig                                    |    2 +<br>=
 drivers/Makefile                                   |    1 +<br> drivers/jt=
ag/Kconfig                               |   31 +<br> drivers/jtag/Makefile=
                              |    2 +<br> drivers/jtag/jtag-aspeed.c      =
                   |  747 ++++++++++++++++++++<br> drivers/jtag/jtag.c     =
                           |  274 +++++++<br> include/linux/jtag.h         =
                      |   41 ++<br> include/uapi/linux/jtag.h              =
            |  109 +++<br> 14 files changed, 1400 insertions(+), 0 deletion=
s(-)<br> create mode 100644 Documentation/ABI/testing/jtag-dev<br> create m=
ode 100644 Documentation/devicetree/bindings/jtag/aspeed-jtag.txt<br> creat=
e mode 100644 Documentation/jtag/overview<br> create mode 100644 Documentat=
ion/jtag/transactions<br> create mode 100644 drivers/jtag/Kconfig<br> creat=
e mode 100644 drivers/jtag/Makefile<br> create mode 100644 drivers/jtag/jta=
g-aspeed.c<br> create mode 100644 drivers/jtag/jtag.c<br> create mode 10064=
4 include/linux/jtag.h<br> create mode 100644 include/uapi/linux/jtag.h</bl=
ockquote></div>

--00000000000091924d0571291146--
