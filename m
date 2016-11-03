Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8Qpx2bFZzDvPX
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 11:30:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=kL1a9ddv; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id n85so3042184pfi.3
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 17:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=message-id:subject:from:to:date:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Sb5qAY6ILdkme7PHTO3CawjZQ1Dbtk6uGHKoFg+CZqI=;
 b=kL1a9ddvEI97ykY8+qBJINAy7dAmopEnoYrdNQQNzsUJtaPQMPZxOHtkM1PCJGQejL
 osj8VRROSOOMA1LCQHlLegYfurenA+4y+Qo+Nf8eRLwYTy2lZf3cXJfLQ9cZce8Fm+oN
 +BmU7YCJFOwUbSo8LR5IuLSLFcBdH/ciRWuGMCzgGDDvGGjBLTvxDO0R7IhD5pYO5Zdx
 zCJbXxNqGWKhmvsbiNyZ1OFfEQmNRb6Y8Lm4EEzb8+bTB5fdKw4IK6xHwGTeoYL9ybGp
 tvlpNKuRRpo1rbe1LEQhM+1jvNFSAGhsQ/Hs4i5ETSFCuCW01Y4slm6p75Q6PzaNU+wA
 tBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sb5qAY6ILdkme7PHTO3CawjZQ1Dbtk6uGHKoFg+CZqI=;
 b=KWJwCypoRbRq4FNK303pw5O+6+dwJMj7xTk8UW4Ajveq1dFAUDIgdPoxGCYtxFrmrg
 SlLAlDvVjs9hbMWQD/jvSZEpGUYxIxXjmDtHvIHGf1dCFmDQV1CeI3HaZ+gepjF6no+E
 fj53oH6rBktOlryhfCxqN3aumqrZ6ZBbH1WHhSegmKclpaOG8P05Q56Q3s/yxWs+CreY
 nrrrZ2zxFOC12zFY51Nm1GiF9kcWK3VdBoQrDPTt4hKoXliGYp4sPakpKXcj4ozhFk/m
 5v8i1F/fhXJrxK9syKudaUbK95Q7pfgqjnUmx18G2DFKJJdNyAES1LJQ4SgCFRC2KLzn
 n6QQ==
X-Gm-Message-State: ABUngvf0pEzKDgqhg1GlLEyrkB/cAUVLK4aVMKUtCM7lJw8SzlVGA2JYaP+JNZucrPZX6w==
X-Received: by 10.99.56.22 with SMTP id f22mr9749639pga.72.1478133015694;
 Wed, 02 Nov 2016 17:30:15 -0700 (PDT)
Received: from cyril.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id af14sm7448070pac.13.2016.11.02.17.30.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Nov 2016 17:30:15 -0700 (PDT)
Message-ID: <1478133011.728.5.camel@gmail.com>
Subject: Re: [PATCH linux dev-4.7 0/8] BT driver sync up
From: Cyril Bur <cyrilbur@gmail.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Thu, 03 Nov 2016 11:30:11 +1100
In-Reply-To: <1477465067-19034-1-git-send-email-clg@kaod.org>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 03 Nov 2016 00:30:17 -0000

On Wed, 2016-10-26 at 08:57 +0200, Cédric Le Goater wrote:
> Hello,
> 
> Here is a serie syncing the OpenBMC kernel with the BT driver merged
> in mainline linux. This kernel needs an updated version of btbridged
> :
> 
>      https://github.com/legoater/btbridge/commits/master
> 
> The last two patches add a request expiry list and some configuration
> through sysfs. These are for review only as they need to be sent to
> mainline first.
> 

Tested this series with patched btbridge on palmetto, host comes up
with no problems.

> Thanks,
> 
> C.
> 
> Cédric Le Goater (8):
>   Revert "misc: Add Aspeed BT IPMI host driver"
>   ARM: aspeed: remove previous definitions in default config
>   ARM: dts: aspeed: remove previous iBT definitions
>   ipmi: add an Aspeed BT IPMI BMC driver
>   ARM: aspeed: Add defconfigs for CONFIG_ASPEED_BT_IPMI_BMC
>   ARM: dts: aspeed: Enable BT IPMI BMC device
>   ipmi: maintain a request expiry list
>   ipmi: add a sysfs file for configure maximum response time
> 
>  .../bindings/char/ipmi/aspeed,ast2400-bt-bmc.txt   |  23 +
>  arch/arm/boot/dts/aspeed-g4.dtsi                   |   2 +-
>  arch/arm/boot/dts/aspeed-g5.dtsi                   |   2 +-
>  arch/arm/configs/aspeed_g4_defconfig               |   2 +-
>  arch/arm/configs/aspeed_g5_defconfig               |   2 +-
>  drivers/Makefile                                   |   2 +-
>  drivers/char/ipmi/Kconfig                          |   8 +
>  drivers/char/ipmi/Makefile                         |   1 +
>  drivers/char/ipmi/bt-bmc.c                         | 668
> +++++++++++++++++++++
>  drivers/misc/Kconfig                               |   5 -
>  drivers/misc/Makefile                              |   1 -
>  drivers/misc/bt-host.c                             | 427 ---------
> ----
>  include/uapi/linux/Kbuild                          |   2 +-
>  include/uapi/linux/{bt-host.h => bt-bmc.h}         |  12 +-
>  14 files changed, 712 insertions(+), 445 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/char/ipmi/aspeed,ast2400-bt-bmc.txt
>  create mode 100644 drivers/char/ipmi/bt-bmc.c
>  delete mode 100644 drivers/misc/bt-host.c
>  rename include/uapi/linux/{bt-host.h => bt-bmc.h} (55%)
> 
