Return-Path: <hs@denx.de>
X-Greylist: delayed 583 seconds by postgrey-1.36 at bilbo;
 Wed, 23 Nov 2016 23:38:04 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tP21S3HctzDw9c
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 23:38:03 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 3tP1p10jyYz3hjYZ;
 Wed, 23 Nov 2016 13:28:09 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
 by mail.m-online.net (Postfix) with ESMTP id 3tP1p06DB8zvl4w;
 Wed, 23 Nov 2016 13:28:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
 port 10024)
 with ESMTP id 3GnIyljNQ0ai; Wed, 23 Nov 2016 13:28:04 +0100 (CET)
X-Auth-Info: vLbK9Je+CPTj9o9ug77JYDik+QMiSBnJxv8LezoiN1I=
Received: from localhost.localdomain (87.97.2.198.pool.invitel.hu
 [87.97.2.198])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 23 Nov 2016 13:28:04 +0100 (CET)
Subject: Re: [U-Boot] [PATCH u-boot 0/5] Aspeed I2C driver, using Driver Model.
To: maxims@google.com
References: <1479858976-139210-1-git-send-email-maxims@google.com>
Cc: sjg@google.com, u-boot@lists.denx.de, openbmc@lists.ozlabs.org
Reply-To: hs@denx.de
From: Heiko Schocher <hs@denx.de>
Message-ID: <58358B53.5030702@denx.de>
Date: Wed, 23 Nov 2016 13:28:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1479858976-139210-1-git-send-email-maxims@google.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 24 Nov 2016 00:20:54 +1100
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
X-List-Received-Date: Wed, 23 Nov 2016 12:38:04 -0000

Hello Maxim,

Am 23.11.2016 um 00:56 schrieb maxims@google.com:
> From: Maxim Sloyko <maxims@google.com>
>
> This series of patches is only meant for openbmc/u-boot tree.

If this series is not for U-Boot mainline, why do you post this patches
on the U-Boot Mailinglist?

bye,
Heiko
> It adds basic support for aspeed i2c. Only single master
> mode is supported with synchronous transfer.
>
> The style is inconsistent with U-Boot style guide in few places,
> but follows local style in those files.
>
> Maxim Sloyko (5):
>    aspeed/g5: Device Tree for ast2500, copied from openbmc/linux (include
>      file), plus minimal device tree configuration for ast2500 eval
>      board.
>    aspeed: Fixed incosistency in some SCU registers naming.
>    aspeed: Added function to calculate APB Clock frequency.
>    aspeed: Added function to configure pins for I2C devices.
>    aspeed: I2C driver.
>
>   arch/arm/dts/Makefile                       |    2 +
>   arch/arm/dts/aspeed-g5-evb.dts              |   28 +
>   arch/arm/dts/aspeed-g5.dtsi                 | 1278 +++++++++++++++++++++++++++
>   arch/arm/include/asm/arch-aspeed/ast_scu.h  |    6 +
>   arch/arm/include/asm/arch-aspeed/regs-scu.h |   73 +-
>   arch/arm/mach-aspeed/ast-scu.c              |   41 +-
>   drivers/i2c/Kconfig                         |    7 +
>   drivers/i2c/Makefile                        |    1 +
>   drivers/i2c/ast_i2c.c                       |  305 +++++++
>   drivers/i2c/ast_i2c.h                       |  143 +++
>   10 files changed, 1851 insertions(+), 33 deletions(-)
>   create mode 100644 arch/arm/dts/aspeed-g5-evb.dts
>   create mode 100644 arch/arm/dts/aspeed-g5.dtsi
>   create mode 100644 drivers/i2c/ast_i2c.c
>   create mode 100644 drivers/i2c/ast_i2c.h
>
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> U-Boot mailing list
> U-Boot@lists.denx.de
> http://lists.denx.de/mailman/listinfo/u-boot
>

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
