Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lmnsGAiT"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rJsH1lKBzDqVB
 for <openbmc@lists.ozlabs.org>; Sat, 27 Apr 2019 02:09:22 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id d1so3568560edd.13
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 09:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ws9fZfcfwnBN5onE1G4mSFwv+iMr3+0ibhGtS12/lDM=;
 b=lmnsGAiTTKS0Om6pjplgiy7f36O2UnwBS8nY6KHwW6C0ONDEh6mXUy00ly5qjYYfJC
 5gHiTUNWeF9j+3svJjwo4kg3HyW6slUiE0ceakKR5dT34IC3eC8po3Xx9WX8NJX0qzQ3
 DOb4S3X9qhDj1WDiqXc8HEVnphnBrg78ZY1BdO8uIzEBQ6Me1j6YI536uyh+uymvEp63
 wl2+7G6GuBhWK+Rr6ePqfpxhUSG+q2WBxCRqOvTtx/SjeXEgVKniNTJ4s2/DSpDMoez6
 uBHVn3v0IOJ9tcG7PFDmmf2pOyc8BnZo18kNnlPTymUn94JiizrGIKoqprX3VNfuZBEe
 4Esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ws9fZfcfwnBN5onE1G4mSFwv+iMr3+0ibhGtS12/lDM=;
 b=hEc6Zn8lY42/hiEpvlnyDkUpt4yVqIe1SKEEwflFFUchgkoZTrX4tg0H27IN+lr5uc
 LMDkMN+Ba0GP3z67j7uzDk5KUmq7+jyb4ZTya3DSVTrPZSJPfnRWqc9S5G2zqpeEstpd
 d1V9//F7WFk5Kw+Ra/ysWP2ypwZ34EYlHGY3XNEpTSvvPF3XEOINJu514KmoA28nuVJ6
 1MTiprQf7v6Pj0kftZ7OdQTfX/b3fvjoV9BgQ8TzN0ORmzNLC/iOvtLwz7cHPbWHMpbQ
 VgnhNzvb6qcYxgte8eliBsNcMjW6H/XNy5g0ufiuKTBdNy/leh9ThSVK/cuRjdYLV1ka
 UyGg==
X-Gm-Message-State: APjAAAVK/ucM6oqTlrU4Thr4CfIcF5DS6JFv+Jfwd85/B5exQZRMizC1
 pQ7y+G0syxtE1JkOAsjykoaXP4gRrDvuephn9VxXAg==
X-Google-Smtp-Source: APXvYqyX4T3+EMaiVFMekGwtj7RxuVpvJjFK7ovifdE0Xn2hhvlS32JRY0NMMU0GJPEuJH9ivdmOsLtKW8fZrBXqRQg=
X-Received: by 2002:a50:9172:: with SMTP id f47mr29030707eda.233.1556294959549; 
 Fri, 26 Apr 2019 09:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxyVAx=LY+5tCUWaezZP67JKy7z3NT3SAUcKR64W8Pk_w@mail.gmail.com>
 <d4abbc06-a4ea-4cd0-95f7-b32cd388293e@www.fastmail.com>
 <CABoTLcSi0DvcqAdrd7QumCotZDAE6VvF+SGu-gtKz_ZRWvsoWg@mail.gmail.com>
 <CAO=notw+eP=xNWMk=LjB-HhsqjjEp3cpS-SjA4EsCN1g-S4GTw@mail.gmail.com>
In-Reply-To: <CAO=notw+eP=xNWMk=LjB-HhsqjjEp3cpS-SjA4EsCN1g-S4GTw@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Fri, 26 Apr 2019 11:09:02 -0500
Message-ID: <CABoTLcSw6AuBLsE3s8XGY69ioJLyvc3bUjf8mC7UEUPkBa01gA@mail.gmail.com>
Subject: Re: linux kernel compiler warnings ignored
To: Patrick Venture <venture@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000003b46780587712876"
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
X-List-Received-Date: Fri, 26 Apr 2019 16:09:24 -0000

--0000000000003b46780587712876
Content-Type: text/plain; charset="UTF-8"

Hi Patrick

I'm not sure I follow ... Is that documented somewhere or can you elaborate?

I was hoping that I could build the kernel separately (as Andrew described)
and then combine that with "something" to end up with an image similar to
"obmc-phosphor-image-${MACHINE}.static.mtd".

Or is there an even easier way without having to build and flash a new
.static.mtd?

Thanks
Oskar.

On Fri, Apr 26, 2019 at 10:45 AM Patrick Venture <venture@google.com> wrote:

