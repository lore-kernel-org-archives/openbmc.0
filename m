Return-Path: <maxims@google.com>
Received: from mail-yw0-x229.google.com (mail-yw0-x229.google.com
 [IPv6:2607:f8b0:4002:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9Tlp0bZHzDvgh
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 04:46:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kiSHZDWn"; 
 dkim-atps=neutral
Received: by mail-yw0-x229.google.com with SMTP id r204so97728830ywb.0
 for <openbmc@lists.ozlabs.org>; Fri, 04 Nov 2016 10:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=xohnGBe68hDoLteHXkGZX2ULlEzxDexYsWxZQCug7pc=;
 b=kiSHZDWnv6E31kOEVApHD54kKCM0BPuv7n0X9tB/3wjKwX2ltMp4U/zhGavoKhKBaa
 gXzYAFBot8xJTnqVJXhgRYOBi0rPkq/Okfm+OVnyb6SbuQ6a30gMQHoRN02X0Smc/Pq1
 8pxdFI0bq1usvukph5vi7W2KbfA15lNkSWrZOPijaI/a5P1bcb74NdYJBlAGlnt0nI9S
 TI+rSR/Qj1WXKDBIC2TN1/XPbIKqa8UapBW0ODLHXc2ZLAtrGmfyKFO3uI9//4zl4U1D
 CzFbmRgHzD2lrkjt+zjkYQS8bmBHSysl4DyQPSIP+uUS2YBpOWFmclc39+2hj5/LkUg/
 e1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=xohnGBe68hDoLteHXkGZX2ULlEzxDexYsWxZQCug7pc=;
 b=VjwziZS7I3+hrdPaBYJWZg8Mw3lPvlz/Or8AWMqM5W8X2se2H16x093pijne39adtL
 oFpOWbWYwe5aKutRpv9S6YZlLgJa677xy7KgUNYNhB1uEWQhbuImxCbp1b4f2vvSpmFV
 5SIqu+lx2hAE1GeCMU+r3niM/Ljoo1+hshuLAT9TKp09Q5AwkeCXvp8WsvVn3gUxHZuI
 GjxlQ5aznzJJhVobcn7Y0ikQWaV8+/UwTHvs/CWI43zRes86R0DUZUgou8arTqGCIAsw
 iM7yo18SSwp1k9SwG1ACZEX/t3WUyJ7yD3V3/PQsOoX/Em+CRdi/CFXeU3NhITIlC9c/
 6mng==
X-Gm-Message-State: ABUngvdb3d4CzyfAaWGnK/1uOMYm1ISj9RZf2x65f5A+HForDEWVlU03GRMIYCyaduQCRc7/lzoFgrP24ufK4JzO
X-Received: by 10.13.212.129 with SMTP id w123mr4925544ywd.180.1478281571225; 
 Fri, 04 Nov 2016 10:46:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.56.210 with HTTP; Fri, 4 Nov 2016 10:46:10 -0700 (PDT)
In-Reply-To: <7a5ddb25-a5d6-104b-b81e-3d92d43b26e6@kaod.org>
References: <CAFR_W8qYKipAMj4h8xwMCJi4=AhiYePf=d3ndCGgYzCg=qxfNw@mail.gmail.com>
 <7a5ddb25-a5d6-104b-b81e-3d92d43b26e6@kaod.org>
From: Maxim Sloyko <maxims@google.com>
Date: Fri, 4 Nov 2016 10:46:10 -0700
Message-ID: <CAFR_W8oez8r9qX1A8KD-egFbcBZrWLmNc0hwagmM+XyjKvmiWQ@mail.gmail.com>
Subject: Re: U-Boot upstreaming
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114fa738eed82105407d3fb5
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Nov 2016 17:46:14 -0000

--001a114fa738eed82105407d3fb5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 4, 2016 at 8:54 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Hello !
>
> On 11/03/2016 09:44 PM, Maxim Sloyko wrote:
> > Hi Cedric,
> >
> > My manager (Rick Alther) mentioned that you were working on some
> > minimal "upstreamable" commit for Aspeed in U-Boot. How far were
> > you able to get?
>
> Please check :
>
>   https://github.com/openbmc/u-boot/wiki
>
> This is where we track the ugly details and here is my tree :
>
>    https://github.com/legoater/u-boot/commits/v2016.11-aspeed-openbmc
>
> Patch one is the "minimum" we have been working on with Joel these
> last 6 months to :
>
>  * make it compatible with upstream
>  * extract all exoticisms
>  * extract funky drivers
>  * isolate ugly hacks
>
> I think we are at a point where we need to rewrite bits of lowlevel_init
> or move them later on in the code. This big asm routines does :
>
>  * LPC patching for ast2300 (we can kill that)
>  * uart init (if SDRAM calibration is done, easy we can keep)
>  * SDRAM calibration (we could use static calibration values instead)
>  * SDRAM size calculation (may be we can move that in a C part)
>  * video clock setting (one reg setting)
>  * JTAG master (one reg setting)
>  * RMII/RGMII clock setting (one reg setting)
>  * GPIO massive reset (not sure if this is useful, should ask Andrew)
>  * SPI Calibration (I have done in C so we can move)
>

Yes, I looked at it too and it does not look like any of that has any
business being in lowlevel_init, let alone being implemented in asm.

Did you try moving this whole function further down the init sequence?
board_early_init_f might be a good candidate. It might cause problems
because it does not restore registers properly, but should be an easy fix -=
-
at this point we would already have stack setup for us (need to be
configured via CONFIG_SYS_INIT_SP_ADDR to point to the top of SRAM) and
even have a basic malloc (need to be configured). This would make calling
into C somewhat easier.


>
> > This is also what I was thinking of doing, so we should be able to join
> forces on this.
> >
> > I talked to Simon Glass recently (he's an active contributor to mainlin=
e
> U-Boot)
> > and basically that's the path that he also recommended -- just getting
> minimal amount
> > of code in, that can just boot to a prompt. He also said that DRAM
> driver would have
> > to be part of it.
>
> yes. See my comments above.
>
> > So, the way I see it, there are two big chunks of work here:
> >  1. Setting up the whole structure. This would include actually adding =
a
> board, minimum
> > amount of supporting code, debug serial console init,
>
> yes. that is patch one above, in which we still need to cleanup
> stuff in the .S part.
>
> >  2. DDR3/DDR4 driver. This is the biggest part of what we have in
> platform.S now. A lot
> > of work, but relatively straightforward, just rewrite ~1.5k lines of
> assembly in C.
>
> I am not sure this is feasible, AFAIK, you can not call C. I might
> be wrong.
>

You can. I tried it and it works. We just need stack (see above). Even if
moving the whole lowlevel_init further down will prove too hard, we can at
least call

mov sp, =3DTOP_OF_SRAM

at top of lowlevel_init. after this you can write (and call into) pretty
complicated C functions. This is what I've tried in my early experiments.


>
> > Personally, I don't have preference on who does what, as long as we
> don't step on each
> > other's toes. It would probably be easier for me to take (1), because I
> can easily talk
> > to two people who are in our time zone and have a lot of mainline U-Boo=
t
> experience.
> >
> > Thoughts?
>
> you could send patches on top of my tree to cleanup what ever
> part you want in lowlevel_init. when lowlevel_init reaches a
> minimum acceptable level, with a full patchset working on top
> of it, I think we can send for review. Then, we will work on
> the next details :
>
>  * extra settings
>  * spi/nor driver
>  * ftgmac100 extensions for Aspeed
>  * NCSI support
>  * DTS support
>  * etc.
>
> There is also a massive hack on the ast2500 mmu disablement in
> the core part of u-boot that I don't understand. So we could
> try to fix now or ask help when the patchset is sent.
>
>
> Cheers,
>
> C.
>



--=20
*M*axim *S*loyko

--001a114fa738eed82105407d3fb5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Nov 4, 2016 at 8:54 AM, C=C3=A9dric Le Goater <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:clg@kaod.org" target=3D"_blank">clg@kaod.org</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Hello !<br>
<span class=3D""><br>
On 11/03/2016 09:44 PM, Maxim Sloyko wrote:<br>
&gt; Hi Cedric,<br>
&gt;<br>
&gt; My manager (Rick Alther) mentioned that you were working on some<br>
&gt; minimal &quot;upstreamable&quot; commit for Aspeed in U-Boot. How far =
were<br>
&gt; you able to get?<br>
<br>
</span>Please check :<br>
<br>
=C2=A0 <a href=3D"https://github.com/openbmc/u-boot/wiki" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/openbmc/u-<wbr>boot/wiki</a><br>
<br>
This is where we track the ugly details and here is my tree :<br>
<br>
=C2=A0 =C2=A0<a href=3D"https://github.com/legoater/u-boot/commits/v2016.11=
-aspeed-openbmc" rel=3D"noreferrer" target=3D"_blank">https://github.com/le=
goater/u-<wbr>boot/commits/v2016.11-aspeed-<wbr>openbmc</a><br>
<br>
Patch one is the &quot;minimum&quot; we have been working on with Joel thes=
e<br>
last 6 months to :<br>
<br>
=C2=A0* make it compatible with upstream<br>
=C2=A0* extract all exoticisms<br>
=C2=A0* extract funky drivers<br>
=C2=A0* isolate ugly hacks<br>
<br>
I think we are at a point where we need to rewrite bits of lowlevel_init<br=
>
or move them later on in the code. This big asm routines does :<br>
<br>
=C2=A0* LPC patching for ast2300 (we can kill that)<br>
=C2=A0* uart init (if SDRAM calibration is done, easy we can keep)<br>
=C2=A0* SDRAM calibration (we could use static calibration values instead)<=
br>
=C2=A0* SDRAM size calculation (may be we can move that in a C part)<br>
=C2=A0* video clock setting (one reg setting)<br>
=C2=A0* JTAG master (one reg setting)<br>
=C2=A0* RMII/RGMII clock setting (one reg setting)<br>
=C2=A0* GPIO massive reset (not sure if this is useful, should ask Andrew)<=
br>
=C2=A0* SPI Calibration (I have done in C so we can move)<br></blockquote><=
div><br></div><div>Yes, I looked at it too and it does not look like any of=
 that has any business being in lowlevel_init, let alone being implemented =
in asm.</div><div><br></div><div>Did you try moving this whole function fur=
ther down the init sequence? board_early_init_f might be a good candidate. =
It might cause problems because it does not restore registers properly, but=
 should be an easy fix --</div><div>at this point we would already have sta=
ck setup for us (need to be configured via CONFIG_SYS_INIT_SP_ADDR to point=
 to the top of SRAM) and even have a basic malloc (need to be configured). =
This would make calling into C somewhat easier.=C2=A0</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt; This is also what I was thinking of doing, so we should be able to joi=
n forces on this.<br>
&gt;<br>
&gt; I talked to Simon Glass recently (he&#39;s an active contributor to ma=
inline U-Boot)<br>
&gt; and basically that&#39;s the path that he also recommended -- just get=
ting minimal amount<br>
&gt; of code in, that can just boot to a prompt. He also said that DRAM dri=
ver would have<br>
&gt; to be part of it.<br>
<br>
</span>yes. See my comments above.<br>
<span class=3D""><br>
&gt; So, the way I see it, there are two big chunks of work here:<br>
&gt;=C2=A0 1. Setting up the whole structure. This would include actually a=
dding a board, minimum<br>
&gt; amount of supporting code, debug serial console init,<br>
<br>
</span>yes. that is patch one above, in which we still need to cleanup<br>
stuff in the .S part.<br>
<span class=3D""><br>
&gt;=C2=A0 2. DDR3/DDR4 driver. This is the biggest part of what we have in=
 platform.S now. A lot<br>
&gt; of work, but relatively straightforward, just rewrite ~1.5k lines of a=
ssembly in C.<br>
<br>
</span>I am not sure this is feasible, AFAIK, you can not call C. I might<b=
r>
be wrong.<br></blockquote><div><br></div><div>You can. I tried it and it wo=
rks. We just need stack (see above). Even if moving the whole lowlevel_init=
 further down will prove too hard, we can at least call</div><div><br></div=
><div>mov sp, =3DTOP_OF_SRAM</div><div><br></div><div>at top of lowlevel_in=
it. after this you can write (and call into) pretty complicated C functions=
. This is what I&#39;ve tried in my early experiments.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt; Personally, I don&#39;t have preference on who does what, as long as w=
e don&#39;t step on each<br>
&gt; other&#39;s toes. It would probably be easier for me to take (1), beca=
use I can easily talk<br>
&gt; to two people who are in our time zone and have a lot of mainline U-Bo=
ot experience.<br>
&gt;<br>
&gt; Thoughts?<br>
<br>
</span>you could send patches on top of my tree to cleanup what ever<br>
part you want in lowlevel_init. when lowlevel_init reaches a<br>
minimum acceptable level, with a full patchset working on top<br>
of it, I think we can send for review. Then, we will work on<br>
the next details :<br>
<br>
=C2=A0* extra settings<br>
=C2=A0* spi/nor driver<br>
=C2=A0* ftgmac100 extensions for Aspeed<br>
=C2=A0* NCSI support<br>
=C2=A0* DTS support<br>
=C2=A0* etc.<br>
<br>
There is also a massive hack on the ast2500 mmu disablement in<br>
the core part of u-boot that I don&#39;t understand. So we could<br>
try to fix now or ask help when the patchset is sent.<br>
<br>
<br>
Cheers,<br>
<br>
C.<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <=
b>S</b>loyko</div></div>
</div></div>

--001a114fa738eed82105407d3fb5--
