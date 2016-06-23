Return-Path: <raltherr@google.com>
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rb7j35088zDqhg
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 03:28:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=ZHLM+2cW; 
 dkim-atps=neutral
Received: by mail-it0-x233.google.com with SMTP id f6so68765631ith.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=FV5MRB9w6bMbQjnv01Y80wYI+qgF+ANSsfV659utqsA=;
 b=ZHLM+2cWtwLk1JyCucRtqILEPwDpPxf7kxGtuFniKMHNZ4M9lgkLT+lkYQEByHO1DL
 sRI6jtPl7Rradq8vMITmgYe4bm+FnC8zh/Y438pc9F6HyKZCN48tnab5+zqUUfjmAGaz
 04P/gGK6A1r9TOQcOp3hBUqO1bCR59YCiZ7tPxthWqzkJJyXi3//qoq44nbnxpz9vrFz
 tSENPTRBCTA2ew+xMlMEUMLbfhFDqVm2GIdLKyFQgL3fWyLU2c0K82Ql/GfTvUpTuXvo
 Rg4wuyqPlHJ4q0AFMkdTmAOgVB0doRRjQtITYfikxT7KZ2Dl3oxwhFfv4ZrdSJ7czSk9
 lGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=FV5MRB9w6bMbQjnv01Y80wYI+qgF+ANSsfV659utqsA=;
 b=J3VAiOTFQ4i7U5xVKs6d85rsUEqM+Jcu62sokeDPMp5ZXcYiEfKB4E+FGEgc7VEDj9
 abddYLV7OfqKzfBpOMMkO4j2uUeHNnhThSF8UHSaKB4kXy+qTMQn9g2ahDo5wJtp5Hrb
 skFDwVxlAw3qo2YicIMyiGKULo2T2a/7oz+c13c+WT9EL5PxOM6b1p95UOx3DJJF7gHv
 VZH4l3wnjN/C9RHH/H9baQvW1Rjz4zeeP7O5IP6IRf7PhMFQCQW65Ckk+NbC7C4Gq/CJ
 /9NOiFmaw2rKyEv3Vi8JWT+dM0+3sWc61sSst44ytuaarcZrp6Wwz+UHn+2jhz3PFGtb
 xq4g==
X-Gm-Message-State: ALyK8tKWLTm2GiyivnarK75dKC+0lKZziUmZP1vTRHLWRJB099HcvziO3ODRNzNkbc0L89Y73yhuM9LebwMOXdqR
X-Received: by 10.36.2.71 with SMTP id 68mr22402115itu.38.1466702899759; Thu,
 23 Jun 2016 10:28:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.101.202 with HTTP; Thu, 23 Jun 2016 10:28:19 -0700 (PDT)
In-Reply-To: <CACPK8Xfe+pVLwniWd9Nm3pemfrnVTZpS1twttN-aUGjQdPG-aA@mail.gmail.com>
References: <1465932059-5531-1-git-send-email-raltherr@google.com>
 <CACPK8Xfe+pVLwniWd9Nm3pemfrnVTZpS1twttN-aUGjQdPG-aA@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 23 Jun 2016 10:28:19 -0700
Message-ID: <CAPLgG=kfYKVxnd1k2sEdz_sW7kLoV4ZnkDYZKkztiM9=ATcrqA@mail.gmail.com>
Subject: Re: [PATCH] aspeed/ast-g5: Simplify default bootargs
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
Content-Type: multipart/alternative; boundary=001a1144b1d0551d490535f56116
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
X-List-Received-Date: Thu, 23 Jun 2016 17:28:24 -0000

--001a1144b1d0551d490535f56116
Content-Type: text/plain; charset=UTF-8

I had intended to remove the Change-Id tag but the gerrit hooks in a git
repo seem to run deep.  I believe Xo sent a PR with the same patch.  I
prefer to drop my patch and follow up on his.

