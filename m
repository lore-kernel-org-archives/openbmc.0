Return-Path: <raltherr@google.com>
Received: from mail-io0-x235.google.com (mail-io0-x235.google.com
 [IPv6:2607:f8b0:4001:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rl5yh5FrCzDr5G
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jul 2016 02:37:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=T5BIHitl; 
 dkim-atps=neutral
Received: by mail-io0-x235.google.com with SMTP id f30so32177ioj.2
 for <openbmc@lists.ozlabs.org>; Wed, 06 Jul 2016 09:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=xDx5C+MEy1G4Nt6gqaNGaiZo1LGU3+W6Jp5RPoOBE4Q=;
 b=T5BIHitlc+Y57nEaysU7IW9C79uut08HlCH+nIufwSKhJpPGuY5nrTH/unnqL8+pwg
 h2fk8F5C/0tw9iCPA6jop5n1RSyiFKb4paRkpNGiGkQ6PaQMbnBBMGfAiN4XY47fIsoV
 TTZdKVzsZ4eu8CecH4Yeml04U43iK64G3WrBpY4TETOq+TV4/fTAVy4QBCmCJ8RXVIur
 w0mHRnL8GJLCaGN9AywYK5Q2MKbZYqtOP4RoCD+ALlga54lIZ/taI+E3668gNyYPA5yF
 Bj0TmlSdqWxMhiTlvpJ1gVO2SwIHlh9fd654w1aFaRQk1TpSQ6hwwDwOnYoSAQJyF2OF
 wmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=xDx5C+MEy1G4Nt6gqaNGaiZo1LGU3+W6Jp5RPoOBE4Q=;
 b=mCwK2kRDh93emtqK4VYvwyXWLA9wRy73n5m9LuXYDwbuooGFULXqyQ+8BCP8aV/46R
 EdAJt72LHXuLfXJlW2eqT8RWEW9jUKPyklRoQNqyekoGjNS0/I8TaFVT199gzpaQn2fv
 NBecpr0OjGQGdj59HBfTa4/w8CWk3y1j8a82+3S/9TekicZ3RJf69g+aAihrdR9zmhdk
 uwzH9SSYZiW8c7yG8bWRBLggH3te6jcI/sLxk9IU5BY3hGnVrmnPJ1oHXgHVWn0TrAGu
 i7jB0T7YOpPISP7D2S5kuE4pZZgkxdLxWVCVJkBsHKfi0AbOzPzaoMhciMQwdV+dXAhS
 48Pw==
X-Gm-Message-State: ALyK8tJbLPEcPUhLX2N62uDCLCqhiLnoEOsvL1wY/4ffAp0DYIT658CthflijXAfSwJZDOP/tjEU6PQfBaNUednl
X-Received: by 10.107.58.65 with SMTP id h62mr22162013ioa.172.1467822761004;
 Wed, 06 Jul 2016 09:32:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.101.202 with HTTP; Wed, 6 Jul 2016 09:32:40 -0700 (PDT)
In-Reply-To: <20160705194707.GC20922@asimov.austin.ibm.com>
References: <20160629224032.22118-1-openbmc-patches@stwcx.xyz>
 <20160629224032.22118-2-openbmc-patches@stwcx.xyz>
 <CACPK8Xf_8oBsgoPaESQ8ToBQVNKRQ1A-33kRwMjsFK40y2DUkQ@mail.gmail.com>
 <20160705194707.GC20922@asimov.austin.ibm.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 6 Jul 2016 09:32:40 -0700
Message-ID: <CAPLgG=kT1W_eHd7P6OAjua3KuwkfFPur-XEk0WY-hYm1H8=+WA@mail.gmail.com>
Subject: Re: [PATCH openbmc] Force OLDEST_KERNEL to 4.4.0
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>
Content-Type: multipart/alternative; boundary=001a114ac61643a1da0536fa1ee4
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
X-List-Received-Date: Wed, 06 Jul 2016 16:37:49 -0000

--001a114ac61643a1da0536fa1ee4
Content-Type: text/plain; charset=UTF-8

Until we understand the upgrade scenarios better, I prefer to leave it
fixed to the earliest released kernel version.

On Tue, Jul 5, 2016 at 12:47 PM, Patrick Williams <patrick@stwcx.xyz> wrote:

> On Thu, Jun 30, 2016 at 05:26:29PM +0930, Joel Stanley wrote:
> > On Thu, Jun 30, 2016 at 8:10 AM, OpenBMC Patches
> > <openbmc-patches@stwcx.xyz> wrote:
> > > From: Patrick Williams <patrick@stwcx.xyz>
> > >
> > > This is the oldest kernel currently used by openbmc, so there is no
> > > point in compiling glibc support older kernels.
> >
> > Sounds good. Buildroot does the same thing for our firmware builds on
> the host.
> >
> > Is there any way to use the actual kernel version to set this variable?
> >
>
> I might be able to set OLDEST_KERNEL in terms of LINUX_KERNEL.  Is that
> what we want?  I have a little concern that this might affect certain
> use cases of code upgrade (or downgrade) and netbooting.
>
> The saving for this setting ended up being pretty insignificant.  About
> 7k from glibc.  I can either leave this as something we change for
> "major" upgrades of openBMC or attempt to set it in terms of the
> LINUX_KERNEL variable.
>
> > >
> > > Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> > > ---
> > >  meta-phosphor/conf/distro/openbmc-phosphor.conf | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta-phosphor/conf/distro/openbmc-phosphor.conf
> b/meta-phosphor/conf/distro/openbmc-phosphor.conf
> > > index f37e88c..b4e6f7a 100644
> > > --- a/meta-phosphor/conf/distro/openbmc-phosphor.conf
> > > +++ b/meta-phosphor/conf/distro/openbmc-phosphor.conf
> > > @@ -5,6 +5,7 @@ DISTRO_NAME = "Phosphor OpenBMC (Phosphor OpenBMC
> Project Reference Distro)"
> > >  DISTRO_VERSION = "0.1.0"
> > >  TARGET_VENDOR="-openbmc"
> > >
> > > +OLDEST_KERNEL = "4.4.0"
> > >  GCCVERSION ?= "4.9.3"
> > >  IMAGE_FSTYPES += "cpio.gz"
> > >  IMAGE_FSTYPES += "squashfs-xz"
> > > --
> > > 2.9.0
> > >
> > >
> > > _______________________________________________
> > > openbmc mailing list
> > > openbmc@lists.ozlabs.org
> > > https://lists.ozlabs.org/listinfo/openbmc
>
> --
> Patrick Williams
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>

--001a114ac61643a1da0536fa1ee4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Until we understand the upgrade scenarios better, I prefer=
 to leave it fixed to the earliest released kernel version.</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jul 5, 2016 at 12:4=
7 PM, Patrick Williams <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick@stwc=
x.xyz" target=3D"_blank">patrick@stwcx.xyz</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><span class=3D"">On Thu, Jun 30, 2016 at 05:26:29PM=
 +0930, Joel Stanley wrote:<br>
&gt; On Thu, Jun 30, 2016 at 8:10 AM, OpenBMC Patches<br>
&gt; &lt;<a href=3D"mailto:openbmc-patches@stwcx.xyz">openbmc-patches@stwcx=
.xyz</a>&gt; wrote:<br>
&gt; &gt; From: Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">p=
atrick@stwcx.xyz</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This is the oldest kernel currently used by openbmc, so there is =
no<br>
&gt; &gt; point in compiling glibc support older kernels.<br>
&gt;<br>
&gt; Sounds good. Buildroot does the same thing for our firmware builds on =
the host.<br>
&gt;<br>
&gt; Is there any way to use the actual kernel version to set this variable=
?<br>
&gt;<br>
<br>
</span>I might be able to set OLDEST_KERNEL in terms of LINUX_KERNEL.=C2=A0=
 Is that<br>
what we want?=C2=A0 I have a little concern that this might affect certain<=
br>
use cases of code upgrade (or downgrade) and netbooting.<br>
<br>
The saving for this setting ended up being pretty insignificant.=C2=A0 Abou=
t<br>
7k from glibc.=C2=A0 I can either leave this as something we change for<br>
&quot;major&quot; upgrades of openBMC or attempt to set it in terms of the<=
br>
LINUX_KERNEL variable.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Patrick Williams &lt;<a href=3D"mailto:patrick@stw=
cx.xyz">patrick@stwcx.xyz</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-phosphor/conf/distro/openbmc-phosphor.conf | 1 +<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-phosphor/conf/distro/openbmc-phosphor.conf b/me=
ta-phosphor/conf/distro/openbmc-phosphor.conf<br>
&gt; &gt; index f37e88c..b4e6f7a 100644<br>
&gt; &gt; --- a/meta-phosphor/conf/distro/openbmc-phosphor.conf<br>
&gt; &gt; +++ b/meta-phosphor/conf/distro/openbmc-phosphor.conf<br>
&gt; &gt; @@ -5,6 +5,7 @@ DISTRO_NAME =3D &quot;Phosphor OpenBMC (Phosphor =
OpenBMC Project Reference Distro)&quot;<br>
&gt; &gt;=C2=A0 DISTRO_VERSION =3D &quot;0.1.0&quot;<br>
&gt; &gt;=C2=A0 TARGET_VENDOR=3D&quot;-openbmc&quot;<br>
&gt; &gt;<br>
&gt; &gt; +OLDEST_KERNEL =3D &quot;4.4.0&quot;<br>
&gt; &gt;=C2=A0 GCCVERSION ?=3D &quot;4.9.3&quot;<br>
&gt; &gt;=C2=A0 IMAGE_FSTYPES +=3D &quot;cpio.gz&quot;<br>
&gt; &gt;=C2=A0 IMAGE_FSTYPES +=3D &quot;squashfs-xz&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.9.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; openbmc mailing list<br>
&gt; &gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.=
org</a><br>
&gt; &gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"nore=
ferrer" target=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a><br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Patrick Williams<br>
</font></span><br>_______________________________________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a><br>
<br></blockquote></div><br></div>

--001a114ac61643a1da0536fa1ee4--
