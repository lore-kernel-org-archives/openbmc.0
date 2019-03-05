Return-Path: <manivannan.sadhasivam@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=manivannan.sadhasivam@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="E3yWxV0F"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44D0Hb2Rb0zDqDp
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 12:51:36 +1100 (AEDT)
Received: by mail-it1-x142.google.com with SMTP id v2so1879881ith.3
 for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2019 17:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tb94qa+Lhw2PjTQbTPumpz74R9zUXXqOPciWgwufK1w=;
 b=E3yWxV0FoJIFkTzdXXlmBAJYwu/GlPuOoFRqOMcWv8RVg/ehx1SiPu2qqXKxl0hQ28
 w4W82AhhHxqCRXIJMdKQjhU9aKhVF7d9V+D2u2GhLwQzAhCwoxfmqMhmrBb7r571s+gS
 CDOB32itYl9Unt++e7QXqiiKFf+JEMaXiwMh0pPlRINVx97R5qSnSHFjUzGdfeZYQq3e
 ve+Ylvam4ajGudxD4FIaBxQLknAioTM9/bxBx1/gvQWr18Bsa17i1Aq3vOum8UjSGpnJ
 02n3UzDyk0Ia+w6f6SzeSCKnH1ZL5jSnYe/W+Y3jZdGmudtFfOSSTkAuTFhsnRzmoJlV
 kChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tb94qa+Lhw2PjTQbTPumpz74R9zUXXqOPciWgwufK1w=;
 b=stPAPN5aeyg2ydfsWYHa7eBlSnAqDF9hAeT3yE28Pd0iJIh+YxbPY98KWeWQT2sbPm
 UZE7SfmPsvEXBG5Qz/0L5H9N2YJov9wl4U5hjXsbEmh22AiT05Epuna0HvaMafe2VRH+
 kvgSiJ1MfrsnHaWqYS7gOBj4V2qEfOs0x+AS4S8K68ZcR3Tfk+L18fIMzqSBsyiqrRIr
 rvtRGKktREGnCLix4wla3onpmY+lO1HyXwZZLHCcZf62BHgB074W8cH3188EkJpknM3y
 3K7urHb8G7EC9mqdc8X7S0kRVHdYpI++3ibBYL32h2WIsvqZC3mzF6IzedaPUahzQUuk
 11uA==
X-Gm-Message-State: APjAAAX3QiRI8i6JijG+ZRhNR6Po3bqhmK47Rp7eM6iVw4vscjhxbhw1
 L/P4QI1O3811p7CcPCe/IEiWZeP80b2izyEZl2tK
X-Google-Smtp-Source: APXvYqyrEXorU1B6ZIyYiIz6F0MAJ4/pkx/ouJUbgqxJfAHWwFvlD4XrfkBLJXWSODT3oCpdOgyXsky1pSN4a394k88=
X-Received: by 2002:a24:6344:: with SMTP id j65mr1255750itc.40.1551750692827; 
 Mon, 04 Mar 2019 17:51:32 -0800 (PST)
MIME-Version: 1.0
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
 <20190301155523.GA1915@Mani-XPS-13-9360>
 <CACRpkdb=E9_rm4_7DQV3dS5uOs1gozxEwN9MtWr0tTwmjcYe=A@mail.gmail.com>
 <20190304144829.GA5265@Mani-XPS-13-9360>
 <CACRpkda+8QZnaT-YoeccQGjg78y9-E-JoWBr3LJs62T03H4wQw@mail.gmail.com>
In-Reply-To: <CACRpkda+8QZnaT-YoeccQGjg78y9-E-JoWBr3LJs62T03H4wQw@mail.gmail.com>
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 5 Mar 2019 07:21:19 +0530
Message-ID: <CAOZjjhnDYHkWCd-zDqkFpg5FPoj-UxxNwVxfbg6QEahiASm10w@mail.gmail.com>
Subject: Re: [PATCH 01/15] ARM: actions: fix a leaked reference by
 addingmissing of_node_put
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wen Yang <wen.yang99@zte.com.cn>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Russell King <linux@armlinux.org.uk>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, 
 Michal Simek <michal.simek@xilinx.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 avifishman70@gmail.com, 
 Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Xu Wei <xuwei5@hisilicon.com>, Maxime Ripard <maxime.ripard@bootlin.com>, 
 Chen-Yu Tsai <wens@csie.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will.deacon@arm.com>, Simon Horman <horms@verge.net.au>, 
 Magnus Damm <magnus.damm@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, 
 NXP Linux Team <linux-imx@nxp.com>, wang.yi59@zte.com.cn
