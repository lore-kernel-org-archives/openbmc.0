Return-Path: <raltherr@google.com>
Received: from mail-it0-x232.google.com (mail-it0-x232.google.com
 [IPv6:2607:f8b0:4001:c0b::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rb7rT1wNHzDq60
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 03:34:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=XAnYezD6; 
 dkim-atps=neutral
Received: by mail-it0-x232.google.com with SMTP id a5so132592676ita.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 10:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Ta/vPU4Qdq6EzcBRiBTs0aRJFPjyyrVyMuDujRvc7ZM=;
 b=XAnYezD6SwqLiUkBAKbIKuoa7lrzaF+EAFs+41jhbX2VLq+2ttKkTwWBL7AQzBaK0S
 pfnNkopR4o3IQyftRNcFdT4P62z7Kab8SaoIubzOFKhI9ZJeHT0xyBmpq4pf8sAS5lF6
 fF/ulGBp9nwKOgck4l6I05QNhBwyWaQFUW/F3ZqW0wleT1b1mYCw1Qn1iag/H30+/fg6
 UrNMqCkKtTc7JUAkbaosS413pGJtdtf3ihl55vuumOZECllwj+juAHRg6z8P9+DFJ1se
 Zb1N4ScHOniHJK5yu/2PrRwyF7W8N9/r92CWuCuxtEZUSsRCz9kn0lQLkG29qG0WIJDL
 dSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Ta/vPU4Qdq6EzcBRiBTs0aRJFPjyyrVyMuDujRvc7ZM=;
 b=Xiq8zjiMyxaIhqlIzkD54zmBSJzxHrZ9FT2EfSF4DjjZWIhTuJ4mWsZ8J4t+usOkce
 5QviCzKm+thJG5arx4Crcd/Ntb/VL+aIg+uJcCjPLLL4YgsqYlb67+1zKle6U+fp3DbN
 goycT20XAKXJTZxOhAKqkX3iIMf3/SEP3h2bKHC5dTYIrsSPTf5evCBaDdOOBcRsf19v
 p736GBHHca2YtlYMOe68Tgsv4+3Anfqe5NAgEiidxkXGISsNHzKc86cnDwOShT4x+C98
 Xm5C/wdjqweqysUcwM+PEjYwyXeDvHUnnpknkgC9sIpet8PsJU7tCu2iT/3Hqs0eie7W
 kxOg==
X-Gm-Message-State: ALyK8tLYoq1dqQmLA/T+pe8XEfx0iO0SNevmYUZLrgHLOVjHawFmPqb1XQXdNwYZE8X+J/9QW9PPXIFYBXUfAWLq
X-Received: by 10.36.217.68 with SMTP id p65mr2142339itg.38.1466703286776;
 Thu, 23 Jun 2016 10:34:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.101.202 with HTTP; Thu, 23 Jun 2016 10:34:46 -0700 (PDT)
In-Reply-To: <5763902B.9050106@kaod.org>
References: <CACPK8Xft-LvtjE9gQ7a0WD+5kD_wLfOYiBfCjoytHD3huWg7LA@mail.gmail.com>
 <5763902B.9050106@kaod.org>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 23 Jun 2016 10:34:46 -0700
Message-ID: <CAPLgG==YoJAxSkC0yt0-rRC_a4pg3L+xsGdjKCakZq24HfOSYg@mail.gmail.com>
Subject: Re: Flashing U-Boot using DediProg(R) on Aspeed AST2500 EVB
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, Shay Slobodkin <shays@mellanox.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114631b6678b400535f57801
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
X-List-Received-Date: Thu, 23 Jun 2016 17:34:50 -0000

--001a114631b6678b400535f57801
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Xo and I have been using SF100s with AST2500 EVB.  It works OK.  The main
gotcha seems to be that after writing to the flash with the SF100, it is
left in a state that the AST2500 can't seem to boot from.  Power cycling
fixes it.  I haven't spent the time to investigate further.

On Thu, Jun 16, 2016 at 10:52 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:

> On 06/17/2016 07:32 AM, Joel Stanley wrote:
> > Hi Shay,
> >
> > On Wed, Jun 15, 2016 at 9:39 PM, Shay Slobodkin <shays@mellanox.com>
> wrote:
> >> Recently we had some problems with our AST2500 EVB U-Boot.
> >>
> >> Had several systems gone bad.
> >>
> >> We want to use the DediProg=C2=AE tool in order to recover.
> >>
> >> If you have used this tool, could you please explain briefly how to us=
e
> it
> >> with Aspeed AST2500 EVB?
> >
> > I've not done this myself on the evb.
> >
> > Looking at the board, you want header J70 is for the ast2500 boot
> > flash. It's a 5 pin connector on the south west area of the board. The
> > pins are labeled in the order: CS0, Clock, MOSI, MISO, Ground.
>
> Yes. It works pretty well from a raspberry pi. I also have used a
> Flashcat programmer.
>
> You should make sure that the board is not booting from the flash
> module. For that you need to unselect the flash chip, CS0 on header J44.
>
> > If you need further help perhaps send a photo of your programmer and
> > whatever cables it came with.
>
> and one of your board perhaps. With details of what is around the
> flash.
>
> Cheers,
>
> C.
>
> > Cheers,
> >
> > Joel
> >
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--001a114631b6678b400535f57801
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Xo and I have been using SF100s with AST2500 EVB.=C2=A0 It=
 works OK.=C2=A0 The main gotcha seems to be that after writing to the flas=
h with the SF100, it is left in a state that the AST2500 can&#39;t seem to =
boot from.=C2=A0 Power cycling fixes it.=C2=A0 I haven&#39;t spent the time=
 to investigate further.=C2=A0</div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Thu, Jun 16, 2016 at 10:52 PM, C=C3=A9dric Le Goater =
<span dir=3D"ltr">&lt;<a href=3D"mailto:clg@kaod.org" target=3D"_blank">clg=
@kaod.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On 06/17/2016 07:32 AM, Joel Stanley wrote:<br>
&gt; Hi Shay,<br>
&gt;<br>
&gt; On Wed, Jun 15, 2016 at 9:39 PM, Shay Slobodkin &lt;<a href=3D"mailto:=
shays@mellanox.com">shays@mellanox.com</a>&gt; wrote:<br>
&gt;&gt; Recently we had some problems with our AST2500 EVB U-Boot.<br>
&gt;&gt;<br>
&gt;&gt; Had several systems gone bad.<br>
&gt;&gt;<br>
&gt;&gt; We want to use the DediProg=C2=AE tool in order to recover.<br>
&gt;&gt;<br>
&gt;&gt; If you have used this tool, could you please explain briefly how t=
o use it<br>
&gt;&gt; with Aspeed AST2500 EVB?<br>
&gt;<br>
&gt; I&#39;ve not done this myself on the evb.<br>
&gt;<br>
&gt; Looking at the board, you want header J70 is for the ast2500 boot<br>
&gt; flash. It&#39;s a 5 pin connector on the south west area of the board.=
 The<br>
&gt; pins are labeled in the order: CS0, Clock, MOSI, MISO, Ground.<br>
<br>
</span>Yes. It works pretty well from a raspberry pi. I also have used a<br=
>
Flashcat programmer.<br>
<br>
You should make sure that the board is not booting from the flash<br>
module. For that you need to unselect the flash chip, CS0 on header J44.<br=
>
<span class=3D""><br>
&gt; If you need further help perhaps send a photo of your programmer and<b=
r>
&gt; whatever cables it came with.<br>
<br>
</span>and one of your board perhaps. With details of what is around the<br=
>
flash.<br>
<br>
Cheers,<br>
<br>
C.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Cheers,<br>
&gt;<br>
&gt; Joel<br>
&gt;<br>
<br>
_______________________________________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a><br>
</div></div></blockquote></div><br></div>

--001a114631b6678b400535f57801--
