Return-Path: <raltherr@google.com>
Received: from mail-wm0-x234.google.com (mail-wm0-x234.google.com
 [IPv6:2a00:1450:400c:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHKCT5WppzDqmS
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 12:42:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="FnmYPkLU"; 
 dkim-atps=neutral
Received: by mail-wm0-x234.google.com with SMTP id c184so70067598wmd.0
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 19:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=tNgNbTT3PAa15aSZS86mbT17weFYmFCKThH65F402Zs=;
 b=FnmYPkLUmOcR7TrlsJluoocWHLB72J1dQonyCEzAo1E7UgY7D3m6yKiirZFqzNcdFV
 1mrCtlHtcBE2Q9cf2wN8AH3+Q/6xHd2/pVEb2DPVt+2ddTcSdgclr3QCS9JEGZEHaEDP
 CwVs5q/o1IVKLeP+B0WMYpUXx4BYom5rJ9X7TP69QxkkvA5IRgaK63ZMBuUrb3oDUgGn
 yCwmh1mJztJkIxCDsVxbpk96IuNcUo1X1WC5ZRr9d3jpOlod3T7vm+IS9ZvlKDodE0rr
 FaddCCZ9rAKoZBLogCEw31y1Pz6nxjGwPoX6+fqHDSGNFrpTGWNQv2NhP90yu/OeV8L9
 +PEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=tNgNbTT3PAa15aSZS86mbT17weFYmFCKThH65F402Zs=;
 b=TtW1b8s4EUb1Mt8t1ZjtQPX6uujImkAGbdc5FdOafYY+EHhu5F+p99aJ60NPwpc9F+
 LnnLIyaJrYxuR/3ET2LXEkn+m30+hsZOSvTKZVIki9LhIZqontx2C1+y2VGNII7V0C+z
 tgGy19k+5Af0De91y8dTinhzTFnZ8vOyx6++tn6K96ETwg4FsmMifK7e0QVThofk74JS
 cUrVlA08UsnZsex+iThrTUKa1LGI3pp5xQ0+s3gegxRFQo+lrBhZarr4zBXAzFhAJLPR
 6TZk/4VVUJDSO0kyH38SA6yplf9eaQ/QaaGoQTvZ2wHk9gEkWL/zwn3pfOehJHgjgCcf
 6pLA==
X-Gm-Message-State: AIVw113y59QnWN7PPtl42dMYa6+d67+PqIMKjdQ034SbHjnWdonYy8wP
 A+rluc31SCKT41VylizAbxJJvDRHCRpC
X-Received: by 10.28.169.82 with SMTP id s79mr10067194wme.123.1501036961788;
 Tue, 25 Jul 2017 19:42:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.153.69 with HTTP; Tue, 25 Jul 2017 19:42:40 -0700 (PDT)
Received: by 10.28.153.69 with HTTP; Tue, 25 Jul 2017 19:42:40 -0700 (PDT)
In-Reply-To: <20170725224224.GB473@asimov.austin.ibm.com>
References: <20170721223326.28674-1-patrick@stwcx.xyz>
 <CAPLgG==ZSsfgAm38616-32W5P6vZJsKJ+e8-XfhPxK3CVvVDmw@mail.gmail.com>
 <20170725224224.GB473@asimov.austin.ibm.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 25 Jul 2017 19:42:40 -0700
Message-ID: <CAPLgG==VR2Hkxg-VbP-c=TpH7AExG1KHraWzg5Xf=-j6z8Ebbw@mail.gmail.com>
Subject: Re: [PATCH u-boot 0/1] RFC: How to configure boot options?
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114b36a4e7596d05552f66a5"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jul 2017 02:42:46 -0000

--001a114b36a4e7596d05552f66a5
Content-Type: text/plain; charset="UTF-8"

I could see those as IMAGE_FEATURES. FIT vs non-FIT is controlled by
KERNAL_IMAGETYPE but that could be triggered by IMAGE_FEATURES. Regardless
of the options chosen, the built U-Boot should support booting the current
FIT+initramfs+cpio and a future FIT+UBI at least for the transition period.

On Jul 25, 2017 3:42 PM, "Patrick Williams" <patrick@stwcx.xyz> wrote:

> On Mon, Jul 24, 2017 at 11:19:52AM -0700, Rick Altherr wrote:
> > The current bootcmd script is there to provide backward compatibility for
> > pre-FIT ramdisks.  That can probably be removed but we now want fallback
> > behavior for images that still use a ramdisk.
>
> Thanks for giving me the history on that BOOTCOMMAND snippet.  It wasn't
> obvious what it was doing to me.
>
> Agreed.  It seems a little odd to me that this is all controlled in the
> u-boot repository directly, hence my questions.  I would have expected
> that an IMAGE_FEATURE or MACHINE_FEATURE of Yocto would have triggered
> FIT vs non-FIT.  Same now with the transition to UBI with kernel and
> squashfs instead of distinct MTD devices.
>
> >
> > On Fri, Jul 21, 2017 at 3:33 PM, Patrick Williams <patrick@stwcx.xyz>
> wrote:
> >
> > > As part of the change-over from an initramfs-based boot sequence to a
> > > direct rootfs boot, we need to change some of the boot options for
> > > u-boot.  I expect these to change a few times in the near future as we
> > > also transition to UBI-managed volumes and we figure out how to set
> > > u-boot environment options to switch between different UBI kernels and
> > > rootfses.
> > >
> > > This is really independent from the current ast-*-defconfigs, in that
> > > those currently select between different network options.  I suspect
> > > we do not N*M combinations of defconfigs for network*image-structure.
> > > I plan to make a MACHINE_FEATURE (or DISTRO_FEATURE) in bitbake to
> > > control this, but looking for feedback on how we should change u-boot.
> > >
> > > Ideally, to me, this would have been passed in via the config file and
> > > we could have used config-snippets in Yocto like we do for the kernel.
> > > Due to the way u-boot builds, I could not find a simple way to even
> > > change this option from a include/config/ast-common.h #define into a
> > > machine_config driven option.
> > >
> > > Anyone have ideas?
> > >
> > > Patrick Williams (1):
> > >   config/ast-common: hack bootopts
> > >
> > >  include/configs/ast-common.h | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > --
> > > 2.13.0
> > >
> > >
> > >
>
> --
> Patrick Williams
>

--001a114b36a4e7596d05552f66a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I could see those as IMAGE_FEATURES. FIT vs non-FIT is co=
ntrolled by KERNAL_IMAGETYPE but that could be triggered by IMAGE_FEATURES.=
 Regardless of the options chosen, the built U-Boot should support booting =
the current FIT+initramfs+cpio and a future FIT+UBI at least for the transi=
tion period.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Jul 25, 2017 3:42 PM, &quot;Patrick Williams&quot; &lt;<a href=3D"mailt=
o:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br type=3D"attributio=
n"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On Mon, Jul 24, 2017 at 11:19:52AM -0700,=
 Rick Altherr wrote:<br>
&gt; The current bootcmd script is there to provide backward compatibility =
for<br>
&gt; pre-FIT ramdisks.=C2=A0 That can probably be removed but we now want f=
allback<br>
&gt; behavior for images that still use a ramdisk.<br>
<br>
Thanks for giving me the history on that BOOTCOMMAND snippet.=C2=A0 It wasn=
&#39;t<br>
obvious what it was doing to me.<br>
<br>
Agreed.=C2=A0 It seems a little odd to me that this is all controlled in th=
e<br>
u-boot repository directly, hence my questions.=C2=A0 I would have expected=
<br>
that an IMAGE_FEATURE or MACHINE_FEATURE of Yocto would have triggered<br>
FIT vs non-FIT.=C2=A0 Same now with the transition to UBI with kernel and<b=
r>
squashfs instead of distinct MTD devices.<br>
<br>
&gt;<br>
&gt; On Fri, Jul 21, 2017 at 3:33 PM, Patrick Williams &lt;<a href=3D"mailt=
o:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; As part of the change-over from an initramfs-based boot sequence =
to a<br>
&gt; &gt; direct rootfs boot, we need to change some of the boot options fo=
r<br>
&gt; &gt; u-boot.=C2=A0 I expect these to change a few times in the near fu=
ture as we<br>
&gt; &gt; also transition to UBI-managed volumes and we figure out how to s=
et<br>
&gt; &gt; u-boot environment options to switch between different UBI kernel=
s and<br>
&gt; &gt; rootfses.<br>
&gt; &gt;<br>
&gt; &gt; This is really independent from the current ast-*-defconfigs, in =
that<br>
&gt; &gt; those currently select between different network options.=C2=A0 I=
 suspect<br>
&gt; &gt; we do not N*M combinations of defconfigs for network*image-struct=
ure.<br>
&gt; &gt; I plan to make a MACHINE_FEATURE (or DISTRO_FEATURE) in bitbake t=
o<br>
&gt; &gt; control this, but looking for feedback on how we should change u-=
boot.<br>
&gt; &gt;<br>
&gt; &gt; Ideally, to me, this would have been passed in via the config fil=
e and<br>
&gt; &gt; we could have used config-snippets in Yocto like we do for the ke=
rnel.<br>
&gt; &gt; Due to the way u-boot builds, I could not find a simple way to ev=
en<br>
&gt; &gt; change this option from a include/config/ast-common.h #define int=
o a<br>
&gt; &gt; machine_config driven option.<br>
&gt; &gt;<br>
&gt; &gt; Anyone have ideas?<br>
&gt; &gt;<br>
&gt; &gt; Patrick Williams (1):<br>
&gt; &gt;=C2=A0 =C2=A0config/ast-common: hack bootopts<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 include/configs/ast-common.h | 6 ++++++<br>
&gt; &gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.13.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
--<br>
Patrick Williams<br>
</blockquote></div></div>

--001a114b36a4e7596d05552f66a5--