On Tue, Jun 14, 2016 at 8:49 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Wed, Jun 15, 2016 at 5:20 AM, Rick Altherr <raltherr@google.com> wrote:
> > From: Xo Wang <xow@google.com>
> >
> > New arguments set default console for DEBUG_UART on the EVB and allow
> > the kernel to choose init path, root/overlay, and memory size.
> >
> > Change-Id: I919f7e4027968ad000c4283f8bd80cca1b17e2eb
>
> I normally ask submissions to not include links to internal bugzillas
> when submitting patches. Do you think that's a reasonable rule for
> gerrit tags as well?
>
> > Signed-off-by: Xo Wang <xow@google.com>
> > Signed-off-by: Rick Altherr <raltherr@google.com>
> > ---
> >  include/configs/ast-g5.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/configs/ast-g5.h b/include/configs/ast-g5.h
> > index 6c05e6d..149cac8 100644
> > --- a/include/configs/ast-g5.h
> > +++ b/include/configs/ast-g5.h
> > @@ -139,7 +139,7 @@
> >
> >  #define CONFIG_SYS_LOAD_ADDR           0x83000000      /* default load
> address */
> >
> > -#define CONFIG_BOOTARGS                "console=ttyS0,115200n8
> ramdisk_size=16384 root=/dev/ram rw init=/linuxrc mem=80M"
> > +#define CONFIG_BOOTARGS                "console=ttyS4,115200
> earlyprintk"
>
> The change looks good.
>
> As you mentioned on IRC, we should create an ast2500-evb configuration
> in the future.
>
> Cheers,
>
> Joel
>

--001a1144b1d0551d490535f56116
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I had intended to remove the Change-Id tag but the gerrit =
hooks in a git repo seem to run deep.=C2=A0 I believe Xo sent a PR with the=
 same patch.=C2=A0 I prefer to drop my patch and follow up on his.</div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jun 14, 2016=
 at 8:49 PM, Joel Stanley <span dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms.=
id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><span class=3D"">On Wed, Jun 15, 2016 at 5:20 AM, Rick=
 Altherr &lt;<a href=3D"mailto:raltherr@google.com">raltherr@google.com</a>=
&gt; wrote:<br>
&gt; From: Xo Wang &lt;<a href=3D"mailto:xow@google.com">xow@google.com</a>=
&gt;<br>
&gt;<br>
&gt; New arguments set default console for DEBUG_UART on the EVB and allow<=
br>
&gt; the kernel to choose init path, root/overlay, and memory size.<br>
&gt;<br>
&gt; Change-Id: I919f7e4027968ad000c4283f8bd80cca1b17e2eb<br>
<br>
</span>I normally ask submissions to not include links to internal bugzilla=
s<br>
when submitting patches. Do you think that&#39;s a reasonable rule for<br>
gerrit tags as well?<br>
<span class=3D""><br>
&gt; Signed-off-by: Xo Wang &lt;<a href=3D"mailto:xow@google.com">xow@googl=
e.com</a>&gt;<br>
&gt; Signed-off-by: Rick Altherr &lt;<a href=3D"mailto:raltherr@google.com"=
>raltherr@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/configs/ast-g5.h | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/include/configs/ast-g5.h b/include/configs/ast-g5.h<br>
&gt; index 6c05e6d..149cac8 100644<br>
&gt; --- a/include/configs/ast-g5.h<br>
&gt; +++ b/include/configs/ast-g5.h<br>
&gt; @@ -139,7 +139,7 @@<br>
&gt;<br>
&gt;=C2=A0 #define CONFIG_SYS_LOAD_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x83000000=C2=A0 =C2=A0 =C2=A0 /* default load address */<br>
&gt;<br>
&gt; -#define CONFIG_BOOTARGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;console=3DttyS0,115200n8 ramdisk_size=3D16384 root=3D/dev/=
ram rw init=3D/linuxrc mem=3D80M&quot;<br>
&gt; +#define CONFIG_BOOTARGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;console=3DttyS4,115200 earlyprintk&quot;<br>
<br>
</span>The change looks good.<br>
<br>
As you mentioned on IRC, we should create an ast2500-evb configuration<br>
in the future.<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div><br></div>

--001a1144b1d0551d490535f56116--
