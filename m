Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::230; helo=mail-qk0-x230.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uuCGldwO"; 
 dkim-atps=neutral
Received: from mail-qk0-x230.google.com (mail-qk0-x230.google.com
 [IPv6:2607:f8b0:400d:c09::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41L94c0FZBzF1Dg
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 15:47:43 +1000 (AEST)
Received: by mail-qk0-x230.google.com with SMTP id d22-v6so2293869qkc.8
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jul 2018 22:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=EjsusHfuFqxPfxDqTVaEenIg50sU1XWO+oimVMlgbiE=;
 b=uuCGldwO5ATYY+rDNKBf6sWqb3Cqo1PaxDae3IBXCKqgijleXn6qx0vZCLF5L00tgX
 f9yHpDSqcprqfWJG1vCFFRKIMeWD2uIGEhNaad78nNUaTyYpFQdp1EeL1t7AR46Elb68
 AizRDFa5BzT2b2gWJPZ7MixVQcBzxf+5Kh9wGA1MEWiDGB7ird6y/5yuAJfUMfycdrDA
 6wV60xHppZcEEdN0gLUaU9TzoKqyiTWvmv/V/a8WxtjReTjdnZxmuzJz9cVhMdAvNbVo
 wW4eg8NiklfiLs4Pddt++ZX0m4tkp4WpKLNMZ7npYOp+zaea97nd3uHraZIzT8SNOUw+
 deXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=EjsusHfuFqxPfxDqTVaEenIg50sU1XWO+oimVMlgbiE=;
 b=pRwHi6cdS/DJfGJsauJrsQTmtzioESu7wYr3KIn6fh0Sy3oYUwYeBXpzu+8eOm6GZi
 0fIf1URRa7FQVhTbqCc7Sb0zMUa+jeMMbCCy55vXm22J/TpnV83cK+X91R6HTPF+wz1L
 FuufKPtYN93eVonlYwMcQT1OjxGbwUcEt9z12brFivB27zW2R/aom/VUyaZPjLQDz46S
 68/B5aRmzPT8acWhZSBtnj1i6ar+cNhLGD4VBbory3GHZaGmacl4LHdNzO2l5mu0soQR
 YMsa+RgoameH3WpyoLzxKbiIAV2Fvs9QS0uKZoJgpfEPj7rnuhtU4efhd/aH4K/wQ69j
 jmXQ==
X-Gm-Message-State: APt69E1MO1Ym4G2LC9kr0BaODEzlE8GwlYykUS0FZaGavnXHVvjpi1C+
 znKSgQD756ulCYqEAogPLkCMUoSW/j/gA8EM4tA=
X-Google-Smtp-Source: AAOMgpdt5QBm2wGBShb26xvf24ZLI2irafCjRm2fLLI3sgaGUGZyppXYUPmWoFcKZcDq1XreqKKY15i3uCqlA9W2nNA=
X-Received: by 2002:a37:7ac5:: with SMTP id
 v188-v6mr481606qkc.262.1530683260793; 
 Tue, 03 Jul 2018 22:47:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP;
 Tue, 3 Jul 2018 22:47:40 -0700 (PDT)
In-Reply-To: <CAG9c7cAWdGQRnTLCFK16UbBjLn7TodvgeTouu-nZD6OqpY+_pA@mail.gmail.com>
References: <CAG9c7cCPZFFg65e-1iOSkLqgb26-2t1SqH_AZ4JjB5-TigNqzw@mail.gmail.com>
 <CAARXrtm1ELUMV_Hh9VNF21fMXeKnn3RpOhABLfaWRPk05Gd=RA@mail.gmail.com>
 <CAG9c7cApfyerEPeZ7e=WBN1nfcgMrxT0Yvy-vSP66S1+-KJYJA@mail.gmail.com>
 <CAARXrtkRqe-CGfi1XZn1ueuA7npP0pC67-HfuvaGCiaxtU-Uvg@mail.gmail.com>
 <CAG9c7cBFcpDp+d-WiDqLsGjo8XEUa-ziGYYRU_=hOwAr6TbGKg@mail.gmail.com>
 <CAARXrtn0SM65b4m6Ln_+2Sh7iC9LNV+X6YjKY6v28UVdDAsg+A@mail.gmail.com>
 <CAG9c7cAWdGQRnTLCFK16UbBjLn7TodvgeTouu-nZD6OqpY+_pA@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Wed, 4 Jul 2018 13:47:40 +0800
Message-ID: <CAG9c7cB7R1RQpUmsR8FKVzWD5fq6N6xs-DdKnZ9mc-zkN9OtQA@mail.gmail.com>
Subject: Re: How to override default Kernel config
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000005f983057025f81d"
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
X-List-Received-Date: Wed, 04 Jul 2018 05:47:45 -0000

--00000000000005f983057025f81d
Content-Type: text/plain; charset="UTF-8"

I just cloned the latest openbmc REPO and re-did the same modification in
the romulus machine.

I got the same result.

2018-07-04 10:57 GMT+08:00 Henbin Chang <henbinchang@gmail.com>:

> My machine isn't in the OpenBMC tree.
>
> I list the partial contents in my machine layer
>   ...
>   meta-aspeed \
>   meta-x86 \
>   meta-x86/meta-mct \
>   meta-x86/meta-mct/meta-tiogapass \ -> the last line in the bblayers.conf
>
> In the merge_config_build.log, I find the merging sequence is the below
>   Using .kernel-meta/configs//./tiogapass.cfg as base
>   Merging .kernel-meta/configs//./phosphor-gpio-keys.cfg
>   Merging .kernel-meta/configs//./phosphor-gpio-keys.cfg
>   Merging .kernel-meta/configs//./phosphor-vlan.cfg
>   Merging .kernel-meta/configs//./phosphor-vlan.cfg
>   Merging .kernel-meta/configs//./phosphor-wdt-on-panic.cfg
>   Merging .kernel-meta/configs//./phosphor-wdt-on-panic.cfg
>   Merging .kernel-meta/configs//./defconfig
>   ...
>
> Suppose the CONFIG_DEVMEM=y is removed while 'Merging
> .kernel-meta/configs//./defconfig'
>
> Thanks.
>
> 2018-07-04 10:34 GMT+08:00 Lei YU <mine260309@gmail.com>:
>
>> > After following your instructions, the CONFIG_DEVMEM is still not set
>> in the below '.config'
>> >
>> > workspace/sources/linux-aspeed/.config
>> >
>> > It did work if I directly modified meta-openbmc-bsp/meta-aspeed/r
>> ecipes-kernel/linux/linux-aspeed/ast2500/defconfig
>>
>> Then you need to make sure if your build config include the machine layer
>> by
>> checking the build configuration.
>>
>> E.g. below is meta-romulus' configuration, check if your meta-machine is
>> correctly included.
>>
>>     Build Configuration:
>>     ...
>>     meta
>>     meta-poky
>>     meta-oe
>>     meta-networking
>>     meta-perl
>>     meta-python
>>     meta-webserver
>>     meta-virtualization
>>     meta-phosphor
>>     meta-aspeed
>>     meta-openpower
>>     meta-ibm
>>     meta-romulus   <== Your meta-machine should appear here.
>>
>> Btw, what is your machine, is it in OpenBMC tree?
>>
>
>

--00000000000005f983057025f81d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I just cloned the latest openbmc REPO and re-did the =
same modification in the romulus machine.<br></div><div><br></div><div>I go=
t the same result.</div><div><br></div><div class=3D"gmail_extra"><div clas=
s=3D"gmail_quote">2018-07-04 10:57 GMT+08:00 Henbin Chang <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:henbinchang@gmail.com" target=3D"_blank">henbinchang=
@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r">My machine isn&#39;t in the OpenBMC tree.<div><br></div><div>I list the =
partial contents in my machine layer</div><div>=C2=A0 ...</div><div><div>=
=C2=A0 meta-aspeed \</div><div>=C2=A0 meta-x86 \</div><div>=C2=A0 meta-x86/=
meta-mct \</div><div>=C2=A0 meta-x86/meta-mct/meta-<wbr>tiogapass \ -&gt; t=
he last line in the bblayers.conf</div></div><div><br></div><div>In the=C2=
=A0merge_config_build.log, I find the merging sequence is the below</div><d=
iv><div>=C2=A0 Using .kernel-meta/configs//./<wbr>tiogapass.cfg as base</di=
v><div>=C2=A0 Merging .kernel-meta/configs//./<wbr>phosphor-gpio-keys.cfg</=
div><div>=C2=A0 Merging .kernel-meta/configs//./<wbr>phosphor-gpio-keys.cfg=
</div><div>=C2=A0 Merging .kernel-meta/configs//./<wbr>phosphor-vlan.cfg</d=
iv><div>=C2=A0 Merging .kernel-meta/configs//./<wbr>phosphor-vlan.cfg</div>=
<div>=C2=A0 Merging .kernel-meta/configs//./<wbr>phosphor-wdt-on-panic.cfg<=
/div><div>=C2=A0 Merging .kernel-meta/configs//./<wbr>phosphor-wdt-on-panic=
.cfg</div><div>=C2=A0 Merging .kernel-meta/configs//./<wbr>defconfig</div><=
/div><div>=C2=A0 ...</div><div><br></div><div>Suppose the CONFIG_DEVMEM=3Dy=
 is removed while &#39;<span style=3D"font-size:small;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">Merging .kernel-meta/configs//./<wbr>defconfig</sp=
an>&#39;</div><div><br></div><div>Thanks.</div></div><div class=3D"HOEnZb">=
<div class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>2018-07-04 10:34 GMT+08:00 Lei YU <span dir=3D"ltr">&lt;<a href=3D"mailto:=
mine260309@gmail.com" target=3D"_blank">mine260309@gmail.com</a>&gt;</span>=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><span>&gt; After following your instruc=
tions, the CONFIG_DEVMEM is still not set in the below &#39;.config&#39;<br=
>
&gt;<br>
&gt; workspace/sources/linux-aspeed<wbr>/.config<br>
&gt;<br>
&gt; It did work if I directly modified meta-openbmc-bsp/meta-aspeed/r<wbr>=
ecipes-kernel/linux/linux-aspe<wbr>ed/ast2500/defconfig<br>
<br>
</span>Then you need to make sure if your build config include the machine =
layer by<br>
checking the build configuration.<br>
<br>
E.g. below is meta-romulus&#39; configuration, check if your meta-machine i=
s<br>
correctly included.<br>
<br>
=C2=A0 =C2=A0 Build Configuration:<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 meta<br>
=C2=A0 =C2=A0 meta-poky<br>
=C2=A0 =C2=A0 meta-oe<br>
=C2=A0 =C2=A0 meta-networking<br>
=C2=A0 =C2=A0 meta-perl<br>
=C2=A0 =C2=A0 meta-python<br>
=C2=A0 =C2=A0 meta-webserver<br>
=C2=A0 =C2=A0 meta-virtualization<br>
=C2=A0 =C2=A0 meta-phosphor<br>
=C2=A0 =C2=A0 meta-aspeed<br>
=C2=A0 =C2=A0 meta-openpower<br>
=C2=A0 =C2=A0 meta-ibm<br>
=C2=A0 =C2=A0 meta-romulus=C2=A0 =C2=A0&lt;=3D=3D Your meta-machine should =
appear here.<br>
<br>
Btw, what is your machine, is it in OpenBMC tree?<br>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div></div>

--00000000000005f983057025f81d--
