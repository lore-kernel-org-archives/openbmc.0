Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WzMvrCEy"; 
 dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fjrZ0vSnzDqXM
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 21:20:13 +1100 (AEDT)
Received: by mail-io1-xd2e.google.com with SMTP id l14so4466216ioj.5
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 02:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KSTFWUOow4V0jxg1ei+VGwqrvIR9QARRoxa/tiOS9yY=;
 b=WzMvrCEyUhyBhjlPkf8KQ4SEWQq3kax9gj8ZhcTmbDmJQDuhCUHi3dMCsBx22iw22x
 3G+w30nbTsEg9VhyU4ycNAAg/beDuvCEG/dqJZFVx7mUEO0Mg8aQ/voHDRGzUg2F01mZ
 BltQuQTbEp3rO14ioAp8Uj0a099ZukGlDjqIHThtEGj3TszGRepGkLAkOY7H0G9ePpHs
 zlgbfimNR5YmSVgk2kEsi+QPinqV+JVySr2Y2o0+KMf+FcygpMAaqaF2r9CMRpzwzKJ1
 RuE5ZnyItpbgFzI9MNdRQJh79Mq9PoJd6y5wpjZglfyGkOskBNPFtyLCH8NZBuLlmRZ6
 Ofdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KSTFWUOow4V0jxg1ei+VGwqrvIR9QARRoxa/tiOS9yY=;
 b=V6BuPPplse4HvWEzbHEOjzXWX3nJ0aX6xessjmhyOd6rsiCkSnqwmIaQbOwEPXK1NW
 24J+DsON0/0koBdOqFEIyGCp4UewjasQ4Z+djquRZp82cm3YdZZyxxX0dS+vWnKwUsai
 rRb7RPcH5GjZJp+qtirR/cc+2uhawb3qKwkD5SW3Z+h46Afo81JulEX9W1ruBmHmjYP+
 Tap95pmxI45K3SXMneRww1/5Ee8/C6Xya9/+qo+xYZZ35Vkd9aD6Fe5Cn/96NulZM8/H
 AwQIV1UhOanRw/wddtqC2RaSHZzBItaevw0LM1GWyICk225iNsuyZqzQplRiH00wUox7
 5FsQ==
X-Gm-Message-State: AJcUukfGcLbNHW611nMzITcEK1OoGO1t70AXaUhyr7oBBJm2xqfHob2w
 fTwYZH8fiHuFl/LPuJF8dmSY65/uxJf8Ad6QHwWdBVff
X-Google-Smtp-Source: ALg8bN7813nbG4FPqz6eLTGyXuJknF49e+eMkacNs05jo7k3Cp0mW1QzsoCd+lrTiBvTawh5vaYAU5ce4lEMBl+IP+E=
X-Received: by 2002:a5d:9650:: with SMTP id d16mr4487546ios.289.1547634011733; 
 Wed, 16 Jan 2019 02:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20190114130710.427600-1-tmaimon77@gmail.com>
 <CACPK8XfuiowoTr7+_d2tO8ZK6e3_zj=mz0XNJ9J4mGKOFPm=mg@mail.gmail.com>
In-Reply-To: <CACPK8XfuiowoTr7+_d2tO8ZK6e3_zj=mz0XNJ9J4mGKOFPm=mg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 16 Jan 2019 12:26:30 +0200
Message-ID: <CAP6Zq1g0PebeFbtWVpQZre_r10+Gi-EpjrF9GnVj4bKJoMKm5A@mail.gmail.com>
Subject: Re: [linux dev-4.19 00/15] dd NPCM7xx patches to dev-4.19
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000830537057f909f28"
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
X-List-Received-Date: Wed, 16 Jan 2019 10:20:15 -0000

--000000000000830537057f909f28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joel,

Thanks a lot for applying the patches

On Wed, 16 Jan 2019 at 01:46, Joel Stanley <joel@jms.id.au> wrote:

