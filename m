Return-Path: <xavinux@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::232; helo=mail-qk0-x232.google.com;
 envelope-from=xavinux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DyB666aK"; 
 dkim-atps=neutral
Received: from mail-qk0-x232.google.com (mail-qk0-x232.google.com
 [IPv6:2607:f8b0:400d:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y84sL28KQzDqJ7
 for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2017 10:02:13 +1100 (AEDT)
Received: by mail-qk0-x232.google.com with SMTP id l194so9343826qke.13
 for <openbmc@lists.ozlabs.org>; Fri, 06 Oct 2017 16:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nvZM+c5Vgsh0y3nMUwQC0vE2aAuelEDzxCmHAZtCNeo=;
 b=DyB666aKND442YLXY8HTbyOZeJdmXZsIR00ovaa2qLjhTbS5vL1jyFHzbhC+bchI7F
 +qDMAIKaAvDGNWoq591uMRVFWV0pQBi9oFpAj3yhRbI3vJ7zzimT0wf8CYisjt8YCzdC
 MUgNjBDUnP1fvGH4Pyt8WgTshUTUtgfgXmPSmi+qTV5g8t7pm25S/zju0VWOVPXzQHtb
 TtXLCf4yIONNhxCJChnZIlZsE61waJCFJcdLrtf43Hro+wcCOQwj/R//RuEnsgN9mhr0
 PBGLXZna1noKFyMSKFQ74OWjzX9r4aiXANrdN+ulCXP6lgDmisRRAv0UJ/JFAQ1kH0Od
 EFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nvZM+c5Vgsh0y3nMUwQC0vE2aAuelEDzxCmHAZtCNeo=;
 b=XDmH1/s4RdjdutrCvGzplYqj4ycW9GBFe1h1s8QkKXhsHFe2lTl23N2lf3/qb4fAym
 WjbySfoL6H9zDGcxcrJ/bbqrrbtoT5PsY472i9o+Xpv4hMMDY8dbDnMFNXRkm76GKcRq
 3rxU9PxzdQXO60AplxS++BY8Lw5XMqb3tixy/47ODP21OXv9u/ff5S3pJiqJd+t1TvqP
 ActVNhHDQeU0FdoGYA/tPkXRNyHnX/IKGReHqHAhHG8zj2dfvyaoAfnBLkPPVA+qNyOm
 wT1EzCoggUPaM7A7OdH3MSE9vGgI8/CpUKNlmDWC+oOJTJ+6MPaoyI8B46/DOCBnIv+3
 NMtA==
X-Gm-Message-State: AMCzsaUEUA11kZBPTmKS2cMp2jE4uycIIclcAAAHfrjD8UE+EeDA6spL
 G7g+Ftz+gt/KiLddWYggLTW0R2AIPEq1niJTNh9D6g==
X-Google-Smtp-Source: AOwi7QAOZqqBR+/olbye0x/u9op5X7Mu9OFsZu2ccJLLdXFWMkU0UG7avU6BTuIblJIXxLxKnV7iEKhSgS+4yDvuBvY=
X-Received: by 10.55.215.147 with SMTP id t19mr626940qkt.182.1507330929598;
 Fri, 06 Oct 2017 16:02:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.180.159 with HTTP; Fri, 6 Oct 2017 16:02:08 -0700 (PDT)
In-Reply-To: <1507325323.1545468.1130544088.6FEEF44B@webmail.messagingengine.com>
References: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
 <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
 <1507325323.1545468.1130544088.6FEEF44B@webmail.messagingengine.com>
From: Javier Romero <xavinux@gmail.com>
Date: Fri, 6 Oct 2017 20:02:08 -0300
Message-ID: <CAEX+82KLmByCXqVg1Hzi7r5-cH2=Cx-0OE_hLwx-Jr_XXfe1Wg@mail.gmail.com>
Subject: Re: OpenBMC on Raspberry PI 3.
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rick Altherr <raltherr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a1149daae9e27c9055ae8d420"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 23:02:15 -0000

--001a1149daae9e27c9055ae8d420
Content-Type: text/plain; charset="UTF-8"

Rick / Andrew,

Thank you very much for your answer and suggestions.

I'm looking at that repository on Github now.

Regards,




*Javier Romero*

*E-mail: xavinux@gmail.com <xavinux@gmail.com>*

*Skype: xavinux*


2017-10-06 18:28 GMT-03:00 Andrew Jeffery <andrew@aj.id.au>:

>
>
> On Sat, 7 Oct 2017, at 03:29, Rick Altherr wrote:
> > When you run  export TEMPLATECONF=meta-openbmc-machines/meta-
> > openpower/meta-ibm/meta-palmetto/conf, you are telling the build system
> > that you want to build images for the BMC processor used on the Palmetto
> > machine (Aspeed AST2400).  That image won't boot on a RaspberryPi.  What
> > you'll need to do is create a new layer in meta-openbmc-machines for a
> > RaspberryPi that includes the raspberrypi layer, specifies the correct
> > kernel device tree, etc.
>
>  As a heads-up, some of this work has already been done:
>
> https://github.com/openbmc/openbmc/tree/master/meta-
> openbmc-machines/meta-evb/meta-evb-raspberrypi/conf
>
> It was added in this change:
>
> https://gerrit.openbmc-project.xyz/#/c/508/
>
> I don't think it was thoroughly tested and it has probably bit-rotted,
> but maybe it's existence will flatten out the learning curve a bit.
>
> Cheers,
>
> Andrew
>

--001a1149daae9e27c9055ae8d420
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Rick / Andrew,<div><br></div><div>Thank you very much for =
your answer and suggestions.</div><div><br></div><div>I&#39;m looking at th=
at repository on Github now.</div><div><br></div><div>Regards,</div><div><b=
r></div><div><br></div></div><div class=3D"gmail_extra"><br clear=3D"all"><=
div><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div style=3D"text-align:left"><i><b>Javier Romero<br></b></i><=
/div><div style=3D"text-align:left"><span style=3D"color:rgb(19,79,92)"><i>=
<b><span style=3D"color:rgb(0,0,0)">E-mail:<span style=3D"color:rgb(0,0,255=
)"> </span></span><span style=3D"color:rgb(0,0,255)"><a href=3D"mailto:xavi=
nux@gmail.com" target=3D"_blank">xavinux@gmail.com</a></span><br></b></i></=
span></div><div style=3D"text-align:left"><i><b><span style=3D"color:rgb(19=
,79,92)"><span style=3D"color:rgb(0,0,0)">Skype:</span> <span style=3D"colo=
r:rgb(11,83,148)"><u><span style=3D"color:rgb(0,0,255)">xavinux</span><br><=
/u></span></span></b></i></div><div style=3D"text-align:left"><br></div> </=
div></div></div>
<br><div class=3D"gmail_quote">2017-10-06 18:28 GMT-03:00 Andrew Jeffery <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"_blank">an=
drew@aj.id.au</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On Sat, 7 Oct 2017, at 03:29, Rick Altherr wrote:<br>
&gt; When you run=C2=A0 export TEMPLATECONF=3Dmeta-openbmc-<wbr>machines/me=
ta-<br>
<span class=3D"">&gt; openpower/meta-ibm/meta-<wbr>palmetto/conf, you are t=
elling the build system<br>
&gt; that you want to build images for the BMC processor used on the Palmet=
to<br>
&gt; machine (Aspeed AST2400).=C2=A0 That image won&#39;t boot on a Raspber=
ryPi.=C2=A0 What<br>
&gt; you&#39;ll need to do is create a new layer in meta-openbmc-machines f=
or a<br>
&gt; RaspberryPi that includes the raspberrypi layer, specifies the correct=
<br>
&gt; kernel device tree, etc.<br>
<br>
</span>=C2=A0As a heads-up, some of this work has already been done:<br>
<br>
<a href=3D"https://github.com/openbmc/openbmc/tree/master/meta-openbmc-mach=
ines/meta-evb/meta-evb-raspberrypi/conf" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/openbmc/<wbr>openbmc/tree/master/meta-<wbr>openbmc-ma=
chines/meta-evb/<wbr>meta-evb-raspberrypi/conf</a><br>
<br>
It was added in this change:<br>
<br>
<a href=3D"https://gerrit.openbmc-project.xyz/#/c/508/" rel=3D"noreferrer" =
target=3D"_blank">https://gerrit.openbmc-<wbr>project.xyz/#/c/508/</a><br>
<br>
I don&#39;t think it was thoroughly tested and it has probably bit-rotted,<=
br>
but maybe it&#39;s existence will flatten out the learning curve a bit.<br>
<br>
Cheers,<br>
<br>
Andrew<br>
</blockquote></div><br></div>

--001a1149daae9e27c9055ae8d420--
