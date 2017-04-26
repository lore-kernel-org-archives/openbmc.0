Return-Path: <raltherr@google.com>
Received: from mail-wm0-x22c.google.com (mail-wm0-x22c.google.com
 [IPv6:2a00:1450:400c:c09::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wCnCT6K6szDqCL
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 03:30:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="IGumWvTY"; 
 dkim-atps=neutral
Received: by mail-wm0-x22c.google.com with SMTP id u65so57216142wmu.1
 for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 10:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=i0l2EJQuB0VrMxiEDi8eZE2XAALR4J8CHvTx4Dv/E8c=;
 b=IGumWvTYtgy4RVemjGF/vFbYgVXUViISpUHMNNPX4eqq6IajcSpB06+VWg+FrFhjs4
 Tjn1uopfB6lp0qVyfASUZfF4psAikSJWiJlM57xDhOYeiWRuFe1zsbdVSQs6sohIBYTz
 oErxOx8iMgZPw1VfoE07poLK+m/DosdlHLYNfdI0KBeGnMef3AI0wCkFqWEibens/kvM
 KHoBpj7HhPu0P9DXQedvdNV1AWi6QjTBYOsT3PmxZo5ModNSStnOrpO6HTKOpSBKZGtI
 vcpvM7Zt2ypCrr93wvTVWbAMSJP1Bq98/p5tzoBOJ9JltS0zfW75g8VWwsNES5h4yvXn
 uwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=i0l2EJQuB0VrMxiEDi8eZE2XAALR4J8CHvTx4Dv/E8c=;
 b=TrL86xm5OHT/b6GqNmHFOrmbHBUOgu+T0yZYZUmHpRDZnw2biNGBnvsomAJciI8w5V
 kBH5OD0b9vFbUq1/QqPrTRCdZratYX/bK6gIunHlC2GE1/POBCA9hcTxfpfXbNqXUiLs
 x4sP2RJ++cX5k2YC7nfsucvzpWZrD7Mk5ARBGg/dV9M5ZCwLMONqDJJ6Zt8EjV7C10sL
 D7UANTHw4kzIpxAWUTqWEjMJ6z8bIgiJXSqtHUWowzVkPKmG+uRtnGrTwcexW1d81D+c
 +9UG6soNflsqCcE91rZj/czp6367YzAjgQWFOWFU4zrZ4sKCRE7d96RM5hej03tsf/gM
 xSKQ==
X-Gm-Message-State: AN3rC/6vCdmczuPlTKlhoDAWfiEX2hVuqtGk66KDgE52IMpXeEVJCSLU
 DB444TvQlpTJ62EX/c6Fi0wdjR8stbPx
X-Received: by 10.28.87.70 with SMTP id l67mr6057038wmb.37.1493227809680; Wed,
 26 Apr 2017 10:30:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.46.130 with HTTP; Wed, 26 Apr 2017 10:30:08 -0700 (PDT)
In-Reply-To: <CAPH-5w4OS_oT5MMu2kEOUwtOza_LO94vwSH9dZHpVMa_4OA38Q@mail.gmail.com>
References: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
 <CAPH-5w6-2zVQn2iNVP28aOAS_r11rxGYCrioXCR-sX8Ln7_BZQ@mail.gmail.com>
 <CAPH-5w4OS_oT5MMu2kEOUwtOza_LO94vwSH9dZHpVMa_4OA38Q@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 26 Apr 2017 10:30:08 -0700
Message-ID: <CAPLgG=nuU5befF4AfheWAbnU7tYPCpZSnj+-Zk8MDkvaKek+uw@mail.gmail.com>
Subject: Re: Switching to 4.10
To: Xo Wang <xow@google.com>
Cc: Joel Stanley <joel@jms.id.au>, Edward James <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>
Content-Type: multipart/alternative; boundary=001a1144323e2a9dc9054e1531b9
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
X-List-Received-Date: Wed, 26 Apr 2017 17:30:15 -0000

--001a1144323e2a9dc9054e1531b9
Content-Type: text/plain; charset=UTF-8

I saw Joel started https://gerrit.openbmc-project.xyz/#/c/2846/ which has a
defconfig for ast2400.  If you have one for ast2500, please upload a new
patch set to that change.

On Tue, Apr 25, 2017 at 5:30 PM, Xo Wang <xow@google.com> wrote:

> On Tue, Apr 25, 2017 at 4:57 PM, Xo Wang <xow@google.com> wrote:
> > Hi Joel,
> >
> > On Thu, Apr 20, 2017 at 7:30 PM, Joel Stanley <joel@jms.id.au> wrote:
> >> Hello team,
> >>
> >> I want to make the 4.10 change happen. We don't have the resource to
> >> be maintaining two trees, and the 4.10 tree has a whole heap of
> >> shinyness - faster network, faster flash access, improved I2C.
> >>
> >> To this end I will stop merging patches in to 4.7. Please target the
> >> 4.10 tree from here on.
> >>
> >> Use this thread to discuss concerns and coordinate the work that needs
> >> to be done. Bits that I'm aware of
> >>
> >>  - Eddie is updating userspace to the new FSI APIs
> >>  - I need to merge the upstream FSI patchset
> >>  - Brednan needs to post the lastest version of the i2c patchset which
> >> I will merge
> >>  - I need to merge benh's ftgmac100 improvements
> >
> > We'll need to update the defconfig in the build system. Currently if I
> > compile the kernel and generate a new defconfig (make savedefconfig),
> > I see the following changes in the 4.10 generated defconfig:
> >
> > @@ -73,7 +73,6 @@
> >  CONFIG_MTD_BLOCK=y
> >  CONFIG_MTD_PARTITIONED_MASTER=y
> >  CONFIG_MTD_SPI_NOR=y
> > -CONFIG_ASPEED_FLASH_SPI=y
> >  CONFIG_MTD_UBI=y
> >  CONFIG_MTD_UBI_FASTMAP=y
> >  CONFIG_MTD_UBI_BLOCK=y
> > @@ -116,7 +115,6 @@
> >  # CONFIG_SERIO is not set
> >  # CONFIG_VT is not set
> >  CONFIG_LEGACY_PTY_COUNT=4
> > -# CONFIG_DEVKMEM is not set
> >  CONFIG_SERIAL_8250=y
> >  # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> >  CONFIG_SERIAL_8250_CONSOLE=y
> > @@ -131,10 +129,8 @@
> >  CONFIG_I2C=y
> >  CONFIG_I2C_CHARDEV=y
> >  CONFIG_I2C_ASPEED=y
> > -CONFIG_SENSORS_MAX31785=y
> >  CONFIG_SENSORS_LM75=y
> >  CONFIG_SENSORS_NCT7904=y
> > -CONFIG_SENSORS_POWER8_OCC_I2C=y
> >  CONFIG_PMBUS=y
> >  CONFIG_SENSORS_ADM1275=y
> >  CONFIG_SENSORS_UCD9000=y
> > @@ -143,21 +139,14 @@
> >  # CONFIG_USB_SUPPORT is not set
> >  CONFIG_NEW_LEDS=y
> >  CONFIG_LEDS_CLASS=y
> > -CONFIG_LEDS_GPIO=y
> >  CONFIG_LEDS_TRIGGERS=y
> >  CONFIG_LEDS_TRIGGER_TIMER=y
> >  CONFIG_LEDS_TRIGGER_HEARTBEAT=y
> > -CONFIG_LEDS_TRIGGER_GPIO=y
> >  CONFIG_RTC_CLASS=y
> >  CONFIG_RTC_DRV_DS1307=y
> >  CONFIG_RTC_DRV_ASPEED=y
> >  CONFIG_MAILBOX=y
> > -CONFIG_ASPEED_MBOX=y
> >  # CONFIG_IOMMU_SUPPORT is not set
> > -CONFIG_FSI=y
> > -CONFIG_FSI_MASTER_GPIO=y
> > -CONFIG_FSI_SCOM=y
> > -CONFIG_FSI_I2C=y
> >  CONFIG_FIRMWARE_MEMMAP=y
> >  CONFIG_FANOTIFY=y
> >  CONFIG_AUTOFS4_FS=y
> >
> >>
> >> Cheers,
> >>
> >> Joel
> >
> > I know that CONFIG_ASPEED_FLASH_SPI is now CONFIG_SPI_ASPEED_SMC, but
> > I've yet to look at each of the other differences.
> >
> > cheers
> > xo
>
> OK, I guess it's not that much work to look at those configs. This
> seems to work up to the limit of the missing FSI drivers as previously
> mentioned:
>
> --- a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-
> kernel/linux/linux-obmc/defconfig
> +++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-
> kernel/linux/linux-obmc/defconfig
> @@ -73,7 +73,7 @@ CONFIG_MTD_CMDLINE_PARTS=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_PARTITIONED_MASTER=y
>  CONFIG_MTD_SPI_NOR=y
> -CONFIG_ASPEED_FLASH_SPI=y
> +CONFIG_SPI_ASPEED_SMC=y
>  CONFIG_MTD_UBI=y
>  CONFIG_MTD_UBI_FASTMAP=y
>  CONFIG_MTD_UBI_BLOCK=y
> @@ -116,7 +116,6 @@ CONFIG_INPUT_EVDEV=y
>  # CONFIG_SERIO is not set
>  # CONFIG_VT is not set
>  CONFIG_LEGACY_PTY_COUNT=4
> -# CONFIG_DEVKMEM is not set
>  CONFIG_SERIAL_8250=y
>  # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
>  CONFIG_SERIAL_8250_CONSOLE=y
> @@ -131,10 +130,11 @@ CONFIG_ASPEED_BT_IPMI_BMC=y
>  CONFIG_I2C=y
>  CONFIG_I2C_CHARDEV=y
>  CONFIG_I2C_ASPEED=y
> -CONFIG_SENSORS_MAX31785=y
> +CONFIG_GPIOLIB=y
> +CONFIG_GPIO_SYSFS=y
> +CONFIG_GPIO_ASPEED=y
>  CONFIG_SENSORS_LM75=y
>  CONFIG_SENSORS_NCT7904=y
> -CONFIG_SENSORS_POWER8_OCC_I2C=y
>  CONFIG_PMBUS=y
>  CONFIG_SENSORS_ADM1275=y
>  CONFIG_SENSORS_UCD9000=y
> @@ -152,12 +152,8 @@ CONFIG_RTC_CLASS=y
>  CONFIG_RTC_DRV_DS1307=y
>  CONFIG_RTC_DRV_ASPEED=y
>  CONFIG_MAILBOX=y
> -CONFIG_ASPEED_MBOX=y
> +CONFIG_ASPEED_LPC_MBOX=y
>  # CONFIG_IOMMU_SUPPORT is not set
> -CONFIG_FSI=y
> -CONFIG_FSI_MASTER_GPIO=y
> -CONFIG_FSI_SCOM=y
> -CONFIG_FSI_I2C=y
>  CONFIG_FIRMWARE_MEMMAP=y
>  CONFIG_FANOTIFY=y
>  CONFIG_AUTOFS4_FS=y
>
> cheers
> xo
>

--001a1144323e2a9dc9054e1531b9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I saw Joel started=C2=A0<a href=3D"https://gerrit.openbmc-=
project.xyz/#/c/2846/">https://gerrit.openbmc-project.xyz/#/c/2846/</a> whi=
ch has a defconfig for ast2400.=C2=A0 If you have one for ast2500, please u=
pload a new patch set to that change.</div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Tue, Apr 25, 2017 at 5:30 PM, Xo Wang <span di=
r=3D"ltr">&lt;<a href=3D"mailto:xow@google.com" target=3D"_blank">xow@googl=
e.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D=
"HOEnZb"><div class=3D"h5">On Tue, Apr 25, 2017 at 4:57 PM, Xo Wang &lt;<a =
href=3D"mailto:xow@google.com">xow@google.com</a>&gt; wrote:<br>
&gt; Hi Joel,<br>
&gt;<br>
&gt; On Thu, Apr 20, 2017 at 7:30 PM, Joel Stanley &lt;<a href=3D"mailto:jo=
el@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>
&gt;&gt; Hello team,<br>
&gt;&gt;<br>
&gt;&gt; I want to make the 4.10 change happen. We don&#39;t have the resou=
rce to<br>
&gt;&gt; be maintaining two trees, and the 4.10 tree has a whole heap of<br=
>
&gt;&gt; shinyness - faster network, faster flash access, improved I2C.<br>
&gt;&gt;<br>
&gt;&gt; To this end I will stop merging patches in to 4.7. Please target t=
he<br>
&gt;&gt; 4.10 tree from here on.<br>
&gt;&gt;<br>
&gt;&gt; Use this thread to discuss concerns and coordinate the work that n=
eeds<br>
&gt;&gt; to be done. Bits that I&#39;m aware of<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 - Eddie is updating userspace to the new FSI APIs<br>
&gt;&gt;=C2=A0 - I need to merge the upstream FSI patchset<br>
&gt;&gt;=C2=A0 - Brednan needs to post the lastest version of the i2c patch=
set which<br>
&gt;&gt; I will merge<br>
&gt;&gt;=C2=A0 - I need to merge benh&#39;s ftgmac100 improvements<br>
&gt;<br>
&gt; We&#39;ll need to update the defconfig in the build system. Currently =
if I<br>
&gt; compile the kernel and generate a new defconfig (make savedefconfig),<=
br>
&gt; I see the following changes in the 4.10 generated defconfig:<br>
&gt;<br>
&gt; @@ -73,7 +73,6 @@<br>
&gt;=C2=A0 CONFIG_MTD_BLOCK=3Dy<br>
&gt;=C2=A0 CONFIG_MTD_PARTITIONED_MASTER=3D<wbr>y<br>
&gt;=C2=A0 CONFIG_MTD_SPI_NOR=3Dy<br>
&gt; -CONFIG_ASPEED_FLASH_SPI=3Dy<br>
&gt;=C2=A0 CONFIG_MTD_UBI=3Dy<br>
&gt;=C2=A0 CONFIG_MTD_UBI_FASTMAP=3Dy<br>
&gt;=C2=A0 CONFIG_MTD_UBI_BLOCK=3Dy<br>
&gt; @@ -116,7 +115,6 @@<br>
&gt;=C2=A0 # CONFIG_SERIO is not set<br>
&gt;=C2=A0 # CONFIG_VT is not set<br>
&gt;=C2=A0 CONFIG_LEGACY_PTY_COUNT=3D4<br>
&gt; -# CONFIG_DEVKMEM is not set<br>
&gt;=C2=A0 CONFIG_SERIAL_8250=3Dy<br>
&gt;=C2=A0 # CONFIG_SERIAL_8250_DEPRECATED_<wbr>OPTIONS is not set<br>
&gt;=C2=A0 CONFIG_SERIAL_8250_CONSOLE=3Dy<br>
&gt; @@ -131,10 +129,8 @@<br>
&gt;=C2=A0 CONFIG_I2C=3Dy<br>
&gt;=C2=A0 CONFIG_I2C_CHARDEV=3Dy<br>
&gt;=C2=A0 CONFIG_I2C_ASPEED=3Dy<br>
&gt; -CONFIG_SENSORS_MAX31785=3Dy<br>
&gt;=C2=A0 CONFIG_SENSORS_LM75=3Dy<br>
&gt;=C2=A0 CONFIG_SENSORS_NCT7904=3Dy<br>
&gt; -CONFIG_SENSORS_POWER8_OCC_<wbr>I2C=3Dy<br>
&gt;=C2=A0 CONFIG_PMBUS=3Dy<br>
&gt;=C2=A0 CONFIG_SENSORS_ADM1275=3Dy<br>
&gt;=C2=A0 CONFIG_SENSORS_UCD9000=3Dy<br>
&gt; @@ -143,21 +139,14 @@<br>
&gt;=C2=A0 # CONFIG_USB_SUPPORT is not set<br>
&gt;=C2=A0 CONFIG_NEW_LEDS=3Dy<br>
&gt;=C2=A0 CONFIG_LEDS_CLASS=3Dy<br>
&gt; -CONFIG_LEDS_GPIO=3Dy<br>
&gt;=C2=A0 CONFIG_LEDS_TRIGGERS=3Dy<br>
&gt;=C2=A0 CONFIG_LEDS_TRIGGER_TIMER=3Dy<br>
&gt;=C2=A0 CONFIG_LEDS_TRIGGER_HEARTBEAT=3D<wbr>y<br>
&gt; -CONFIG_LEDS_TRIGGER_GPIO=3Dy<br>
&gt;=C2=A0 CONFIG_RTC_CLASS=3Dy<br>
&gt;=C2=A0 CONFIG_RTC_DRV_DS1307=3Dy<br>
&gt;=C2=A0 CONFIG_RTC_DRV_ASPEED=3Dy<br>
&gt;=C2=A0 CONFIG_MAILBOX=3Dy<br>
&gt; -CONFIG_ASPEED_MBOX=3Dy<br>
&gt;=C2=A0 # CONFIG_IOMMU_SUPPORT is not set<br>
&gt; -CONFIG_FSI=3Dy<br>
&gt; -CONFIG_FSI_MASTER_GPIO=3Dy<br>
&gt; -CONFIG_FSI_SCOM=3Dy<br>
&gt; -CONFIG_FSI_I2C=3Dy<br>
&gt;=C2=A0 CONFIG_FIRMWARE_MEMMAP=3Dy<br>
&gt;=C2=A0 CONFIG_FANOTIFY=3Dy<br>
&gt;=C2=A0 CONFIG_AUTOFS4_FS=3Dy<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Joel<br>
&gt;<br>
&gt; I know that CONFIG_ASPEED_FLASH_SPI is now CONFIG_SPI_ASPEED_SMC, but<=
br>
&gt; I&#39;ve yet to look at each of the other differences.<br>
&gt;<br>
&gt; cheers<br>
&gt; xo<br>
<br>
</div></div>OK, I guess it&#39;s not that much work to look at those config=
s. This<br>
seems to work up to the limit of the missing FSI drivers as previously<br>
mentioned:<br>
<br>
--- a/meta-openbmc-bsp/meta-<wbr>aspeed/meta-ast2500/recipes-<wbr>kernel/li=
nux/linux-obmc/<wbr>defconfig<br>
+++ b/meta-openbmc-bsp/meta-<wbr>aspeed/meta-ast2500/recipes-<wbr>kernel/li=
nux/linux-obmc/<wbr>defconfig<br>
@@ -73,7 +73,7 @@ CONFIG_MTD_CMDLINE_PARTS=3Dy<br>
=C2=A0CONFIG_MTD_BLOCK=3Dy<br>
=C2=A0CONFIG_MTD_PARTITIONED_MASTER=3D<wbr>y<br>
=C2=A0CONFIG_MTD_SPI_NOR=3Dy<br>
-CONFIG_ASPEED_FLASH_SPI=3Dy<br>
+CONFIG_SPI_ASPEED_SMC=3Dy<br>
=C2=A0CONFIG_MTD_UBI=3Dy<br>
=C2=A0CONFIG_MTD_UBI_FASTMAP=3Dy<br>
=C2=A0CONFIG_MTD_UBI_BLOCK=3Dy<br>
@@ -116,7 +116,6 @@ CONFIG_INPUT_EVDEV=3Dy<br>
<span class=3D"">=C2=A0# CONFIG_SERIO is not set<br>
=C2=A0# CONFIG_VT is not set<br>
=C2=A0CONFIG_LEGACY_PTY_COUNT=3D4<br>
-# CONFIG_DEVKMEM is not set<br>
=C2=A0CONFIG_SERIAL_8250=3Dy<br>
=C2=A0# CONFIG_SERIAL_8250_DEPRECATED_<wbr>OPTIONS is not set<br>
=C2=A0CONFIG_SERIAL_8250_CONSOLE=3Dy<br>
</span>@@ -131,10 +130,11 @@ CONFIG_ASPEED_BT_IPMI_BMC=3Dy<br>
=C2=A0CONFIG_I2C=3Dy<br>
=C2=A0CONFIG_I2C_CHARDEV=3Dy<br>
=C2=A0CONFIG_I2C_ASPEED=3Dy<br>
-CONFIG_SENSORS_MAX31785=3Dy<br>
+CONFIG_GPIOLIB=3Dy<br>
+CONFIG_GPIO_SYSFS=3Dy<br>
+CONFIG_GPIO_ASPEED=3Dy<br>
<span class=3D"">=C2=A0CONFIG_SENSORS_LM75=3Dy<br>
=C2=A0CONFIG_SENSORS_NCT7904=3Dy<br>
-CONFIG_SENSORS_POWER8_OCC_<wbr>I2C=3Dy<br>
=C2=A0CONFIG_PMBUS=3Dy<br>
=C2=A0CONFIG_SENSORS_ADM1275=3Dy<br>
=C2=A0CONFIG_SENSORS_UCD9000=3Dy<br>
</span>@@ -152,12 +152,8 @@ CONFIG_RTC_CLASS=3Dy<br>
=C2=A0CONFIG_RTC_DRV_DS1307=3Dy<br>
=C2=A0CONFIG_RTC_DRV_ASPEED=3Dy<br>
=C2=A0CONFIG_MAILBOX=3Dy<br>
-CONFIG_ASPEED_MBOX=3Dy<br>
+CONFIG_ASPEED_LPC_MBOX=3Dy<br>
<span class=3D"">=C2=A0# CONFIG_IOMMU_SUPPORT is not set<br>
-CONFIG_FSI=3Dy<br>
-CONFIG_FSI_MASTER_GPIO=3Dy<br>
-CONFIG_FSI_SCOM=3Dy<br>
-CONFIG_FSI_I2C=3Dy<br>
=C2=A0CONFIG_FIRMWARE_MEMMAP=3Dy<br>
=C2=A0CONFIG_FANOTIFY=3Dy<br>
=C2=A0CONFIG_AUTOFS4_FS=3Dy<br>
<br>
</span>cheers<br>
<span class=3D"HOEnZb"><font color=3D"#888888">xo<br>
</font></span></blockquote></div><br></div>

--001a1144323e2a9dc9054e1531b9--
