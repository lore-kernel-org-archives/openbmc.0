Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22b; helo=mail-qt0-x22b.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lxVJW3C+"; 
 dkim-atps=neutral
Received: from mail-qt0-x22b.google.com (mail-qt0-x22b.google.com
 [IPv6:2607:f8b0:400d:c0d::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 410xPG52bqzF2Z7
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jun 2018 15:02:25 +1000 (AEST)
Received: by mail-qt0-x22b.google.com with SMTP id y20-v6so5103485qto.8
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jun 2018 22:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=DlouqS8FGRx9w7jVLuamoHRaCv/g9zumDuWqa+BiYOU=;
 b=lxVJW3C+9R5EnI2pzVGb0jjpa+b9UBirbuygwsCYu/AV+zaQI0bbBofGfiDG2Qg9oj
 YIy3V3COSVLs/Lkl4AsxDHu504ioTxfg3jBpWAF8vSX/CWFfUdZ3M1pYXExy9GHBbV3s
 1OpKvXa9ST3dxiAmypVmG9HZXTytWXm3/yR9YNmrJbs5p9vCcH86mLUoS0SHsxabyUWX
 rcKvQo0KCB+zXNuvjsCcD97c2R2j6ZrjdAcJ1mC8tzQLQZYzprNbf+R5Z4j+VswgzSmK
 2W+h+lD26fy3lF5Pajc4H3RntnbJtBkYHqvNzAK4LMOE6/CDgOD3YHj12/A93IvCimZW
 VChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=DlouqS8FGRx9w7jVLuamoHRaCv/g9zumDuWqa+BiYOU=;
 b=Vya8CvBwl/BpWcZAZJailA5U6IQi/vyB0R6m8diMBo6o/nOToXx7u3Zxd3kAUl308l
 8ivvmDG3wZjfV8wMmkPgGLoK0heIV5e8vw+CK5cDBSMSeYlpfCzXNbXuBlmQU3TpH2YM
 ih6U6SBMzGzOI+nx2f+UubytOa9TgyjbjVIDlIskSMwPt+jn19lhXooK08RtmP6pc5le
 +d6+rrYTVwgJbsV4kmLNRHNd/js7k5ZDPFtIw6LJHYQzPYYMoxjQMme2TPDhj6nXMus3
 sUp58IioSFI3V2PBceorxBaqXsOWsEDd7MvIo/5+wuu14hNJeOtzzg/ZyHUyLjON8YyB
 4bAg==
X-Gm-Message-State: APt69E3S4+jp4e6Q7/jGTJHSleWk0genxQfN+kiHjdbpUMOH2VDUZVRA
 7zZ6K0XGqTBz3LtIJluLwWh4pwRNpRpjhBBUAjMgKQ==
X-Google-Smtp-Source: ADUXVKJUcu+4I4ce4eDRguyQMIlzfdCX5+1z4zRkLDlXct/2IfajSTWiCwz5/WZ9mwlRmbkOr3EkfWOihTNnZZN6DJQ=
X-Received: by 2002:aed:22ae:: with SMTP id
 p43-v6mr1414334qtc.200.1528261342715; 
 Tue, 05 Jun 2018 22:02:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:2965:0:0:0:0:0 with HTTP;
 Tue, 5 Jun 2018 22:02:22 -0700 (PDT)
In-Reply-To: <1528252585.1372887.1397896680.27123F8A@webmail.messagingengine.com>
References: <CAG9c7cA1Zz_z=Rz1E+i3U_HD4JNOxisQQn27gOgAV9RBs7AdiA@mail.gmail.com>
 <1528252585.1372887.1397896680.27123F8A@webmail.messagingengine.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Wed, 6 Jun 2018 13:02:22 +0800
Message-ID: <CAG9c7cD0NLPVeoBzX3hVO226=EwBM-vypz5FJkUrteCabG-kSQ@mail.gmail.com>
Subject: Re: How to configure Clock Stop Control Register
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000074e473056df2120f"
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
X-List-Received-Date: Wed, 06 Jun 2018 05:02:27 -0000

--00000000000074e473056df2120f
Content-Type: text/plain; charset="UTF-8"

>
> What kernel tree are you building/booting? Can you provide a link?
> Currently we've tied the LCLK to enabling LPC2AHB bridge:
> https://github.com/openbmc/linux/blob/dev-4.13/arch/arm/boot
> /dts/aspeed-g5.dtsi#L302
> You may need to add the following to your dts if you've developed your own:
> ```
> &lpc_ctrl {
>         status = "okay";
> };


Hi Andrew,

Thanks  for your quick response.

I use dev-4.13 branch (the last commit is aca92be80c008bceeb6fb62fd1d450
b5be5d0a4f).

The aspeed-g5.dtsi I use is the same with the one in your link.

I follow your suggestion and add the following to my dts but the SCU0C[8]
is still 1b'.

&lpc_ctrl {
        status = "okay";
};

Even I directly change the status of lpc_ctrl to 'okay'  in the
aspeed-g5.dtsi,  the SCU0C[8] is still 1b'.
lpc_ctrl: lpc-ctrl@0 {
     compatible = "aspeed,ast2500-lpc-ctrl";
     reg = <0x0 0x80>;
     clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
     status = "okay";
 };

devmem 0x1e6e200c 32
0xFFCDBF8B

Thanks.


2018-06-06 10:36 GMT+08:00 Andrew Jeffery <andrew@aj.id.au>:

> Hi Henbin,
>
> On Wed, 6 Jun 2018, at 11:30, Henbin Chang wrote:
> > Hi,
> >
> > I found 'SCU0C[8] Stop LCLK' was set after boot into Kernel.
> >
> > Could anyone share how/where I should configure the Clock Stop Control
> > Register?
>
> What kernel tree are you building/booting? Can you provide a link?
>
> Currently we've tied the LCLK to enabling LPC2AHB bridge:
>
> https://github.com/openbmc/linux/blob/dev-4.13/arch/arm/
> boot/dts/aspeed-g5.dtsi#L302
>
> You may need to add the following to your dts if you've developed your own:
>
> ```
> &lpc_ctrl {
>         status = "okay";
> };
> ```
>
> Andrew
>

--00000000000074e473056df2120f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<span class=3D"gmail-im" style=3D"color:rgb(80,0,80);font-size:14px;text-de=
coration-style:initial;text-decoration-color:initial"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><span style=3D"font-size:14px;text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">What=
 kernel tree are you building/booting? Can you provide a link?</span><br st=
yle=3D"font-size:14px;text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"font-size:14px;text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">Currently we&#39;ve tied =
the LCLK to enabling LPC2AHB bridge:</span><br style=3D"font-size:14px;text=
-decoration-style:initial;text-decoration-color:initial"><a href=3D"https:/=
/github.com/openbmc/linux/blob/dev-4.13/arch/arm/boot/dts/aspeed-g5.dtsi#L3=
02" rel=3D"noreferrer" target=3D"_blank" style=3D"color:rgb(17,85,204);font=
-size:14px">https://github.com/openbmc/lin<wbr>ux/blob/dev-4.13/arch/arm/bo=
ot<wbr>/dts/aspeed-g5.dtsi#L302</a><br style=3D"font-size:14px;text-decorat=
ion-style:initial;text-decoration-color:initial"><span style=3D"font-size:1=
4px;text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">You may need to add the following to your dts if you&#39;ve=
 developed your own:</span><br style=3D"font-size:14px;text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"font-size:14px;text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">```<br></span><span style=3D"font-size:14px;text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">&amp;lpc_ct=
rl {<br></span><span style=3D"font-size:14px;text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 status =3D &quot;okay&quot;;<br></span><span style=3D"font-size:=
14px;text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">};</span></blockquote><div><br></div></span><div style=3D"=
font-size:14px;text-decoration-style:initial;text-decoration-color:initial"=
>Hi Andrew,</div><div style=3D"font-size:14px;text-decoration-style:initial=
;text-decoration-color:initial"><br></div><div style=3D"font-size:14px;text=
-decoration-style:initial;text-decoration-color:initial">Thanks=C2=A0 for y=
our quick response.</div><div style=3D"font-size:14px;text-decoration-style=
:initial;text-decoration-color:initial"><br></div><div style=3D"font-size:1=
4px;text-decoration-style:initial;text-decoration-color:initial">I use dev-=
4.13 branch (the last commit is aca92be80c008bceeb6fb62fd1d450<wbr>b5be5d0a=
4f).</div><div style=3D"font-size:14px;text-decoration-style:initial;text-d=
ecoration-color:initial"><br></div><div style=3D"font-size:14px;text-decora=
tion-style:initial;text-decoration-color:initial">The aspeed-g5.dtsi I use =
is the same with the one in your link.</div><div style=3D"font-size:14px;te=
xt-decoration-style:initial;text-decoration-color:initial"><br></div><div s=
tyle=3D"font-size:14px;text-decoration-style:initial;text-decoration-color:=
initial">I follow your suggestion and add the following to my dts but the S=
CU0C[8] is still 1b&#39;.</div><div style=3D"font-size:14px;text-decoration=
-style:initial;text-decoration-color:initial"><br></div><div style=3D"font-=
size:14px;text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;font-size:14px;float:none;display:inline">&am=
p;lpc_ctrl {<br></span><span style=3D"background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;font-size:14px;flo=
at:none;display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&q=
uot;;<br></span><span style=3D"background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;font-size:14px;float:none=
;display:inline">};</span><span>=C2=A0</span><br></div><div style=3D"font-s=
ize:14px;text-decoration-style:initial;text-decoration-color:initial"><br><=
/div><div style=3D"font-size:14px;text-decoration-style:initial;text-decora=
tion-color:initial">Even I directly change the status of lpc_ctrl to &#39;o=
kay&#39;=C2=A0 in the=C2=A0<span style=3D"font-size:small;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">aspeed-g5.dtsi,=C2=A0<span>=C2=A0</span><span =
style=3D"text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline">the SCU0C[8] is still 1b&#39;.</span></span></div><div=
 style=3D"font-size:14px;text-decoration-style:initial;text-decoration-colo=
r:initial"><span style=3D"background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;float:none;display:inline"><sp=
an style=3D"text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline"><div>lpc_ctrl: lpc-ctrl@0 {</div><div>=C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;aspeed,ast2500-lpc-ctrl&quot;;</div><div>=C2=A0=
 =C2=A0 =C2=A0reg =3D &lt;0x0 0x80&gt;;</div><div>=C2=A0 =C2=A0 =C2=A0clock=
s =3D &lt;&amp;syscon ASPEED_CLK_GATE_LCLK&gt;;</div><div>=C2=A0 =C2=A0 =C2=
=A0status =3D &quot;okay&quot;;</div><div>=C2=A0};</div><div><br></div></sp=
an></span></div><div style=3D"font-size:14px;text-decoration-style:initial;=
text-decoration-color:initial"><span style=3D"background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline"><span style=3D"text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline"><div>devmem 0x1e6e200c 32</div>=
<div>0xFFCDBF8B</div></span></span></div><div style=3D"font-size:14px;text-=
decoration-style:initial;text-decoration-color:initial"><br></div><div styl=
e=3D"font-size:14px;text-decoration-style:initial;text-decoration-color:ini=
tial">Thanks.</div>

<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-06=
-06 10:36 GMT+08:00 Andrew Jeffery <span dir=3D"ltr">&lt;<a href=3D"mailto:=
andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt;</span>:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Hi Henbin,<br>
<span class=3D""><br>
On Wed, 6 Jun 2018, at 11:30, Henbin Chang wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I found &#39;SCU0C[8] Stop LCLK&#39; was set after boot into Kernel.<b=
r>
&gt; <br>
&gt; Could anyone share how/where I should configure the Clock Stop Control=
<br>
&gt; Register?<br>
<br>
</span>What kernel tree are you building/booting? Can you provide a link?<b=
r>
<br>
Currently we&#39;ve tied the LCLK to enabling LPC2AHB bridge:<br>
<br>
<a href=3D"https://github.com/openbmc/linux/blob/dev-4.13/arch/arm/boot/dts=
/aspeed-g5.dtsi#L302" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/openbmc/<wbr>linux/blob/dev-4.13/arch/arm/<wbr>boot/dts/aspeed-g5.dtsi#L=
302</a><br>
<br>
You may need to add the following to your dts if you&#39;ve developed your =
own:<br>
<br>
```<br>
&amp;lpc_ctrl {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
};<br>
```<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Andrew<br>
</font></span></blockquote></div><br></div>

--00000000000074e473056df2120f--
