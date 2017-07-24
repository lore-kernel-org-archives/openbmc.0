Return-Path: <raltherr@google.com>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com
 [IPv6:2a00:1450:400c:c09::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGV5n2r57zDrKJ
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 04:19:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HSR6bkrX"; 
 dkim-atps=neutral
Received: by mail-wm0-x235.google.com with SMTP id c184so38557065wmd.0
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nHL+W5L4FJcbT+3oFpHjKe3uqcfHGdEwMpHCUvIR41k=;
 b=HSR6bkrXASUtLPfmMr/niKCtbCsOeLBhb05JUrWg/0J28Yp/fIqUVV/voP3ZJssN88
 CnyTCPBW56Tg6pom/yKuLV6x1aemuq4n+OLZqwhhBTPaCU0Ue5T8WGIBqTX0dSoJrZZC
 3m4hztRonsrOfuNFhzOBDNSoP2bIfYYWYYTuBkGC/4OIelfMU+LLPdBX5V/WJqEXO7Y9
 HTRDkhuDN63UoeXQcVr5U7bF5T/E+gQudsK8WxGzrhltbgXMMTSOWJeUbUXQvTateiVu
 CO9Havid2jnIUkDLvOzN67nscZRvehV7/H6AEJAYAgapA9mLxDLl0vbcYQ+SgUdihgrN
 9JxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nHL+W5L4FJcbT+3oFpHjKe3uqcfHGdEwMpHCUvIR41k=;
 b=agp+iLkzifYBvWr2xpEz5eg541YaUlaK+40FK2c7j+Qv2n9OKKTeDH2Jdauvsx3PbZ
 IAI3mu9sqbqUjsfEvnm+NYeapbxGPssCGUMhjZ1EzLYnTQw0nSPbCt4YsvHC+6TGrJt+
 8HDQu1JbSIVBoHU0+KlVTQ7wrDG8qHzxRgbW5UYcTgClniE9aB352JxMbhkd+Dyr/qko
 2VLBOXvDFpaDNDss410hpiij7JXwoUpj6b/di5YqwidcUEBAXM+5I7I41a26UtKKH3Z1
 FLcAENe6+tY0YxiOQz5xrOatHyOmfnJjOaAHCfZAxurpzgGh83mk9NCIwOERhmksJ2Ze
 mS/Q==
X-Gm-Message-State: AIVw112Xu/wVooDYNpAx4lacE760GvimP901UW/u4GriDuf/PRxNzyOy
 94RDJrD/0UThVJjCW6vmjstOGVlQJPvK
X-Received: by 10.28.98.66 with SMTP id w63mr5806380wmb.34.1500920393306; Mon,
 24 Jul 2017 11:19:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.153.69 with HTTP; Mon, 24 Jul 2017 11:19:52 -0700 (PDT)
In-Reply-To: <20170721223326.28674-1-patrick@stwcx.xyz>
References: <20170721223326.28674-1-patrick@stwcx.xyz>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 24 Jul 2017 11:19:52 -0700
Message-ID: <CAPLgG==ZSsfgAm38616-32W5P6vZJsKJ+e8-XfhPxK3CVvVDmw@mail.gmail.com>
Subject: Re: [PATCH u-boot 0/1] RFC: How to configure boot options?
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114a511ce1a691055514426f"
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
X-List-Received-Date: Mon, 24 Jul 2017 18:19:58 -0000

--001a114a511ce1a691055514426f
Content-Type: text/plain; charset="UTF-8"

The current bootcmd script is there to provide backward compatibility for
pre-FIT ramdisks.  That can probably be removed but we now want fallback
behavior for images that still use a ramdisk.

On Fri, Jul 21, 2017 at 3:33 PM, Patrick Williams <patrick@stwcx.xyz> wrote:

> As part of the change-over from an initramfs-based boot sequence to a
> direct rootfs boot, we need to change some of the boot options for
> u-boot.  I expect these to change a few times in the near future as we
> also transition to UBI-managed volumes and we figure out how to set
> u-boot environment options to switch between different UBI kernels and
> rootfses.
>
> This is really independent from the current ast-*-defconfigs, in that
> those currently select between different network options.  I suspect
> we do not N*M combinations of defconfigs for network*image-structure.
> I plan to make a MACHINE_FEATURE (or DISTRO_FEATURE) in bitbake to
> control this, but looking for feedback on how we should change u-boot.
>
> Ideally, to me, this would have been passed in via the config file and
> we could have used config-snippets in Yocto like we do for the kernel.
> Due to the way u-boot builds, I could not find a simple way to even
> change this option from a include/config/ast-common.h #define into a
> machine_config driven option.
>
> Anyone have ideas?
>
> Patrick Williams (1):
>   config/ast-common: hack bootopts
>
>  include/configs/ast-common.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> --
> 2.13.0
>
>
>

--001a114a511ce1a691055514426f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The current bootcmd script is there to provide backward co=
mpatibility for pre-FIT ramdisks.=C2=A0 That can probably be removed but we=
 now want fallback behavior for images that still use a ramdisk. =C2=A0</di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jul 21,=
 2017 at 3:33 PM, Patrick Williams <span dir=3D"ltr">&lt;<a href=3D"mailto:=
patrick@stwcx.xyz" target=3D"_blank">patrick@stwcx.xyz</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">As part of the change-over from an init=
ramfs-based boot sequence to a<br>
direct rootfs boot, we need to change some of the boot options for<br>
u-boot.=C2=A0 I expect these to change a few times in the near future as we=
<br>
also transition to UBI-managed volumes and we figure out how to set<br>
u-boot environment options to switch between different UBI kernels and<br>
rootfses.<br>
<br>
This is really independent from the current ast-*-defconfigs, in that<br>
those currently select between different network options.=C2=A0 I suspect<b=
r>
we do not N*M combinations of defconfigs for network*image-structure.<br>
I plan to make a MACHINE_FEATURE (or DISTRO_FEATURE) in bitbake to<br>
control this, but looking for feedback on how we should change u-boot.<br>
<br>
Ideally, to me, this would have been passed in via the config file and<br>
we could have used config-snippets in Yocto like we do for the kernel.<br>
Due to the way u-boot builds, I could not find a simple way to even<br>
change this option from a include/config/ast-common.h #define into a<br>
machine_config driven option.<br>
<br>
Anyone have ideas?<br>
<br>
Patrick Williams (1):<br>
=C2=A0 config/ast-common: hack bootopts<br>
<br>
=C2=A0include/configs/ast-common.h | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.13.0<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--001a114a511ce1a691055514426f--
