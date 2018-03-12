Return-Path: <arndbergmann@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22c; helo=mail-qt0-x22c.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QAs82iPN"; 
 dkim-atps=neutral
Received: from mail-qt0-x22c.google.com (mail-qt0-x22c.google.com
 [IPv6:2607:f8b0:400d:c0d::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400JvM5RbjzDr8K
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 00:37:35 +1100 (AEDT)
Received: by mail-qt0-x22c.google.com with SMTP id j4so18762510qth.8
 for <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=S5kaapUiuOcld+FW6FmEOo15M3N5apvAabeewBHwG7s=;
 b=QAs82iPNp+5yEvSSDf1WP9gR+fUNO4ZqFx1cNmZMfq741JkgO2D3HINwS5j6/9y0BK
 iKDYjkolcrrQdG926o/9C3lCIiDilX0An9Q5XP8jVtjLK4FOf7b02AAcGx000XfpVFEU
 2p5IYLHIj44InitjvXmjBYz4HG4Z2GflzeGJvysPV3SnnbFnpksWT+2iHBlZvwBLUKfI
 BQFdhV8Qx8VzaJ4EujoqH1zzf1FDn7bIRC6oIrWFkXc2UC8Jj1zk4FIzxD8gwzmOTrOs
 FsM2OzUnPKwMK+T6wgyTYF6D1RJ1ShZBkik269pNCyhvCHMp3nvJJ+VkgrRPWOHG4ERK
 2pSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=S5kaapUiuOcld+FW6FmEOo15M3N5apvAabeewBHwG7s=;
 b=Y800rUEF6t/qnMul5uG5P6QGBP9fHnBXsXvaggmCgNOr0+u3E4/I8ytMQRmfbmA3cq
 wAJoK0yZCsO6wysly0BmFiJIkTUw4S2V55w5eU1wrBCuEPD0UcGK6EURY6m4j0UHmgbr
 NvcBeLfCadqlRR7lcPS1DTQXlxE2cj13Z9gXBXzcxS1tCrT+blGaoT6uIzGN6kcXDgbB
 V/MfMNQNPGwzFTIvfVMiguC2VVx1w0Qf0SuCRvJPbStgYYrdpKJh/y5QgAzBoM67dqF7
 TPlYUAJaLyO6T393XanXa7RYKbKaEmB58MSkDbSLWtmjlY8dRtzJxf9aW4qhMg7mqrkO
 MVbg==
X-Gm-Message-State: AElRT7HMYE0YuWbTWJcm3gY0b4BuIzOqHfexCfecbkGedrZCyvF5SbGu
 Y0PMtnlwRITZ4snorsdoUwvKtpXd6qQkQktuIq4=
X-Google-Smtp-Source: AG47ELt/ReKh0kZXZIB6mQlnXmHp3mQeHUVkvUqdtEFWshyc4CbfATjaP9Jx76R7P3MF0x2tjwJPPJBNOvBn1O6upXc=
X-Received: by 10.200.56.182 with SMTP id f51mr12527725qtc.9.1520861852681;
 Mon, 12 Mar 2018 06:37:32 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.12.185.46 with HTTP; Mon, 12 Mar 2018 06:37:32 -0700 (PDT)
In-Reply-To: <CAP6Zq1jEAg2OrmnHzJdk9UBjPkDctu5oGHYyJ+QLBzN+E31sPw@mail.gmail.com>
References: <20180307162430.2664523-1-arnd@arndb.de>
 <CAFd5g45h3wAZtx-4oJb_uLbtDTzSsD6eLM5G0VF=3BBHNmW8YQ@mail.gmail.com>
 <CAP6Zq1jEAg2OrmnHzJdk9UBjPkDctu5oGHYyJ+QLBzN+E31sPw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 12 Mar 2018 14:37:32 +0100
X-Google-Sender-Auth: 6exdRStu4kyAXOEBZS-wRlbkHjw
Message-ID: <CAK8P3a2=0ZUqyhmKVa4u_VvOg4rtd6vUWdpRojfsoP3OSvGyeQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: npcm: add CONFIG_ARCH_MULTI_V7 dependency
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Avi Fishman <avifishman70@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Mar 2018 13:37:36 -0000

On Mon, Mar 12, 2018 at 2:28 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Hi Brendan,
>
> According to the last mail I have with Arnd can you modify the Kconfig
> as follow:
>
> +menuconfig ARCH_NPCM
> +       bool "Nuvoton NPCM Architecture"
> +       depends on ARCH_MULTI_V7
> +       select PINCTRL
> +
> +if ARCH_NPCM
> +
> +config ARCH_NPCM7XX
> +       bool "Support for NPCM7xx BMC (Poleg)"
> +       depends on ARCH_MULTI_V7
> +       select PINCTRL_NPCM7XX
> +       select NPCM7XX_TIMER
> +       select ARCH_REQUIRE_GPIOLIB
> +       select CACHE_L2X0
> +       select ARM_GIC
> +       select HAVE_ARM_TWD if SMP
> +       select HAVE_ARM_SCU if SMP
> +       select ARM_ERRATA_764369 if SMP
> +       select ARM_ERRATA_720789
> +       select ARM_ERRATA_754322
> +       select ARM_ERRATA_794072
> +       select PL310_ERRATA_588369
> +       select PL310_ERRATA_727915
> +       select MFD_SYSCON
> +       help
> +         General support for NPCM7xx BMC (Poleg).
> +
> +         Nuvoton NPCM7xx BMC based on the Cortex A9.
> +
> +endif

One more change is needed to avoid a link error without CONFIG_SMP:

diff --git a/arch/arm/mach-npcm/Makefile b/arch/arm/mach-npcm/Makefile
index c7a1316d27c1..34d51f9f207c 100644
--- a/arch/arm/mach-npcm/Makefile
+++ b/arch/arm/mach-npcm/Makefile
@@ -1,3 +1,4 @@
 AFLAGS_headsmp.o               += -march=armv7-a

-obj-$(CONFIG_ARCH_NPCM750)     += npcm7xx.o platsmp.o headsmp.o
+obj-$(CONFIG_ARCH_NPCM750)     += npcm7xx.o
+obj-$(CONFIG_SMP)              += platsmp.o headsmp.o

Can one of you send me a pull request or the full patch series on top
of the version I have in arm-soc?

      Arnd
