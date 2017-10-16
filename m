Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22b; helo=mail-vk0-x22b.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WsVFjH+/"; 
 dkim-atps=neutral
Received: from mail-vk0-x22b.google.com (mail-vk0-x22b.google.com
 [IPv6:2607:f8b0:400c:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yFl7W74SmzDrF8
 for <openbmc@lists.ozlabs.org>; Mon, 16 Oct 2017 15:04:06 +1100 (AEDT)
Received: by mail-vk0-x22b.google.com with SMTP id 137so6893757vkk.8
 for <openbmc@lists.ozlabs.org>; Sun, 15 Oct 2017 21:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=/j9Nvk6D8MIFzJ43ocqEYvhdiENf92cYTyZtVtoCCms=;
 b=WsVFjH+/TfdfXqcNXFjau2QeNb8/QpQZdeV1sy7h0uB9hxsIKUdOO3ExG+bSe8FkZb
 QPTOtYqA+zezddPjreF2yV1JCyhBwnOPofzuqVghoVm3a10UdxNP2ebyRhOjezBrkjL0
 W5+oVuKGJQMl6wdr7CFR31rAExNR2tfbHTqaG1lDRIuB+C/jgABv+uQ5SP9gXnBk/m8x
 B9TZ8ydhWGbTrOxooTPlUGO8B6PiMKwIQRUT49V+2pTsezOW6cP8+bqb8uwp3RL3R6J5
 EKzOLA07ukPkr61iCDkppR8Tvsr9Md9BInK/5wwo/R77UC2ki4EAfCpGXMoTA2SnH3il
 9//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=/j9Nvk6D8MIFzJ43ocqEYvhdiENf92cYTyZtVtoCCms=;
 b=XU8CDPcX4OKvL7w4IY+Pc9OWA0a4QFUlncoVT7nl2U4eHjQ6UjNBngpehjPF3oo/uS
 mTDFdi+jPnLQ5U6zmsKdqhhqUY0fmZdBgBbriSVzhk45vDBd5clLD+NIPwWimZkuH6v3
 4Yd3Fx+ZQ0kFrLA2hFRo6yATjTCg0SQjjScPcHMCr5SHRJi8GJcia1312JK6Xxv/Drcy
 vEa3XXiL8pNeSdlW37wRP9CLqi6dgBw59ZYrV0eB3QyPgSCQvoM+CvrBI1X0vRF6RWPx
 PeP9ShllRShhCYk1wp3sH+5JCwQwwMv03Ck/XPcE44bSJXls7+WZ/HFgpUgF+As00hNc
 bgmg==
X-Gm-Message-State: AMCzsaWIrHevCh9VkbAnunnKp/+8XQcxEbBKeszZeTyRbpbOzkpWeR92
 VlQIKapQnRP80/lF5NiSSfKKJS+ZrT+nEdvRFiFbHw==
X-Google-Smtp-Source: ABhQp+TkEPG1JVsnx0Ase8ISwg04kLI6wKPnIz+P/jIM0s3LTwPe7ob525UFp/xRLxnyE/zBBTQLGUYstDqKFuITQzg=
X-Received: by 10.31.76.129 with SMTP id z123mr4814688vka.158.1508126643804;
 Sun, 15 Oct 2017 21:04:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.70.4 with HTTP; Sun, 15 Oct 2017 21:04:03 -0700 (PDT)
In-Reply-To: <CABV8kRx3PVrqLGZ9=V9znSGvwo+rjv9WS8J1dxMTCvBZrvsm0w@mail.gmail.com>
References: <CABV8kRx3PVrqLGZ9=V9znSGvwo+rjv9WS8J1dxMTCvBZrvsm0w@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Sun, 15 Oct 2017 21:04:03 -0700
Message-ID: <CAPLgG=nN+33sTzf6GrZLcxKMN4KSxDwnyv2hW1Xp_k39gqHr4A@mail.gmail.com>
Subject: Re: OpenBMC on Supermicro X11SSH-F
To: Keno Fischer <keno@juliacomputing.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114dd13ee1d19c055ba2186c"
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
X-List-Received-Date: Mon, 16 Oct 2017 04:04:08 -0000

--001a114dd13ee1d19c055ba2186c
Content-Type: text/plain; charset="UTF-8"

Cool!  Comment inline.

On Sun, Oct 15, 2017 at 3:33 PM, Keno Fischer <keno@juliacomputing.com>
wrote:

> Hi folks,
>
> as I mentioned on IRC I've been working on porting OpenBMC to the
> Supermicro
> X11SSH-F board's BMC (an AST2400). It's not complete (lacking most
> sensors, but
> does have leds and host power control), but there's enough there that I'd
> like to
> kick of the discussion on how to incorporate this.
>
> I should note that I have no affiliation with Supermicro and no access to
> the datasheet
> or schematic. What I know about the board was derived by poking the board
> with
> an oscilloscope.
>
>
Glad there are people out there like you who are willing to take the time
to map the signals out.


> The patch sets are here (just so people can take a look, some of them need
> a bit
> of cleanup before I submit them for review):
> linux: https://github.com/Keno/openbmc-linux
> qemu: https://github.com/Keno/openbmc-qemu
> openbmc: https://github.com/Keno/openbmc
>
> With that a couple of questions:
> 1. Are you interested in having support for this board in tree?
>

I certainly am.  It's an easily obtainable off-the-shelf board.


> 2. If so, am i correct that patches
>    a. to the openbmc linux tree should be emailed here
>

Yes.  Looks like you only needed a DTS which is good news.


>    b. to openbmc itself should be submitted via gerrit?
>

Correct.


>    c. to qemu should be emailed upstream with the appropriate cc?
>

Yes

>
> I'd like to thank all the people on IRC who've helped me get this up and
> running.
> I also very much appreciate all the work you've been doing in developing
> this in
> the open and upstreaming your work. I'm hoping my work on this port can
> help
> amplify the impact this work by making openbmc more widely available.
>
> Keno
>

--001a114dd13ee1d19c055ba2186c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Cool!=C2=A0 Comment inline.<div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Sun, Oct 15, 2017 at 3:33 PM, Keno Fischer <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:keno@juliacomputing.com" target=3D"_b=
lank">keno@juliacomputing.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr">Hi folks,<div><br></div><div>as I mentioned on =
IRC I&#39;ve been working on porting OpenBMC to the Supermicro</div><div>X1=
1SSH-F board&#39;s BMC (an AST2400). It&#39;s not complete (lacking most se=
nsors, but</div><div>does have leds and host power control), but there&#39;=
s enough there that I&#39;d like to</div><div>kick of the discussion on how=
 to incorporate this.</div><div><br></div><div>I should note that I have no=
 affiliation with Supermicro and no access to the datasheet</div><div>or sc=
hematic. What I know about the board was derived by poking the board with</=
div><div>an oscilloscope.</div><div><br></div></div></blockquote><div><br><=
/div><div>Glad there are people out there like you who are willing to take =
the time to map the signals out.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr"><div></div><div>The patch sets are here (just s=
o people can take a look, some of them need a bit</div><div>of cleanup befo=
re I submit them for review):</div><div>linux:=C2=A0<a href=3D"https://gith=
ub.com/Keno/openbmc-linux" target=3D"_blank">https://github.com/<wbr>Keno/o=
penbmc-linux</a></div><div>qemu: <a href=3D"https://github.com/Keno/openbmc=
-qemu" target=3D"_blank">https://github.com/Keno/<wbr>openbmc-qemu</a></div=
><div>openbmc: <a href=3D"https://github.com/Keno/openbmc" target=3D"_blank=
">https://github.com/Keno/<wbr>openbmc</a></div><div><br></div><div>With th=
at a couple of questions:</div><div>1. Are you interested in having support=
 for this board in tree?</div></div></blockquote><div><br></div><div>I cert=
ainly am.=C2=A0 It&#39;s an easily obtainable off-the-shelf board.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>2. If so=
, am i correct that patches</div><div>=C2=A0 =C2=A0a. to the openbmc linux =
tree should be emailed here</div></div></blockquote><div><br></div><div>Yes=
.=C2=A0 Looks like you only needed a DTS which is good news.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>=C2=A0 =C2=A0=
b. to openbmc itself should be submitted via gerrit?</div></div></blockquot=
e><div><br></div><div>Correct.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr"><div>=C2=A0 =C2=A0c. to qemu should be emailed up=
stream with the appropriate cc?</div></div></blockquote><div><br></div><div=
>Yes=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><br></=
div><div>I&#39;d like to thank all the people on IRC who&#39;ve helped me g=
et this up and running.</div><div>I also very much appreciate all the work =
you&#39;ve been doing in developing this in</div><div>the open and upstream=
ing your work. I&#39;m hoping my work on this port can help</div><div>ampli=
fy the impact this work by making openbmc more widely available.</div><span=
 class=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div>Keno</div></f=
ont></span></div>
</blockquote></div><br></div></div>

--001a114dd13ee1d19c055ba2186c--
