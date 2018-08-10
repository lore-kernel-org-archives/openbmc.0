Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::231; helo=mail-qt0-x231.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ruj94oAU"; 
 dkim-atps=neutral
Received: from mail-qt0-x231.google.com (mail-qt0-x231.google.com
 [IPv6:2607:f8b0:400d:c0d::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mnpl03LqzDrYf
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 11:39:10 +1000 (AEST)
Received: by mail-qt0-x231.google.com with SMTP id y5-v6so8705372qti.12
 for <openbmc@lists.ozlabs.org>; Thu, 09 Aug 2018 18:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Zz8BOrfggN5WpItrzphlhdXhwbLNkm6u2VV47KEbETk=;
 b=Ruj94oAUPsI5c/w93TlcKy4ZdVr+S10tp9GI6900VlIvpsIhPN1EFPxhr9HpXAfRxp
 dxK/IhgJ4vMKZAj/LQ8YzP9XtsbBIyBA7q6Lf21g3AEe9Rus1WAOsDo0LLOkPxKzJf30
 fT1wn6vn78QTCZHq7vHABe2g6EiZlzfew2/aSvqa0txR3L+0D03otu291CNykYsUO70A
 I9CTjSOEb+eJHNtDf/pRC2SZGmZVVk7f6Nleu/HScz+m3gfw9m6t0DAxqTZ+hWqWmjUB
 0OdHh668bCRM88gyBcq7FxjlWCpvO0D4/itzd+hJxUfc+XjbKMBwCQhygG3YEKGRDZB8
 9SlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Zz8BOrfggN5WpItrzphlhdXhwbLNkm6u2VV47KEbETk=;
 b=kO1EDyfTjspz2wRVhpcFqfkK+4LmfnQXoMuff7TOrlW/QUAX5zzOtEAHE5BBhkA+0F
 kAZ/0leszqkXR6rxkbnZO6/sf7rh+ah1YK/ppuYfMtE9XIPTqVoU3x73dFaz3TiEk8sR
 6PFCXE+9Y1e4/JYx4y8Abez+kqK4JCi3REWLlVIurgV4A2A/eFkeQnfeQzkrUcjL9kPC
 qv49FjxiUmxwF0yVmRYaAiANdXZW/5V6UXGUzrFfeFEvR7x1cjLacY79UTMME7akvVd7
 qQfSEtX/P8SzLaC93fBYHkXWhDtHTrzqGjBxolzrW9VVqyeR0jsg/0WJJXmZxeQOW3ff
 hi6w==
X-Gm-Message-State: AOUpUlHOQtniLVgbBcUnILCMD70v+SsNHKPKdjbZ7+BSWcUfxTUucG+C
 sQNNI979aGWgmwwm4VvxU+99ceGFaIM8GIKBtp8=
X-Google-Smtp-Source: AA+uWPxvWO1+5TbBX+jvIQE8RejHca2EixqWnT9rUJALmXMvwpVtT/xv1z/g2NWPXPmx/o1LjrOzHN98U5H1/10eIvk=
X-Received: by 2002:ac8:35c8:: with SMTP id
 l8-v6mr4694980qtb.409.1533865147985; 
 Thu, 09 Aug 2018 18:39:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP;
 Thu, 9 Aug 2018 18:39:07 -0700 (PDT)
In-Reply-To: <CACPK8Xf1bDR_vPSDF7p1qW1cGjmjmRXSe2qdei9YMjKtqRHL8Q@mail.gmail.com>
References: <CAG9c7cAk-B=cSwWz3373eywPud3mQdBKCBMwb_iwuCcAwX9Udw@mail.gmail.com>
 <CACPK8Xf1bDR_vPSDF7p1qW1cGjmjmRXSe2qdei9YMjKtqRHL8Q@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Fri, 10 Aug 2018 09:39:07 +0800
Message-ID: <CAG9c7cB7sNDGX+o4x4BXxNgw=H6uk=NDzjSnfn9xH+1k=+DT9w@mail.gmail.com>
Subject: Re: Patch files not apply while devtool modify linux-aspeed
To: Joel Stanley <joel@jms.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Eddie James <eajames.ibm@gmail.com>, 
 Adriana Kobylak <anoo@linux.vnet.ibm.com>, Lei YU <mine260309@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000004773f105730acf62"
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
X-List-Received-Date: Fri, 10 Aug 2018 01:39:12 -0000

--0000000000004773f105730acf62
Content-Type: text/plain; charset="UTF-8"

Thanks Joel.

The issue could be duplicated following the steps in the romulus machine.

1. 'devtool modify linux-aspeed'
2. 'cd workspace/sources/linux-aspeed/' and edit
'arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts'
3. 'git add -A' and 'git commit -m 'Test modify dts' '
4. go to build directory and 'devtool update-recipe -m patch -a
../meta-openbmc-machines/meta-openpower/meta-ibm/meta-romulus/ linux-aspeed'
5. Confirm the below files are generated.
meta-openbmc-machines/meta-openpower/meta-ibm/meta-romulus/recipes-kernel/linux/linux-aspeed/0001-Test-modify-dts.patch
meta-openbmc-machines/meta-openpower/meta-ibm/meta-romulus/recipes-kernel/linux/linux-aspeed_git.bbappend
6. 'devtool reset linux-aspeed' and remove ' workspace/sources/linux-aspeed/
'
7. 'devtool modify linux-aspeed' again
8. 'cd workspace/sources/linux-aspeed/ ' and the commit with the 'Test
modify dts' message not found while 'git log'
9. 'git branch'
  dev
  dev-4.10
  dev-4.13
  dev-4.17
  dev-4.3
  dev-4.4
  dev-4.6
  dev-4.7
* devtool
  devtool-no-overrides
  devtool-override-df-obmc-ubi-fs
  master
10. 'git checkout dev-4.17' and 'git log'

commit 2310638091e7b4dd97014f1b373a9ba111ac4e58
Author: Henbin.Chang <henbin-chang@mic.com.tw>
Date:   Thu Aug 9 16:15:48 2018 +0800

    Test modify dts

I had no idea why the patch was not applied in the 'devtool' branch.

BRs,
Henbin

2018-08-10 9:01 GMT+08:00 Joel Stanley <joel@jms.id.au>:

> Hello,
>
> On Tue, 7 Aug 2018 at 11:13, Henbin Chang <henbinchang@gmail.com> wrote:
> > We found the patch files would be applied while 'devtool modify
> linux-aspeed' after upgrade to Yocto 2.5.
> > And show the below warning message.
> >
> > WARNING: SRC_URI is conditionally overridden in this recipe, thus
> several devtool-override-* branches have been created, one for each
> override that makes changes to SRC_URI. It is recommended that you make
> changes to the devtool branch first, then checkout and rebase each
> devtool-override-* branch and update any unique patches there (duplicates
> on those branches will be ignored by devtool finish/update-recipe)
>
> I do not use yocto when developing the kernel, so I can't help here. I
> have cc'd some other developers that my have encountered this issue.
>
> Cheers,
>
> Joel
>

--0000000000004773f105730acf62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Joel.<div><br></div><div>The issue could be duplica=
ted following the steps in the=C2=A0<span style=3D"font-size:small;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline">romulus machine.</span></div><div><br=
></div><div>1. &#39;devtool modify linux-aspeed&#39;</div><div>2. &#39;cd w=
orkspace/sources/linux-aspeed/&#39; and edit &#39;arch/arm/boot/dts/aspeed-=
bmc-opp-romulus.dts&#39;</div><div>3. &#39;git add -A&#39; and &#39;git com=
mit -m &#39;Test modify dts&#39; &#39;</div><div>4. go to build directory a=
nd &#39;devtool update-recipe -m patch -a ../meta-openbmc-machines/meta-ope=
npower/meta-ibm/meta-romulus/ linux-aspeed&#39;</div><div>5. Confirm the be=
low files are generated.</div><div><div>meta-openbmc-machines/meta-openpowe=
r/meta-ibm/meta-romulus/recipes-kernel/linux/linux-aspeed/0001-Test-modify-=
dts.patch</div><div>meta-openbmc-machines/meta-openpower/meta-ibm/meta-romu=
lus/recipes-kernel/linux/linux-aspeed_git.bbappend</div></div><div>6. &#39;=
devtool reset linux-aspeed&#39; and remove &#39;

<span style=3D"font-size:small;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">workspace/sources/linux-aspeed/</span>&#39;</div><div>7.=C2=A0<span style=
=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">&#39;devt=
ool modify linux-aspeed&#39; again</span></div><div><span style=3D"font-siz=
e:small;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">8. &#39;cd=20

<span style=3D"text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">workspace/sources/linux-aspeed/</span>

&#39; and the commit with the &#39;<span style=3D"text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">Test modify d=
ts&#39; message not found while &#39;git log&#39;</span></span></div><div><=
span style=3D"font-size:small;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
><span style=3D"text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline">9. &#39;git branch&#39;</span></span></div><div=
><span style=3D"background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline"><span style=
=3D"text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline"><div>=C2=A0 dev</div><div>=C2=A0 dev-4.10</div><div>=C2=A0 =
dev-4.13</div><div>=C2=A0 dev-4.17</div><div>=C2=A0 dev-4.3</div><div>=C2=
=A0 dev-4.4</div><div>=C2=A0 dev-4.6</div><div>=C2=A0 dev-4.7</div><div>* d=
evtool</div><div>=C2=A0 devtool-no-overrides</div><div>=C2=A0 devtool-overr=
ide-df-obmc-ubi-fs</div><div>=C2=A0 master</div><div>10. &#39;git checkout=
=20

<span style=3D"font-size:small;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">dev-4.17&#39; and &#39;git log&#39;</span></div><div><span style=3D"font-=
size:small;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline"><br></span></div><=
div><span style=3D"background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline"><div>commi=
t 2310638091e7b4dd97014f1b373a9ba111ac4e58</div><div>Author: Henbin.Chang &=
lt;<a href=3D"mailto:henbin-chang@mic.com.tw">henbin-chang@mic.com.tw</a>&g=
t;</div><div>Date:=C2=A0 =C2=A0Thu Aug 9 16:15:48 2018 +0800</div><div><br>=
</div><div>=C2=A0 =C2=A0 Test modify dts</div></span></div></span></span></=
div><div><span style=3D"font-size:small;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline"><br></span></div><div><span style=3D"font-size:small;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">I had no idea why the patch was not appl=
ied in the &#39;devtool&#39; branch.</span></div><div><span style=3D"font-s=
ize:small;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline"><br></span></div><d=
iv><span style=3D"font-size:small;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">BRs,</span></div><div><span style=3D"font-size:small;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">Henbin</span></div><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">2018-08-10 9:01 GMT+08:00 Joel Stanley <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@j=
ms.id.au</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello,<br>
<span class=3D""><br>
On Tue, 7 Aug 2018 at 11:13, Henbin Chang &lt;<a href=3D"mailto:henbinchang=
@gmail.com">henbinchang@gmail.com</a>&gt; wrote:<br>
&gt; We found the patch files would be applied while &#39;devtool modify li=
nux-aspeed&#39; after upgrade to Yocto 2.5.<br>
&gt; And show the below warning message.<br>
&gt;<br>
&gt; WARNING: SRC_URI is conditionally overridden in this recipe, thus seve=
ral devtool-override-* branches have been created, one for each override th=
at makes changes to SRC_URI. It is recommended that you make changes to the=
 devtool branch first, then checkout and rebase each devtool-override-* bra=
nch and update any unique patches there (duplicates on those branches will =
be ignored by devtool finish/update-recipe)<br>
<br>
</span>I do not use yocto when developing the kernel, so I can&#39;t help h=
ere. I<br>
have cc&#39;d some other developers that my have encountered this issue.<br=
>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div><br></div></div>

--0000000000004773f105730acf62--
