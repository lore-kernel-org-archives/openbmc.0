Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbNFt56VYzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 12:54:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=SBb0fwkC; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id r136so116055qke.3
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 19:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=o0suWAttgvTR8Y4Ug45BLNUtO54vzVvKreK3QBxMXbY=;
 b=SBb0fwkCrVhhPubBZntJlsJLvq6dxRuSSgO8SbZWxvXUYeodhSTI3+GSZm+hpX2Y5V
 3MQO1PzNuGwhGDJK3NeqG4ZLyjlxjlmLhg1ibG80rD1LAt7lgquj1u2kS+yMXTtgiUAF
 QblBf/FWf4Pz31mwzHy56+X/v0+bD7KbDm/VUuItZwij8LT0eRgch3op9X7Y6uNM0jXZ
 T2yUmwfdsne05xHgSeJq9xBgGxmz0PnB9ZUzbxZcLWUx4z8Z26bfJbpYnNwHYltHYUsP
 XhkH5QwhsbJZ4wKDOUDSDTjapvvOjk4qo9X/gIIcb0bm3BCWB+Dsey1oi6nwzSrvJN13
 Vvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=o0suWAttgvTR8Y4Ug45BLNUtO54vzVvKreK3QBxMXbY=;
 b=OUGtVQyZjbhq+HQwJ53g0WfWFDCaUIu3GXRhNltzpJ2pVeRI2he9+cVOH1eRW8jLEk
 Bjf2NBDVyGcynJKuYopzA6Bn/wM0FBM948B4R+EmhnrtJrOWymGwQ1/I7j6s7fHgZjXL
 Ez6VR1QiyTzMN1KDPZWFk2NAn8ME5jUmeRA664weEpvoxpeX7gIZMdY1dnKsWkawzs6j
 ixwRO4ZTlKYRmyQnvPGbRYjB6Itva1QIPyem8fCR23wQUV0z07oVy588MuicLp4n/T6v
 bfq2YynYiTtgf6LNTTAFm4SAgCC8oaXYcxI+nfNiKsz4L0Lo3dOFivKrgG7tCgFfVh/S
 DGTA==
X-Gm-Message-State: ALyK8tKrgEWN6vTe5PAVbZzzQ1HaL0V+JsgxZcBlO6oQn3ZrzmrYoPh8nn3Vax6bMqL/xJgtiTAmIk3mA74M5w==
X-Received: by 10.55.212.89 with SMTP id l86mr2060675qki.114.1466736848834;
 Thu, 23 Jun 2016 19:54:08 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 19:53:49 -0700 (PDT)
In-Reply-To: <20160623204033.13165-5-openbmc-patches@stwcx.xyz>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
 <20160623204033.13165-5-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 12:23:49 +0930
X-Google-Sender-Auth: A2L81RkPsrIWfo19MKpcqFIr4js
Message-ID: <CACPK8XeXhyQr_EyHgvx+OmEqc6zH7vN7ON4ttUmceyhOFhSA8g@mail.gmail.com>
Subject: Re: [PATCH openbmc v5 04/11] meta-phosphor: Make image-overlay an
 optional feature
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 24 Jun 2016 02:54:11 -0000

On Fri, Jun 24, 2016 at 6:10 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Patrick Williams <patrick@stwcx.xyz>
>
> Previously, obmc-bsp-common.inc added "overlay" to the IMAGE_FSTYPES
> but this only has meaning if the 'image-overlay' class is used.  The
> obmc-phosphor-image class explicitly includes 'image-overlay' when
> appropriate but no other images (ie. ones that come with yocto) do.
>
> Changed obmc-bsp-common to instead enable an obmc-phosphor-image feature
> by setting OBMC_PHOSPHOR_IMAGE_OVERLAY=1. Then in obmc-phosphor-image we
> add "overlay" to the IMAGE_FSTYPES only when the feature is enabled.
>
> This will fix both non-phosphor images on hardware platforms and all images
> on simulation platforms.
>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  meta-phosphor/classes/obmc-phosphor-image.bbclass      | 15 +++++++++------
>  meta-phosphor/conf/machine/include/obmc-bsp-common.inc |  2 +-
>  2 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-phosphor/classes/obmc-phosphor-image.bbclass
> index d3960c7..b2925c2 100644
> --- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
> +++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
> @@ -48,9 +48,12 @@ CORE_IMAGE_EXTRA_INSTALL_append = " bash \
>
>  OBMC_IMAGE_EXTRA_INSTALL ?= ""
>
> -def build_overlay(d):
> -        if bb.utils.contains("IMAGE_FSTYPES", "overlay", "overlay", "0", d) != "0":
> -                return "image-overlay"
> -        return ""
> -
> -inherit ${@build_overlay(d)}
> +def image_overlay_enabled(d, fstype):
> +        if d.getVar('OBMC_PHOSPHOR_IMAGE_OVERLAY', True) != "1":
> +            return ""
> +        if fstype:
> +            return "overlay"
> +        return "image-overlay"
> +
> +IMAGE_FSTYPES += "${@image_overlay_enabled(d, True)}"
> +inherit ${@image_overlay_enabled(d, False)}
> diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
> index 8d1fd7e..2b6a163 100644
> --- a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
> +++ b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
> @@ -13,7 +13,7 @@ UBOOT_SUFFIX ?= "bin"
>
>  MACHINEOVERRIDES =. "openbmc:"
>
> -IMAGE_FSTYPES += "overlay"
> +OBMC_PHOSPHOR_IMAGE_OVERLAY= "1"
>  IMAGE_FSTYPES += "cpio.${INITRAMFS_CTYPE}.u-boot"
>  OBMC_IMAGE_EXTRA_INSTALL_append = " u-boot-fw-utils"
>
> --
> 2.9.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
