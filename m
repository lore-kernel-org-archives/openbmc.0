Return-Path: <raltherr@google.com>
Received: from mail-io0-x235.google.com (mail-io0-x235.google.com
 [IPv6:2607:f8b0:4001:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rLwhd2d5KzDq66
 for <openbmc@lists.ozlabs.org>; Sat,  4 Jun 2016 06:30:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=AUnjO1Bq; 
 dkim-atps=neutral
Received: by mail-io0-x235.google.com with SMTP id k19so74722717ioi.3
 for <openbmc@lists.ozlabs.org>; Fri, 03 Jun 2016 13:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=amrYg/s8WiQjLYSN8Z4I3Kh3rd6JE4wpVwALE+ZRb5o=;
 b=AUnjO1Bqkmqze8VcPgZvr0hJ8SCFnfZaj8B1i2gpX3FyDOTnrbtInKkiapdjoTn5rH
 0sWz0fJtakU9PJOVjTtJclpF1E4iBU0F/+35CgSQg47YZVLvPmc4lwDyJcknZ1pSfOE6
 No1+Q53B3vF7/KccpCgO8cf7EgI3n3cbrUefl2eBsP0Gbdhp1NtuRslbvm3fI3lCBSQ1
 6GKLoUehjFi7YeVn8nBsvQ3vHjkiiTqsIIIGS35cQF+ctw0qbx/f5MetctzgErugy56M
 bHTSX9ZNADusI7uGoDhp9OdIdhBXibXcKSSX6diT50NhV0Kt6YN1qRLLRdStssELJwOz
 eELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=amrYg/s8WiQjLYSN8Z4I3Kh3rd6JE4wpVwALE+ZRb5o=;
 b=jUVq/LAGZXNYUWyHfdISQMGifTM7Frvch7d+YOfdno7+IJrdfG3sjWDQ+RNJxNA3gf
 KvZuHFISxdD2Y6aLHxskjBc9rZa2nIXHtBVcwNMFfLIflq1Mh0hPP41gCHirGKWFtup1
 oTf1jEmJCDYh5OxeLcyOwSyGheqq+qX0DXVsBeaRgy3D2psOTPYnPq2LPuyjOhdpiIqS
 UsT8x9WqjrcM8Md0EQG4mWj07yPe+14qcUw7EYoNXa15tjr8rshbpGPTAwCs+81am3Z2
 LZdRR2ZnECbAUubY24rUkRLh6lp1qCY/57IfhT38pdy3Blr1wE3r4R08J9Rd1saq3zM+
 TVRw==
X-Gm-Message-State: ALyK8tJ8mRxfHbz0IJLWt0T5uWmFtIpsEbzQhvwpQn9M9qKutDu3WKmHPNqnodyVK75ECDRhIczdHmxQOLS+VfNk
X-Received: by 10.107.58.213 with SMTP id h204mr8399409ioa.172.1464985835856; 
 Fri, 03 Jun 2016 13:30:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.65.14.170 with HTTP; Fri, 3 Jun 2016 13:30:35 -0700 (PDT)
In-Reply-To: <CACPK8XeLH1pM1+cmB02tYK9iSJqS6ZSwBduyxRKy-3x+SrBYOA@mail.gmail.com>
References: <CAPLgG==KjbSt766V7ztyOJfhp9=tg7ZDOboO+45Jwzu3CL7gjA@mail.gmail.com>
 <20160602022644.GR19968@asimov.austin.ibm.com>
 <CAPLgG=kyY-gfV7nqwWx16FSWXML-mxOCsiG2YtWvD7NGjinZCA@mail.gmail.com>
 <CACPK8XeLH1pM1+cmB02tYK9iSJqS6ZSwBduyxRKy-3x+SrBYOA@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 3 Jun 2016 13:30:35 -0700
Message-ID: <CAPLgG==Bn6bhQkWb+r4fOi0wpHK8VrhkV4W16f=+46anVJPmVg@mail.gmail.com>
Subject: Re: Roadmap for AST2500?
To: Joel Stanley <joel@jms.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Gavin Shan <gwshan@linux.vnet.ibm.com>, Teddy Reed V <teddy@prosauce.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary=001a114ac34c5949280534659822
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
X-List-Received-Date: Fri, 03 Jun 2016 20:30:42 -0000

--001a114ac34c5949280534659822
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 3, 2016 at 1:12 PM, Joel Stanley <joel@jms.id.au> wrote:

> Hello Rick,
>
> On Thu, Jun 2, 2016 at 1:05 PM, Rick Altherr <raltherr@google.com> wrote:
> > AFAIK, Zaius will have an option for NC-SI in addition to an on-board
> PHY.
> > I suspect there will be some work required for NC-SI with the NICs Google
> > will be using.
>
> We've got a proposed NC-SI stack in our kernels we're using for
> Barreleye and on a ast2500 based system. That's been worked on by
> Gavin; he's keen to find someone who works in the Linux network stack
> to provide meaningful review.
>

Let me ask if we have anyone here at Google who can help.


>
> > Are you planning to stick with 4.7-rc1 as a base for AST2500 support?  I
> was
> > expecting to start from a normal release such as 4.6.
>
> We tend to keep moving forward so any work we do is relevant for
> upstreaming. I have some basic aspeed support upstream in 4.7, and I
> moved our drivers up so I could test this. As I didn't run in to any
> trouble on the evb when testing we're running with 4.7.
>
> I intend to continue cleaning up our drivers and submitting them
> before the 4.8 merge window opens. Assistance on this front is
> welcome.
>
>
As we discussed in IRC, I've backported the upstream aspeed support from
4.7-rc1 to 4.6 and then rebased your dev-4.7 branch on top.  I've pushed
the result to https://github.com/kc8apf/linux/tree/v4.6-ast2500.  This
seems to be a good starting point for linux-obmc so I'll send a pull
request soon.  While you move your dev branch along with upstream, I'll
backport changes into the 4.6-based linux-obmc branch until 4.7 is
released.  Then we'll move linux-obmc to 4.7 and repeat.  That way, poky
can be aimed at the 4.6-based linux-obmc and let work on the BSP and
machine layers continue.


> > I'll ask one of my people to start looking into u-boot.  I know we need
> to
> > do some work for Google-specific changes but we should also be able to
> help
> > with getting the Aspeed changes cleaned up for upstream.
>
> We've got two people working on that front. Teddy has been focusing on
> the ast2400 and sent some mail to the u-boot list relating to that
> today.
>
> Cedric has been focusing on ast2500 support. He has that booting on
> Qemu and will try that on hardware next week.
>
>
I look forward to seeing the changes.  Full obmc-phosphor-images will be
blocked until we have a u-boot that can at least build for ast2500.


> Finally, Brad has added a ast2500-evb board to our poky tree. Expect
> to see patches for that on the list in the next day or two.
>
>
As we discussed on IRC, Xo and I have also put together a BSP and machine
layer that seems to build everything except u-boot.  So far when using the
SDK u-boot, the image seems to boot up to starting login consoles.  There's
something not right with the ttys so we never get a login prompt.  Xo is
poking at that now.


> Cheers,
>
> Joel
>
> >
> >
> > On Wed, Jun 1, 2016 at 7:26 PM, Patrick Williams <patrick@stwcx.xyz>
> wrote:
> >>
> >> Rick,
> >>
> >> Joel has been working on the AST2500 support for the kernel. I believe
> >> his current working tree is here:
> >>     https://github.com/shenki/linux/tree/dev-4.7
> >>
> >> We are currently using the u-boot from the Aspeed SDK without much
> >> (any?) change at all. I think this is his tree for that:
> >>     https://github.com/shenki/u-boot/tree/v2013.01-aspeed-ast2500
> >>
> >> We are also in the process of creating the AST2500 BSP recipes to pull
> >> this work all together. You should see some commits in the next few days
> >> for this. In the worst case, it will be up by the end of next week.
> >>
> >> One area of need we have is taking the u-boot changes from Aspeed and
> >> getting them cleaned up, applicable to upstream master, and sent
> >> upstream. Joel and Teddy from Facebook have both done a little work in
> >> this area, but I think both of them have been busy with other tasks.
> >>
> >> Have you looked at support for Zaius' NIC for the BMC? Some of the
> >> systems use an NCSI shared interface and some have an independent PHY.
> >> This has tended to be a "problematic" area for both u-boot and kernel.
> >> If you're not using an already-supported interface there will be code
> >> you need to write there. U-boot isn't required but is handy for netboot
> >> in development.
> >>
> >> I don't have the roadmap ready for the userspace work we are planning to
> >> do. There is a significant amount of work we have planned over the next
> >> N months for a machine we are developing in a parallel time-frame with
> >> Zaius. I am really striving to get this all out on Github so we can
> >> coordinate this work with your team, but had some snags that I am
> >> working out.
> >>
> >> I am going to be in town next Wed 6/8. We can discuss some more on the
> >> userspace plans face-to-face. Hopefully, I can get our plans for the
> >> next few months published in Github by the end of this month.
> >>
> >> On Wed, Jun 01, 2016 at 12:54:51PM -0700, Rick Altherr wrote:
> >> > For Zaius, Google and Rackspace's Power9 server, we'll be including an
> >> > AST2500 and plan to run OpenBMC.  I have a few people on my team
> >> > available
> >> > to contribute to AST2500 bringup and Zaius-specific OpenBMC
> development.
> >> > I'm trying to figure out what all needs to be done, what AST2500 work
> is
> >> > already being done, and where my team's contributions can best be
> >> > utilized.
> >> >
> >> > I know Xo Wang (xow@google.com) has already been talking with some of
> >> > you
> >> > about the kernel work needed for AST2500.  What is needed in Yocto and
> >> > the
> >> > userspace apps?  I can easily put together a AST2500 bsp layer but
> >> > without
> >> > a corresponding kernel, that's not particularly useful.
> >> >
> >> > Is there a published roadmap somewhere?  Where do you see the biggest
> >> > need
> >> > for help?
> >> >
> >> > Rick
> >>
> >> > _______________________________________________
> >> > openbmc mailing list
> >> > openbmc@lists.ozlabs.org
> >> > https://lists.ozlabs.org/listinfo/openbmc
> >>
> >>
> >> --
> >> Patrick Williams
> >
> >
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
> >
>

--001a114ac34c5949280534659822
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jun 3, 2016 at 1:12 PM, Joel Stanley <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);paddin=
g-left:1ex">Hello Rick,<br>
<span class=3D"gmail-"><br>
On Thu, Jun 2, 2016 at 1:05 PM, Rick Altherr &lt;<a href=3D"mailto:raltherr=
@google.com">raltherr@google.com</a>&gt; wrote:<br>
&gt; AFAIK, Zaius will have an option for NC-SI in addition to an on-board =
PHY.<br>
&gt; I suspect there will be some work required for NC-SI with the NICs Goo=
gle<br>
&gt; will be using.<br>
<br>
</span>We&#39;ve got a proposed NC-SI stack in our kernels we&#39;re using =
for<br>
Barreleye and on a ast2500 based system. That&#39;s been worked on by<br>
Gavin; he&#39;s keen to find someone who works in the Linux network stack<b=
r>
to provide meaningful review.<br></blockquote><div><br></div><div>Let me as=
k if we have anyone here at Google who can help.</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);paddi=
ng-left:1ex">
<span class=3D"gmail-"><br>
&gt; Are you planning to stick with 4.7-rc1 as a base for AST2500 support?=
=C2=A0 I was<br>
&gt; expecting to start from a normal release such as 4.6.<br>
<br>
</span>We tend to keep moving forward so any work we do is relevant for<br>
upstreaming. I have some basic aspeed support upstream in 4.7, and I<br>
moved our drivers up so I could test this. As I didn&#39;t run in to any<br=
>
trouble on the evb when testing we&#39;re running with 4.7.<br>
<br>
I intend to continue cleaning up our drivers and submitting them<br>
before the 4.8 merge window opens. Assistance on this front is<br>
welcome.<br>
<span class=3D"gmail-"><br></span></blockquote><div><br></div><div>As we di=
scussed in IRC, I&#39;ve backported the upstream aspeed support from 4.7-rc=
1 to 4.6 and then rebased your dev-4.7 branch on top.=C2=A0 I&#39;ve pushed=
 the result to=C2=A0<a href=3D"https://github.com/kc8apf/linux/tree/v4.6-as=
