Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AN+hf5UF"; 
 dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 443SK54hLZzDqKD
 for <openbmc@lists.ozlabs.org>; Tue, 19 Feb 2019 15:23:21 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id i20so32153008otl.0
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 20:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aC3ymaghnWxq2Y1CP6TamrqvoN7x4kqkJ7mMvFqnaEI=;
 b=AN+hf5UFjuVQuUFNUuJ706mpv3IeCabaqIjZff3kDnZsoVNVkmnNDQcMGwHYrF5Gqk
 glKVeD3u2TYOnng4Agm7zwkO6OuNkkP6Yb2q45fIK8R8jarhaMDEvqIpyiajG1xSqos3
 sZlWqCtBeVP1j+pBBINYCGcAAO+uYe4QK7TgrJpaf4MIII1CXSiqq59+hzpDLfDqmJiG
 +un0cCb84yqh6r7aEZDgLaA+CQKeGi8dNkcJgAyxSjDafze3FieAZ2F7C36s/ikaFlyO
 CAxTBs1Zbzq8WtepGuFzzaneqGoUjhOuXU0hsJ6euwKVuhM7NBZUd0OrxPh+ZddVB5aF
 0ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aC3ymaghnWxq2Y1CP6TamrqvoN7x4kqkJ7mMvFqnaEI=;
 b=BMVxk8HGbZJ7r/0sifa8KcQoG5V/VgzhRCAVstNhalx4WTY+cnyLILpOFA68EiqcCo
 7NvyIPejnUDjK0DWQ4c9CU3xoiiXB/6h7e5nemTIif9HF358kqt8GGtRsEpj+2YQIYBi
 q64ezFXVUpPe1qZZX1YXhnM4B1C90TE2KCj7uuUe9GvTKvwu+QTrkb3qBENdEDn0zPT7
 M8wutrUpu+kmxn5tiB2tFuIbnrSIwjhtER8WaT0wj0BmfpzzIx2IaXH64z8PdAyMzOya
 D7vQVidKdvmWGtOXgdJZ5AedADYnjCdxZFTrUDwjqDiWSIJxeAiaAsND61FZNHHyMPHJ
 Psfg==
X-Gm-Message-State: AHQUAuYCd1/umR4ImnHHRdqJxL8h4c/FZQanLOr+lmsT3ZUfNWJn1Gkg
 dlvZotpO/PuuLOClYWVpbm9OyvsrVzRydebbomfshGWy
X-Google-Smtp-Source: AHgI3IZj5r4anvZ5PwfPXjJPBNI7uEJcti/AOKBwDdcqK77PS4Qbbumw1EPTprMSOUfAT3LmE5KSCaFbYaLsW7CwqzA=
X-Received: by 2002:aca:61c4:: with SMTP id v187mr1278811oib.122.1550550199101; 
 Mon, 18 Feb 2019 20:23:19 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLGC==CvoJLBV+jUnp=RiFph7wxa0q2o6ZfhrqaNMZtBCQ@mail.gmail.com>
 <1550097803.1007491.1657535928.051F6319@webmail.messagingengine.com>
 <CAE33tLG24aYDx0a7pbNCs8KU=ANT161JvT9c_iPpCQ44Lc5Fbg@mail.gmail.com>
 <1550186888.4139421.1658270160.5405B961@webmail.messagingengine.com>
 <CAE33tLHdxOpH8NsPv6xRLdymAisBsy0smwySkc=V=E6nz28fKQ@mail.gmail.com>
 <1550457918.2790490.1659886984.2F457972@webmail.messagingengine.com>
 <CAE33tLH4_f1tYAektG2GLUh47EFEYybwgcTKi1KP3UV3QuZPtQ@mail.gmail.com>
 <e44dbb70-8630-4bc0-9809-f24b6e9a3815@www.fastmail.com>
