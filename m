Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x22a.google.com (mail-ob0-x22a.google.com
 [IPv6:2607:f8b0:4003:c01::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3573D1A0622
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 09:55:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=yioCDtA8; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=HBlNAU0/; 
 dkim-atps=neutral
Received: by mail-ob0-x22a.google.com with SMTP id gc3so837036obb.3
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 14:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=zNBJYoN6vthxCUmtyyf1QdOvyTa6Juy0Z3SobfbsRsY=;
 b=yioCDtA8+3BDi2x2C+u2U3G/F6u6lUwCQCGNZb5CAOcR+qplyjkvIEX6XvlIV9O7We
 4mePmfJkLSz95TjF+qavml2yuYI9G7q2fkoHUzjY0xIPUZBrB/MF/gSAnNhJ+2dGtI8X
 UiesES+4dZ+ht+IlH9FZp+j8qszTjig6KAg833VBgMWSm6ZMotahWQiXc0qjlZqz7Emt
 05jgmE2abe62/tXaboGXSZZj7Riy/5hjcXuXLIK67eX+PgRbnnBVnt/GKuaZWosFCUn4
 XF3zsN/kxNH26/ojPXawGMBF9NwdpiQUiRhS0Z/Yocg7dAFVswFA2EdnN3U9BcncgZj2
 LVIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=zNBJYoN6vthxCUmtyyf1QdOvyTa6Juy0Z3SobfbsRsY=;
 b=HBlNAU0/RY06x1u+dgM0sQGW1PDNhe2pjScNmLjbgOWlilTR6hoMrcwGM1QsrqatPN
 B/J7t9xHNw6dTQ8UgUtZCwggWMjcuGkT1NOzq+NFnzBdefbaTyVFjtqpqKmDTPA91NfB
 uQ5XrKafUnj5e1UWgjVawW7pV+TX14b9M8rxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=zNBJYoN6vthxCUmtyyf1QdOvyTa6Juy0Z3SobfbsRsY=;
 b=f46+b4wCLyz/fRzMuO8FeD3+Mngc4r4L7BeK1T8vLcJvlf/vPmngIbETa/br7jmw1C
 NNK4/jFboKhtWwEasgMZoBiq8mZRsk7tTLaPRjc02NnSdnLaEWso/kXaN48WetMp+FXQ
 DeCIF5eD6+8RWOubmz+HZKJYlZ7V42MieKb/u/iRRKPgEL/QpYyM7RyiyQzzlWEAH2YL
 7knnQAxr0lQDpltSOc+O6h56cBoxpixtv2bRYMZh/W0xYE8JteihYRSKeLd9lhkbXM+k
 eHuflaQCeDyVDiqfCRbM5x4cHD2Jv28Ec+8q8mWY4cGoGRPdqtp8112LQoSZMDkoo/iN
 v7Sg==
X-Gm-Message-State: AG10YOTqtiLZhSFLBu8WfmQ4vrSk5z3I2s5GyD/PYcckH1xdLCkbnLvS7xXEFhN75ArOzy3uGvxo5EyGbhcJAQ==
X-Received: by 10.60.79.102 with SMTP id i6mr29402889oex.4.1456268102883; Tue,
 23 Feb 2016 14:55:02 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Tue, 23 Feb 2016 14:54:43 -0800 (PST)
In-Reply-To: <1456238703-11117-2-git-send-email-andrew@aj.id.au>
References: <1456238703-11117-1-git-send-email-andrew@aj.id.au>
 <1456238703-11117-2-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 Feb 2016 09:24:43 +1030
X-Google-Sender-Auth: zdyCkbiPfX-tORETtWd78J4FTos
Message-ID: <CACPK8XeAq+0RHcdDLP=ezEetCimnAPhDEFz0GJkqFYg4iE4-Lw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] oe_mkimage: Use consistent indentation
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Feb 2016 22:55:08 -0000

On Wed, Feb 24, 2016 at 1:14 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> It was inconsistent with the rest of the file, which seems to use 7
> spaces. In particular, vim-sleuth was detecting the indentation style
> from the first indent(s) in the file, which were in the oe_mkimage
> function.

7 spaces seems kind of unusual.

Upstream bbclass files are a mixture; I'd go with 8 spaces as I
suspect that was the intent in this file.

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> index c390c36..bf987bb 100644
> --- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> +++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> @@ -4,9 +4,9 @@ inherit image_types_uboot
>  # the image load address and entry point. Override it here.
>
>  oe_mkimage () {
> -    mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_BASENAME} \
> -        -a ${INITRD_IMAGE_LOADADDRESS} -e ${INITRD_IMAGE_ENTRYPOINT} \
> -        -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
> +       mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_BASENAME} \
> +              -a ${INITRD_IMAGE_LOADADDRESS} -e ${INITRD_IMAGE_ENTRYPOINT} \
> +              -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
>  }
>
>  INITRD_IMAGE_ENTRYPOINT ?= "0x40800000"
> --
> 2.5.0
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
