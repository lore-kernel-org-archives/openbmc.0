Return-Path: <boris.brezillon@bootlin.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bootlin.com
 (client-ip=62.4.15.54; helo=mail.bootlin.com;
 envelope-from=boris.brezillon@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by lists.ozlabs.org (Postfix) with ESMTP id 437ffq6Lk9zDqNb
 for <openbmc@lists.ozlabs.org>; Mon,  3 Dec 2018 20:22:55 +1100 (AEDT)
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 2861F20CFA; Mon,  3 Dec 2018 10:22:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.bootlin.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
 URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.2
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 by mail.bootlin.com (Postfix) with ESMTPSA id BB91E206A1;
 Mon,  3 Dec 2018 10:22:40 +0100 (CET)
Date: Mon, 3 Dec 2018 10:22:40 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, robh+dt@kernel.org, mark.rutland@arm.com, yuenn@google.com,
 venture@google.com, brendanhiggins@google.com, avifishman70@gmail.com,
 joel@jms.id.au, linux-mtd@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 0/2] SPI-NOR add NPCM FIU controller driver
Message-ID: <20181203102240.79a86a26@bbrezillon>
In-Reply-To: <20181203091456.454030-1-tmaimon77@gmail.com>
References: <20181203091456.454030-1-tmaimon77@gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 03 Dec 2018 23:19:35 +1100
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
X-List-Received-Date: Mon, 03 Dec 2018 09:23:00 -0000

On Mon,  3 Dec 2018 11:14:54 +0200
Tomer Maimon <tmaimon77@gmail.com> wrote:

> This patch set adds Flash Interface Unit(FIU) SPI-NOR
> support for the Nuvoton NPCM Baseboard Management 
> Controller (BMC).
>     
> The FIU supports single, dual or quad communication interface.
>     
> the FIU controller can operate in following modes:
> - User Mode Access(UMA): provides flash access by using an
>   indirect address/data mechanism.
> - direct rd/wr mode: maps the flash memory into the core
>   address space.
> - SPI-X mode: used for an expansion bus to an ASIC or CPLD.
> 
> The NPCM750/730/715/710 supports up to three FIU devices:
> - FIU0 supports two chip select.
> - FIU3 supports four chip select.
> - FIUX supports two chip select.
> 
> The NPCM FIU driver tested on NPCM750 evaluation board.
> 
> Tomer Maimon (2):
>   dt-binding: mtd: add NPCM FIU controller
>   mtd: spi-nor: add NPCM FIU controller driver
> 
>  Documentation/devicetree/bindings/mtd/npcm-fiu.txt |  64 ++
>  drivers/mtd/spi-nor/Kconfig                        |   8 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/npcm-fiu.c                     | 930 +++++++++++++++++++++

We are currently trying to move all SPI NOR controller drivers out of
drivers/mtd/spi-nor. Can you try to implement the spi-mem interface [1]
and place your driver in drivers/spi/. 

[1]https://elixir.bootlin.com/linux/v4.20-rc5/source/include/linux/spi/spi-mem.h#L185