t2500">https://github.com/kc8apf/linux/tree/v4.6-ast2500</a>.=C2=A0 This se=
ems to be a good starting point for linux-obmc so I&#39;ll send a pull requ=
est soon.=C2=A0 While you move your dev branch along with upstream, I&#39;l=
l backport changes into the 4.6-based linux-obmc branch until 4.7 is releas=
ed.=C2=A0 Then we&#39;ll move linux-obmc to 4.7 and repeat.=C2=A0 That way,=
 poky can be aimed at the 4.6-based linux-obmc and let work on the BSP and =
machine layers continue.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><span class=
=3D"gmail-">
&gt; I&#39;ll ask one of my people to start looking into u-boot.=C2=A0 I kn=
ow we need to<br>
&gt; do some work for Google-specific changes but we should also be able to=
 help<br>
&gt; with getting the Aspeed changes cleaned up for upstream.<br>
<br>
</span>We&#39;ve got two people working on that front. Teddy has been focus=
ing on<br>
the ast2400 and sent some mail to the u-boot list relating to that<br>
today.<br>
<br>
Cedric has been focusing on ast2500 support. He has that booting on<br>
Qemu and will try that on hardware next week.<br>
<br></blockquote><div><br></div><div>I look forward to seeing the changes.=
=C2=A0 Full obmc-phosphor-images will be blocked until we have a u-boot tha=
t can at least build for ast2500.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
Finally, Brad has added a ast2500-evb board to our poky tree. Expect<br>
to see patches for that on the list in the next day or two.<br>
<br></blockquote><div><br></div><div>As we discussed on IRC, Xo and I have =
also put together a BSP and machine layer that seems to build everything ex=
cept u-boot.=C2=A0 So far when using the SDK u-boot, the image seems to boo=
t up to starting login consoles.=C2=A0 There&#39;s something not right with=
 the ttys so we never get a login prompt.=C2=A0 Xo is poking at that now.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-col=
or:rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
Joel<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
&gt;<br>
&gt;<br>
&gt; On Wed, Jun 1, 2016 at 7:26 PM, Patrick Williams &lt;<a href=3D"mailto=
:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Rick,<br>
&gt;&gt;<br>
&gt;&gt; Joel has been working on the AST2500 support for the kernel. I bel=
ieve<br>
&gt;&gt; his current working tree is here:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/shenki/linux/tree=
/dev-4.7" rel=3D"noreferrer">https://github.com/shenki/linux/tree/dev-4.7</=
a><br>
&gt;&gt;<br>
&gt;&gt; We are currently using the u-boot from the Aspeed SDK without much=
<br>
&gt;&gt; (any?) change at all. I think this is his tree for that:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/shenki/u-boot/tre=
e/v2013.01-aspeed-ast2500" rel=3D"noreferrer">https://github.com/shenki/u-b=
oot/tree/v2013.01-aspeed-ast2500</a><br>
&gt;&gt;<br>
&gt;&gt; We are also in the process of creating the AST2500 BSP recipes to =
pull<br>
&gt;&gt; this work all together. You should see some commits in the next fe=
w days<br>
&gt;&gt; for this. In the worst case, it will be up by the end of next week=
.<br>
&gt;&gt;<br>
&gt;&gt; One area of need we have is taking the u-boot changes from Aspeed =
and<br>
&gt;&gt; getting them cleaned up, applicable to upstream master, and sent<b=
r>
&gt;&gt; upstream. Joel and Teddy from Facebook have both done a little wor=
k in<br>
&gt;&gt; this area, but I think both of them have been busy with other task=
s.<br>
&gt;&gt;<br>
&gt;&gt; Have you looked at support for Zaius&#39; NIC for the BMC? Some of=
 the<br>
