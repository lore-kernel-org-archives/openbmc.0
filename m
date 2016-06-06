Return-Path: <raltherr@google.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
 [209.85.223.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNkmH6Hg6zDqFh
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 05:10:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=XrdzjTTP; 
 dkim-atps=neutral
Received: by mail-io0-f175.google.com with SMTP id n127so25429092iof.3
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jun 2016 12:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=tacQJVB0NYX8L0/BWU2oDBOrIaZbM1prgVvMJxXY1x0=;
 b=XrdzjTTPEtikyte5w/mR8xzUBLOAP74/ek7ezigxhG5mVDOZOwdSOfgBZi+jjBZo9o
 eSjYa/t6NvOfsuQdqowwBPE+IYpwBPInRZ+KvrWxOjszyN1mGDjZtsQGO7kownh9djVH
 Rm1yCVJAba6B+AFLQVDP9DAekqZCeWqRdKswhINXchqJtxzL8QRjYm/TlBe7ihdvAIkY
 5Rqhfxbqr9NIWxVcnu9DTjBtn9IphIFnyBsm3u2PPZsf3EUNbmDbIPfydHigFaOsv4GE
 XnhhWjPW/7oAAtBH5ErCvye+KCdCUynNENI5KXHCTWCP2tVp64sls95j4xzKiIJlMKG1
 TdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=tacQJVB0NYX8L0/BWU2oDBOrIaZbM1prgVvMJxXY1x0=;
 b=bc4NtshM2XnXn7jJRmHSGrMArylibiu4lNRcYMs53iQOkFu+eNrXkj058U696lsQMk
 h1WdArE/rTAppMKFPojfHzUPhyHt9gUyu4W1vk0IJ1I9X5NMVBZGF70TLkPY4mAg9CCE
 a8bEydws0OEXEeQxK2zvhcGLpKalC2hwkotcQu4UTqH/U2KycyqJFxcUB9srhVXSckxy
 qLQE7WY00xKMhu2FYof2rMl/hvgna/NPa9EfWSdplBh+RtedgpurgbdOUewWLmXodrGQ
 z3z93buyVk3K2UMMcKgpOQZ+G+/oNGKQsF01e5FqiIwqfhbGkVZWt9yiUGTOjQKzsfGt
 kewg==
X-Gm-Message-State: ALyK8tLmtK5Uxy0lPJY9s8cdO9C2UBUGNK092pzGffVrf0Ay/6pLz65FyS5R1DAzZlWb/wMYkX7RN19O1lAmUkzk
X-Received: by 10.107.26.85 with SMTP id a82mr24418461ioa.13.1465240084806;
 Mon, 06 Jun 2016 12:08:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.65.14.170 with HTTP; Mon, 6 Jun 2016 12:08:04 -0700 (PDT)
In-Reply-To: <CACPK8XeSGjPNhXBvvRigQJ8eE3YWmJ3WmgGcR782crw6Wek6tg@mail.gmail.com>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
 <20160604052039.6581-7-openbmc-patches@stwcx.xyz>
 <CACPK8XeSGjPNhXBvvRigQJ8eE3YWmJ3WmgGcR782crw6Wek6tg@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 6 Jun 2016 12:08:04 -0700
Message-ID: <CAPLgG=mJA8UStZ8SwevUixvnAzseggLFN=d9r1qqeSMpiwCPTQ@mail.gmail.com>
Subject: Re: [PATCH openbmc 06/10] Move static kernel recipe configuration to
 include
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary=001a113fd586c593810534a0ca15
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
X-List-Received-Date: Mon, 06 Jun 2016 19:10:09 -0000

--001a113fd586c593810534a0ca15
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 5, 2016 at 9:40 AM, Joel Stanley <joel@jms.id.au> wrote:

> On Sat, Jun 4, 2016 at 12:20 AM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> >
> > This facilitates multiple kernel recipes.
> >
> > Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> > ---
> >  .../common/recipes-kernel/linux/linux-obmc.inc         | 18
> ++++++++++++++++++
> >  .../common/recipes-kernel/linux/linux-obmc_4.4.bb      | 18
> +-----------------
> >  2 files changed, 19 insertions(+), 17 deletions(-)
> >  create mode 100644
> meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
> >
> > diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
> b/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
> > new file mode 100644
> > index 0000000..c64ff9d
> > --- /dev/null
> > +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
> > @@ -0,0 +1,18 @@
> > +DESCRIPTION = "Linux kernel for OpenBMC"
> > +SECTION = "kernel"
> > +LICENSE = "GPLv2"
> > +
> > +KCONFIG_MODE="--alldefconfig"
> > +
> > +KSRC ?= "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
>
> Can we tell poky to download a tarball instead of waiting for it to
> check out a git repository?
>
>
You can but Bitbake does a bunch of caching that makes it mostly a
non-issue.  Basically, the repo gets checked out to a download folder and
then cloned into the work directory.  When we have 4.6 as well, it will use
the same cached repo in the download folder for both kernel versions.


> > +SRC_URI = "${KSRC}"
> > +SRC_URI += "file://hwmon.cfg"
>
> As I commented in another patch, I'd prefer we weren't spreading our
> configuration all over the poky tree and instead it was all in one
> place.
>
> Cheers,
>
> Joel
>
> > +
> > +LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
> > +
> > +PV = "${LINUX_VERSION}+git${SRCPV}"
> > +
> > +COMPATIBLE_MACHINE_${MACHINE} = "openbmc"
> > +
> > +inherit kernel
> > +require recipes-kernel/linux/linux-yocto.inc
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--001a113fd586c593810534a0ca15
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Jun 5, 2016 at 9:40 AM, Joel Stanley <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Sat, Jun 4,=
 2016 at 12:20 AM, OpenBMC Patches<br>
&lt;<a href=3D"mailto:openbmc-patches@stwcx.xyz">openbmc-patches@stwcx.xyz<=
/a>&gt; wrote:<br>
&gt; From: Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com">b=
radleyb@fuzziesquirrel.com</a>&gt;<br>
&gt;<br>
&gt; This facilitates multiple kernel recipes.<br>
&gt;<br>
&gt; Signed-off-by: Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirr=
el.com">bradleyb@fuzziesquirrel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../common/recipes-kernel/linux/linux-obmc.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++++<br>
&gt;=C2=A0 .../common/recipes-kernel/linux/<a href=3D"http://linux-obmc_4.4=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-obmc_4.4.bb</a>=C2=A0 =C2=
=A0 =C2=A0 | 18 +-----------------<br>
&gt;=C2=A0 2 files changed, 19 insertions(+), 17 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-phosphor/common/recipes-kernel/linux/lin=
ux-obmc.inc<br>
&gt;<br>
&gt; diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc =
b/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000..c64ff9d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc<br>
&gt; @@ -0,0 +1,18 @@<br>
&gt; +DESCRIPTION =3D &quot;Linux kernel for OpenBMC&quot;<br>
&gt; +SECTION =3D &quot;kernel&quot;<br>
&gt; +LICENSE =3D &quot;GPLv2&quot;<br>
&gt; +<br>
&gt; +KCONFIG_MODE=3D&quot;--alldefconfig&quot;<br>
&gt; +<br>
&gt; +KSRC ?=3D &quot;git://<a href=3D"http://github.com/openbmc/linux;prot=
ocol=3Dgit;branch=3D${KBRANCH}" rel=3D"noreferrer" target=3D"_blank">github=
.com/openbmc/linux;protocol=3Dgit;branch=3D${KBRANCH}</a>&quot;<br>
<br>
</span>Can we tell poky to download a tarball instead of waiting for it to<=
br>
check out a git repository?<br>
<span class=3D""><br></span></blockquote><div><br></div><div>You can but Bi=
tbake does a bunch of caching that makes it mostly a non-issue.=C2=A0 Basic=
ally, the repo gets checked out to a download folder and then cloned into t=
he work directory.=C2=A0 When we have 4.6 as well, it will use the same cac=
hed repo in the download folder for both kernel versions.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><span class=3D"">
&gt; +SRC_URI =3D &quot;${KSRC}&quot;<br>
&gt; +SRC_URI +=3D &quot;file://hwmon.cfg&quot;<br>
<br>
</span>As I commented in another patch, I&#39;d prefer we weren&#39;t sprea=
ding our<br>
configuration all over the poky tree and instead it was all in one<br>
place.<br>
<br>
Cheers,<br>
<br>
Joel<br>
<span class=3D"im HOEnZb"><br>
&gt; +<br>
&gt; +LINUX_VERSION_EXTENSION ?=3D &quot;-${SRCREV}&quot;<br>
&gt; +<br>
&gt; +PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_MACHINE_${MACHINE} =3D &quot;openbmc&quot;<br>
&gt; +<br>
&gt; +inherit kernel<br>
&gt; +require recipes-kernel/linux/linux-yocto.inc<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">____________________________=
___________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a><br>
</div></div></blockquote></div><br></div></div>

--001a113fd586c593810534a0ca15--
