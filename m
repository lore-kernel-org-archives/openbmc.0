Return-Path: <raltherr@google.com>
Received: from mail-io0-x230.google.com (mail-io0-x230.google.com
 [IPv6:2607:f8b0:4001:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tXXdS37PkzDvtc
 for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2016 05:01:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cbE9NyyX"; 
 dkim-atps=neutral
Received: by mail-io0-x230.google.com with SMTP id m5so471482323ioe.3
 for <openbmc@lists.ozlabs.org>; Mon, 05 Dec 2016 10:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=wBHcLjhPurcW+KUwIKGSdAwj5GcL9LvwhyBc/cn91pE=;
 b=cbE9NyyXofEI1H59lcJJ1qMsxrdhsJ1OhVBk9NTQ7Y0yqFfoPdqX7F41cR7EF/CLUQ
 uydTTfJSiv8c/C7aIxX7NbeoIKcfOCmFXQ+Mh8vAtBHINsXUQGatE+3PLdUa/0OoHcu5
 Ulps0tyVJver+C+Icefp2/qKLcH9tyTVxsYH9fgxXnvv4C32bhBJXnGgs6Py+NGmqsSj
 O8d2tnb9KIWIHMPSv7BxbJ46ilxmoYuj6Tf5eDxhb/rfBHsB6NhnBCSTDVoGBB/DK2iN
 Zcl8QC/EWtLTrEnMoxYMqiN80cVZAu+RjjuHpuHkPwSuMmfD36NCij3MYWPC+PFEan7s
 IOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=wBHcLjhPurcW+KUwIKGSdAwj5GcL9LvwhyBc/cn91pE=;
 b=GqDuXeTvepJwcNoUx2+GVjb9loClLk7gBNG4Dz3Iq91qhYuLXemvUi1lUzGOEPdPoI
 MnHXOlWBywq4pTmv41URZyxS4L/NSmbHB+M3+LYo2mf5b/+tg8OBhnVVgACH2yVyPxGo
 FRdWuzMoiYfamG7u/qWIy9bspgi7BThIfgM6gXisubm1RIqE3sLYZlK92EpZNkxJGXfi
 7VxAZh4VkO7YN8Nxg0OeWtBfKRD/yV0veMzcNNZuUdTCd9gjzhru+ZE3eC1eDil9yMAx
 3nsPYGaZ4QV16DsqCHQP0gA+xSqz3X4PnmPtq917gLb8j4Gjx1gldXCVG++IoFFOT8B2
 BKzQ==
X-Gm-Message-State: AKaTC01kDaCblxrUQwsZrunItN8B81/iDwgDyIY/DFvCJty3/RLniR+3oU1rjCS/82gASPel5omRlDTEXTKJre0G
X-Received: by 10.107.53.36 with SMTP id c36mr50232100ioa.55.1480960904151;
 Mon, 05 Dec 2016 10:01:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.154.197 with HTTP; Mon, 5 Dec 2016 10:01:43 -0800 (PST)
In-Reply-To: <CAPnjgZ0HHnneMeVM=6ZThS53GwYFgoQKxVnc_pbE42k3SLWpjg@mail.gmail.com>
References: <1480717624-24994-1-git-send-email-raltherr@google.com>
 <1480717624-24994-3-git-send-email-raltherr@google.com>
 <CAPnjgZ0HHnneMeVM=6ZThS53GwYFgoQKxVnc_pbE42k3SLWpjg@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 5 Dec 2016 10:01:43 -0800
Message-ID: <CAPLgG=m2wsM3EXiNkgYZDLD4A6X9EWsa4GrquQ80E2Y1eOg+CQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2 2/3] bootm: relocate ramdisk if
 CONFIG_SYS_BOOT_RAMDISK_HIGH set
To: Simon Glass <sjg@chromium.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1144939a9eb3ef0542ed1415
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
X-List-Received-Date: Mon, 05 Dec 2016 18:01:49 -0000

--001a1144939a9eb3ef0542ed1415
Content-Type: text/plain; charset=UTF-8

I think that is an artifact of starting from the Aspeed SDK.  Once these
changes are in, I plan to propose changing to FIT+FDT.

On Sun, Dec 4, 2016 at 10:24 PM, Simon Glass <sjg@chromium.org> wrote:

> Hi Rick,
>
> On 2 December 2016 at 15:27, Rick Altherr <raltherr@google.com> wrote:
> > In 35fc84f, bootm was refactored so plain 'bootm' and
> > 'bootm <subcommand>' shared a common implementation.
> > The 'bootm ramdisk' command implementation is now part of the common
> > implementation but not invoke by plain 'bootm' since the original
> > implementation never did ramdisk relocation.  Instead, ramdisk
> > relocation happened in image_setup_linux() which is typically called
> > during the OS portion of 'bootm'.
> >
> > On ARM, parameters to the Linux kernel can either be passed by FDT or
> > ATAGS. When using FDT, image_setup_linux() is called which also triggers
> > ramdisk relocation.  When using ATAGS, image_setup_linux() is _not_
> > called because it mostly does FDT setup.
> >
> > Instead of calling image_setup_linux() in both FDT and ATAGS cases,
> > include BOOTM_STATE_RAMDISK in the requested states during a plain
> > 'bootm' if CONFIG_SYS_BOOT_RAMDISK_HIGH is set and remove the ramdisk
> > relocation from image_setup_linux().  This causes ramdisk relocation to
> > happen on any system where CONFIG_SYS_BOOT_RAMDISK_HIGH regardless of
> > the OS being booted.
> >
> > Signed-off-by: Rick Altherr <raltherr@google.com>
> > ---
> >  cmd/bootm.c    | 3 +++
> >  common/image.c | 7 -------
> >  2 files changed, 3 insertions(+), 7 deletions(-)
>
> Reviewed-by: Simon Glass <sjg@chromium.org>
>
> But why would you still be using ATAGS?
>
> Regards,
> Simon
>

--001a1144939a9eb3ef0542ed1415
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think that is an artifact of starting from the Aspeed SD=
K.=C2=A0 Once these changes are in, I plan to propose changing to FIT+FDT.<=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Dec =
4, 2016 at 10:24 PM, Simon Glass <span dir=3D"ltr">&lt;<a href=3D"mailto:sj=
g@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Hi Rick,<br>
<span class=3D""><br>
On 2 December 2016 at 15:27, Rick Altherr &lt;<a href=3D"mailto:raltherr@go=
ogle.com">raltherr@google.com</a>&gt; wrote:<br>
&gt; In 35fc84f, bootm was refactored so plain &#39;bootm&#39; and<br>
&gt; &#39;bootm &lt;subcommand&gt;&#39; shared a common implementation.<br>
&gt; The &#39;bootm ramdisk&#39; command implementation is now part of the =
common<br>
&gt; implementation but not invoke by plain &#39;bootm&#39; since the origi=
nal<br>
&gt; implementation never did ramdisk relocation.=C2=A0 Instead, ramdisk<br=
>
&gt; relocation happened in image_setup_linux() which is typically called<b=
r>
&gt; during the OS portion of &#39;bootm&#39;.<br>
&gt;<br>
&gt; On ARM, parameters to the Linux kernel can either be passed by FDT or<=
br>
&gt; ATAGS. When using FDT, image_setup_linux() is called which also trigge=
rs<br>
&gt; ramdisk relocation.=C2=A0 When using ATAGS, image_setup_linux() is _no=
t_<br>
&gt; called because it mostly does FDT setup.<br>
&gt;<br>
&gt; Instead of calling image_setup_linux() in both FDT and ATAGS cases,<br=
>
&gt; include BOOTM_STATE_RAMDISK in the requested states during a plain<br>
&gt; &#39;bootm&#39; if CONFIG_SYS_BOOT_RAMDISK_HIGH is set and remove the =
ramdisk<br>
&gt; relocation from image_setup_linux().=C2=A0 This causes ramdisk relocat=
ion to<br>
&gt; happen on any system where CONFIG_SYS_BOOT_RAMDISK_HIGH regardless of<=
br>
&gt; the OS being booted.<br>
&gt;<br>
&gt; Signed-off-by: Rick Altherr &lt;<a href=3D"mailto:raltherr@google.com"=
>raltherr@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 cmd/bootm.c=C2=A0 =C2=A0 | 3 +++<br>
&gt;=C2=A0 common/image.c | 7 -------<br>
&gt;=C2=A0 2 files changed, 3 insertions(+), 7 deletions(-)<br>
<br>
</span>Reviewed-by: Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org">sjg=
@chromium.org</a>&gt;<br>
<br>
But why would you still be using ATAGS?<br>
<br>
Regards,<br>
Simon<br>
</blockquote></div><br></div>

--001a1144939a9eb3ef0542ed1415--