&gt;&gt; systems use an NCSI shared interface and some have an independent =
PHY.<br>
&gt;&gt; This has tended to be a &quot;problematic&quot; area for both u-bo=
ot and kernel.<br>
&gt;&gt; If you&#39;re not using an already-supported interface there will =
be code<br>
&gt;&gt; you need to write there. U-boot isn&#39;t required but is handy fo=
r netboot<br>
&gt;&gt; in development.<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t have the roadmap ready for the userspace work we are p=
lanning to<br>
&gt;&gt; do. There is a significant amount of work we have planned over the=
 next<br>
&gt;&gt; N months for a machine we are developing in a parallel time-frame =
with<br>
&gt;&gt; Zaius. I am really striving to get this all out on Github so we ca=
n<br>
&gt;&gt; coordinate this work with your team, but had some snags that I am<=
br>
&gt;&gt; working out.<br>
&gt;&gt;<br>
&gt;&gt; I am going to be in town next Wed 6/8. We can discuss some more on=
 the<br>
&gt;&gt; userspace plans face-to-face. Hopefully, I can get our plans for t=
he<br>
&gt;&gt; next few months published in Github by the end of this month.<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Jun 01, 2016 at 12:54:51PM -0700, Rick Altherr wrote:<br>
&gt;&gt; &gt; For Zaius, Google and Rackspace&#39;s Power9 server, we&#39;l=
l be including an<br>
&gt;&gt; &gt; AST2500 and plan to run OpenBMC.=C2=A0 I have a few people on=
 my team<br>
