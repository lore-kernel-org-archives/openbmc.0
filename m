Return-Path: <sjg@google.com>
Received: from mail-oi0-x22f.google.com (mail-oi0-x22f.google.com
 [IPv6:2607:f8b0:4003:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYPbN2M4fzDvh9
 for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2016 14:47:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DBU87W4Q"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="ge+d3sbP";
 dkim-atps=neutral
Received: by mail-oi0-x22f.google.com with SMTP id b126so402686232oia.2
 for <openbmc@lists.ozlabs.org>; Tue, 06 Dec 2016 19:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=KPLAVjfwzJPXdHX2FItQ7VxTk1/amwJAM9OMZlKmfNQ=;
 b=DBU87W4Qo3y0gr/CBjpIeLr+jEgPjlcAV4o88l+iq/uc9FaJyt8XLoZDU/N7j/+EbJ
 WBJz+Axfl/h4qanmuuWKA1JAuO75PVlmryuPrNwiYevT4NzijcPGHUW7LERMwkfohpFb
 IpdJuTPCYzFZVs81VCOyrucfNppYSbJjkmUk0fQd276AzDBpyQeTguV41g2XfDiQVgLp
 3kevMkXij6iv1iJbacXR6xkFjzpxPCfLPP7DKMZ5VT3haILHpj2MvaD7v/R4GUKQjTpv
 TgnlqAE+4/1Zzdzj5oRfxdbfq4CVL8Y6YJXqumLsJ78HCfV/5qJyjcXgwjnk5jn6qGCm
 mZ1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=KPLAVjfwzJPXdHX2FItQ7VxTk1/amwJAM9OMZlKmfNQ=;
 b=ge+d3sbPEW8P0jj1XMQubfVgPGChiAecfMyaIquiLNdyebWcsO8kHQqlGT6Mn8I+NQ
 SB3RLiDKVmZ6+KagOsbd30bfLiGiTsiwi0MKuh+OAAriGrbjeDV8siggkjwRpfxgVcp4
 TzDcuzXQm91T0vz7jTDSO7vREjgibwFJVAUTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=KPLAVjfwzJPXdHX2FItQ7VxTk1/amwJAM9OMZlKmfNQ=;
 b=Uwi2XLAfpO6jCBBZbKz+XzzB5o5/ZeUSC23+YCfciPzSCILxLl8bhBA8DU9mYPRF7c
 93dv+QbsaHcXG5DW2/qHz+EQzSdwSlt5V9ZhuWUU9j66Qx7iIwQBp5QELfjpQSoCCuFq
 425Z5e/2QhzQP5OttvGJDG+3vSil8OHmRNOm7vWUAvhF2M7VXWVdYHOWVgsjFhQ48V4t
 cpZnirno9L7z6scqN3aK6y57y/6KgEbrVNPCnJn8YjpOjocurq1YzRnqScMbeXNLvanI
 C1prv8mkVSeGT3utJk7EGY8JL6Tc0EbYzQGROXTSEf/m0yeV2q+eztIX/TpZJWoLqH0U
 XZVw==
X-Gm-Message-State: AKaTC023qy/77iDoWy/kLqW5QE+3G1MmBuoLdqCg4gGzHdmOZtMltMimN1Tx7kRPCFIJln2wIfeH88drprQ3Aaiv
X-Received: by 10.157.8.46 with SMTP id 43mr37747280oty.54.1481082477305; Tue,
 06 Dec 2016 19:47:57 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.22.226 with HTTP; Tue, 6 Dec 2016 19:47:36 -0800 (PST)
In-Reply-To: <1480961822-6631-3-git-send-email-raltherr@google.com>
References: <1480961822-6631-1-git-send-email-raltherr@google.com>
 <1480961822-6631-3-git-send-email-raltherr@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 6 Dec 2016 22:47:36 -0500
X-Google-Sender-Auth: 9cnu7t8YOcdoYz8McUZGeIXHuMM
Message-ID: <CAPnjgZ3P_KRtE2RrwYUyy_BC__wDLHKULU3gB-0HDR8C17X6Eg@mail.gmail.com>
Subject: Re: [PATCH u-boot v3 2/3] bootm: relocate ramdisk if
 CONFIG_SYS_BOOT_RAMDISK_HIGH set
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 07 Dec 2016 03:48:01 -0000

On 5 December 2016 at 13:17, Rick Altherr <raltherr@google.com> wrote:
> In 35fc84f, bootm was refactored so plain 'bootm' and
> 'bootm <subcommand>' shared a common implementation.
> The 'bootm ramdisk' command implementation is now part of the common
> implementation but not invoke by plain 'bootm' since the original
> implementation never did ramdisk relocation.  Instead, ramdisk
> relocation happened in image_setup_linux() which is typically called
> during the OS portion of 'bootm'.
>
> On ARM, parameters to the Linux kernel can either be passed by FDT or
> ATAGS. When using FDT, image_setup_linux() is called which also triggers
> ramdisk relocation.  When using ATAGS, image_setup_linux() is _not_
> called because it mostly does FDT setup.
>
> Instead of calling image_setup_linux() in both FDT and ATAGS cases,
> include BOOTM_STATE_RAMDISK in the requested states during a plain
> 'bootm' if CONFIG_SYS_BOOT_RAMDISK_HIGH is set and remove the ramdisk
> relocation from image_setup_linux().  This causes ramdisk relocation to
> happen on any system where CONFIG_SYS_BOOT_RAMDISK_HIGH regardless of
> the OS being booted. Also remove IMAGE_ENABLE_RAMDISK_HIGH as it was
> only used by the now-removed code from image_setup_linux().
>
> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---
>  cmd/bootm.c     | 3 +++
>  common/image.c  | 7 -------
>  include/image.h | 6 ------
>  3 files changed, 3 insertions(+), 13 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

(when you send a new version you should put any review tags in your
commit, unless you make changes that you want re-reviewed)
