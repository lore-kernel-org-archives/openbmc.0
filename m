Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x22f.google.com (mail-yb0-x22f.google.com
 [IPv6:2607:f8b0:4002:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wx4dH1p5dzDr1k
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 20:13:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pcYGTsp8"; 
 dkim-atps=neutral
Received: by mail-yb0-x22f.google.com with SMTP id e201so26995203ybb.1
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 03:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=QItphcAUakjtftgbMQBlbjb5JDLB7aLcl4EZqVsSqTw=;
 b=pcYGTsp8dYpRgZVJpYRLkjPx1Ae5dsuhfE5lnc1AnCBcI8UqkA2vLsHWaHAtU/74/P
 W+8HMbtlYAQ1QuVhc86JS3zhZqXTyeU9d2edsV9scGnJUlK5INx0XCJD2kJDPYdgO+y1
 xo7su6Mn/R8JC2kLrDwUpsCA9ysWTD5SJxGiC43dkGsRMizud4iBGRo8mF7HaTnHekSM
 WrpB0v3ymmTV9ef8Ku+Ef8vHR0qv4SZu/haEGW5QBdWbTfkWOykv0GxKMAQYrwHnf3yu
 i0pwX/KRZ2r/q6Sf34bdz0nyh1lPvs3csd4bWXmgkOTRnIBHe67qLPGgT3GID9yM2p96
 M9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=QItphcAUakjtftgbMQBlbjb5JDLB7aLcl4EZqVsSqTw=;
 b=exdzh5PMEh12VKplWwZUD69vsPwySdtOsAbAXDLzJNZhl12GlRHZhNcK5kyZsnXrnm
 BFd32scqgP5nDB4hpYexCC/EGeermbHIVj1/E2oMYuXYpZJdbN1x+gk5l6pCiH5D/LgS
 iNM6ALNa9s4isP58OR2156xOBro77PPZB8gnoBXKD/AfbOjOfH/wyofgQFQ1kU8UtGV8
 r3Lyh/zQzsgShZuSCAMlCar+jHwRIxP5i3ARlg/EdmQaQ7xFM7UmmeT6lODML43zyD1R
 WxAamvr+D03xgE0aWYLEdq9LhANfolbdy5whV67MumsCUAPJ3H7lDR+2YMpvf3wuSoeE
 ijPg==
X-Gm-Message-State: AKS2vOzfc8q+VUbtqzYaUr+Pej9DZ3GQqQ6mqzsSgeEoP5utgST4K0nu
 uuf0jhMPmFixdk4GMguSx1rhgGilhw==
X-Received: by 10.37.88.193 with SMTP id m184mr14245789ybb.39.1498472000137;
 Mon, 26 Jun 2017 03:13:20 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Mon, 26 Jun 2017 03:12:59 -0700 (PDT)
In-Reply-To: <20170602091800.189904-1-c_mykolak@mellanox.com>
References: <20170602091800.189904-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 26 Jun 2017 19:42:59 +0930
X-Google-Sender-Auth: IQfk6n5bim0XcwuZ8ul0BkawrUY
Message-ID: <CACPK8XcdZ0L1oc+jC25RDccC78wxa4Ybt3X=RqRuHFjV2+Rs0Q@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add ast-g5 ncsi 2nd boot
 config.
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
X-List-Received-Date: Mon, 26 Jun 2017 10:13:23 -0000

On Fri, Jun 2, 2017 at 6:48 PM, Mykola Kostenok <c_mykolak@mellanox.com> wrote:
> Add ncsi 2nd boot aspeed g5 configuration header.
> It based on ast-g5-ncsi.h extended with defines for memtest.

I was hoping to merge these changes into the normal configurations,
instead of having a separate config.

The only difference is the presence of the SYS_MEMTEST defines.

> +/* platform.S settings */
> +#define        CONFIG_DRAM_ECC_SIZE            0x10000000
> +
> +#define CONFIG_SYS_MEMTEST_SIZE        128 * 1024 * 1024 /* 128MB */
> +#define CONFIG_SYS_MEMTEST_START       CONFIG_SYS_SDRAM_BASE
> +#define CONFIG_SYS_MEMTEST_END (CONFIG_SYS_MEMTEST_START + CONFIG_SYS_MEMTEST_SIZE)

I was looking at the u-boot tree, and it appears that these
SYS_MEMTEST defines are used by the mtest command, and the mtest
command is deprecated:


2. The "mtest" command.

   This is probably the best known memory test utility in U-Boot.
   Unfortunately, it is also the most problematic, and the most
   useless one.

   Because of these issues, the "mtest" command is considered depre-
   cated.  It should not be enabled in most normal ports of U-Boot,
   especially not in production.  If you really need a memory test,
   then see 1. and 3. above resp. below.

Are you sure that you want to enable the mtest command?

Cheers,

Joel


> +
> +#endif /* __AST_G5_NCSI_2BOOT_CONFIG_H */
> --
> 2.11.0
>
