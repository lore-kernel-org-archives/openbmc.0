Return-Path: <raltherr@google.com>
Received: from mail-io0-x236.google.com (mail-io0-x236.google.com
 [IPv6:2607:f8b0:4001:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rLFWx2HWmzDqgj
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jun 2016 04:05:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=dhP3djB0; 
 dkim-atps=neutral
Received: by mail-io0-x236.google.com with SMTP id t40so53684399ioi.0
 for <openbmc@lists.ozlabs.org>; Thu, 02 Jun 2016 11:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=jZktcvsiG0qbefNQbpqopJyL+WGwl7HugDwJtbPcIag=;
 b=dhP3djB0RF/i+BPoDV9qsrSqlUkyoUz+vI8GWelaIydwZVWM3z3FLqC9XdIRu7a2VZ
 /l4NqZsmmEKJDK/9pOE9BFyX6nS5J/owlzx+vUXPjZJFZETQDnnV6nkHSQrKxXUS/4VX
 LpY6OXgUosYKes8a4iaRYkeVzp640ITeJJCQxBEsvCsrmYiceoBllWyX6pTBsdWFluM1
 dtJh8ZHZIAQA5lnP/tNBpNKDaS89nmoj/kZzFcG0va36TKbVownkz+CLT/gcIVmO4nIJ
 CsIryHSz5mSFKq1LKnx4VecXuTd2cFcss4s15SZUmy/MI6XH5V48fN3ShdrWq6sxlcGo
 leEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=jZktcvsiG0qbefNQbpqopJyL+WGwl7HugDwJtbPcIag=;
 b=PtvsjRwxwUZHk+BSEBvrA6HWezSRPyepaY5B9fUfSDipge9SqJ1LWSq2426+FC5W7L
 HoRYIh/9Zc0CRC7kGBVGo170AwEpJyaFP9e6GmcmSD5a59wWjWh+wGcEtLcX6dLq/pwa
 23JphuzkA8BNJMX1uaYY5sKfqPVF0w4i5JMQ31Q4Z7PbDLgvryoBO08Nocxqv4B3VzK7
 tMyHWrZBtplb2+YMndFijt34g3DjHkL78N7MU02LkXG/WcYVVu5TOmhDZcubfn+k1U8I
 qo0vq03eLjwAGVX71KW0GO+AWt8qAASIYH4r7x+X8ONrIGOzIne6CbDKSVnZkJ49yR6B
 U37g==
X-Gm-Message-State: ALyK8tJbm3eXeMIhK4XehT5iWLKTUXvtuqHj9coDaAbuC7POxQOwNDWNtaLtZ88/r9Ag5aUwGtZKGpYElfYhlFMY
X-Received: by 10.107.26.85 with SMTP id a82mr89961ioa.13.1464890744500; Thu,
 02 Jun 2016 11:05:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.65.14.170 with HTTP; Thu, 2 Jun 2016 11:05:43 -0700 (PDT)
In-Reply-To: <20160602022644.GR19968@asimov.austin.ibm.com>
References: <CAPLgG==KjbSt766V7ztyOJfhp9=tg7ZDOboO+45Jwzu3CL7gjA@mail.gmail.com>
 <20160602022644.GR19968@asimov.austin.ibm.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 2 Jun 2016 11:05:43 -0700
Message-ID: <CAPLgG=kyY-gfV7nqwWx16FSWXML-mxOCsiG2YtWvD7NGjinZCA@mail.gmail.com>
Subject: Re: Roadmap for AST2500?
To: Patrick Williams <patrick@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=001a113fd586767e0005344f749f
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jun 2016 18:05:50 -0000

--001a113fd586767e0005344f749f
Content-Type: text/plain; charset=UTF-8

Thanks Patrick.  That helps quite a bit.

AFAIK, Zaius will have an option for NC-SI in addition to an on-board PHY.
I suspect there will be some work required for NC-SI with the NICs Google
will be using.

Are you planning to stick with 4.7-rc1 as a base for AST2500 support?  I
was expecting to start from a normal release such as 4.6.

I'll ask one of my people to start looking into u-boot.  I know we need to
do some work for Google-specific changes but we should also be able to help
with getting the Aspeed changes cleaned up for upstream.

On Wed, Jun 1, 2016 at 7:26 PM, Patrick Williams <patrick@stwcx.xyz> wrote:

> Rick,
>
> Joel has been working on the AST2500 support for the kernel. I believe
> his current working tree is here:
>     https://github.com/shenki/linux/tree/dev-4.7
>
> We are currently using the u-boot from the Aspeed SDK without much
> (any?) change at all. I think this is his tree for that:
>     https://github.com/shenki/u-boot/tree/v2013.01-aspeed-ast2500
>
> We are also in the process of creating the AST2500 BSP recipes to pull
> this work all together. You should see some commits in the next few days
> for this. In the worst case, it will be up by the end of next week.
>
> One area of need we have is taking the u-boot changes from Aspeed and
> getting them cleaned up, applicable to upstream master, and sent
> upstream. Joel and Teddy from Facebook have both done a little work in
> this area, but I think both of them have been busy with other tasks.
>
> Have you looked at support for Zaius' NIC for the BMC? Some of the
> systems use an NCSI shared interface and some have an independent PHY.
> This has tended to be a "problematic" area for both u-boot and kernel.
> If you're not using an already-supported interface there will be code
> you need to write there. U-boot isn't required but is handy for netboot
> in development.
>
> I don't have the roadmap ready for the userspace work we are planning to
> do. There is a significant amount of work we have planned over the next
> N months for a machine we are developing in a parallel time-frame with
> Zaius. I am really striving to get this all out on Github so we can
> coordinate this work with your team, but had some snags that I am
> working out.
>
> I am going to be in town next Wed 6/8. We can discuss some more on the
> userspace plans face-to-face. Hopefully, I can get our plans for the
> next few months published in Github by the end of this month.
>
> On Wed, Jun 01, 2016 at 12:54:51PM -0700, Rick Altherr wrote:
> > For Zaius, Google and Rackspace's Power9 server, we'll be including an
> > AST2500 and plan to run OpenBMC.  I have a few people on my team
> available
> > to contribute to AST2500 bringup and Zaius-specific OpenBMC development.
> > I'm trying to figure out what all needs to be done, what AST2500 work is
> > already being done, and where my team's contributions can best be
> utilized.
> >
> > I know Xo Wang (xow@google.com) has already been talking with some of
> you
> > about the kernel work needed for AST2500.  What is needed in Yocto and
> the
> > userspace apps?  I can easily put together a AST2500 bsp layer but
> without
> > a corresponding kernel, that's not particularly useful.
> >
> > Is there a published roadmap somewhere?  Where do you see the biggest
> need
> > for help?
> >
> > Rick
>
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>
>
> --
> Patrick Williams
>

--001a113fd586767e0005344f749f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Patrick.=C2=A0 That helps quite a bit.<div><br></di=
v><div>AFAIK, Zaius will have an option for NC-SI in addition to an on-boar=
d PHY.=C2=A0 I suspect there will be some work required for NC-SI with the =
NICs Google will be using.<div><br></div><div>Are you planning to stick wit=
h 4.7-rc1 as a base for AST2500 support?=C2=A0 I was expecting to start fro=
m a normal release such as 4.6.<div><br></div><div>I&#39;ll ask one of my p=
eople to start looking into u-boot.=C2=A0 I know we need to do some work fo=
r Google-specific changes but we should also be able to help with getting t=
he Aspeed changes cleaned up for upstream.<br><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Wed, Jun 1, 2016 at 7:26 PM, Patrick Willia=
ms <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_bl=
ank">patrick@stwcx.xyz</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Rick,<br>
<br>
Joel has been working on the AST2500 support for the kernel. I believe<br>
his current working tree is here:<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/shenki/linux/tree/dev-4.7" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/shenki/linux/tree/dev-=
4.7</a><br>
<br>
We are currently using the u-boot from the Aspeed SDK without much<br>
(any?) change at all. I think this is his tree for that:<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/shenki/u-boot/tree/v2013.01-asp=
eed-ast2500" rel=3D"noreferrer" target=3D"_blank">https://github.com/shenki=
/u-boot/tree/v2013.01-aspeed-ast2500</a><br>
<br>
We are also in the process of creating the AST2500 BSP recipes to pull<br>
this work all together. You should see some commits in the next few days<br=
>
for this. In the worst case, it will be up by the end of next week.<br>
<br>
One area of need we have is taking the u-boot changes from Aspeed and<br>
getting them cleaned up, applicable to upstream master, and sent<br>
upstream. Joel and Teddy from Facebook have both done a little work in<br>
this area, but I think both of them have been busy with other tasks.<br>
<br>
Have you looked at support for Zaius&#39; NIC for the BMC? Some of the<br>
systems use an NCSI shared interface and some have an independent PHY.<br>
This has tended to be a &quot;problematic&quot; area for both u-boot and ke=
rnel.<br>
If you&#39;re not using an already-supported interface there will be code<b=
r>
you need to write there. U-boot isn&#39;t required but is handy for netboot=
<br>
in development.<br>
<br>
I don&#39;t have the roadmap ready for the userspace work we are planning t=
o<br>
do. There is a significant amount of work we have planned over the next<br>
N months for a machine we are developing in a parallel time-frame with<br>
Zaius. I am really striving to get this all out on Github so we can<br>
coordinate this work with your team, but had some snags that I am<br>
working out.<br>
<br>
I am going to be in town next Wed 6/8. We can discuss some more on the<br>
userspace plans face-to-face. Hopefully, I can get our plans for the<br>
next few months published in Github by the end of this month.<br>
<div><div class=3D"h5"><br>
On Wed, Jun 01, 2016 at 12:54:51PM -0700, Rick Altherr wrote:<br>
&gt; For Zaius, Google and Rackspace&#39;s Power9 server, we&#39;ll be incl=
uding an<br>
&gt; AST2500 and plan to run OpenBMC.=C2=A0 I have a few people on my team =
available<br>
&gt; to contribute to AST2500 bringup and Zaius-specific OpenBMC developmen=
t.<br>
&gt; I&#39;m trying to figure out what all needs to be done, what AST2500 w=
ork is<br>
&gt; already being done, and where my team&#39;s contributions can best be =
utilized.<br>
&gt;<br>
&gt; I know Xo Wang (<a href=3D"mailto:xow@google.com">xow@google.com</a>) =
has already been talking with some of you<br>
&gt; about the kernel work needed for AST2500.=C2=A0 What is needed in Yoct=
o and the<br>
&gt; userspace apps?=C2=A0 I can easily put together a AST2500 bsp layer bu=
t without<br>
&gt; a corresponding kernel, that&#39;s not particularly useful.<br>
&gt;<br>
&gt; Is there a published roadmap somewhere?=C2=A0 Where do you see the big=
gest need<br>
&gt; for help?<br>
&gt;<br>
&gt; Rick<br>
<br>
</div></div>&gt; _______________________________________________<br>
&gt; openbmc mailing list<br>
&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</=
a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
Patrick Williams<br>
</font></span></blockquote></div><br></div></div></div></div></div>

--001a113fd586767e0005344f749f--