Content-Type: multipart/alternative; boundary="000000000000d3bb3405834f1c04"
X-Mailman-Approved-At: Thu, 07 Mar 2019 12:31:41 +1100
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
X-List-Received-Date: Tue, 05 Mar 2019 01:51:40 -0000

--000000000000d3bb3405834f1c04
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Mar, 2019, 4:08 AM Linus Walleij <linus.walleij@linaro.org wrote:

> On Mon, Mar 4, 2019 at 3:48 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> > On Mon, Mar 04, 2019 at 01:29:33PM +0100, Linus Walleij wrote:
> > > On Fri, Mar 1, 2019 at 4:55 PM Manivannan Sadhasivam
> > > <manivannan.sadhasivam@linaro.org> wrote:
> > > > Hi Wen,
> > > >
> > > > On Fri, Mar 01, 2019 at 04:56:42PM +0800, Wen Yang wrote:
> > > > > The call to of_get_next_child returns a node pointer with refcount
> > > > > incremented thus it must be explicitly decremented after the last
> > > > > usage.
> > > > >
> > > > > Detected by coccinelle with the following warnings:
> > > > > ./arch/arm/mach-actions/platsmp.c:112:2-8: ERROR: missing
> of_node_put; acquired a node pointer with refcount incremented on line 103,
> but without a corresponding object release within this function.
> > > > > ./arch/arm/mach-actions/platsmp.c:124:2-8: ERROR: missing
> of_node_put; acquired a node pointer with refcount incremented on line 115,
> but without a corresponding object release within this function.
> > > > > ./arch/arm/mach-actions/platsmp.c:137:3-9: ERROR: missing
> of_node_put; acquired a node pointer with refcount incremented on line 128,
> but without a corresponding object release within this function.
> > > > >
> > > >
> > > > We have a floating patch for this:
> > > > https://www.spinics.net/lists/arm-kernel/msg694544.html
> > > >
> > > > Andreas: Can you please take a second look at the patchset submitted
> by Linus
> > > > Walleij and Russel for simplifying the Actions startup code?
> > >
> > > Andreas wrote a version of simplifying secondary startup in the
> > > same spirit as Russell's patches, and it's merged and all
> > > is fine I think.
> > >
> >
> > Oops. I think I missed that! Can you please point me to that patch? And
> how it
> > got merged? I did the PR for actions stuff this time and haven't
> included any
> > mach-actions patches.
>
> I just did git log arch/arm/mach-actions but I think it came in quite some
> time
> ago, not last merge window:
>
> But you see:
> commit 6c2eb3e76fb84e2eb46d484f71fab469c0d9532c
> "ARM: owl: smp: Drop owl_secondary_boot()"
> commit bad29933fef76fb6ee577f4a0b6d145c1f52f663
> "ARM: owl: smp: Use __pa_symbol()"
> commit 18cfd9429d8a82c49add8f3ca9d366599bfcac45
> "ARM: owl: smp: Drop bogus holding pen"
>
> platsmp.c looks just fine these days. Except for what Wei's patch is
> fixing,
> of_node_put().
>

Nope. platsmp.c still requires some cleanup like removing the redundant
bootlock and pen_release flag as pointed out by Russel. Andreas just
replied to your cleanup patches but there was no follow up since that. So,
I guess we can just apply Russell's patches and this patch once Andreas is
fine with it (it looks good to me though).

Thanks,
Mani


> Yours,
> Linus Walleij
>

