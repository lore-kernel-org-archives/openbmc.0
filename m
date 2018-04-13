Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::22d; helo=mail-it0-x22d.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="f5r2ZeCX"; 
 dkim-atps=neutral
Received: from mail-it0-x22d.google.com (mail-it0-x22d.google.com
 [IPv6:2607:f8b0:4001:c0b::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40N54H6VLkzF1gK
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 03:53:47 +1000 (AEST)
Received: by mail-it0-x22d.google.com with SMTP id m134-v6so4221050itb.3
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 10:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=drWB41euXOxqHWSoJhSBMB0lxdfb9IzZUEkmfcxBVKM=;
 b=f5r2ZeCXH2Qk1sOd7A3zFW9AZBQpOOiY5/Y2XgW/sQHa9n0+SOFpba2aY8sa5hPhZe
 htCWaZIC62pxXiP/vK6EBz0EFxuI9krlCEtxCjcfDDoLYLruH4jrlmDpYk4Tjdv1GHMy
 LrB25bAEo1/hlEpJroRMd2lO62OL7vaLSos1UXcMgSkMgJdeP9GyZ37JzSYkT8igmylD
 teUgenAbNnQz6ipl/JTtVt836RETxAoCZsoR0kBJhG8+UcFG5AAL3lRF42D13f1Rv+xG
 8pSXSwsCgVigpExLp8WX1yHCL86i5f/zMH1jT+TmEogEv1esGWucrtQdP8K5m0kc42KU
 PDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=drWB41euXOxqHWSoJhSBMB0lxdfb9IzZUEkmfcxBVKM=;
 b=bkdd9EXpPIySoOYo/jXo9KWofga1jUvxsn5qWZhfsd7PYJXzuRIMBQlSKwIfDAKLMZ
 XmRxXuuKuElnoQAuQ+hxTWdiod9godYUmEdvLI+FU9BDGjfqlsr1IMJhJm45K2uAVsms
 TkPYWSXPzuG2agHf7T9C9TSyplT6QL2nljZR/7xv5/yIFoijymMGPN1FPe8y5ljaHfHt
 FOUrBmmRGZ3AnAjajYjqzrAlpPNuptQ+XxwyqLj443lJaL9+yUMesp3tFujGFpstxrQX
 tJ9BgYalZgsvp8KDulMekB5jqT95MCWfJX0uH1i7WcCXi9ls5+IuuVRm0spH9oJI2wOC
 cpJQ==
X-Gm-Message-State: ALQs6tBAO0DD/wyPu4DWxvDSqoqaa8m4eX3KOcTGbMtjA+8oxcU0lTio
 vfyZ5n9iHp4l9ASrI8ewbfa9UlhQXgpdNUamsD5xNQ==
X-Google-Smtp-Source: AIpwx48REwvh9EzxCGk3+hkDDNqhZucggcKj0gN4yHCrfRJd/kVYAbegepGqfLlJBH4j2kPfaMflZJATe7fodDF7L6Y=
X-Received: by 2002:a24:7613:: with SMTP id
 z19-v6mr6303784itb.153.1523642025266; 
 Fri, 13 Apr 2018 10:53:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.181.134 with HTTP; Fri, 13 Apr 2018 10:53:04 -0700 (PDT)
In-Reply-To: <2D4C2F3F-7B13-48C4-9E4C-5733835552F9@gmail.com>
References: <6BB03E30-7768-4455-BB7D-6B1C8AECBDE4@gmail.com>
 <1523367363.1598830.1332941912.403D2457@webmail.messagingengine.com>
 <2D4C2F3F-7B13-48C4-9E4C-5733835552F9@gmail.com>
From: Nancy Yuen <yuenn@google.com>
Date: Fri, 13 Apr 2018 10:53:04 -0700
Message-ID: <CADfYTpG+ceGDtcvW7zVkmVAMehcnchrOpJcJtUjFWF7P=-W0cw@mail.gmail.com>
Subject: Re: How to power on Intel x86 based CPUs
To: Brad Chou <chou.brad@gmail.com>, Patrick Venture <venture@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Ed Tanous <ed.tanous@intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000aef5330569be8d3f"
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
X-List-Received-Date: Fri, 13 Apr 2018 17:53:52 -0000

--000000000000aef5330569be8d3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patrick Venture uses the q71l and may be able to answer #2.  I suspect it
was removed simply b/c the system we were using it on didn't use it.

----------
Nancy

On Fri, Apr 13, 2018 at 2:43 AM, Brad Chou <chou.brad@gmail.com> wrote:

> Hi,
> Actually I am using the meta-s2600wf as my TEMPLATECONF.
> Now switch to Q71L but found some problems :
>
> 1. I can not send the same REST command to power up the host. It seems th=
e
> xyz/openbmc_project/state/host0/attr/RequestedHostTransition
> is gone. I even can=E2=80=99t see any attributes related to
> xyz/openbmc_project/state.
>
> 2. I found in quanta-q71l.conf, it remove the obmc-host-state-mgmt, this
> may be needed when using REST to power on host. Why q71L remove it ?  Is =
it
> because of not compatible with x86 system ?
>
> 3. Suppose the REST is not used by Q71L, how can I power it up from LAN ?
>
> Thanks.
>
>
> On Apr 10, 2018, at 21:36, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hi Brad,
>
> On Tue, 10 Apr 2018, at 19:35, Brad Chou wrote:
>
> Hi,
> I am going to power on my OEM server board with two Intel x86 CPUs. The
> BMC chip is ASPEED 2500.
>
> By the Intel data sheets, I just need to control a power on GPIO to
> emulate power button behavior.
> The problems are, when I send Host State Control commands as mentioned
> in docs/host-management.md, the journal log shows a lot of systemctl
> errors.
>
> Looks like it is going to start the OpenPower related host control
> services, which only applies to PowerPC system.
> I try to modify GPIO_CONFIGS appears in skeleton recipe to match my
> board, but I still got some other errors says pflash stuffs.
>
>
> It sounds like you're building an OpenPOWER-based BMC image - this is
> controlled by how you set the TEMPLATECONF environment variable when
> sourcing the `openbmc-env` file to build (at a guess I'd say you're
> building for Palmetto, as it's used throughout the examples in the docs
> repo).
>
> We do have support for a couple of x86 machines in the tree - your best
> bet is probably the Quanta 71L machine maintained by Patrick Venture:
>
> https://github.com/openbmc/openbmc/tree/master/meta-
> openbmc-machines/meta-x86/meta-quanta/meta-q71l
>
> As an aside, if you're experimenting and switching between target
> machines, it's probably a good idea to blow away your build/conf director=
y
> to make sure things get set up correctly when you next set TEMPLATECONF a=
nd
> source openbmc-env.
>
>
> Because there is no documents to tell me how to customize the openbmc to
> fit on x86 CPUs, so I am not sure the GPIO_CONFIGS in skeleton is the
> right way or not.
>
>
> Yeah, there's not a wealth of documentation on bringing up a new machine.
> It would be great if you could document your experience once you get ther=
e
> :)
>
> Hope that helps in some way,
>
> Andrew
>
>
>

--000000000000aef5330569be8d3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Patrick Venture uses the q71l and may be able to answer #2=
.=C2=A0 I suspect it was removed simply b/c the system we were using it on =
didn&#39;t use it.<br></div><div class=3D"gmail_extra"><br clear=3D"all"><d=
iv><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">------=
----<br>Nancy</div></div>
<br><div class=3D"gmail_quote">On Fri, Apr 13, 2018 at 2:43 AM, Brad Chou <=
span dir=3D"ltr">&lt;<a href=3D"mailto:chou.brad@gmail.com" target=3D"_blan=
k">chou.brad@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div style=3D"word-wrap:break-word;line-break:after-white-space">Hi,<di=
v><div>Actually I am using the meta-s2600wf as my TEMPLATECONF.</div><div>N=
ow switch to Q71L but found some problems :</div><div><br></div><div>1. I c=
an not send the same REST command to power up the host. It seems the=C2=A0<=
span style=3D"font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quo=
t;,Menlo,Courier,monospace;color:rgb(36,41,46);font-size:13.600000381469727=
px">xyz/openbmc_project/state/<wbr>host0/attr/<wbr>RequestedHostTransition=
=C2=A0</span></div><div>is gone. I even can=E2=80=99t see any attributes re=
lated to=C2=A0<span style=3D"color:rgb(36,41,46);font-family:SFMono-Regular=
,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;font-size:13.=
600000381469727px">xyz/openbmc_project/state.</span></div><div><span style=
=3D"color:rgb(36,41,46);font-family:SFMono-Regular,Consolas,&quot;Liberatio=
n Mono&quot;,Menlo,Courier,monospace;font-size:13.600000381469727px"><br></=
span></div><div><font color=3D"#24292e" face=3D"SFMono-Regular, Consolas, L=
iberation Mono, Menlo, Courier, monospace" size=3D"2"><span>2. I found in=
=C2=A0quanta-q71l.conf, it remove the obmc-host-state-mgmt, this may be nee=
ded when using REST to power on host. Why q71L remove it ?=C2=A0 Is it beca=
use of not compatible with x86 system ?</span></font></div><div><font color=
=3D"#24292e" face=3D"SFMono-Regular, Consolas, Liberation Mono, Menlo, Cour=
ier, monospace" size=3D"2"><span><br></span></font></div><div><font color=
=3D"#24292e" face=3D"SFMono-Regular, Consolas, Liberation Mono, Menlo, Cour=
ier, monospace" size=3D"2"><span>3. Suppose the REST is not used by Q71L, h=
ow can I power it up from LAN ?</span></font></div><div><br></div><div><fon=
t color=3D"#24292e" face=3D"SFMono-Regular, Consolas, Liberation Mono, Menl=
o, Courier, monospace" size=3D"2"><span>Thanks.</span></font></div><div><di=
v class=3D"h5"><div><font color=3D"#24292e" face=3D"SFMono-Regular, Consola=
s, Liberation Mono, Menlo, Courier, monospace" size=3D"2"><span><br></span>=
</font></div><div><div><br><blockquote type=3D"cite"><div>On Apr 10, 2018, =
at 21:36, Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"_=
blank">andrew@aj.id.au</a>&gt; wrote:</div><br class=3D"m_45648529384667235=
87Apple-interchange-newline"><div><div>Hi Brad,<br><br>On Tue, 10 Apr 2018,=
 at 19:35, Brad Chou wrote:<br><blockquote type=3D"cite">Hi,<br>I am going =
to power on my OEM server board with two Intel x86 CPUs. The <br>BMC chip i=
s ASPEED 2500.<br><br>By the Intel data sheets, I just need to control a po=
wer on GPIO to <br>emulate power button behavior.<br>The problems are, when=
 I send Host State Control commands as mentioned <br>in docs/host-managemen=
t.md, the journal log shows a lot of systemctl <br>errors.<br><br>Looks lik=
e it is going to start the OpenPower related host control <br>services, whi=
ch only applies to PowerPC system.<br>I try to modify GPIO_CONFIGS appears =
in skeleton recipe to match my <br>board, but I still got some other errors=
 says pflash stuffs.<br></blockquote><br>It sounds like you&#39;re building=
 an OpenPOWER-based BMC image - this is controlled by how you set the TEMPL=
ATECONF environment variable when sourcing the `openbmc-env` file to build =
(at a guess I&#39;d say you&#39;re building for Palmetto, as it&#39;s used =
throughout the examples in the docs repo).<br><br>We do have support for a =
couple of x86 machines in the tree - your best bet is probably the Quanta 7=
1L machine maintained by Patrick Venture:<br><br><a href=3D"https://github.=
com/openbmc/openbmc/tree/master/meta-openbmc-machines/meta-x86/meta-quanta/=
meta-q71l" target=3D"_blank">https://github.com/openbmc/<wbr>openbmc/tree/m=
aster/meta-<wbr>openbmc-machines/meta-x86/<wbr>meta-quanta/meta-q71l</a><br=
><br>As an aside, if you&#39;re experimenting and switching between target =
machines, it&#39;s probably a good idea to blow away your build/conf direct=
ory to make sure things get set up correctly when you next set TEMPLATECONF=
 and source openbmc-env.<br><br><blockquote type=3D"cite"><br>Because there=
 is no documents to tell me how to customize the openbmc to <br>fit on x86 =
CPUs, so I am not sure the GPIO_CONFIGS in skeleton is the <br>right way or=
 not.<br></blockquote><br>Yeah, there&#39;s not a wealth of documentation o=
n bringing up a new machine. It would be great if you could document your e=
xperience once you get there :)<br><br>Hope that helps in some way,<br><br>=
Andrew<br></div></div></blockquote></div><br></div></div></div></div></div>=
</blockquote></div><br></div>

--000000000000aef5330569be8d3f--
