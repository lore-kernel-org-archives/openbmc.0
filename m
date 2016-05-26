Return-Path: <raltherr@google.com>
Received: from mail-io0-x231.google.com (mail-io0-x231.google.com
 [IPv6:2607:f8b0:4001:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFX106BsFzDqKM
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 11:41:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=jH83L0/i; 
 dkim-atps=neutral
Received: by mail-io0-x231.google.com with SMTP id 190so44521516iow.1
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 18:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=KNxLLzFHH5Ibf0q3MvK7sRzW1gS/QpPEfiXQg9iAjfg=;
 b=jH83L0/iioVIFVmjMirNNuO8INFdZJrigsxP+n9ikHHppaS5Ve9iTN/UcVOwaaN7KI
 B+irhef6qloEnOb8spxGqL8CShvyfBZecQ0mrHteXW1n6sIdHi/9TfRq4g6Yr6xqFqJG
 ITi1GrgX+ORZkLVAFBzDggJ4gd6xLO9EBfPhzSid13VMU/Ir5mX8TFXcGc93o/KJwJWD
 pW4WhD2PEmvsYKb8CUesI9wAB+NWipyfBoxS+wbigj1b5dX3OYBflIMQmal6+inJvLwv
 h+p5K9wyVg+rJoZItvjuPM1pxizFJHKGuOxLWATz83z569EvtuGMFf6F/QbzErVE1dkp
 VMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=KNxLLzFHH5Ibf0q3MvK7sRzW1gS/QpPEfiXQg9iAjfg=;
 b=H09mWUJ/YSyoRc9r4tbdvnjyfeWCFxXyuTgkF/bZaNGr7eeBujjoUw/ZVPr5tx/CG8
 oe8IVXumGT0J/dDvVlBHLeyFSFxAEpUBtPpCWjp3aNFa/JqGzGOkZyteidARrZ5rUZZV
 myuEVNbLFaef7Yag115/eGuN55O7bG8LzP7BVkTIX9WNn6nw6Di67biRXJsuslPAebKY
 TVqyWZMR7Zh9OU+3/YcEGpJyE/Nl8OcTtVe60HWfL0dyfpQYnitm7AQVAltgxUSsQK67
 7noiTbKxSR8Y+5lhhd1ERQVDtp/9ob86yogPrJdLVMynHA/HSjmPrp0uJz+qTef7oaSq
 sRkQ==
X-Gm-Message-State: ALyK8tLuRbbT4T6dhicS5DLzNGWVNbY1mylbQqWPNgWzLndE1ex2xJlq80T3Us0VIBV/DhWE6hQbmZZOYt2XcXnr
X-Received: by 10.107.26.85 with SMTP id a82mr6556126ioa.13.1464226866313;
 Wed, 25 May 2016 18:41:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.63.164 with HTTP; Wed, 25 May 2016 18:41:05 -0700 (PDT)
In-Reply-To: <1464225896.8430.21.camel@aj.id.au>
References: <1464223026-8881-1-git-send-email-raltherr@google.com>
 <1464225896.8430.21.camel@aj.id.au>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 25 May 2016 18:41:05 -0700
Message-ID: <CAPLgG=nmaLuLuF-xuMQbpjHaNg2b8eUZwQSoY2B=GpRHhWWX8Q@mail.gmail.com>
Subject: Re: [PATCH] Fix i2c-tools SRCURI syntax
To: andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org, Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary=001a113fd5863d2f250533b4e23d
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
X-List-Received-Date: Thu, 26 May 2016 01:41:09 -0000

--001a113fd5863d2f250533b4e23d
Content-Type: text/plain; charset=UTF-8

Shall I resend this patch as a pull request?

On Wed, May 25, 2016 at 6:24 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Hi Rick,
>
> Thanks for the patch. I've reproduced the warning* and tested the fix.
> As an aside, the commit message introducing the .bbappend was pretty
> terse, I assume the reason for switching the SRC_URI is that
> {www,dl}.lm-sensors.org seem to be unreachable.
>
> Separately, the means to contribute to OpenBMC is a bit fragmented at
> the moment, and there are ongoing discussions about how to manage it.
> As it stands for the openbmc/openbmc repository, pull-requests are the
> preferred approach. More generally, for projects that are OpenBMC-
> specific pull-requests are preferred**, but for contributions to our
> forks of other projects the upstream workflow is preferred. So for u-
> boot, the kernel and qemu, sending patches to the list is the way to
> go.
>
> * The warning was:
> WARNING: Failed to fetch URL
> http://downloads.yoctoproject.org/mirror/sources/i2c-tools-3.1.2.tar.bz2http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-3.1.2.tar.bz2,
> attempting MIRRORS if available
>
> ** Though the word is the OpenBMC repos will be using Gerrit shortly
>
> On Wed, 2016-05-25 at 17:37 -0700, Rick Altherr wrote:
> > Override syntax (FOO_append, FOO_prepend) doesn't insert spaces to
> > separate the append from the original value.  This caused the two URIs
> > to be incorrectly merged into one and caused a download failure.  It
> > happens that the fallback in that case is to use the Yocto mirror so it
> > kept working other than emitting a warning.  Using =+ prepend syntax
> > correctly adds the separating space.
> >
> > Change-Id: I36f48cb53aa29ea9a4bde738c975784f6ce24250
> > Signed-off-by: Rick Altherr <raltherr@google.com>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>
> Cheers,
>
> Andrew
>
> > ---
> >  meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend |
> 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git
> a/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend
> b/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend
> > index bdbdc67..599394d 100644
> > ---
> a/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend
> > +++
> b/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend
> > @@ -1,4 +1,5 @@
> > +# Prefer the Yocto mirror over the direct lm-sensors download.
> >  SRC_URI_remove = "
> http://dl.lm-sensors.org/i2c-tools/releases/${BP}.tar.bz2"
> > -SRC_URI_prepend = "
> http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.bz2"
> > +SRC_URI =+ "
> http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.bz2"
> >
> >  RDEPENDS_${PN}_remove = "${PN}-misc"
>

--001a113fd5863d2f250533b4e23d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Shall I resend this patch as a pull request?</div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, May 25, 2016 at 6=
:24 PM, Andrew Jeffery <span dir=3D"ltr">&lt;<a href=3D"mailto:andrew@aj.id=
.au" target=3D"_blank">andrew@aj.id.au</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Hi Rick,<br>
<br>
Thanks for the patch. I&#39;ve reproduced the warning* and tested the fix.<=
br>
As an aside, the commit message introducing the .bbappend was pretty<br>
terse, I assume the reason for switching the SRC_URI is that<br>
{www,dl}.<a href=3D"http://lm-sensors.org" rel=3D"noreferrer" target=3D"_bl=
ank">lm-sensors.org</a> seem to be unreachable.<br>
<br>
Separately, the means to contribute to OpenBMC is a bit fragmented at<br>
the moment, and there are ongoing discussions about how to manage it.<br>
As it stands for the openbmc/openbmc repository, pull-requests are the<br>
preferred approach. More generally, for projects that are OpenBMC-<br>
specific pull-requests are preferred**, but for contributions to our<br>
forks of other projects the upstream workflow is preferred. So for u-<br>
boot, the kernel and qemu, sending patches to the list is the way to<br>
go.<br>
<br>
* The warning was:<br>
WARNING: Failed to fetch URL <a href=3D"http://downloads.yoctoproject.org/m=
irror/sources/i2c-tools-3.1.2.tar.bz2http://dl.lm-sensors.org/i2c-tools/rel=
eases/i2c-tools-3.1.2.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://=
downloads.yoctoproject.org/mirror/sources/i2c-tools-3.1.2.tar.bz2http://dl.=
lm-sensors.org/i2c-tools/releases/i2c-tools-3.1.2.tar.bz2</a>, attempting M=
IRRORS if available<br>
<br>
** Though the word is the OpenBMC repos will be using Gerrit shortly<br>
<span class=3D""><br>
On Wed, 2016-05-25 at 17:37 -0700, Rick Altherr wrote:<br>
&gt; Override syntax (FOO_append, FOO_prepend) doesn&#39;t insert spaces to=
<br>
&gt; separate the append from the original value.=C2=A0=C2=A0This caused th=
e two URIs<br>
&gt; to be incorrectly merged into one and caused a download failure.=C2=A0=
=C2=A0It<br>
&gt; happens that the fallback in that case is to use the Yocto mirror so i=
t<br>
&gt; kept working other than emitting a warning.=C2=A0=C2=A0Using =3D+ prep=
end syntax<br>
&gt; correctly adds the separating space.<br>
&gt;<br>
&gt; Change-Id: I36f48cb53aa29ea9a4bde738c975784f6ce24250<br>
&gt; Signed-off-by: Rick Altherr &lt;<a href=3D"mailto:raltherr@google.com"=
>raltherr@google.com</a>&gt;<br>
<br>
</span>Reviewed-by: Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">a=
ndrew@aj.id.au</a>&gt;<br>
<br>
Cheers,<br>
<br>
Andrew<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; ---<br>
&gt; =C2=A0meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbap=
pend | 3 ++-<br>
&gt; =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools=
_%.bbappend b/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.b=
bappend<br>
&gt; index bdbdc67..599394d 100644<br>
&gt; --- a/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbap=
pend<br>
&gt; +++ b/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbap=
pend<br>
&gt; @@ -1,4 +1,5 @@<br>
&gt; +# Prefer the Yocto mirror over the direct lm-sensors download.<br>
&gt; =C2=A0SRC_URI_remove =3D &quot;<a href=3D"http://dl.lm-sensors.org/i2c=
-tools/releases/${BP}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://=
dl.lm-sensors.org/i2c-tools/releases/${BP}.tar.bz2</a>&quot;<br>
&gt; -SRC_URI_prepend =3D &quot;<a href=3D"http://downloads.yoctoproject.or=
g/mirror/sources/${BP}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http:/=
/downloads.yoctoproject.org/mirror/sources/${BP}.tar.bz2</a>&quot;<br>
&gt; +SRC_URI =3D+ &quot;<a href=3D"http://downloads.yoctoproject.org/mirro=
r/sources/${BP}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://downlo=
ads.yoctoproject.org/mirror/sources/${BP}.tar.bz2</a>&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0RDEPENDS_${PN}_remove =3D &quot;${PN}-misc&quot;</div></div></bl=
ockquote></div><br></div>

--001a113fd5863d2f250533b4e23d--