&gt;&gt; &gt; available<br>
&gt;&gt; &gt; to contribute to AST2500 bringup and Zaius-specific OpenBMC d=
evelopment.<br>
&gt;&gt; &gt; I&#39;m trying to figure out what all needs to be done, what =
AST2500 work is<br>
&gt;&gt; &gt; already being done, and where my team&#39;s contributions can=
 best be<br>
&gt;&gt; &gt; utilized.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I know Xo Wang (<a href=3D"mailto:xow@google.com">xow@google.=
com</a>) has already been talking with some of<br>
&gt;&gt; &gt; you<br>
&gt;&gt; &gt; about the kernel work needed for AST2500.=C2=A0 What is neede=
d in Yocto and<br>
&gt;&gt; &gt; the<br>
&gt;&gt; &gt; userspace apps?=C2=A0 I can easily put together a AST2500 bsp=
 layer but<br>
&gt;&gt; &gt; without<br>
&gt;&gt; &gt; a corresponding kernel, that&#39;s not particularly useful.<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Is there a published roadmap somewhere?=C2=A0 Where do you se=
e the biggest<br>
&gt;&gt; &gt; need<br>
&gt;&gt; &gt; for help?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Rick<br>
&gt;&gt;<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; openbmc mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozl=
abs.org</a><br>
&gt;&gt; &gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"=
noreferrer">https://lists.ozlabs.org/listinfo/openbmc</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Patrick Williams<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; openbmc mailing list<br>
&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</=
a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferre=
r">https://lists.ozlabs.org/listinfo/openbmc</a><br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a114ac34c5949280534659822--