> On Fri, Apr 26, 2019 at 8:25 AM Oskar Senft <osk@google.com> wrote:
> >
> > Thank you!
> >
> > Is there an "easy" way to bake the resulting kernel image into an image
> for the SPI flash chip?
> >
> > I often make kernel-only changes and usually run through the whole
> process of committing to a local repo, then running bit bake and waiting
> for all the other stuff it also does. If there was a way to just build the
> kernel and replace the one in the SPI flash image with the new one, that
> would be awesome.
>
> Oskar, if you're using static-images still, there's an image-kernel
> file output from the build process.  this is supported if you drop it
> into /run/initramfs/ and reboot similarly to image-bmc.
>
> >
> > Oskar.
> >
> > On Fri, Apr 26, 2019 at 10:15 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >>
> >>
> >>
> >> On Fri, 26 Apr 2019, at 08:01, Patrick Venture wrote:
> >> > I'm getting feedback from a patchset I sent upstream that there are
> >> > compiler warnings.  Which surprised me because my OpenBMC builds with
> >> > those patches don't complain.  I imagine therefore we have them
> >> > silenced and was curious where we silence them.
> >>
> >> How are you building the kernel?
> >>
> >> I strongly recommend you build kernels directly from the kernel source
> tree rather than using bitbake, if that's what you're doing.
> >>
> >> In the kernel source tree, do:
> >>
> >> $ export ARCH=arm
> >> $ export CROSS_COMPILE=arm-linux-gnueabi-
> >> $ make aspeed_g5_defconfig
> >> $ make W=1 -j$(nproc)
> >>
> >> This exports are from memory, ymmv.
> >>
> >> In addition to giving you more output than Greg is after, it has a much
> lower write/compile/test latency.
> >>
> >> Hope that helps,
> >>
> >> Andrew
> >>
> >> >
> >> > Patrick
> >> >
>

--0000000000003b46780587712876
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Patrick<br><div><br></div><div>I&#39;m=
 not sure I follow ... Is that documented somewhere or can you elaborate?</=
div><div><br></div><div>I was hoping that I could build the kernel separate=
ly (as Andrew described) and then combine that with &quot;something&quot; t=
o end up with an image similar to &quot;obmc-phosphor-image-${MACHINE}.stat=
ic.mtd&quot;.</div><div><br></div><div>Or is there an even easier way witho=
ut having to build and flash a new .static.mtd?</div><div><br></div><div>Th=
anks</div><div>Oskar.</div></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 26, 2019 at 10:45 AM Patrick V=
enture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, =
Apr 26, 2019 at 8:25 AM Oskar Senft &lt;<a href=3D"mailto:osk@google.com" t=
arget=3D"_blank">osk@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Thank you!<br>
&gt;<br>
&gt; Is there an &quot;easy&quot; way to bake the resulting kernel image in=
to an image for the SPI flash chip?<br>
&gt;<br>
&gt; I often make kernel-only changes and usually run through the whole pro=
cess of committing to a local repo, then running bit bake and waiting for a=
ll the other stuff it also does. If there was a way to just build the kerne=
l and replace the one in the SPI flash image with the new one, that would b=
e awesome.<br>
<br>
Oskar, if you&#39;re using static-images still, there&#39;s an image-kernel=
<br>
file output from the build process.=C2=A0 this is supported if you drop it<=
br>
into /run/initramfs/ and reboot similarly to image-bmc.<br>
<br>
&gt;<br>
&gt; Oskar.<br>
&gt;<br>
&gt; On Fri, Apr 26, 2019 at 10:15 AM Andrew Jeffery &lt;<a href=3D"mailto:=
andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Fri, 26 Apr 2019, at 08:01, Patrick Venture wrote:<br>
&gt;&gt; &gt; I&#39;m getting feedback from a patchset I sent upstream that=
 there are<br>
&gt;&gt; &gt; compiler warnings.=C2=A0 Which surprised me because my OpenBM=
C builds with<br>
&gt;&gt; &gt; those patches don&#39;t complain.=C2=A0 I imagine therefore w=
e have them<br>
&gt;&gt; &gt; silenced and was curious where we silence them.<br>
&gt;&gt;<br>
&gt;&gt; How are you building the kernel?<br>
&gt;&gt;<br>
&gt;&gt; I strongly recommend you build kernels directly from the kernel so=
urce tree rather than using bitbake, if that&#39;s what you&#39;re doing.<b=
r>
&gt;&gt;<br>
&gt;&gt; In the kernel source tree, do:<br>
&gt;&gt;<br>
&gt;&gt; $ export ARCH=3Darm<br>
&gt;&gt; $ export CROSS_COMPILE=3Darm-linux-gnueabi-<br>
&gt;&gt; $ make aspeed_g5_defconfig<br>
&gt;&gt; $ make W=3D1 -j$(nproc)<br>
&gt;&gt;<br>
&gt;&gt; This exports are from memory, ymmv.<br>
&gt;&gt;<br>
&gt;&gt; In addition to giving you more output than Greg is after, it has a=
 much lower write/compile/test latency.<br>
&gt;&gt;<br>
&gt;&gt; Hope that helps,<br>
&gt;&gt;<br>
&gt;&gt; Andrew<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Patrick<br>
&gt;&gt; &gt;<br>
</blockquote></div>

--0000000000003b46780587712876--
