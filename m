Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HZ6VkAdx"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rHtm0vbtzDqJB
 for <openbmc@lists.ozlabs.org>; Sat, 27 Apr 2019 01:25:29 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id i13so3464929edf.11
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 08:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lpNC6v2JCzwDIrHrBju2qsKWIm7JPjgyeSniCwt4+XA=;
 b=HZ6VkAdx/5Ib7eUJuUltyYOZLYVgbRwHJ229aw4EVL0JjSDW06C6JQr3VO0wPuPWir
 ray3GmRq8ElPzNmb6M8P+C0StGh46YmJUxbJsxEwWBnbC/9bfOHxwRwpymGHm6c+mURD
 KAE29tbBC1o4RI3oiH4XeN3MMYA55XBJ6JzpGaOORhi9rYeP2204sDVW7JPUeoAZpBOl
 m8yGW7jUwW9PehP7OY4ggaed3OJxQo/GY6Nx7RHgjghmMPb5TCAdPTzHkKVKR+3I9Yeq
 THfvXclCxARMrIdxfG4FRRqaGT58RxfHoSnlGcO8rdB7XzMem79aapQnzwxPmcj/X1Dh
 dFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lpNC6v2JCzwDIrHrBju2qsKWIm7JPjgyeSniCwt4+XA=;
 b=eDfuz0pxJkfKfX0TJHLDpiD1X+0GsVQm85ZLffsBSrPkdc2UoVdQGz+OHRvffMGJz/
 0cJvs4lGwjewewS0JPZJ+3JcKLdOZfWWYkHorunsj1/XF9oLCE3AmQO42raQHNMpiJS+
 LAe+UqTJJ2zYW5S2nFYDs4RWtfWBNMEn7mvfVZnn/MEzR7AfEP2TJb6Km6/LoHUWOsvD
 +s1uh1k6bZ/JYvThc9Q/Pvbdngstc7h4WQGRXFeghjTpIpgpVq9/AAIs7JDSaQ3an8m+
 Fxa7EBH2GGvAkxMVKsIQPEIX7y43C78mVlPgzoviKytC+8lRoN/jKoseqRugSaebhyWG
 SaEA==
X-Gm-Message-State: APjAAAXNS9OSk4mmZSDcUu1b29UunyXzGdVFfhKvfI4w5x0LWd2OxrHd
 PWsfle8NU0jil5y0aCEPUVW8BoWe3IircW1+YLnogg==
X-Google-Smtp-Source: APXvYqxU+SN8MI4L4tU6gOBv4+OYxB/HQSBe/UhlwAQ4stMSuYgT+d6a5kj7tif/aokxixpa5py06NHs1lEp85K4vIU=
X-Received: by 2002:a50:913d:: with SMTP id e58mr5000456eda.107.1556292324636; 
 Fri, 26 Apr 2019 08:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxyVAx=LY+5tCUWaezZP67JKy7z3NT3SAUcKR64W8Pk_w@mail.gmail.com>
 <d4abbc06-a4ea-4cd0-95f7-b32cd388293e@www.fastmail.com>
In-Reply-To: <d4abbc06-a4ea-4cd0-95f7-b32cd388293e@www.fastmail.com>
From: Oskar Senft <osk@google.com>
Date: Fri, 26 Apr 2019 10:25:08 -0500
Message-ID: <CABoTLcSi0DvcqAdrd7QumCotZDAE6VvF+SGu-gtKz_ZRWvsoWg@mail.gmail.com>
Subject: Re: linux kernel compiler warnings ignored
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000002dbada0587708b3d"
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
X-List-Received-Date: Fri, 26 Apr 2019 15:25:37 -0000

--0000000000002dbada0587708b3d
Content-Type: text/plain; charset="UTF-8"

Thank you!

Is there an "easy" way to bake the resulting kernel image into an image for
the SPI flash chip?

I often make kernel-only changes and usually run through the whole process
of committing to a local repo, then running bit bake and waiting for all
the other stuff it also does. If there was a way to just build the kernel
and replace the one in the SPI flash image with the new one, that would be
awesome.

Oskar.

On Fri, Apr 26, 2019 at 10:15 AM Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Fri, 26 Apr 2019, at 08:01, Patrick Venture wrote:
> > I'm getting feedback from a patchset I sent upstream that there are
> > compiler warnings.  Which surprised me because my OpenBMC builds with
> > those patches don't complain.  I imagine therefore we have them
> > silenced and was curious where we silence them.
>
> How are you building the kernel?
>
> I strongly recommend you build kernels directly from the kernel source
> tree rather than using bitbake, if that's what you're doing.
>
> In the kernel source tree, do:
>
> $ export ARCH=arm
> $ export CROSS_COMPILE=arm-linux-gnueabi-
> $ make aspeed_g5_defconfig
> $ make W=1 -j$(nproc)
>
> This exports are from memory, ymmv.
>
> In addition to giving you more output than Greg is after, it has a much
> lower write/compile/test latency.
>
> Hope that helps,
>
> Andrew
>
> >
> > Patrick
> >
>

--0000000000002dbada0587708b3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you!<div><br></div><div>Is there an &quot;easy&quot;=
 way to bake the resulting kernel image into an image for the SPI flash chi=
p?<div><br></div><div>I often make kernel-only changes and usually run thro=
ugh the whole process of committing to a local repo, then running bit bake =
and waiting for all the other stuff it also does. If there was a way to jus=
t build the kernel and replace the one in the SPI flash image with the new =
one, that would be awesome.<br><div><br></div><div>Oskar.</div></div></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Fri, Apr 26, 2019 at 10:15 AM Andrew Jeffery &lt;<a href=3D"mailto:andre=
w@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><br>
<br>
On Fri, 26 Apr 2019, at 08:01, Patrick Venture wrote:<br>
&gt; I&#39;m getting feedback from a patchset I sent upstream that there ar=
e<br>
&gt; compiler warnings.=C2=A0 Which surprised me because my OpenBMC builds =
with<br>
&gt; those patches don&#39;t complain.=C2=A0 I imagine therefore we have th=
em<br>
&gt; silenced and was curious where we silence them.<br>
<br>
How are you building the kernel?<br>
<br>
I strongly recommend you build kernels directly from the kernel source tree=
 rather than using bitbake, if that&#39;s what you&#39;re doing.<br>
<br>
In the kernel source tree, do:<br>
<br>
$ export ARCH=3Darm<br>
$ export CROSS_COMPILE=3Darm-linux-gnueabi-<br>
$ make aspeed_g5_defconfig<br>
$ make W=3D1 -j$(nproc)<br>
<br>
This exports are from memory, ymmv.<br>
<br>
In addition to giving you more output than Greg is after, it has a much low=
er write/compile/test latency.<br>
<br>
Hope that helps,<br>
<br>
Andrew<br>
<br>
&gt; <br>
&gt; Patrick<br>
&gt;<br>
</blockquote></div>

--0000000000002dbada0587708b3d--