In-Reply-To: <e44dbb70-8630-4bc0-9809-f24b6e9a3815@www.fastmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Tue, 19 Feb 2019 09:52:32 +0530
Message-ID: <CAE33tLEdEsdZ+0NXvAuVeWP3145MvL5w=VZQp-_obQPBLSpDGw@mail.gmail.com>
Subject: Re: Unable to read or write from system SPI flash memory.
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d2eb920582379904"
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
X-List-Received-Date: Tue, 19 Feb 2019 04:23:22 -0000

--000000000000d2eb920582379904
Content-Type: text/plain; charset="UTF-8"

I flashed OpenBMC image to system flash using pflash. After power-off, I
tried to boot the BMC (Aspeed AST-2500) from the system flash. For that I
used the command *bootm <system flash address>* in u-boot prompt. That
gives error "no image found".

On Tue, Feb 19, 2019 at 5:33 AM Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Mon, 18 Feb 2019, at 15:04, AKASH G J wrote:
> > I wrote a bootable version of OpenBMC Linux image in system SPI flash.
> >
> > I tried to boot it before power-off, it was successfully booted. Then I
> > tried to boot the same, that time it was unsuccessful.
>
> But you just said you flashed an OpenBMC image to the system flash.
> That's never going to work. You need the host firmware on the host
> flash to successfully boot the host, and OpenBMC is not the host
> firmware.
>
> Am I understanding you correctly?
>
> >
> > Do I need to make any change in the Linux device tree for resolving this
> issue?
> >
> > On Mon, Feb 18, 2019 at 8:15 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > >
> > >  On Fri, 15 Feb 2019, at 16:03, AKASH G J wrote:
> > >  > I just powered off the entire board. After that the data is not
> present in
> > >  > the SPI1 flash. But before power-off it was there.
> > >
> > >  How were you verifying the data was there before the poweroff?
> > >
> > >  >
> > >  > We are using OpenBMC Linux version 4.18.7 and pflash v6.1
> > >
> > >  Thanks for the versions. Should be handy as we dig deeper.
> > >
> >
>

--000000000000d2eb920582379904
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I flashed OpenBMC image to system flash using pflash.=
 After power-off, I tried to boot the BMC (Aspeed AST-2500) from the system=
 flash. For that I used the command <i>bootm &lt;system flash address&gt;</=
i> in u-boot prompt. That gives error &quot;no image found&quot;.<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Feb 19, 2019 at 5:33 AM Andrew Jeffery &lt;<a href=3D"mailto:andrew=
@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><br>
<br>
On Mon, 18 Feb 2019, at 15:04, AKASH G J wrote:<br>
&gt; I wrote a bootable version of OpenBMC Linux image in system SPI flash.=
 <br>
&gt; <br>
&gt; I tried to boot it before power-off, it was successfully booted. Then =
I <br>
&gt; tried to boot the same, that time it was unsuccessful.<br>
<br>
But you just said you flashed an OpenBMC image to the system flash. <br>
That&#39;s never going to work. You need the host firmware on the host<br>
flash to successfully boot the host, and OpenBMC is not the host<br>
firmware.<br>
<br>
Am I understanding you correctly?<br>
<br>
&gt; <br>
&gt; Do I need to make any change in the Linux device tree for resolving th=
is issue?<br>
&gt; <br>
&gt; On Mon, Feb 18, 2019 at 8:15 AM Andrew Jeffery &lt;<a href=3D"mailto:a=
ndrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 On Fri, 15 Feb 2019, at 16:03, AKASH G J wrote:<br>
&gt; &gt;=C2=A0 &gt; I just powered off the entire board. After that the da=
ta is not present in<br>
&gt; &gt;=C2=A0 &gt; the SPI1 flash. But before power-off it was there.<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 How were you verifying the data was there before the powero=
ff?<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 &gt; <br>
&gt; &gt;=C2=A0 &gt; We are using OpenBMC Linux version 4.18.7 and pflash v=
6.1<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 Thanks for the versions. Should be handy as we dig deeper.<=
br>
&gt; &gt;=C2=A0 <br>
&gt;<br>
</blockquote></div>

--000000000000d2eb920582379904--
