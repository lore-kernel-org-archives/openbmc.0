Return-Path: <raltherr@google.com>
Received: from mail-wr0-x22a.google.com (mail-wr0-x22a.google.com
 [IPv6:2a00:1450:400c:c0c::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDQ8S40rGzDq72
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 04:14:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="j/y8tENX"; 
 dkim-atps=neutral
Received: by mail-wr0-x22a.google.com with SMTP id l9so21795286wre.1
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 11:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=F+Obcr0hCYhyDTO6FtINKN3EODkUa1hX73F7K6aHyR0=;
 b=j/y8tENXplQnGIV9anskruP+CuktLKpzeCo5hRVbf68PCs9Lw28rGsu2AlIzMbXCVT
 Sud3o6063CPL2go0kBaHwvlTXlLK1Vm0AhJ5Ts4ZOl7SR3mNMz+g1kx+Btc8l3c8lYn4
 11QRY27IRk7DCJjlo+o1oe7S8E1owCsgxbnyKuw1kMme56TQrKrwM0ggIsojq7ABXBY5
 NW+on0EUJHYJ7Z7ZSCFPPvm29Yx+P4Z+/Y+iNbKFWFvtSzgT6rNrqeN0uxoUFU49reYa
 mIfijCrroNLLAs1FW7JdvFDJNhZPR23psSbIdAfbMQ5axMfeXzzOjRwVqoOYr7Mjumz8
 CJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=F+Obcr0hCYhyDTO6FtINKN3EODkUa1hX73F7K6aHyR0=;
 b=LnLuBqk7BUV203CsiPiNnyQxPxIRSYEDflAHN3O3BbXsN/Y9cDwaX4tZ5+p/RaAEv9
 olCxfXbmXlcfL7Slex9SU8FKqKyrKhFYsQCt+XoARexKuuL/876ZC8lBguVH6NO/CHdT
 lnvsXWOybbRD2aBJmJN6YCl+penkevm2zNm1pKEfQIMAaE7BMyT2gWx0B0uPQLVLmo0l
 +zBe2udCtaUx85B6GebnsW9hLrQ+EFJP/WlzIR5VOAO6wDbm0x0bmM5NzeeaY+sJYK22
 x+VDSZ4v0bQC206B+58RgLm/FYlyJ2LNE1yI/pqsZKFkB6erjfsHp6+QuTl3WV+NY/Xt
 vUmg==
X-Gm-Message-State: AN3rC/69ta/yiZ71E0COaaPLXLgjL65U6QXfFPyrbenlQrmn8mNAt9dC
 jRGkM6O2j0d0uEcnTBjHoZwqlkOBjxGS
X-Received: by 10.223.143.70 with SMTP id p64mr4346688wrb.120.1493316884926;
 Thu, 27 Apr 2017 11:14:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.46.130 with HTTP; Thu, 27 Apr 2017 11:14:44 -0700 (PDT)
In-Reply-To: <CACPK8XdLpPYitsvg9Eaw+g4jRX0Ki=9oBCtgtd9fx=_XevdfhA@mail.gmail.com>
References: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
 <CAPH-5w6-2zVQn2iNVP28aOAS_r11rxGYCrioXCR-sX8Ln7_BZQ@mail.gmail.com>
 <CAPH-5w4OS_oT5MMu2kEOUwtOza_LO94vwSH9dZHpVMa_4OA38Q@mail.gmail.com>
 <CAPLgG=nuU5befF4AfheWAbnU7tYPCpZSnj+-Zk8MDkvaKek+uw@mail.gmail.com>
 <CACPK8XdLpPYitsvg9Eaw+g4jRX0Ki=9oBCtgtd9fx=_XevdfhA@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 27 Apr 2017 11:14:44 -0700
Message-ID: <CAPLgG=kUDdPgcLnp5fV+qjJHhONoD4DT3bvuaVXVsQO1W6FrZQ@mail.gmail.com>
Subject: Re: Switching to 4.10
To: Joel Stanley <joel@jms.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 msbarth <msbarth@linux.vnet.ibm.com>, 
 Edward James <eajames@us.ibm.com>, Xo Wang <xow@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>
Content-Type: multipart/alternative; boundary=f403045f4c4076d888054e29eee2
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
X-List-Received-Date: Thu, 27 Apr 2017 18:14:50 -0000

--f403045f4c4076d888054e29eee2
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 27, 2017 at 12:33 AM, Joel Stanley <joel@jms.id.au> wrote:

> On Thu, Apr 27, 2017 at 3:00 AM, Rick Altherr <raltherr@google.com> wrote:
> > I saw Joel started https://gerrit.openbmc-project.xyz/#/c/2846/ which
> has a
> > defconfig for ast2400.  If you have one for ast2500, please upload a new
> > patch set to that change.
>
> I have defconfigs in the tree that are ready to go. I will upload them
> to Gerrit when I get the chance.
>
>
I've been holding off on testing some RNG changes because it depends on
4.10.  Can you please upload these defconfigs so I can build a full 4.10
image more easily?


> I've pulled in:
>
>  - Ben's ftgmac100 patches from the net-next tree
>  - Brendan's i2c patches, v7
>  - Andrew's GPIO and Pinconf patches from the gpio and pinconf trees
>  - Chris Bostic's FSI series, v6
>
> These are going through a test cycle on the ast2500evb and Plametto
> tonight. Once I have an ack for the i2c device tree, I will add that
> to the tree and push to github.
>
> Eddie, can you let me know which version of your OCC hwmon patches you
> want included. Same goes for the CFAM I2C patches. If you want to wait
> for review then please ping your reviewers and we can see if we can
> get the patches reviewed before we include them.
>
> Brad, can you point me to the SBE FIFO work that you want included. If
> you would prefer to wait for review that is okay.
>
> Matt, I think do you want to merge the MAX31785 hwmon driver as-is for now?
>
> Cheers,
>
> JOel
>
> >
> > On Tue, Apr 25, 2017 at 5:30 PM, Xo Wang <xow@google.com> wrote:
> >>
> >> On Tue, Apr 25, 2017 at 4:57 PM, Xo Wang <xow@google.com> wrote:
> >> > Hi Joel,
> >> >
> >> > On Thu, Apr 20, 2017 at 7:30 PM, Joel Stanley <joel@jms.id.au> wrote:
> >> >> Hello team,
> >> >>
> >> >> I want to make the 4.10 change happen. We don't have the resource to
> >> >> be maintaining two trees, and the 4.10 tree has a whole heap of
> >> >> shinyness - faster network, faster flash access, improved I2C.
> >> >>
> >> >> To this end I will stop merging patches in to 4.7. Please target the
> >> >> 4.10 tree from here on.
> >> >>
> >> >> Use this thread to discuss concerns and coordinate the work that
> needs
> >> >> to be done. Bits that I'm aware of
> >> >>
> >> >>  - Eddie is updating userspace to the new FSI APIs
> >> >>  - I need to merge the upstream FSI patchset
> >> >>  - Brednan needs to post the lastest version of the i2c patchset
> which
> >> >> I will merge
> >> >>  - I need to merge benh's ftgmac100 improvements
> >> >
> >> > We'll need to update the defconfig in the build system. Currently if I
> >> > compile the kernel and generate a new defconfig (make savedefconfig),
> >> > I see the following changes in the 4.10 generated defconfig:
> >> >
> >> > @@ -73,7 +73,6 @@
> >> >  CONFIG_MTD_BLOCK=y
> >> >  CONFIG_MTD_PARTITIONED_MASTER=y
> >> >  CONFIG_MTD_SPI_NOR=y
> >> > -CONFIG_ASPEED_FLASH_SPI=y
> >> >  CONFIG_MTD_UBI=y
> >> >  CONFIG_MTD_UBI_FASTMAP=y
> >> >  CONFIG_MTD_UBI_BLOCK=y
> >> > @@ -116,7 +115,6 @@
> >> >  # CONFIG_SERIO is not set
> >> >  # CONFIG_VT is not set
> >> >  CONFIG_LEGACY_PTY_COUNT=4
> >> > -# CONFIG_DEVKMEM is not set
> >> >  CONFIG_SERIAL_8250=y
> >> >  # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> >> >  CONFIG_SERIAL_8250_CONSOLE=y
> >> > @@ -131,10 +129,8 @@
> >> >  CONFIG_I2C=y
> >> >  CONFIG_I2C_CHARDEV=y
> >> >  CONFIG_I2C_ASPEED=y
> >> > -CONFIG_SENSORS_MAX31785=y
> >> >  CONFIG_SENSORS_LM75=y
> >> >  CONFIG_SENSORS_NCT7904=y
> >> > -CONFIG_SENSORS_POWER8_OCC_I2C=y
> >> >  CONFIG_PMBUS=y
> >> >  CONFIG_SENSORS_ADM1275=y
> >> >  CONFIG_SENSORS_UCD9000=y
> >> > @@ -143,21 +139,14 @@
> >> >  # CONFIG_USB_SUPPORT is not set
> >> >  CONFIG_NEW_LEDS=y
> >> >  CONFIG_LEDS_CLASS=y
> >> > -CONFIG_LEDS_GPIO=y
> >> >  CONFIG_LEDS_TRIGGERS=y
> >> >  CONFIG_LEDS_TRIGGER_TIMER=y
> >> >  CONFIG_LEDS_TRIGGER_HEARTBEAT=y
> >> > -CONFIG_LEDS_TRIGGER_GPIO=y
> >> >  CONFIG_RTC_CLASS=y
> >> >  CONFIG_RTC_DRV_DS1307=y
> >> >  CONFIG_RTC_DRV_ASPEED=y
> >> >  CONFIG_MAILBOX=y
> >> > -CONFIG_ASPEED_MBOX=y
> >> >  # CONFIG_IOMMU_SUPPORT is not set
> >> > -CONFIG_FSI=y
> >> > -CONFIG_FSI_MASTER_GPIO=y
> >> > -CONFIG_FSI_SCOM=y
> >> > -CONFIG_FSI_I2C=y
> >> >  CONFIG_FIRMWARE_MEMMAP=y
> >> >  CONFIG_FANOTIFY=y
> >> >  CONFIG_AUTOFS4_FS=y
> >> >
> >> >>
> >> >> Cheers,
> >> >>
> >> >> Joel
> >> >
> >> > I know that CONFIG_ASPEED_FLASH_SPI is now CONFIG_SPI_ASPEED_SMC, but
> >> > I've yet to look at each of the other differences.
> >> >
> >> > cheers
> >> > xo
> >>
> >> OK, I guess it's not that much work to look at those configs. This
> >> seems to work up to the limit of the missing FSI drivers as previously
> >> mentioned:
> >>
> >> ---
> >> a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-
> kernel/linux/linux-obmc/defconfig
> >> +++
> >> b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-
> kernel/linux/linux-obmc/defconfig
> >> @@ -73,7 +73,7 @@ CONFIG_MTD_CMDLINE_PARTS=y
> >>  CONFIG_MTD_BLOCK=y
> >>  CONFIG_MTD_PARTITIONED_MASTER=y
> >>  CONFIG_MTD_SPI_NOR=y
> >> -CONFIG_ASPEED_FLASH_SPI=y
> >> +CONFIG_SPI_ASPEED_SMC=y
> >>  CONFIG_MTD_UBI=y
> >>  CONFIG_MTD_UBI_FASTMAP=y
> >>  CONFIG_MTD_UBI_BLOCK=y
> >> @@ -116,7 +116,6 @@ CONFIG_INPUT_EVDEV=y
> >>  # CONFIG_SERIO is not set
> >>  # CONFIG_VT is not set
> >>  CONFIG_LEGACY_PTY_COUNT=4
> >> -# CONFIG_DEVKMEM is not set
> >>  CONFIG_SERIAL_8250=y
> >>  # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> >>  CONFIG_SERIAL_8250_CONSOLE=y
> >> @@ -131,10 +130,11 @@ CONFIG_ASPEED_BT_IPMI_BMC=y
> >>  CONFIG_I2C=y
> >>  CONFIG_I2C_CHARDEV=y
> >>  CONFIG_I2C_ASPEED=y
> >> -CONFIG_SENSORS_MAX31785=y
> >> +CONFIG_GPIOLIB=y
> >> +CONFIG_GPIO_SYSFS=y
> >> +CONFIG_GPIO_ASPEED=y
> >>  CONFIG_SENSORS_LM75=y
> >>  CONFIG_SENSORS_NCT7904=y
> >> -CONFIG_SENSORS_POWER8_OCC_I2C=y
> >>  CONFIG_PMBUS=y
> >>  CONFIG_SENSORS_ADM1275=y
> >>  CONFIG_SENSORS_UCD9000=y
> >> @@ -152,12 +152,8 @@ CONFIG_RTC_CLASS=y
> >>  CONFIG_RTC_DRV_DS1307=y
> >>  CONFIG_RTC_DRV_ASPEED=y
> >>  CONFIG_MAILBOX=y
> >> -CONFIG_ASPEED_MBOX=y
> >> +CONFIG_ASPEED_LPC_MBOX=y
> >>  # CONFIG_IOMMU_SUPPORT is not set
> >> -CONFIG_FSI=y
> >> -CONFIG_FSI_MASTER_GPIO=y
> >> -CONFIG_FSI_SCOM=y
> >> -CONFIG_FSI_I2C=y
> >>  CONFIG_FIRMWARE_MEMMAP=y
> >>  CONFIG_FANOTIFY=y
> >>  CONFIG_AUTOFS4_FS=y
> >>
> >> cheers
> >> xo
> >
> >
>

--f403045f4c4076d888054e29eee2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 27, 2017 at 12:33 AM, Joel Stanley <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, Apr =
27, 2017 at 3:00 AM, Rick Altherr &lt;<a href=3D"mailto:raltherr@google.com=
">raltherr@google.com</a>&gt; wrote:<br>
&gt; I saw Joel started <a href=3D"https://gerrit.openbmc-project.xyz/#/c/2=
846/" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-<wbr>proj=
ect.xyz/#/c/2846/</a> which has a<br>
&gt; defconfig for ast2400.=C2=A0 If you have one for ast2500, please uploa=
d a new<br>
&gt; patch set to that change.<br>
<br>
</span>I have defconfigs in the tree that are ready to go. I will upload th=
em<br>
to Gerrit when I get the chance.<br>
<br></blockquote><div><br></div><div>I&#39;ve been holding off on testing s=
ome RNG changes because it depends on 4.10.=C2=A0 Can you please upload the=
se defconfigs so I can build a full 4.10 image more easily?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
I&#39;ve pulled in:<br>
<br>
=C2=A0- Ben&#39;s ftgmac100 patches from the net-next tree<br>
=C2=A0- Brendan&#39;s i2c patches, v7<br>
=C2=A0- Andrew&#39;s GPIO and Pinconf patches from the gpio and pinconf tre=
es<br>
=C2=A0- Chris Bostic&#39;s FSI series, v6<br>
<br>
These are going through a test cycle on the ast2500evb and Plametto<br>
tonight. Once I have an ack for the i2c device tree, I will add that<br>
to the tree and push to github.<br>
<br>
Eddie, can you let me know which version of your OCC hwmon patches you<br>
want included. Same goes for the CFAM I2C patches. If you want to wait<br>
for review then please ping your reviewers and we can see if we can<br>
get the patches reviewed before we include them.<br>
<br>
Brad, can you point me to the SBE FIFO work that you want included. If<br>
you would prefer to wait for review that is okay.<br>
<br>
Matt, I think do you want to merge the MAX31785 hwmon driver as-is for now?=
<br>
<br>
Cheers,<br>
<br>
JOel<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; On Tue, Apr 25, 2017 at 5:30 PM, Xo Wang &lt;<a href=3D"mailto:xow@goo=
gle.com">xow@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Apr 25, 2017 at 4:57 PM, Xo Wang &lt;<a href=3D"mailto:xow=
@google.com">xow@google.com</a>&gt; wrote:<br>
&gt;&gt; &gt; Hi Joel,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Thu, Apr 20, 2017 at 7:30 PM, Joel Stanley &lt;<a href=3D"=
mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; Hello team,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I want to make the 4.10 change happen. We don&#39;t have =
the resource to<br>
&gt;&gt; &gt;&gt; be maintaining two trees, and the 4.10 tree has a whole h=
eap of<br>
&gt;&gt; &gt;&gt; shinyness - faster network, faster flash access, improved=
 I2C.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; To this end I will stop merging patches in to 4.7. Please=
 target the<br>
&gt;&gt; &gt;&gt; 4.10 tree from here on.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Use this thread to discuss concerns and coordinate the wo=
rk that needs<br>
&gt;&gt; &gt;&gt; to be done. Bits that I&#39;m aware of<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 - Eddie is updating userspace to the new FSI APIs<b=
r>
&gt;&gt; &gt;&gt;=C2=A0 - I need to merge the upstream FSI patchset<br>
&gt;&gt; &gt;&gt;=C2=A0 - Brednan needs to post the lastest version of the =
i2c patchset which<br>
&gt;&gt; &gt;&gt; I will merge<br>
&gt;&gt; &gt;&gt;=C2=A0 - I need to merge benh&#39;s ftgmac100 improvements=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; We&#39;ll need to update the defconfig in the build system. C=
urrently if I<br>
&gt;&gt; &gt; compile the kernel and generate a new defconfig (make savedef=
config),<br>
&gt;&gt; &gt; I see the following changes in the 4.10 generated defconfig:<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -73,7 +73,6 @@<br>
&gt;&gt; &gt;=C2=A0 CONFIG_MTD_BLOCK=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_MTD_PARTITIONED_MASTER=3D<wbr>y<br>
&gt;&gt; &gt;=C2=A0 CONFIG_MTD_SPI_NOR=3Dy<br>
&gt;&gt; &gt; -CONFIG_ASPEED_FLASH_SPI=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_MTD_UBI=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_MTD_UBI_FASTMAP=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_MTD_UBI_BLOCK=3Dy<br>
&gt;&gt; &gt; @@ -116,7 +115,6 @@<br>
&gt;&gt; &gt;=C2=A0 # CONFIG_SERIO is not set<br>
&gt;&gt; &gt;=C2=A0 # CONFIG_VT is not set<br>
&gt;&gt; &gt;=C2=A0 CONFIG_LEGACY_PTY_COUNT=3D4<br>
&gt;&gt; &gt; -# CONFIG_DEVKMEM is not set<br>
&gt;&gt; &gt;=C2=A0 CONFIG_SERIAL_8250=3Dy<br>
&gt;&gt; &gt;=C2=A0 # CONFIG_SERIAL_8250_DEPRECATED_<wbr>OPTIONS is not set=
<br>
&gt;&gt; &gt;=C2=A0 CONFIG_SERIAL_8250_CONSOLE=3Dy<br>
&gt;&gt; &gt; @@ -131,10 +129,8 @@<br>
&gt;&gt; &gt;=C2=A0 CONFIG_I2C=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_I2C_CHARDEV=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_I2C_ASPEED=3Dy<br>
&gt;&gt; &gt; -CONFIG_SENSORS_MAX31785=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_SENSORS_LM75=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_SENSORS_NCT7904=3Dy<br>
&gt;&gt; &gt; -CONFIG_SENSORS_POWER8_OCC_<wbr>I2C=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_PMBUS=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_SENSORS_ADM1275=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_SENSORS_UCD9000=3Dy<br>
&gt;&gt; &gt; @@ -143,21 +139,14 @@<br>
&gt;&gt; &gt;=C2=A0 # CONFIG_USB_SUPPORT is not set<br>
&gt;&gt; &gt;=C2=A0 CONFIG_NEW_LEDS=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_LEDS_CLASS=3Dy<br>
&gt;&gt; &gt; -CONFIG_LEDS_GPIO=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_LEDS_TRIGGERS=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_LEDS_TRIGGER_TIMER=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_LEDS_TRIGGER_HEARTBEAT=3D<wbr>y<br>
&gt;&gt; &gt; -CONFIG_LEDS_TRIGGER_GPIO=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_RTC_CLASS=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_RTC_DRV_DS1307=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_RTC_DRV_ASPEED=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_MAILBOX=3Dy<br>
&gt;&gt; &gt; -CONFIG_ASPEED_MBOX=3Dy<br>
&gt;&gt; &gt;=C2=A0 # CONFIG_IOMMU_SUPPORT is not set<br>
&gt;&gt; &gt; -CONFIG_FSI=3Dy<br>
&gt;&gt; &gt; -CONFIG_FSI_MASTER_GPIO=3Dy<br>
&gt;&gt; &gt; -CONFIG_FSI_SCOM=3Dy<br>
&gt;&gt; &gt; -CONFIG_FSI_I2C=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_FIRMWARE_MEMMAP=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_FANOTIFY=3Dy<br>
&gt;&gt; &gt;=C2=A0 CONFIG_AUTOFS4_FS=3Dy<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Cheers,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Joel<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I know that CONFIG_ASPEED_FLASH_SPI is now CONFIG_SPI_ASPEED_=
SMC, but<br>
&gt;&gt; &gt; I&#39;ve yet to look at each of the other differences.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; cheers<br>
&gt;&gt; &gt; xo<br>
&gt;&gt;<br>
&gt;&gt; OK, I guess it&#39;s not that much work to look at those configs. =
This<br>
&gt;&gt; seems to work up to the limit of the missing FSI drivers as previo=
usly<br>
&gt;&gt; mentioned:<br>
&gt;&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; a/meta-openbmc-bsp/meta-<wbr>aspeed/meta-ast2500/recipes-<wbr>kern=
el/linux/linux-obmc/<wbr>defconfig<br>
&gt;&gt; +++<br>
&gt;&gt; b/meta-openbmc-bsp/meta-<wbr>aspeed/meta-ast2500/recipes-<wbr>kern=
el/linux/linux-obmc/<wbr>defconfig<br>
&gt;&gt; @@ -73,7 +73,7 @@ CONFIG_MTD_CMDLINE_PARTS=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_MTD_BLOCK=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_MTD_PARTITIONED_MASTER=3D<wbr>y<br>
&gt;&gt;=C2=A0 CONFIG_MTD_SPI_NOR=3Dy<br>
&gt;&gt; -CONFIG_ASPEED_FLASH_SPI=3Dy<br>
&gt;&gt; +CONFIG_SPI_ASPEED_SMC=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_MTD_UBI=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_MTD_UBI_FASTMAP=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_MTD_UBI_BLOCK=3Dy<br>
&gt;&gt; @@ -116,7 +116,6 @@ CONFIG_INPUT_EVDEV=3Dy<br>
&gt;&gt;=C2=A0 # CONFIG_SERIO is not set<br>
&gt;&gt;=C2=A0 # CONFIG_VT is not set<br>
&gt;&gt;=C2=A0 CONFIG_LEGACY_PTY_COUNT=3D4<br>
&gt;&gt; -# CONFIG_DEVKMEM is not set<br>
&gt;&gt;=C2=A0 CONFIG_SERIAL_8250=3Dy<br>
&gt;&gt;=C2=A0 # CONFIG_SERIAL_8250_DEPRECATED_<wbr>OPTIONS is not set<br>
&gt;&gt;=C2=A0 CONFIG_SERIAL_8250_CONSOLE=3Dy<br>
&gt;&gt; @@ -131,10 +130,11 @@ CONFIG_ASPEED_BT_IPMI_BMC=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_I2C=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_I2C_CHARDEV=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_I2C_ASPEED=3Dy<br>
&gt;&gt; -CONFIG_SENSORS_MAX31785=3Dy<br>
&gt;&gt; +CONFIG_GPIOLIB=3Dy<br>
&gt;&gt; +CONFIG_GPIO_SYSFS=3Dy<br>
&gt;&gt; +CONFIG_GPIO_ASPEED=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_SENSORS_LM75=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_SENSORS_NCT7904=3Dy<br>
&gt;&gt; -CONFIG_SENSORS_POWER8_OCC_<wbr>I2C=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_PMBUS=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_SENSORS_ADM1275=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_SENSORS_UCD9000=3Dy<br>
&gt;&gt; @@ -152,12 +152,8 @@ CONFIG_RTC_CLASS=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_RTC_DRV_DS1307=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_RTC_DRV_ASPEED=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_MAILBOX=3Dy<br>
&gt;&gt; -CONFIG_ASPEED_MBOX=3Dy<br>
&gt;&gt; +CONFIG_ASPEED_LPC_MBOX=3Dy<br>
&gt;&gt;=C2=A0 # CONFIG_IOMMU_SUPPORT is not set<br>
&gt;&gt; -CONFIG_FSI=3Dy<br>
&gt;&gt; -CONFIG_FSI_MASTER_GPIO=3Dy<br>
&gt;&gt; -CONFIG_FSI_SCOM=3Dy<br>
&gt;&gt; -CONFIG_FSI_I2C=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_FIRMWARE_MEMMAP=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_FANOTIFY=3Dy<br>
&gt;&gt;=C2=A0 CONFIG_AUTOFS4_FS=3Dy<br>
&gt;&gt;<br>
&gt;&gt; cheers<br>
&gt;&gt; xo<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--f403045f4c4076d888054e29eee2--
