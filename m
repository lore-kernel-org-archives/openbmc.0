Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x242.google.com (mail-pa0-x242.google.com
 [IPv6:2607:f8b0:400e:c03::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qv4lw6MHDzDq5s
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2016 11:10:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=dIusTXqN; 
 dkim-atps=neutral
Received: by mail-pa0-x242.google.com with SMTP id yl2so2069pac.1
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2016 18:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3bVCWQ1+9NUz0ShNUs5rvcsQOWMYppxT/TxnoGKHEk=;
 b=dIusTXqNybJoQORcu/lQKAWGcTT2K6CBqhT21Ygos6e1W/IL9ikNFE12uMzZTh5GLW
 WmNjR/yiy4gsbp+yXl64LyjqR7+29jdRsr/QDe9npiWOA9KIkxrzgyKlLB89kP/Rg3/W
 I7bqJ+GclYv7nO3pjp3p1qIcIQvaTzejB2APL3BdSUa/7eg2VRpra7fnTwD58gRk8U6p
 7Vt+8UNvo27GGUdZ3W5Oeh7v/VuAFW1/jd3IcmbX28D2WYsAmofsJ0znsQaBkhdgAbHh
 dDRFiJn0dIOvA1zKifWoYGlijlBKsQwTufDQBFmA2bOktUsKl6gxmVjQppPwNUBCX2jg
 C1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3bVCWQ1+9NUz0ShNUs5rvcsQOWMYppxT/TxnoGKHEk=;
 b=bJ/ilCJyn2Vb2EXbhpq24W92LOPwwT7XZooi+Fa/PXgR90zrJ5U+7mIEdJvb2MV54T
 DJmzmalTxSSEmmifKYxgiGp3hO3Ugxbvzj4KPBFkWiPZ0HYAGH52xyWBwTIn4YUfaXuo
 LoX6r6efwdbBmuKRiXD8Z+tpdIpQ558VVsUcvzVKpH+cOWXJewl4a42RowM0pfY0RHFa
 UydcGuuQAXKp12RnikURt/rffd2X29iq9dqHsmQ8pmVXDywHlOJ4683aRSZ1lQ6xGMqk
 PRCzbOxvXpzVSufcNSbeZDF4byQmUFHXQwjaRkzD1WnBiFv67mSg55FWr9oPu8wsb1tW
 R4nQ==
X-Gm-Message-State: AOPr4FWMOB8/i7NTwhLO8/Ja12nG21lZjGsq2N9t5MmW/mS3/ZQYMb/L7C8vFD2kd3NsnA==
X-Received: by 10.66.100.197 with SMTP id fa5mr617331pab.25.1461633051000;
 Mon, 25 Apr 2016 18:10:51 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id rw2sm33031647pab.30.2016.04.25.18.10.49
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 25 Apr 2016 18:10:50 -0700 (PDT)
Date: Tue, 26 Apr 2016 11:10:42 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Patches <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH openbmc] Build a tftpboot friendly image.
Message-ID: <20160426111042.086edc4e@camb691>
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
X-List-Received-Date: Tue, 26 Apr 2016 01:10:53 -0000

On Mon, 25 Apr 2016 21:04:28 -0400
Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:

> Yep, thats what it does.  Did you use obmc-phosphor-image-<machine>.cpio.lzma.u-boot?
> 

Ah, nope that file doesn't appear to exist in my images directory. This must be
my fault, I don't really have any idea how to use bitbake more than what is on
the openbmc wiki, I hoped simply rerunning `bitbake openbmc-phosphor-image`
would have worked... doesn't appear to have created the file.

Thanks for the quick response.

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
