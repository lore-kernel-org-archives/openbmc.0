Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vGnk04l1TzDq5s
 for <openbmc@lists.ozlabs.org>; Mon,  6 Feb 2017 11:03:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sv0q0Lg7"; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id 96so5902791uaq.2
 for <openbmc@lists.ozlabs.org>; Sun, 05 Feb 2017 16:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=NyKahBHPNFs60evL2gkzUX6Oh4leADnfpJQ3W+bIqQA=;
 b=sv0q0Lg7AkEgVFqDQ+lG6phTyy0jO7xOSG6VSXw3sAMCdp5NFwtHB/b6DLbVMRAFpz
 tgC4vO3ij+Z71/+2DXx5500BwDs47+AvHKCrQjSMH9m3rrD8LsUSQC7oLsn0Lfxvf3dO
 9w6MKYZpzR0Glq6OY1NWuT6GEzwYcomsCZRBSt4qxXnlc3MWPqkqUlCND1QdDpJiwcPD
 NHUg+mmdkEaZKTbZzYCLvibuoCwfnTk3fgmcmFitllwLHG8ZPxqNv2w+DKHuuDpWJwMg
 0QjPjozP/kYSpm3rgVutqPk5vvz+vIE07tBXrBvTIo47TRTC0XdzGlEOdGk4qVrrqwIm
 z1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=NyKahBHPNFs60evL2gkzUX6Oh4leADnfpJQ3W+bIqQA=;
 b=nKU8PSkjFfpHG2qGyMw5HicnB0e0BfoVfKWYSCfSSI3HuS0fcdQJahZBwumueLifeB
 xn55l0XkedGfhuuzxLYNBrQYwRux/jdc0Vrmh97VsHXwJUMC74hVHabOMjIbVRDmNMl/
 eRV/aXAmg6ll6qeduOXkdpWnjFj+j2EGiZBlbwaaVFhhM/6Hkr0ffIxyHyT7O+eqTFZx
 ZNBLKRSmenC6UgjTl1r1iVbViI/oZl+8djJQJEXB+kJDpaxHZ5bDzxwKS+IzlI2NRIry
 bOICwaUIICY5/ACOHZkVKDI0RBsvKGruLgxCDETAlPduNXi3qX/rpI6j7kIsnFl6NDM8
 3DIQ==
X-Gm-Message-State: AIkVDXIT8XGP/ksZ3tW2ahVdj1BfK3b6RfCx2Iv2SO7M5F1Qje9KqrmBYrvNL9wt1TZRQq2BbEyHcd7rTnVjpQ==
X-Received: by 10.159.49.25 with SMTP id m25mr3875266uab.87.1486339398212;
 Sun, 05 Feb 2017 16:03:18 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Sun, 5 Feb 2017 16:02:56 -0800 (PST)
In-Reply-To: <20170203042013.2719-1-andrew@aj.id.au>
References: <20170203042013.2719-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Feb 2017 10:32:56 +1030
X-Google-Sender-Auth: Z5AHK6BS_B0-oPDdzUQIStVEi4s
Message-ID: <CACPK8Xeqd_9qHsVdF=yBmgv38VZZ2-zRZ9EBnX-HEUc2shGkzg@mail.gmail.com>
Subject: Re: [RESEND PATCH linux dev-4.7 00/14] Update GPIO and pinctrl to
 upstream
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 06 Feb 2017 00:03:21 -0000

On Fri, Feb 3, 2017 at 2:49 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Joel,
>
> This series gets the GPIO and pinctrl subsystems of dev-4.7 into the same state
> as upstream. A handful of patches reset things back to mainline, and then
> patches applied by the GPIO and pinctrl maintainer are cherry-picked in.
>
> The series has three checkpatch warnings, one for "lack" of Kconfig symbol
> description in 2/14 (which simply resets some state to match mainline), a
> second for a duplicate S-o-B tag in 5/14 and another regarding commit message
> line length in 6/14. I've added my S-o-B twice in 5/14 because the patch
> doesn't backport cleanly and I had to remove some code. The commit message
> warning in 6/14 is for a link to the upstream patch and isn't appropriate to
> wrap.
>
> Other than that, it builds with aspeed_g{4,5}_defconfigs and boots in Palmetto
> and Romulus QEMU machines. The cherry-picked patches have been tested on
> Palmetto and AST2500EVB hardware.

Thanks. Series applied to dev-4.7.

Cheers,

Joel

>
> Please review.
>
> Cheers,
>
> Andrew
>
> Andrew Jeffery (13):
>   gpio: aspeed: dt: Reset bindings to mainline
>   gpio: aspeed: Reset to mainline
>   aspeed: dt: Mark GPIO controller as interrupt-controller
>   gpio: aspeed: Add banks Y, Z, AA, AB and AC
>   gpio: aspeed: Remove dependence on GPIOF_* macros
>   aspeed: g5: dt: Update GPIO pin range to mux banks Y, Z, AA, AB, AC
>   pinctrl: aspeed: Reset to mainline
>   pinctrl: aspeed: dt: Fix compatibles for the System Control Unit
>   pinctrl: aspeed: Read and write bits in LPC and GFX controllers
>   pinctrl: aspeed-g4: Add mux configuration for all pins
>   pinctrl: aspeed-g5: Add mux configuration for all pins
>   pinctrl: aspeed: Fix kerneldoc return descriptions
>   pinctrl: aspeed: g4: Fix mux configuration for GPIOs AA[4-7], AB[0-7]
>
> Joel Stanley (1):
>   gpio: aspeed: Make bank names strings
>
>  .../devicetree/bindings/gpio/gpio-aspeed.txt       |  20 +-
>  .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |  91 ++++++-
>  arch/arm/boot/dts/aspeed-g4.dtsi                   |   1 +
>  arch/arm/boot/dts/aspeed-g5.dtsi                   |   3 +-
>  drivers/gpio/Kconfig                               |  13 +-
>  drivers/gpio/gpio-aspeed.c                         | 299 ++++++++++++++-------
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  63 ++---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  76 ++++--
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c            | 216 +++++++--------
>  drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  48 ++--
>  10 files changed, 507 insertions(+), 323 deletions(-)
>
> --
> 2.9.3
>
