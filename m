Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qvjKs00MBzDq60
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2016 11:38:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=DxEitwkL; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id i5so2982636pag.3
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2016 18:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OCzxy3ixrTavaWG9WRq3nOEuLo3zBeiuzAQ3bOx3WIE=;
 b=DxEitwkLylNob6vcN3Lw+iZiaAG7uu2Rjs454RZScz/cLRrHOxQzc+/vKPK+/MP8xg
 EaAFYCaMDfU71JnVAKAiosfP6ScKgFqAry7WO1NuS9vNkxQ7xEHIPkUHtGnry9GaRH4J
 Qo3GbtT4tCCPpjN7TFvotyoJ8oJD9U56Qyn4Jsy12bYZs7g0COFaokZf6x1LZqpOL2/j
 yGIK5KoOpP9qOqCAdjPURuVN92A5NlTDNIXbh1q3tVPLCW/rs0wxVY2XUIgwRC+OUgIw
 gwgDuKzUYDHbHFAUPbg4fXYhJhAaTYLSom3ahLdDlQ/azimPAU/GxI9nnfrDUPN+VZF0
 flgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OCzxy3ixrTavaWG9WRq3nOEuLo3zBeiuzAQ3bOx3WIE=;
 b=H8kSQ4MIVPZTF1SmGRcppnUH1X0po9yvNzBgm4+fI5SScxZAVcSXGi5rBsyXtZ6OZw
 kkVP2MTeVb1RxWXXEneJysaqCBlug3hHhCbn7X7U+FVStTZ/NlMTYHS7Sm/sjfAfroU5
 f6f75P0duKpJSR6mO3BqpWdhpczYJzVPkFVUxE7k0nNZbdrPhjubyHIiJ/pl+r5gnzYm
 gR6RDaQwqWOhzuaHNS8bOB6qTnE7zv891CgfbFycW3oKOboQxmyyczuD2DtSE0LEvEht
 g7l371dJKWL+jxSg5npipV9U7yuURhkUREb+rT/s32ZWrpSR+vkkx6B96hUmNtSEuF/c
 Itsg==
X-Gm-Message-State: AOPr4FV3hDglvmaZEoQu7FmgDjozyqBfQpEG3xZtIdw1r1Kp/jIRkplD7nuT+x5V43n7CA==
X-Received: by 10.66.193.202 with SMTP id hq10mr7957390pac.6.1461721135075;
 Tue, 26 Apr 2016 18:38:55 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b140sm1407866pfb.19.2016.04.26.18.38.53
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 26 Apr 2016 18:38:54 -0700 (PDT)
Date: Wed, 27 Apr 2016 11:38:45 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Patches <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH openbmc] Build a tftpboot friendly image.
Message-ID: <20160427113845.0ea38dfc@camb691>
In-Reply-To: <C4DFF7E3-7207-4F86-AB93-E36CF6B31DDC@fuzziesquirrel.com>
References: <1461273629-24609-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1461273629-24609-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160426103529.2c4ff3fa@camb691>
 <C4DFF7E3-7207-4F86-AB93-E36CF6B31DDC@fuzziesquirrel.com>
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
X-List-Received-Date: Wed, 27 Apr 2016 01:38:57 -0000

On Mon, 25 Apr 2016 21:04:28 -0400
Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:

> Yep, thats what it does.  Did you use obmc-phosphor-image-<machine>.cpio.lzma.u-boot?
> 

It appears I had my machine configuration missing a file.

The file spawns now, works great!

I'll add my tested by here

Tested-by: Cyril Bur <cyrilbur@gmail.com>

> -brad
> 
> > On Apr 25, 2016, at 8:35 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> > 
> > On Thu, 21 Apr 2016 16:20:29 -0500
> > OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:
> > 
> >> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> >> 
> >> Build a rootfs cpio uimage with everything along with the other
> >> images.
> > 
> > There isn't much to go with, are you saying you're building a initramfs image
> > that contains the full openbmc userspace so that a booting system doesn't need
> > access to the flash at all. This is exactly what I need right now, thankyou!!
> > 
> > I've applied this patch, and I THINK I booted with the right file... doesn't
> > appear to have worked, it still tried to mount the flash and because I can't
> > flash openbmc on my machine I got dropped into recovery shell.
> > 
> > Thoughts?
> > 
> > Thanks anyway...
> > 
> > Cyril
> > 
> >> ---
> >> meta-phosphor/conf/machine/include/obmc-bsp-common.inc | 1 +
> >> 1 file changed, 1 insertion(+)
> >> 
> >> diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
> >> index 60ed088..260cc90 100644
> >> --- a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
> >> +++ b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
> >> @@ -14,6 +14,7 @@ UBOOT_SUFFIX ?= "bin"
> >> MACHINEOVERRIDES =. "openbmc:"
> >> 
> >> IMAGE_FSTYPES += "overlay"
> >> +IMAGE_FSTYPES += "cpio.${INITRAMFS_CTYPE}.u-boot"
> >> IMAGE_INSTALL += "u-boot-fw-utils"
> >> 
> >> IMAGE_CLASSES += "obmc-phosphor-image_types_uboot"
> > 
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
