Return-Path: <arndbergmann@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xZK3K1GljzDqhB
 for <openbmc@lists.ozlabs.org>; Sat, 19 Aug 2017 22:27:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JJrPLlYN"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id e124so11723813oig.0
 for <openbmc@lists.ozlabs.org>; Sat, 19 Aug 2017 05:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=atbnL8usMX9aGAM4hFMgXndtiUBPfJ76RWu6KVLzk80=;
 b=JJrPLlYNYIUHTVpN9KlwY4sMrL1puR7ICOF3XK/hruQYraOeJizr4lFqYneM/aaNm0
 R1btA92VCKHTyLlm1y2ZU40/Obc/hxo/+O4OYHZDBqzrBEQ6GsmI8Puj7pA6ReQ5O1AO
 lBn7gU0IyqQOrDLX4WXIZuCt+oyiZ17XYeTXxdzoBsqz/HodxR84txI4qPuwsRTAYCeC
 h9jtdvfbFcC7UpkKYUpvwRAxEbnk1xLdrQudwYTIXI1SKTC1HQxyIWDyq/rhvtNKNEGp
 kLC/MVXEOhwjQ5k6g2m4GWyt/LSlPyrUwiZQNd9Vh+Ab7j8ybRg3EtHOT0k13h/Sxfyz
 DkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=atbnL8usMX9aGAM4hFMgXndtiUBPfJ76RWu6KVLzk80=;
 b=aTUdWnp4wdwKQ+pOr3nEFgbZscIAYG5FvCGHeHSsQhm/skzXU/akgosLenGPvb+6+K
 hl819aQkehD9PnhJVf/gpwGtTINs9YKdPohTCEQplIDkvlzEs0LxiRM9y6MS2L8ejc5t
 TDkSiRU4SeCJQaalJNjXIEQMjbM936E/QVgSxTZYkWHfPOM00FQC/3KuYBlj+ygqbJui
 UQutFxKUi0Y0xbO239Xfb5/U5Bb0CWC6ztVtMdJa2+5mtjkRehoXZali08UjoksIQ28N
 2xDGmgQsTKU/XwzQlkwO/B0GYbuQwS+mHV5nFNuMQL8Mp8GFoFxT1OzMHPsAzqNztpkP
 XRAA==
X-Gm-Message-State: AHYfb5jkPNATKw4iktYArkV1RtqtZBZKFXEMX2LNOSysKjCa4qYwipnZ
 nbowktovRn9N9ifvyFqXk1/O8USeeg==
X-Received: by 10.202.188.7 with SMTP id m7mr16009211oif.55.1503145658755;
 Sat, 19 Aug 2017 05:27:38 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.182.29.34 with HTTP; Sat, 19 Aug 2017 05:27:37 -0700 (PDT)
In-Reply-To: <201708190909.9GRNaEaj%fengguang.wu@intel.com>
References: <1502791207-26951-3-git-send-email-oleksandrs@mellanox.com>
 <201708190909.9GRNaEaj%fengguang.wu@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 19 Aug 2017 14:27:37 +0200
X-Google-Sender-Auth: dsENZEXEfL6mJpKYdmAiJs8RAfA
Message-ID: <CAK8P3a3H5QUBn9LDqqrwuES6UUH438B4asWXQ-PDhgb-oaWFHA@mail.gmail.com>
Subject: Re: [patch v3 2/3] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
To: kbuild test robot <lkp@intel.com>
Cc: Oleksandr Shamray <oleksandrs@mellanox.com>, kbuild-all@01.org, 
 gregkh <gregkh@linuxfoundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, 
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org,
 mec@shout.net, vadimp@maellanox.com, system-sw-low-level@mellanox.com, 
 Rob Herring <robh+dt@kernel.org>, openocd-devel-owner@lists.sourceforge.net, 
 Jiri Pirko <jiri@mellanox.com>, Richard Weinberger <richard@nod.at>, 
 uml-devel <user-mode-linux-devel@lists.sourceforge.net>
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
X-List-Received-Date: Sat, 19 Aug 2017 12:27:41 -0000

On Sat, Aug 19, 2017 at 3:21 AM, kbuild test robot <lkp@intel.com> wrote:
> Hi Oleksandr,
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v4.13-rc5 next-20170817]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Oleksandr-Shamray/drivers-jtag-Add-JTAG-core-driver/20170818-114739
> config: um-allyesconfig (attached as .config)
> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=um
>
> All errors (new ones prefixed by >>):
>
>    drivers/auxdisplay/img-ascii-lcd.o: In function `img_ascii_lcd_probe':
>    drivers/auxdisplay/img-ascii-lcd.c:386: undefined reference to `devm_ioremap_resource'
>    drivers/jtag/jtag-aspeed.o: In function `aspeed_jtag_init':
>>> drivers/jtag/jtag-aspeed.c:635: undefined reference to `devm_ioremap_resource'
>    collect2: error: ld returned 1 exit status

So arch/um now provides an ioremap() stub despite the absence of
CONFIG_HAS_IOMEM, but the respective devm_* interface from
lib/devres.c is not available.

We can either work around this for new drivers as we used to do for
ioremap() by adding a correct 'depends on HAS_IOMEM' Kconfig
dependency, or we could find a way for arch/um to provide stubs
for the additional functions as well.

      Arnd
