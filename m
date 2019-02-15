Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="J2pUT+HY"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44124M1KmKzDqQv
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 16:33:54 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id w25so14594512otm.13
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 21:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yHe6nPcRY9vI8sA2LVnwhNKxZH6U8CvYd+oLb9SdxWU=;
 b=J2pUT+HYJa95I2lfnt/0UxqV4GUWSvTLWlqmYhf9YJ9dTNKQfVFYhjiG+9AMOnZUmy
 NHafwOUWP9abwh7NL/3/OmlMciiMCvRlsXaj6Kw814FoC70HTDmIxDYIvZVCDSBOykjp
 IM8Z6eNt/L4BVoKZCnIS7q/hn2Mij0V0JHe/9bXeOp+Vi5Iix/DxrCYdl0BXW6Vh24L/
 L6SESm+jfE2xE7vIDqOZW7bmoyHD4xh9Wa5Fq0fKGWKszV0UafJPiRq2AINlWimGbViL
 a8f30oFka/1dFcs7Z58intGWfC3fA6lZ4PoFzsXJwnzhE9d7fzu+akdkpXu04TofEbWY
 w5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yHe6nPcRY9vI8sA2LVnwhNKxZH6U8CvYd+oLb9SdxWU=;
 b=Fl9uXdHj5nCRDjymzzQIy0RGFnkrAHWseXFefMViiC6/4656yaNckx48Mr67qrdZic
 msfULZk7QhZ2Tkp7R0Cl+1/8/BdV82eGw/SSG7cgJxq7dlhW/xbSThz/9Eyou21mAv+U
 jVLE182xE5pVj1Avaogf/72Me+iqPgnggppn39KmY98t/owWi8RqgIaAPOspWGZstSp2
 bDNoCBcy4NhBs3QHq70H/rR4+QjiTthRlyQk9EFvkOSM7tnQgOFm16F6X/8RbO+PjufO
 ku5Qqj5Djb/wgUHbI6Cc8jRvsoM6EBRu4Aktp5T059eZqiEY6drusCkHpFLh/EKLhOzC
 J/Hg==
X-Gm-Message-State: AHQUAuYnLGunMnoc8/pV+xIvRsUXiWa3jL7u9QCF8BiP34WHduprnOux
 uV+CyZ6DJioekhB0Dit9D8819KbHUb0iPC0IRt1uEP8toOE=
X-Google-Smtp-Source: AHgI3IbV2UHcbCK1DpuizqPA60DRuKOPYX42ll5wnlCS7acwkFFEmqcHldm2ecFoVxxPdfvAZ4U8cMc77ND3nnxZino=
X-Received: by 2002:aca:c7c2:: with SMTP id x185mr4808902oif.25.1550208832764; 
 Thu, 14 Feb 2019 21:33:52 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLGC==CvoJLBV+jUnp=RiFph7wxa0q2o6ZfhrqaNMZtBCQ@mail.gmail.com>
 <1550097803.1007491.1657535928.051F6319@webmail.messagingengine.com>
 <CAE33tLG24aYDx0a7pbNCs8KU=ANT161JvT9c_iPpCQ44Lc5Fbg@mail.gmail.com>
 <1550186888.4139421.1658270160.5405B961@webmail.messagingengine.com>
In-Reply-To: <1550186888.4139421.1658270160.5405B961@webmail.messagingengine.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Fri, 15 Feb 2019 11:03:06 +0530
Message-ID: <CAE33tLHdxOpH8NsPv6xRLdymAisBsy0smwySkc=V=E6nz28fKQ@mail.gmail.com>
Subject: Re: Unable to read or write from system SPI flash memory.
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000ce03910581e81e4f"
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
X-List-Received-Date: Fri, 15 Feb 2019 05:33:56 -0000

--000000000000ce03910581e81e4f
Content-Type: text/plain; charset="UTF-8"

I just powered off the entire board. After that the data is not present in
the SPI1 flash. But before power-off it was there.

We are using OpenBMC Linux version 4.18.7 and pflash v6.1

On Fri, Feb 15, 2019 at 4:58 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> On Thu, 14 Feb 2019, at 14:59, AKASH G J wrote:
> > I am using the following command to write data to SPI1 flash.
> > *pflash -e -a 0 -f -p <filename>*
> >
> > On Thu, Feb 14, 2019 at 4:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > > On Wed, 13 Feb 2019, at 19:24, AKASH G J wrote:
> > > > Hi all,
> > > >
> > > > We have a test board containing BMC Aspeed AST-2500. It contains BMC
> > > flash
> > > > memory, SPI1 flash memory and SPI2 flash memory. we are using zaius
> > > machine
> > > > configuration for building Linux. When I am trying to write to SPI1
> flash
> > > > at address 30000000 using pflash tool, the modified data is not
> reflected
> > > > after reboot.
>
> A reboot of what? The host or the BMC? Does this mean that the expected
> data
> is present after the pflash but before the reboot of whichever system
> you're
> talking about here?
>
> What are the versions of the BMC kernel and pflash tool that you're using?
>
> Andrew
>

--000000000000ce03910581e81e4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>I just powered off the entire board.=
 After that the data is not present in the SPI1 flash. But before power-off=
 it was there. <br></div><div><br></div><div>We are using OpenBMC Linux ver=
sion 4.18.7 and pflash v6.1<br></div></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 15, 2019 at 4:58 AM =
Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu=
, 14 Feb 2019, at 14:59, AKASH G J wrote:<br>
&gt; I am using the following command to write data to SPI1 flash.<br>
&gt; *pflash -e -a 0 -f -p &lt;filename&gt;*<br>
&gt; <br>
&gt; On Thu, Feb 14, 2019 at 4:13 AM Andrew Jeffery &lt;<a href=3D"mailto:a=
ndrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, 13 Feb 2019, at 19:24, AKASH G J wrote:<br>
&gt; &gt; &gt; Hi all,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We have a test board containing BMC Aspeed AST-2500. It cont=
ains BMC<br>
&gt; &gt; flash<br>
&gt; &gt; &gt; memory, SPI1 flash memory and SPI2 flash memory. we are usin=
g zaius<br>
&gt; &gt; machine<br>
&gt; &gt; &gt; configuration for building Linux. When I am trying to write =
to SPI1 flash<br>
&gt; &gt; &gt; at address 30000000 using pflash tool, the modified data is =
not reflected<br>
&gt; &gt; &gt; after reboot. <br>
<br>
A reboot of what? The host or the BMC? Does this mean that the expected dat=
a<br>
is present after the pflash but before the reboot of whichever system you&#=
39;re<br>
talking about here?<br>
<br>
What are the versions of the BMC kernel and pflash tool that you&#39;re usi=
ng?<br>
<br>
Andrew<br>
</blockquote></div>

--000000000000ce03910581e81e4f--
