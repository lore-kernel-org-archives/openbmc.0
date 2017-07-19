Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCBrW6qcvzDqm1
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 19:42:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PRuLTXcw"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id c13so2072097ywa.3
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 02:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Z/d0YHxLXKP8V2tHITsAqXy2kJAVF3Y2mJ/aAzVtiGc=;
 b=PRuLTXcwCcY/tRzP841HsE9vojaJxxwXSPzlNzA0BlEjcOtXGpWQRWcWgTuuSDAMXJ
 3SNjJeORxVyLWxHVgiiKXP0f9fSJC67yp7BBZMWYYFXjo1h5qE8JOurSmykji+8fBbxT
 B1GEafos3r3uCsL1uI12/kryE05T6oh5mWjtjIm0zGX2RR5tc8qmEEfz+T7PFly3HqIS
 jBkLQJlJ6DJx6iq5v88AoiPPSvoBmZj9BKSQSHtmhua3ibueA6hDTjOOG/tYN1RSXf7K
 dWVKP4u4CoA+Ojhxt1c2JKYVE2f14NbumUNFtDcLb8p9jyRrGFUvt2/a6Q1kJwiEYJeP
 h5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Z/d0YHxLXKP8V2tHITsAqXy2kJAVF3Y2mJ/aAzVtiGc=;
 b=T+bEs9S7ZVlNNYYfgQOhDTii2wlkBTwGlBIxq47NQrVCSL7Th/mZUUAjMQEStXntTI
 Ogvlw/RqUZrzhml+pIalFAEnVS7TSyvV/iH8dq810ZiFKt5xaqRVS21c6ejFv95iKpLq
 XifSfboFoRjgBbbX2i83EUOhA4ofgVSiEHDXWv6LMCs+01Inqb/VTlJJPykDmClGlBvE
 VHmMWetuZUgV9hYzHJoP08CGkAkXebzk7Rw2zy3gY1bTazqoX0NGXsAizs+nwV+80c4Q
 D15T6g+TzG+GVDO8CMsQ9VuKmJLeSpZs0hVaXfBmFN05ZDhlIoLcORgG7heDFYhoCXP+
 Mr2g==
X-Gm-Message-State: AIVw112p9YA1oIXCq08ph1+HqzXuXvBsix1L6PX9wa30W6vTNk0o573V
 F3f2gGWiTYEUaDUA10pMp/d/vfPIPdYPFnM=
X-Received: by 10.129.87.146 with SMTP id l140mr1394452ywb.210.1500457321814; 
 Wed, 19 Jul 2017 02:42:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 19 Jul 2017 02:41:41 -0700 (PDT)
In-Reply-To: <20170718204324.32945-3-cbostic@linux.vnet.ibm.com>
References: <20170718204324.32945-1-cbostic@linux.vnet.ibm.com>
 <20170718204324.32945-3-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jul 2017 19:11:41 +0930
X-Google-Sender-Auth: O0v4WvrN3X9hTC2_Vc1Xmhpw3mM
Message-ID: <CACPK8Xe_G6hEBp5ran1iRHhCvm5nQOhYYCrykh0y+kgjBFdLRQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: configs: aspeed: Add GPIO_KEYS_POLLED
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 19 Jul 2017 09:42:04 -0000

On Wed, Jul 19, 2017 at 6:13 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Configure to build gpio_keys_polled device driver.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Applied to dev-4.10.

Cheers,

Joel

> ---
>  arch/arm/configs/aspeed_g5_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
> index ad121ed..1868442 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -106,6 +106,7 @@ CONFIG_REALTEK_PHY=y
>  CONFIG_INPUT_EVDEV=y
>  # CONFIG_KEYBOARD_ATKBD is not set
>  CONFIG_KEYBOARD_GPIO=y
> +CONFIG_KEYBOARD_GPIO_POLLED=y
>  # CONFIG_INPUT_MOUSE is not set
>  # CONFIG_SERIO is not set
>  # CONFIG_VT is not set
> --
> 1.8.2.2
>