--000000000000d3bb3405834f1c04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Tue, 5 Mar, 2019, 4:08 AM Linus Walleij &lt;<a href=3D"mailto:linus.wall=
eij@linaro.org">linus.walleij@linaro.org</a> wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On Mon, Mar 4, 2019 at 3:48 PM Manivannan Sadhasivam<br>
&lt;<a href=3D"mailto:manivannan.sadhasivam@linaro.org" target=3D"_blank" r=
el=3D"noreferrer">manivannan.sadhasivam@linaro.org</a>&gt; wrote:<br>
&gt; On Mon, Mar 04, 2019 at 01:29:33PM +0100, Linus Walleij wrote:<br>
&gt; &gt; On Fri, Mar 1, 2019 at 4:55 PM Manivannan Sadhasivam<br>
&gt; &gt; &lt;<a href=3D"mailto:manivannan.sadhasivam@linaro.org" target=3D=
"_blank" rel=3D"noreferrer">manivannan.sadhasivam@linaro.org</a>&gt; wrote:=
<br>
&gt; &gt; &gt; Hi Wen,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Fri, Mar 01, 2019 at 04:56:42PM +0800, Wen Yang wrote:<br=
>
&gt; &gt; &gt; &gt; The call to of_get_next_child returns a node pointer wi=
th refcount<br>
&gt; &gt; &gt; &gt; incremented thus it must be explicitly decremented afte=
r the last<br>
&gt; &gt; &gt; &gt; usage.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Detected by coccinelle with the following warnings:<br>
&gt; &gt; &gt; &gt; ./arch/arm/mach-actions/platsmp.c:112:2-8: ERROR: missi=
ng of_node_put; acquired a node pointer with refcount incremented on line 1=
03, but without a corresponding object release within this function.<br>
&gt; &gt; &gt; &gt; ./arch/arm/mach-actions/platsmp.c:124:2-8: ERROR: missi=
ng of_node_put; acquired a node pointer with refcount incremented on line 1=
15, but without a corresponding object release within this function.<br>
&gt; &gt; &gt; &gt; ./arch/arm/mach-actions/platsmp.c:137:3-9: ERROR: missi=
ng of_node_put; acquired a node pointer with refcount incremented on line 1=
28, but without a corresponding object release within this function.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We have a floating patch for this:<br>
&gt; &gt; &gt; <a href=3D"https://www.spinics.net/lists/arm-kernel/msg69454=
4.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.spinics=
.net/lists/arm-kernel/msg694544.html</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Andreas: Can you please take a second look at the patchset s=
ubmitted by Linus<br>
&gt; &gt; &gt; Walleij and Russel for simplifying the Actions startup code?=
<br>
&gt; &gt;<br>
&gt; &gt; Andreas wrote a version of simplifying secondary startup in the<b=
r>
&gt; &gt; same spirit as Russell&#39;s patches, and it&#39;s merged and all=
<br>
&gt; &gt; is fine I think.<br>
&gt; &gt;<br>
&gt;<br>
&gt; Oops. I think I missed that! Can you please point me to that patch? An=
d how it<br>
&gt; got merged? I did the PR for actions stuff this time and haven&#39;t i=
ncluded any<br>
&gt; mach-actions patches.<br>
<br>
I just did git log arch/arm/mach-actions but I think it came in quite some =
time<br>
ago, not last merge window:<br>
<br>
But you see:<br>
commit 6c2eb3e76fb84e2eb46d484f71fab469c0d9532c<br>
&quot;ARM: owl: smp: Drop owl_secondary_boot()&quot;<br>
commit bad29933fef76fb6ee577f4a0b6d145c1f52f663<br>
&quot;ARM: owl: smp: Use __pa_symbol()&quot;<br>
commit 18cfd9429d8a82c49add8f3ca9d366599bfcac45<br>
&quot;ARM: owl: smp: Drop bogus holding pen&quot;<br>
<br>
platsmp.c looks just fine these days. Except for what Wei&#39;s patch is fi=
xing,<br>
of_node_put().<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Nope. platsmp.c still requires some cleanup like removing the=
 redundant bootlock and pen_release flag as pointed out by Russel. Andreas =
just replied to your cleanup patches but there was no follow up since that.=
 So, I guess we can just apply Russell&#39;s patches and this patch once An=
dreas is fine with it (it looks good to me though).=C2=A0</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto">Mani=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
Yours,<br>
Linus Walleij<br>
</blockquote></div></div></div>

--000000000000d3bb3405834f1c04--
