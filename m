Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qv5dp403WzDq5s
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2016 11:50:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=jMx0JWkL; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id yl2so77801pac.1
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2016 18:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DDq/m6kYGgAvi/SXzAArJRUkmmvkjuV2Q4CSIF0d8SY=;
 b=jMx0JWkLMsf7DBWc+UEjew8WFqxg96VQNh1KC/mTukcVN2mfwqLBSRqNwHayru4ULi
 HRkO/ne5WYQrES2YWP+KShWUeFYjlxhmkFA6yYcvMXAuUMB7Da7k+/O/tGp3giuhinIn
 vx4HID8CwSK3/M42CJj+uKrQuzdnE6GlWcu1/z2j/rqKaqAh27vgFsHkHG7LsVjcEiCo
 fjOXQTKra6j2SOKKkQtoaNQZqsggVG2w0FMr/ykA65/0c4u8QrAEad9fxl5qRrsKolJ4
 iD9C3TyxGfHhk/wzKvdwsNUA24vEyi/yyT6ruNYEYAYKWviW2PCWEzh27l/qjLscYebx
 4+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DDq/m6kYGgAvi/SXzAArJRUkmmvkjuV2Q4CSIF0d8SY=;
 b=f+BVVFZIYkzkJ5xRhXwKOimqk4Wy9UQHpnQkv4dbSBV5HdzioOzKfm1smqpxamm9Ng
 pmHQnpC9xzWE+37a348R+8/YG87e5qID1vIHJHNdSMi4S3TEcf8iosRGh3Ehe0S0toaV
 AAnQel8p7F8E33l/CdMnyc9+gEAJuNRIPrKoFpzHDNWuYQBXlkuA437j6brSOEj/C6Be
 atYDvi16Nd8eKKHArzL7lHMCmVsMie8gPO30h+RA4hHIJYnEEdjRXipP2nuF3Q87XjSc
 qWRMF+sQmKhfjOnKCvQGJHDytCWvIzNXpZm1ht391MhgVDs+Vm4Zz7+Wp/2AilTeTIIz
 KZxw==
X-Gm-Message-State: AOPr4FVAYlvqBKgal35HXsmf2S0YjBbaO6oJg30EMTU+SQIChVNCLLSbuu/yJtF/H98nRg==
X-Received: by 10.66.168.177 with SMTP id zx17mr814088pab.3.1461635436813;
 Mon, 25 Apr 2016 18:50:36 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id kl14sm33190623pab.23.2016.04.25.18.50.35
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 25 Apr 2016 18:50:36 -0700 (PDT)
Date: Tue, 26 Apr 2016 11:50:28 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Patches <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH openbmc] Build a tftpboot friendly image.
Message-ID: <20160426115028.6482189b@camb691>
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
X-List-Received-Date: Tue, 26 Apr 2016 01:50:39 -0000

On Mon, 25 Apr 2016 21:04:28 -0400
Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:

> Yep, thats what it does.  Did you use obmc-phosphor-image-<machine>.cpio.lzma.u-boot?
> 

So just did a clean build, I removed the entire build directory and started
again. Still no file of that name...

Just to confirm, I'm definitely looking for
`obmc-phosphor-image-<machine>.cpio.lzma.u-boot`? Based off your patch that is
what I would expect and I don't see any files that appear to be what I want
anyway...

Thanks,

Cyril

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
> > There isn't much to go with, are you saying you're building a initramfs
> > image that contains the full openbmc userspace so that a booting system
> > doesn't need access to the flash at all. This is exactly what I need right
> > now, thankyou!!
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
> >> diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
> >> b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc index
> >> 60ed088..260cc90 100644 ---
> >> a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc +++
> >> b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc @@ -14,6 +14,7 @@
> >> UBOOT_SUFFIX ?= "bin" MACHINEOVERRIDES =. "openbmc:"
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