> Hi Tomer,
>
> On Tue, 15 Jan 2019 at 00:07, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Hi Joel,
> >
> > Please add the following NPCM7xx patches to dev-4.19:
>
> I applied your series and it does not compile. I am using the
> npcm7xx_defconfig you included:
>
> arm-linux-gnueabi-ld: drivers/i2c/busses/i2c-npcm7xx.o: in function
> `npcm_smb_calc_crc8':
> drivers/i2c/busses/i2c-npcm7xx.c:423: undefined reference to `crc8'
> arm-linux-gnueabi-ld: drivers/i2c/busses/i2c-npcm7xx.o: in function
> `__npcm_i2c_init':
> drivers/i2c/busses/i2c-npcm7xx.c:1668: undefined reference to
> `crc8_populate_lsb'
> drivers/i2c/busses/i2c-npcm7xx.c:1669: undefined reference to
> `crc8_populate_msb'
>
> Please test the patchset exactly as you intend to send before sending it.
>
>
I did test the patches with
https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads/8-2-201=
8-08
(gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabi)
So I do not understand why you get this failures


> In this case you needed to add `selects CRC8` to
> drivers/i2c/busses/Kconfig.
>
> You also have some warnings. Please send follow up patches ASAP to
> resolve these:
>
> ../drivers/iio/adc/npcm_adc.c: In function =E2=80=98npcm_adc_probe=E2=80=
=99:
> ../drivers/iio/adc/npcm_adc.c:301:9: warning: =E2=80=98ret=E2=80=99 may b=
e used
> uninitialized in this function [-Wmaybe-uninitialized]
>   return ret;
>          ^~~
>
> About the ADC patch you are right, somehow I didn't send the latest code
of the ADC driver. I will send it today.


> arch/arm/boot/dts/nuvoton-npcm750-evb.dtb: Warning (pci_bridge):
> /ahb/axi-pcie@e1000000: node name is not "pci" or "pcie"
> arch/arm/boot/dts/nuvoton-npcm750-evb.dtb: Warning
> (pci_device_bus_num): Failed prerequisite 'pci_bridge'
>
> In the patch set you can find patch
[linux dev-4.19 15/15] dts: npcm7xx: Modify NPCM7xx device tree
It's fix the above warnings and modify other node.
please apply it.

> I have done this for you and the tree now builds. I've merged the
> patches into dev-4.19 and will push out once I've finished testing.
>
> Cheers,
>
> Joel
>

I will make sure to send all the fixes today.

Thanks a lot,

Tomer

--000000000000830537057f909f28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">Hi Joel,<div><br></div><div>Thanks a lot for applying the patches=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, 16 Jan =
2019 at 01:46, Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D=
"_blank">joel@jms.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi Tomer,<br>
<br>
On Tue, 15 Jan 2019 at 00:07, Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@=
gmail.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Joel,<br>
&gt;<br>
&gt; Please add the following NPCM7xx patches to dev-4.19:<br>
<br>
I applied your series and it does not compile. I am using the<br>
npcm7xx_defconfig you included:<br>
<br>
arm-linux-gnueabi-ld: drivers/i2c/busses/i2c-npcm7xx.o: in function<br>
`npcm_smb_calc_crc8&#39;:<br>
drivers/i2c/busses/i2c-npcm7xx.c:423: undefined reference to `crc8&#39;<br>
arm-linux-gnueabi-ld: drivers/i2c/busses/i2c-npcm7xx.o: in function<br>
`__npcm_i2c_init&#39;:<br>
drivers/i2c/busses/i2c-npcm7xx.c:1668: undefined reference to<br>
`crc8_populate_lsb&#39;<br>
drivers/i2c/busses/i2c-npcm7xx.c:1669: undefined reference to<br>
`crc8_populate_msb&#39;<br>
<br>
Please test the patchset exactly as you intend to send before sending it.<b=
r>
<br></blockquote><div><br></div><div>I did test the patches with</div><div>=
<a href=3D"https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downlo=
ads/8-2-2018-08">https://developer.arm.com/open-source/gnu-toolchain/gnu-a/=
downloads/8-2-2018-08</a><br></div><div>(gcc-arm-8.2-2018.08-x86_64-arm-lin=
ux-gnueabi)</div><div>So I do not understand why you get this failures</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
In this case you needed to add `selects CRC8` to drivers/i2c/busses/Kconfig=
.<br>
<br>
You also have some warnings. Please send follow up patches ASAP to<br>
resolve these:<br>
<br>
../drivers/iio/adc/npcm_adc.c: In function =E2=80=98npcm_adc_probe=E2=80=99=
:<br>
../drivers/iio/adc/npcm_adc.c:301:9: warning: =E2=80=98ret=E2=80=99 may be =
used<br>
uninitialized in this function [-Wmaybe-uninitialized]<br>
=C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~<br>
<br></blockquote><div>About the ADC patch you are right, somehow I didn&#39=
;t send the latest code of the ADC driver. I will send it today.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
arch/arm/boot/dts/nuvoton-npcm750-evb.dtb: Warning (pci_bridge):<br>
/ahb/axi-pcie@e1000000: node name is not &quot;pci&quot; or &quot;pcie&quot=
;<br>
arch/arm/boot/dts/nuvoton-npcm750-evb.dtb: Warning<br>
(pci_device_bus_num): Failed prerequisite &#39;pci_bridge&#39;<br>
<br></blockquote><div>In the patch set you can find patch</div><div><font f=
ace=3D"arial, helvetica, sans-serif"><span style=3D"color:rgb(32,33,36);fon=
t-variant-ligatures:no-contextual">[linux dev-4.19 15/15] dts: npcm7xx: Mod=
ify NPCM7xx device tree</span><br></font></div><div><span style=3D"color:rg=
b(32,33,36);font-variant-ligatures:no-contextual"><font face=3D"arial, helv=
etica, sans-serif">It&#39;s fix the above warnings and modify other node.</=
font></span></div><div><span style=3D"color:rgb(32,33,36);font-variant-liga=
tures:no-contextual"><font face=3D"arial, helvetica, sans-serif">please app=
ly it.</font></span></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>I have done this for you and the tree now builds. I&#39;ve merged the<br>
patches into dev-4.19 and will push out once I&#39;ve finished testing.<br>
<br>
Cheers,<br>
<br>
Joel<br></blockquote><div><br></div><div>I will make sure to send all the f=
ixes today.</div><div><br></div><div>Thanks a lot,</div><div><br></div><div=
>Tomer</div></div></div></div></div></div>

--000000000000830537057f909f28--
