Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::231; helo=mail-qt0-x231.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IL7dwB69"; 
 dkim-atps=neutral
Received: from mail-qt0-x231.google.com (mail-qt0-x231.google.com
 [IPv6:2607:f8b0:400d:c0d::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41L5Hp5N7bzF1R4
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 12:57:09 +1000 (AEST)
Received: by mail-qt0-x231.google.com with SMTP id c5-v6so3440897qth.5
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jul 2018 19:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=95nLCNtV3lTN5XmzFEJaJHzo/o/GdEEjEqdc6m/6enA=;
 b=IL7dwB69PcMFtt0YDg1pnMwGHJjib1rRAXcGaqe4Q1jPE9aVnCNRSvTION4wNmiOVB
 nJ/lN3NDKVUqV4i+kQc+nNJB0J/nqmvniAMb1Kz4V1KDgrO0gA6kVEb9YB56Y8qIEgZX
 G8mk3B0DLEiOHr4rsjrLM+UJIpFix600Ne+RbyFl0XaHVs79k5srM5SaYdlY2Wy/8wO3
 v/mMCavy0JfBKrD3buWwBjotAjwXJ4U6o+PuqhNW+yfG6nDz/Cgjsa0J1UT+kS2zpd3u
 yyLF4GtIPHLun6X/DEBGWe5u9ILBMk7ltmZvEgSIa4bgFJjebFTkmxLE3VqpyCG9T18n
 z5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=95nLCNtV3lTN5XmzFEJaJHzo/o/GdEEjEqdc6m/6enA=;
 b=YA9slJPIORs5bV5ufl0Sr2yrQDegsL3iMyKbwwevRyDJEJlVRWGwJyp3lYkPFcV70e
 Zj3gRw40/U67oXqQvvPhI/jRZZFY5VKX/lzPjXXcb/EbjAlwarcUPCNisjeYDRK5juUS
 2Z32T3yRFHqNK36ynZaZatk+PhYQgxLZxmlTi2YHLWhdxG/skTSHnBJe1mhGps/mQdUE
 pql7XtIBxUExRec3hiyvIl9hIvEaMQC4EHKjayQoAYKsw0Y5HuHb1eMnxnnH++o4R4HG
 N6AFQ0h8Vrr7DsdmjE8wX1BO7cCesXAUvIOLYdrFjwVlHe0UHdaSdufqdlBVSKZ2yvz8
 qiYg==
X-Gm-Message-State: APt69E0BQo4e/iH95MOg0k/SYe4VmdDTYxBkkRLtKpF89nO8jaZi3UtK
 7gPA7hqdXyc99ck6J0KDMIcf9XFR2FAx5ZAbht+SVA==
X-Google-Smtp-Source: AAOMgpdnARnkoYLfaF9+ruHogW+essKk5Lky0CtNHyD4oWGrMSg88KBKGyxfX6R4LdBGN9YSIZH0XDsgobCTeizp+Ak=
X-Received: by 2002:ac8:35c8:: with SMTP id l8-v6mr167580qtb.409.1530673027319; 
 Tue, 03 Jul 2018 19:57:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP;
 Tue, 3 Jul 2018 19:57:06 -0700 (PDT)
In-Reply-To: <CAARXrtn0SM65b4m6Ln_+2Sh7iC9LNV+X6YjKY6v28UVdDAsg+A@mail.gmail.com>
References: <CAG9c7cCPZFFg65e-1iOSkLqgb26-2t1SqH_AZ4JjB5-TigNqzw@mail.gmail.com>
 <CAARXrtm1ELUMV_Hh9VNF21fMXeKnn3RpOhABLfaWRPk05Gd=RA@mail.gmail.com>
 <CAG9c7cApfyerEPeZ7e=WBN1nfcgMrxT0Yvy-vSP66S1+-KJYJA@mail.gmail.com>
 <CAARXrtkRqe-CGfi1XZn1ueuA7npP0pC67-HfuvaGCiaxtU-Uvg@mail.gmail.com>
 <CAG9c7cBFcpDp+d-WiDqLsGjo8XEUa-ziGYYRU_=hOwAr6TbGKg@mail.gmail.com>
 <CAARXrtn0SM65b4m6Ln_+2Sh7iC9LNV+X6YjKY6v28UVdDAsg+A@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Wed, 4 Jul 2018 10:57:06 +0800
Message-ID: <CAG9c7cAWdGQRnTLCFK16UbBjLn7TodvgeTouu-nZD6OqpY+_pA@mail.gmail.com>
Subject: Re: How to override default Kernel config
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000000f8cf7057023962c"
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
X-List-Received-Date: Wed, 04 Jul 2018 02:57:11 -0000

--0000000000000f8cf7057023962c
Content-Type: text/plain; charset="UTF-8"

My machine isn't in the OpenBMC tree.

I list the partial contents in my machine layer
  ...
  meta-aspeed \
  meta-x86 \
  meta-x86/meta-mct \
  meta-x86/meta-mct/meta-tiogapass \ -> the last line in the bblayers.conf

In the merge_config_build.log, I find the merging sequence is the below
  Using .kernel-meta/configs//./tiogapass.cfg as base
  Merging .kernel-meta/configs//./phosphor-gpio-keys.cfg
  Merging .kernel-meta/configs//./phosphor-gpio-keys.cfg
  Merging .kernel-meta/configs//./phosphor-vlan.cfg
  Merging .kernel-meta/configs//./phosphor-vlan.cfg
  Merging .kernel-meta/configs//./phosphor-wdt-on-panic.cfg
  Merging .kernel-meta/configs//./phosphor-wdt-on-panic.cfg
  Merging .kernel-meta/configs//./defconfig
  ...

Suppose the CONFIG_DEVMEM=y is removed while 'Merging
.kernel-meta/configs//./defconfig'

Thanks.

2018-07-04 10:34 GMT+08:00 Lei YU <mine260309@gmail.com>:

> > After following your instructions, the CONFIG_DEVMEM is still not set in
> the below '.config'
> >
> > workspace/sources/linux-aspeed/.config
> >
> > It did work if I directly modified meta-openbmc-bsp/meta-aspeed/
> recipes-kernel/linux/linux-aspeed/ast2500/defconfig
>
> Then you need to make sure if your build config include the machine layer
> by
> checking the build configuration.
>
> E.g. below is meta-romulus' configuration, check if your meta-machine is
> correctly included.
>
>     Build Configuration:
>     ...
>     meta
>     meta-poky
>     meta-oe
>     meta-networking
>     meta-perl
>     meta-python
>     meta-webserver
>     meta-virtualization
>     meta-phosphor
>     meta-aspeed
>     meta-openpower
>     meta-ibm
>     meta-romulus   <== Your meta-machine should appear here.
>
> Btw, what is your machine, is it in OpenBMC tree?
>

--0000000000000f8cf7057023962c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My machine isn&#39;t in the OpenBMC tree.<div><br></div><d=
iv>I list the partial contents in my machine layer</div><div>=C2=A0 ...</di=
v><div><div>=C2=A0 meta-aspeed \</div><div>=C2=A0 meta-x86 \</div><div>=C2=
=A0 meta-x86/meta-mct \</div><div>=C2=A0 meta-x86/meta-mct/meta-tiogapass \=
 -&gt; the last line in the bblayers.conf</div></div><div><br></div><div>In=
 the=C2=A0merge_config_build.log, I find the merging sequence is the below<=
/div><div><div>=C2=A0 Using .kernel-meta/configs//./tiogapass.cfg as base</=
div><div>=C2=A0 Merging .kernel-meta/configs//./phosphor-gpio-keys.cfg</div=
><div>=C2=A0 Merging .kernel-meta/configs//./phosphor-gpio-keys.cfg</div><d=
iv>=C2=A0 Merging .kernel-meta/configs//./phosphor-vlan.cfg</div><div>=C2=
=A0 Merging .kernel-meta/configs//./phosphor-vlan.cfg</div><div>=C2=A0 Merg=
ing .kernel-meta/configs//./phosphor-wdt-on-panic.cfg</div><div>=C2=A0 Merg=
ing .kernel-meta/configs//./phosphor-wdt-on-panic.cfg</div><div>=C2=A0 Merg=
ing .kernel-meta/configs//./defconfig</div></div><div>=C2=A0 ...</div><div>=
<br></div><div>Suppose the CONFIG_DEVMEM=3Dy is removed while &#39;<span st=
yle=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial;float:none;display:inline">Mergin=
g .kernel-meta/configs//./defconfig</span>&#39;</div><div><br></div><div>Th=
anks.</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
2018-07-04 10:34 GMT+08:00 Lei YU <span dir=3D"ltr">&lt;<a href=3D"mailto:m=
ine260309@gmail.com" target=3D"_blank">mine260309@gmail.com</a>&gt;</span>:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; After following yo=
ur instructions, the CONFIG_DEVMEM is still not set in the below &#39;.conf=
ig&#39;<br>
&gt;<br>
&gt; workspace/sources/linux-<wbr>aspeed/.config<br>
&gt;<br>
&gt; It did work if I directly modified meta-openbmc-bsp/meta-aspeed/<wbr>r=
ecipes-kernel/linux/linux-<wbr>aspeed/ast2500/defconfig<br>
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

--0000000000000f8cf7057023962c--
