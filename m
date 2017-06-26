Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x22a.google.com (mail-yb0-x22a.google.com
 [IPv6:2607:f8b0:4002:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wx4h71vR1zDr1k
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 20:15:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="n/61u4p2"; 
 dkim-atps=neutral
Received: by mail-yb0-x22a.google.com with SMTP id 84so27031967ybe.0
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=pDhc9VvOK5wU3tGKjfnak6Dl9Na+5LOeQuqXK0+Gf7Q=;
 b=n/61u4p27AQyAWPESWskg7DXVu8PGSzaYLwwSMmZUFBAfuviIzEN5h/hYJ5hcwWnrZ
 CTv7f4xAj0KQgPfj4B7Twv9S37DNfSo4Sz4K5dv5x68ZJPeqv4APztY0AZuDRJx0EeUL
 i9xKpjOZ6PSwL2EnTLcsqffZkmv3rLyYhk9Njj9B6+Cm+hcqIFFV9nuhrrr2Puj9qEP0
 BiH3atFWobX/9Yu4NZAIBlfytsXohNB9rQskQLuF1c0Cheb1AIYEjI9Tdl93t7WKKUMW
 homamTM4ib8FSh4Dxmr+0p1Qs0ojD1P2WTDkrpNSpFZv0V6DuQsAcUEIiGCOU7p7YIpK
 7HdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=pDhc9VvOK5wU3tGKjfnak6Dl9Na+5LOeQuqXK0+Gf7Q=;
 b=Ik0tNawDl8xwaNPeWQCGT14w1p3JxsJMq4tizj70pH6jO7MykQ/C2xhCaMDNj60bx/
 Ygvzkn9uAclNNSVVjUIx5sWE8UkuX+qRajOGdS/p63lja1xVmRN1tf50BvFbH8m3x2LX
 3MBsuYQJL4ou6iqm4ZOev35JL7AkyEnpoYt4pXFmGMIzU38yzVBdtuQw2diXAokadLO5
 7kTwmKGvqI+/pPx8/vf807KHwoUBhks0U3Hq2AB26loTXVlHOA6tUkObcwUqz2pH3KYG
 oGE1a0vRFFmnWyraKC8LCT+E+0npZ8X9truEnS74syD0FSjo0B8BmWjUAqnoRan02j3s
 RUEA==
X-Gm-Message-State: AKS2vOxFcRMHOxO8Qh3+DUz1IrOunyAApDKHcJWoP+JcRPo3LNzWzXeJ
 wqmHIaARHSky98gugs0Jc18PrNHvfrktJkDT6g==
X-Received: by 10.37.202.15 with SMTP id a15mr15277710ybg.182.1498472148971;
 Mon, 26 Jun 2017 03:15:48 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Mon, 26 Jun 2017 03:15:28 -0700 (PDT)
In-Reply-To: <20170602091701.189794-1-c_mykolak@mellanox.com>
References: <20170602091701.189794-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 26 Jun 2017 19:45:28 +0930
X-Google-Sender-Auth: 6S30lsZacxnhbbiKyhv_a_BEqxE
Message-ID: <CACPK8Xc4PJ-NmZfN=vi4t4Tc6yauZ=wp3vfkbNWiB4RdSWgEVg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Aspeed: ast-g5 change
 configuration order to allow 2-nd boot
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 26 Jun 2017 10:15:51 -0000

On Fri, Jun 2, 2017 at 6:47 PM, Mykola Kostenok <c_mykolak@mellanox.com> wrote:
> +config FIRMWARE_2ND_BOOT
> +       bool "Firmware second boot WD2 enable."
> +       default n

Looking at the most recent platform.S for the G5:

/******************************************************************************
 Disable WDT2 for 2nd boot function
 ******************************************************************************/
/*
#ifndef CONFIG_FIRMWARE_2ND_BOOT
    ldr   r0, =0x1e78502c
    mov   r1, #0
    str   r1, [r0]
#endif

By setting this option we disable this code, so we do not clear the
WDT2 status register.

The help text for your Kconfig option is confusing; I would think that
it means we enable WDT2.

Can you clarify?

Cheers,

Joel
