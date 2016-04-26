Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qv3zK2pfxzDq5s
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2016 10:35:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=NsTg/Ovg; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id yl2so14059326pac.1
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2016 17:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QzNyzNw1RTs6fv96r1XDXih+5BkMWROuY0dQxLNAMKk=;
 b=NsTg/Ovgi/p0nbgVc3B1RS12Ald7aUQtne8eBGiE9ppg38oJAKjCXOeNLB+DoVYVde
 itPBGMBP+ybiI4du98bWaLcNUUj0UCD2Nq19JwkIN3VsZkab4rPRxYJkMPCvb+uHenaS
 HWDtfZNLa9ATNMb1fenAIgBECq5rqT6OCb6r+qlhi56h2lzs8M75U5b18WCA0bEKt9gN
 jho6GFLbPyVaKY7Hhk1ZEFDKFORb/1XWo20GcEJSQoLQ/wX4uvc02ZktiUXTCyNanRC3
 Z4Ic/5qF4YNFt8OgNvMhdsRSuziHt1X7u1SlucS0DLWwzH7KL7aM/+qyZe9+NxxXLCJC
 QNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QzNyzNw1RTs6fv96r1XDXih+5BkMWROuY0dQxLNAMKk=;
 b=YzzJrGUGGX5SqLppqi+azGYExXXNACNvu1Sj9uK3dtfzylySrveG+t8IhQ3Q6HH5Lc
 /q+WcSQla7YZd21b9w+ST9B8m4th27tpGvAdskizwpjJDUGDC5iA+wEc1AIAyryBjpOR
 XgYtFquEdDeEVirEyEMkTCRDNq8YmOG/mK4CHmnT20KwQPmNo0WkqHGAUOLamjP5a5JV
 wNYbRIr2XFK1sBVxXLaCRRnMagfdup9ziFATMeiGvuEJMyDCAwTtlkDpe7xx3NxLx1+I
 skNWlVA0OUsrJUbRZ48GSqU2U/0x5i2IO7fEQirrO56aK9ppM0+OGM7Y0+kL/4mtp/5w
 WZ/Q==
X-Gm-Message-State: AOPr4FW9dhY76j5eL5IL0CJxE7K8frBvDMeslBN4lL3ZQWSDMW7yOTZoPktGSYirPwufpQ==
X-Received: by 10.66.232.226 with SMTP id tr2mr611393pac.44.1461630939294;
 Mon, 25 Apr 2016 17:35:39 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id gp9sm32962067pac.8.2016.04.25.17.35.37
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 25 Apr 2016 17:35:38 -0700 (PDT)
Date: Tue, 26 Apr 2016 10:35:29 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc] Build a tftpboot friendly image.
Message-ID: <20160426103529.2c4ff3fa@camb691>
In-Reply-To: <1461273629-24609-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461273629-24609-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1461273629-24609-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 26 Apr 2016 00:35:43 -0000

On Thu, 21 Apr 2016 16:20:29 -0500
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> 
> Build a rootfs cpio uimage with everything along with the other
> images.

There isn't much to go with, are you saying you're building a initramfs image
that contains the full openbmc userspace so that a booting system doesn't need
access to the flash at all. This is exactly what I need right now, thankyou!!

I've applied this patch, and I THINK I booted with the right file... doesn't
appear to have worked, it still tried to mount the flash and because I can't
flash openbmc on my machine I got dropped into recovery shell.

Thoughts?

Thanks anyway...

Cyril

> ---
>  meta-phosphor/conf/machine/include/obmc-bsp-common.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
> index 60ed088..260cc90 100644
> --- a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
> +++ b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
> @@ -14,6 +14,7 @@ UBOOT_SUFFIX ?= "bin"
>  MACHINEOVERRIDES =. "openbmc:"
>  
>  IMAGE_FSTYPES += "overlay"
> +IMAGE_FSTYPES += "cpio.${INITRAMFS_CTYPE}.u-boot"
>  IMAGE_INSTALL += "u-boot-fw-utils"
>  
>  IMAGE_CLASSES += "obmc-phosphor-image_types_uboot"
