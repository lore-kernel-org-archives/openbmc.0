Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22c; helo=mail-qt0-x22c.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jurxXmUl"; 
 dkim-atps=neutral
Received: from mail-qt0-x22c.google.com (mail-qt0-x22c.google.com
 [IPv6:2607:f8b0:400d:c0d::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 411dzQ4n24zF0WP
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jun 2018 18:30:57 +1000 (AEST)
Received: by mail-qt0-x22c.google.com with SMTP id s9-v6so9306273qtg.2
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jun 2018 01:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=WgXw3oAMJhgaqstkIOSZldibTJlVw5pv/d8Py+i2lL0=;
 b=jurxXmUltPNgBPJoPPhXa07B6IbtSR93APMpR3wnJ0vp58BJ1Fr85PIRrQ9CbkDOjm
 rDwwQhzeKOCND62QpIAYL6SY1iKzvulDsbdbgbkRu7LRDA4pAfelgsF+5MZv7/Szb41j
 Kq8pKu9T/EMrTC+hR7O1YH5Sl6OKIJlAp0qdpy1Jqp9l6rZQL1yjwqECeYpHmb0Ymrf9
 sJuFnFDUd5yA+93xRoKFSRqnvUpwQpNjb0qHWcKakpdCXgZY2F1s1SeJcoBVOTa05qm6
 bxzFXmLEycHqDdusevWkU8sk2k3F73SWSA+IRpidnv+fzH++XN5LtwYGiOzrW9nkE1C/
 jnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=WgXw3oAMJhgaqstkIOSZldibTJlVw5pv/d8Py+i2lL0=;
 b=T+D0hXR/RVZTnEM4DGiZ5iHh7sgoqFUjt1qKBbobWXlc73A/ATJEaZu+C2mCBlUBIN
 EfY2MCDgFCyg19CcP8DoXxE2A8UpYYVWZ6yOCyysRvmYgVP6Z66ztItwUPb7QzCsAeTy
 ludykmpFgeKvOxRSbMYINX3REfaZUOewP2OORAOr7PCkCP++eMwN1CP1nKNWIp6DyG5M
 Bmo8sB0ri7o4N4tQkaOCJolZL9qhs2oKj9pwLk/zfI0VYVDTNM4uHMG7YIU4r84o1/11
 Thog68dduDMKQof86bBMAo+cX///1pIDBHDw1amv9B8Hor+b1rqeT8Y+fVqzEciI/vYY
 re0w==
X-Gm-Message-State: APt69E0zLpeutFh2zMkfLBl0GUpzqDEd4fb4HqreLMt2Lf7E8c/5m8xq
 OdOsLSTAAc5lNs87Qfz6n5GIC/NcHbQVgE0IEraNOA==
X-Google-Smtp-Source: ADUXVKJMV+hFslQelIRVoVvYavFprXsyOTt+940y6onwfEzTG6rUXojvjv2j1SMrA6jQtMW4IJLfHzKgppak6wsPU3E=
X-Received: by 2002:a0c:ae0a:: with SMTP id
 y10-v6mr722859qvc.157.1528360255012; 
 Thu, 07 Jun 2018 01:30:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:2965:0:0:0:0:0 with HTTP;
 Thu, 7 Jun 2018 01:30:54 -0700 (PDT)
In-Reply-To: <CAG9c7cBDRZGgny4mZzvGke4vHAWMO+b=XNDdrufkZzv=vGcDYg@mail.gmail.com>
References: <CAG9c7cA1Zz_z=Rz1E+i3U_HD4JNOxisQQn27gOgAV9RBs7AdiA@mail.gmail.com>
 <1528252585.1372887.1397896680.27123F8A@webmail.messagingengine.com>
 <CAG9c7cD0NLPVeoBzX3hVO226=EwBM-vypz5FJkUrteCabG-kSQ@mail.gmail.com>
 <CACPK8Xc5Zdd9LM+Ao-3Ly4c3_WDz76K-S6Xq0fky5T8m3zFyBA@mail.gmail.com>
 <CAG9c7cBDRZGgny4mZzvGke4vHAWMO+b=XNDdrufkZzv=vGcDYg@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Thu, 7 Jun 2018 16:30:54 +0800
Message-ID: <CAG9c7cAKnZSQ=EOYUhB9vZ9z0ptmoi+WhFK=8twUjjOPUsTCag@mail.gmail.com>
Subject: Re: How to configure Clock Stop Control Register
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000016c296056e091a5a"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jun 2018 08:30:59 -0000

--00000000000016c296056e091a5a
Content-Type: text/plain; charset="UTF-8"

The 'memory-region' is also the mandatory attribute for the loading of
lpc-ctrl driver.

node = of_parse_phandle(dev->of_node, "memory-region", 0);
    if (!node) {
        dev_err(dev, "Didn't find reserved memory\n");
        return -EINVAL;
    }

Could anyone share the explanation?

Thanks for your help.


2018-06-07 13:26 GMT+08:00 Henbin Chang <henbinchang@gmail.com>:

> Hi Joel,
>
> Thanks for your response.
>
> But I don't understand why 'SCU0C[8] = 1' is related with
> aspeed_lpc_ctrl_ioctl().
>
> I don't see any code to write SCU0C register In the
> aspeed_lpc_ctrl_ioctl().
>
> Update my finding.
>
> I find the aspeed-lpc-ctrl driver can throw the below error message and
> 'return -ENODEV',
> 'Didn't find host pnor flash node'
>
> After checking the my dts, it lacks of the 'flash' filed in the lpc_ctrl .
>
> So I refer the aspeed-bmc-opp-zaius.dts and add it into my dts.
> &lpc_ctrl {
>     status = "okay";
>     memory-region = <&flash_memory>;
>     flash = <&spi1>;
> };
>
> And then the lpc aspeed-lpc-ctrl driver can be loaded successfully.
> And the SCU0C[8] isn't set as 1b'.
>
> For my understanding, the 'spi1' indicates the system SPI connected into
> BIOS SPI flash.
> I don't know why lpc_ctrl has to need the 'flash' field.
>
> Thanks for your help.
>
> 2018-06-06 17:01 GMT+08:00 Joel Stanley <joel@jms.id.au>:
>
>> Hello Henbin,
>>
>> tldr: you need to ensure mboxd has run so the aspeed-lpc-ctrl ioctl
>> has been performed.
>>
>> See below for my explanation.
>>
>> On 6 June 2018 at 14:32, Henbin Chang <henbinchang@gmail.com> wrote:
>> >> What kernel tree are you building/booting? Can you provide a link?
>> >> Currently we've tied the LCLK to enabling LPC2AHB bridge:
>> >>
>> >> https://github.com/openbmc/linux/blob/dev-4.13/arch/arm/boot
>> /dts/aspeed-g5.dtsi#L302
>> >> You may need to add the following to your dts if you've developed your
>> >> own:
>> >> ```
>> >> &lpc_ctrl {
>> >>         status = "okay";
>> >> };
>> >
>> > I use dev-4.13 branch (the last commit is
>> > aca92be80c008bceeb6fb62fd1d450b5be5d0a4f).
>> >
>> > The aspeed-g5.dtsi I use is the same with the one in your link.
>> >
>> > I follow your suggestion and add the following to my dts but the
>> SCU0C[8] is
>> > still 1b'.
>> >
>> > &lpc_ctrl {
>> >         status = "okay";
>> > };
>> >
>> > Even I directly change the status of lpc_ctrl to 'okay'  in the
>> > aspeed-g5.dtsi,  the SCU0C[8] is still 1b'.
>> > lpc_ctrl: lpc-ctrl@0 {
>> >      compatible = "aspeed,ast2500-lpc-ctrl";
>> >      reg = <0x0 0x80>;
>> >      clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>> >      status = "okay";
>> >  };
>>
>> Doing these two are equivalent. But it never hurts to try when things
>> aren't working :)
>>
>> >
>> > devmem 0x1e6e200c 32
>> > 0xFFCDBF8B
>>
>> If you take a look a the driver, you will see this snippet:
>>
>> drivers/misc/aspeed-lpc-ctrl.c
>>
>> static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
>>                 unsigned long param)
>> {
>>                 /*
>>                  * Enable LPC FHW cycles. This is required for the host to
>>                  * access the regions specified.
>>                  */
>>                 return regmap_update_bits(lpc_ctrl->regmap, HICR5,
>>                                 HICR5_ENFWH | HICR5_ENL2H,
>>                                 HICR5_ENFWH | HICR5_ENL2H);
>>
>>
>> The driver is designed to only enable the bridge (ENL2H) when the
>> configuration registers have been programmed by an ioctl() from
>> userspace.
>>
>> This is to ensure the window is pointing at an area of memory that has
>> been chosen by the system integrator, and not accidentally exposing
>> some BMC RAM to the host. So the ioctl for programming the window will
>> automatically enable the FWH and L2H bits (bits 10 and 8).
>>
>> On OpenPower systems, the tool that performs the ioctl is 'mboxd'. If
>> you are using an OpenPower system, where the host firmware talks the
>> mbox protocol (hostboot and skiboot do this), then you should run
>> mboxd.
>>
>> If you're running on another platform, you could write a small utility
>> to do this ioctl from userspace. I wrote one in Rust a few months ago,
>> but you probably want to use C instead.
>>
>> Cheers,
>>
>> Joel
>>
>
>

--00000000000016c296056e091a5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The &#39;memory-region&#39; is also the mandatory att=
ribute for the loading of lpc-ctrl driver.</div><div><br></div><div>node =
=3D of_parse_phandle(dev-&gt;of_node, &quot;memory-region&quot;, 0);</div><=
div>=C2=A0 =C2=A0 if (!node) {</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_er=
r(dev, &quot;Didn&#39;t find reserved memory\n&quot;);</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return -EINVAL;</div><div>=C2=A0 =C2=A0 }</div><div><br><=
/div><div>Could anyone share the explanation?</div><div><br></div><div>Than=
ks for your help.</div><div>=C2=A0</div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">2018-06-07 13:26 GMT+08:00 Henbin Chang <span dir=3D=
"ltr">&lt;<a href=3D"mailto:henbinchang@gmail.com" target=3D"_blank">henbin=
chang@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">Hi Joel,<div><br></div><div>Thanks for your res=
ponse.</div><div><br></div><div>But I don&#39;t understand why &#39;SCU0C[8=
] =3D 1&#39; is related with aspeed_lpc_ctrl_ioctl().</div><div><br></div><=
div>I don&#39;t see any code to write SCU0C register In the aspeed_lpc_ctrl=
_ioctl().</div><div><br></div><div>Update my finding.=C2=A0</div><div><br><=
/div><div>I find the=C2=A0aspeed-lpc-ctrl driver can throw the below error =
message and &#39;return -ENODEV&#39;,</div><div>&#39;Didn&#39;t find host p=
nor flash node&#39;</div><div><br></div><div>After checking the my dts, it =
lacks of the &#39;flash&#39; filed in the=20

<span style=3D"font-size:small;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">lpc_ctrl<span>=C2=A0</span></span>.</div><div><br></div><div>So I refer=
=20

<span style=3D"font-size:small;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">the aspeed-bmc-opp-zaius.dts</span>=C2=A0and add it into my dts.</div><di=
v><div>&amp;lpc_ctrl {</div><div>=C2=A0 =C2=A0 status =3D &quot;okay&quot;;=
</div><div>=C2=A0 =C2=A0 memory-region =3D &lt;&amp;flash_memory&gt;;</div>=
<div>=C2=A0 =C2=A0 flash =3D &lt;&amp;spi1&gt;;</div><div>};</div></div><di=
v><br></div><div>And then the lpc

<span style=3D"font-size:small;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">aspeed-lpc-ctrl driver can be loaded successfully.</span></div><div><span=
 style=3D"font-size:small;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;float:none;display:inline">And=
 the SCU0C[8] isn&#39;t set as 1b&#39;.</span></div><div><span style=3D"fon=
t-size:small;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline"><br></span></div=
><div><span style=3D"font-size:small;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">For my understanding, the &#39;spi1&#39; indicates the system SPI c=
onnected into BIOS SPI flash.</span></div><div>I don&#39;t know why lpc_ctr=
l has to need the &#39;flash&#39; field.</div><div><br></div><div>Thanks fo=
r your help.</div><div><div class=3D"gmail-h5"><div><br></div><div><div cla=
ss=3D"gmail_extra"><div class=3D"gmail_quote">2018-06-06 17:01 GMT+08:00 Jo=
el Stanley <span dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" target=
=3D"_blank">joel@jms.id.au</a>&gt;</span>:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hello Henbin,<br>
<br>
tldr: you need to ensure mboxd has run so the aspeed-lpc-ctrl ioctl<br>
has been performed.<br>
<br>
See below for my explanation.<br>
<span class=3D"gmail-m_-9044243996973820217gmail-"><br>
On 6 June 2018 at 14:32, Henbin Chang &lt;<a href=3D"mailto:henbinchang@gma=
il.com" target=3D"_blank">henbinchang@gmail.com</a>&gt; wrote:<br>
&gt;&gt; What kernel tree are you building/booting? Can you provide a link?=
<br>
&gt;&gt; Currently we&#39;ve tied the LCLK to enabling LPC2AHB bridge:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://github.com/openbmc/linux/blob/dev-4.13/arch/arm=
/boot/dts/aspeed-g5.dtsi#L302" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/openbmc/lin<wbr>ux/blob/dev-4.13/arch/arm/boot<wbr>/dts/aspeed-=
g5.dtsi#L302</a><br>
&gt;&gt; You may need to add the following to your dts if you&#39;ve develo=
ped your<br>
&gt;&gt; own:<br>
&gt;&gt; ```<br>
&gt;&gt; &amp;lpc_ctrl {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;&gt; };<br>
&gt;<br>
</span><span class=3D"gmail-m_-9044243996973820217gmail-">&gt; I use dev-4.=
13 branch (the last commit is<br>
&gt; aca92be80c008bceeb6fb62fd1d450<wbr>b5be5d0a4f).<br>
&gt;<br>
&gt; The aspeed-g5.dtsi I use is the same with the one in your link.<br>
&gt;<br>
&gt; I follow your suggestion and add the following to my dts but the SCU0C=
[8] is<br>
&gt; still 1b&#39;.<br>
&gt;<br>
&gt; &amp;lpc_ctrl {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; };<br>
&gt;<br>
&gt; Even I directly change the status of lpc_ctrl to &#39;okay&#39;=C2=A0 =
in the<br>
&gt; aspeed-g5.dtsi,=C2=A0 the SCU0C[8] is still 1b&#39;.<br>
&gt; lpc_ctrl: lpc-ctrl@0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;aspeed,ast2500-lpc-ctrl&quot;=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x0 0x80&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp;syscon ASPEED_CLK_GATE_LCLK&gt=
;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 };<br>
<br>
</span>Doing these two are equivalent. But it never hurts to try when thing=
s<br>
aren&#39;t working :)<br>
<br>
&gt;<br>
&gt; devmem 0x1e6e200c 32<br>
&gt; 0xFFCDBF8B<br>
<br>
If you take a look a the driver, you will see this snippet:<br>
<br>
drivers/misc/aspeed-lpc-ctrl.c<br>
<br>
static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long param=
)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Enable LPC =
FHW cycles. This is required for the host to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* access the =
regions specified.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return regmap_updat=
e_bits(lpc_ctrl-&gt;r<wbr>egmap, HICR5,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HICR5_ENFWH | HICR5_ENL2H,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HICR5_ENFWH | HICR5_ENL2H);<br>
<br>
<br>
The driver is designed to only enable the bridge (ENL2H) when the<br>
configuration registers have been programmed by an ioctl() from<br>
userspace.<br>
<br>
This is to ensure the window is pointing at an area of memory that has<br>
been chosen by the system integrator, and not accidentally exposing<br>
some BMC RAM to the host. So the ioctl for programming the window will<br>
automatically enable the FWH and L2H bits (bits 10 and 8).<br>
<br>
On OpenPower systems, the tool that performs the ioctl is &#39;mboxd&#39;. =
If<br>
you are using an OpenPower system, where the host firmware talks the<br>
mbox protocol (hostboot and skiboot do this), then you should run<br>
mboxd.<br>
<br>
If you&#39;re running on another platform, you could write a small utility<=
br>
to do this ioctl from userspace. I wrote one in Rust a few months ago,<br>
but you probably want to use C instead.<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div><br></div></div></div></div></div>
</blockquote></div><br></div></div>

--00000000000016c296056e091a5a--
