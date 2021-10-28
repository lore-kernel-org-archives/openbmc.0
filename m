Return-Path: <SRS0=COHF=PQ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF1BC433EF
	for <openbmc@archiver.kernel.org>; Thu, 28 Oct 2021 14:47:27 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B6AA60E8C
	for <openbmc@archiver.kernel.org>; Thu, 28 Oct 2021 14:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B6AA60E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7gx0gMqz3bYW
	for <openbmc@archiver.kernel.org>; Fri, 29 Oct 2021 01:47:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 276 seconds by postgrey-1.36 at boromir;
 Fri, 29 Oct 2021 01:46:58 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg7gQ1QtTz2xDg
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:46:57 +1100 (AEDT)
Received: from mail-wm1-f47.google.com ([209.85.128.47]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M42zo-1mg6gA2n5M-0000Zl for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021
 16:46:54 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 j35-20020a05600c1c2300b0032caeca81b7so4832949wms.0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:46:54 -0700 (PDT)
X-Gm-Message-State: AOAM530ZTZ1FB2xjeDv9l+o2u7XSSoJYPX9tdtrin1fuEMudz6a1r8zd
 A4orJCAB3apJRHCDHSkyzIcuu6LO9/CTaue4gjs=
X-Google-Smtp-Source: ABdhPJxA0GJLTQ+xD6zcoP0LSqb/ZsKcXqHw7zPvo6JWGp61LpzRYISo4RdkeFEDL6Qy0I1GY7j1Zdux6/P0jUeXB5Y=
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr13320221wmq.82.1635432414029; 
 Thu, 28 Oct 2021 07:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-5-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-5-lukas.bulwahn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Oct 2021 16:46:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2LhGWer=GXMW_KT-8=nqBeS0xhu6si7Z57WAF0wE_TUA@mail.gmail.com>
Message-ID: <CAK8P3a2LhGWer=GXMW_KT-8=nqBeS0xhu6si7Z57WAF0wE_TUA@mail.gmail.com>
Subject: Re: [PATCH 04/13] arm: drop an obsolete ifdef with the removed config
 PCI_HOST_ITE8152
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:rMb7MEybclNES+COQRgcinbAku6mrMFpSGwmH3pi39o+R/vi2Bk
 SuZ8Dg5ZhKei3jeK/mcqxMYSbBgtQ7FqrnkNdjSWBu0+eM9MlptO7jUbXgypjdAkrW4bBbv
 FgHng+mr66kqfZf7FQylFMrUKXxyB+2YRtJvp7yv61QSNaTrQO0/WQXsl9p2lY71lMmaTIo
 IQyt+eufliLBeqnyqgEcQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s77oUdQ87A0=:VveaSDqQsjLxUbhzBpRKwx
 ncUf6fZah7gtlA+aEE/UyCV2xrPpV4crUxDdUrG9wfqa/9J8r2TbgXbxwrvWvytDTEicquGB0
 aa9B+0AX77i9J/4kG5ISnZLLzzuERWKUJRxaNXcmlDgw7RNVOofScnJ42ankBDh0+ABKfGAUl
 C92iOR1JZQKaGQOwolsmd5Rf4TL0fkOFSP5D3XQVbVltp4/LH3I7+4Lb2uhPGo0IJwOxBErc4
 wq6w+DG7Aq5i8+NFMRc3eW3hQ21KdUr+ICFwD8Aasr1bVvJwmJXLvt9bQILVEvsnwwRVcwYWk
 /N3tVRReLle9VeUpLDA2J4dxAyDLh/0/6jb+B6txZ/3eIE3BVx6cAeHBggJ9PSNk9a7Mg2Ir5
 7sXZL+MyMXU7iYCzNFv+729XmciidPCbgbxkINq+HuE4EENWPNHH/H8r9CIM43y00VRAKAG/B
 7Wa0z74JjZvRr0YB8CFIWNe6LAeajsQHiHPogYp64JSjAmL1aFFpuBH/Y80fmY2Wrf/zEcxuS
 v+J6UHTt60RxzCf8bpLkZmjZF6a9rrg5pvvBtyTWz7iUu0PtUwy5auxComFoUL8hXVnlz5avm
 FTOvi7tkHUk03JIoaBXDC9GXIHZnLnB3i5PZyC4wVY1vS+UQwZ1iaKi60drdk+skEO2Bjg8tY
 sHqh/EbRnyAGY4pUCKmeaNkueJrcuOBdpmn4ZBt26SMTJSWRWE9HBu9zAKvL+/B2pt/c8YCvr
 kFnTdiHz1CcNTkg+WO+JKq7u01kQ5a9X3mXy/fBmn6+bGt5o6X5zDCa3S72PlZrixaibD+/Gl
 0kR7Peph3g5OqnEJCeRqI3pfuB75X/lht4TYkPvjwOoEwO5eeM=
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Tomer Maimon <tmaimon77@gmail.com>, kernel-janitors@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Sekhar Nori <nsekhar@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Krzysztof Halasa <khalasa@piap.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linusw@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Imre Kaloz <kaloz@openwrt.org>, Shawn Guo <shawnguo@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, Oct 28, 2021 at 4:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 6da5238fa384 ("ARM: 8993/1: remove it8152 PCI controller driver")
> removes the config PCI_HOST_ITE8152, but left a dangling obsolete ifndef
> in ./arch/arm/kernel/bios32.c.
>
> Hence, ./scripts/checkkconfigsymbols.py warns:
>
> PCI_HOST_ITE8152
> Referencing files: arch/arm/kernel/bios32.c
>
> Remove this obsolete ifndef.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I wonder if we should just remove this function and use the
(non-empty) default version instead.

96c5590058d7 ("PCI: Pull PCI 'latency timer' setup up into the core")
introduced that generic version, and I suspect the arm version
was left out by mistake, but it's not clear from that patch.

         Arnd
