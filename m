Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgBhM5X9dzDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 17:56:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=nXVMwENe; 
 dkim-atps=neutral
Received: by mail-qk0-x241.google.com with SMTP id n132so14929631qka.0
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 00:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1eXXvqLVLnCQqBewR0qiCh1YNNI+yA2tBe0gQ6IqcDk=;
 b=nXVMwENehr9H5MWky8QmusJcQouxtHMvtPMRmezNEmMd78DRdeuD05zjcyK/tvspF7
 5a9SLiLVotXYwl5DA3qAnbiQAKBicnhSCxcc84qaDsYe7HX5yoOhYkVOlU/NAlHX14cY
 qzAF4zk0TfTqtz0dl/+b4WXgonE982EWB8AelHmovnPAxEToTh4antFN73nD64ABPifX
 KHRS40ACcVpiUQmg1cVWQfHo7ACTGBpAWtxLOtw/6d3iVuocOLrpVbmR2p4w7w0j4fk0
 RcVGoDBaSIxnSQZ2bchqDUrw+HxRdt/3sCqmPgFWV4VkOr6hKbaBFLfOf8+skC6wuS2i
 1Pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=1eXXvqLVLnCQqBewR0qiCh1YNNI+yA2tBe0gQ6IqcDk=;
 b=iIJAAwb2vva6vdTQ0px8b9NXxLJ9IO1fGftvE04o60OpJuTXj0l74nQTEp/m1pwJ2Q
 HXfzobNUaiklvTjf87X4eWA7alkYAUxfueFmganMEnyhd7cS8/r/p9fS5mivII2EE83G
 m4EdF3iJ3JkbdNCgIJuXvEJtRQYzrFp8pRmBM9dLdsLXCm87idLqTe/Ayj00cDYEhwJx
 QOgPdYmKoABOinxmUNMOAHpbGshgXKxhNvtmcoE733Urh29ZHNvM2GXi4yHikKdH6yQv
 NzI6Wzi8+KUsKAfOoA11mHo4layO3v/rvE8rLLRT9zgRatmDMaBQ9XWgEtNUcR/MFLej
 vs8Q==
X-Gm-Message-State: ALyK8tKdXda2qaM2vLc70B968HZIY1rm8Qv+aa7NMUl1O9E3BCb4AmLVOmkwUE5roNWZ1YDAIKi/YJxoCKiZAg==
X-Received: by 10.55.152.198 with SMTP id a189mr16659413qke.208.1467273409301; 
 Thu, 30 Jun 2016 00:56:49 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 30 Jun 2016 00:56:29 -0700 (PDT)
In-Reply-To: <20160629224032.22118-2-openbmc-patches@stwcx.xyz>
References: <20160629224032.22118-1-openbmc-patches@stwcx.xyz>
 <20160629224032.22118-2-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Jun 2016 17:26:29 +0930
X-Google-Sender-Auth: q2sRZv2XXKAdKNNlFKH4p3d2sIg
Message-ID: <CACPK8Xf_8oBsgoPaESQ8ToBQVNKRQ1A-33kRwMjsFK40y2DUkQ@mail.gmail.com>
Subject: Re: [PATCH openbmc] Force OLDEST_KERNEL to 4.4.0
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
X-List-Received-Date: Thu, 30 Jun 2016 07:56:52 -0000

On Thu, Jun 30, 2016 at 8:10 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Patrick Williams <patrick@stwcx.xyz>
>
> This is the oldest kernel currently used by openbmc, so there is no
> point in compiling glibc support older kernels.

Sounds good. Buildroot does the same thing for our firmware builds on the host.

Is there any way to use the actual kernel version to set this variable?

>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>  meta-phosphor/conf/distro/openbmc-phosphor.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-phosphor/conf/distro/openbmc-phosphor.conf b/meta-phosphor/conf/distro/openbmc-phosphor.conf
> index f37e88c..b4e6f7a 100644
> --- a/meta-phosphor/conf/distro/openbmc-phosphor.conf
> +++ b/meta-phosphor/conf/distro/openbmc-phosphor.conf
> @@ -5,6 +5,7 @@ DISTRO_NAME = "Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
>  DISTRO_VERSION = "0.1.0"
>  TARGET_VENDOR="-openbmc"
>
> +OLDEST_KERNEL = "4.4.0"
>  GCCVERSION ?= "4.9.3"
>  IMAGE_FSTYPES += "cpio.gz"
>  IMAGE_FSTYPES += "squashfs-xz"
> --
> 2.9.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
