Return-Path: <rdunlap@infradead.org>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="koxT9JOr"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40l7n91t3JzF3gh
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 04:01:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xurd6BcuKGJ75DjgRyROHjPQuf98Q5fH7jOa7tA6jkM=; b=koxT9JOrSxMV8a87XK9ru0EIx
 GsW9LyrqkAHqDmfNRp8LLV0XYwxe360hjSfWtG/9wGBgPQRyVSFERSdSn5GUzMfWC5gKJbNnCzmJe
 HR6hsGxov5sjSjU+MjVj4WYe2BoFOFDhLv2BpRR5YLJ8gwtTshSQAPFIfr3wzq3v1luEwSbgeSBzN
 kTnbmtiKIQgrvhKEjMylCTzB3QXBzoBz3uoeNqY6LfzbYAayddOR6XezaON6A9MJChuNMvDVsCUOr
 j3jc5xjmMVUJ1CxGr42UY++1jOKHacprJOmYO/l6ILr+0QHO2qZElkYpQUayFCEnWhuTcO5voYAzp
 h3l74Zipw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIHmz-0004Gq-RI; Mon, 14 May 2018 18:01:37 +0000
Subject: Re: [patch v20 1/4] drivers: jtag: Add JTAG core driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>, gregkh@linuxfoundation.org,
 arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jiri@resnulli.us, tklauser@distanz.ch, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com, robh+dt@kernel.org,
 openocd-devel-owner@lists.sourceforge.net, linux-api@vger.kernel.org,
 davem@davemloft.net, mchehab@kernel.org, Jiri Pirko <jiri@mellanox.com>
References: <1526314803-3532-1-git-send-email-oleksandrs@mellanox.com>
 <1526314803-3532-2-git-send-email-oleksandrs@mellanox.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <338d958b-f3c3-15b8-32b9-9d30bfb348b5@infradead.org>
Date: Mon, 14 May 2018 11:01:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1526314803-3532-2-git-send-email-oleksandrs@mellanox.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 14 May 2018 18:01:51 -0000

On 05/14/2018 09:20 AM, Oleksandr Shamray wrote:

Hi,
Just a bit more Kconfig fixing below.

> ---
>  Documentation/ioctl/ioctl-number.txt |    2 +
>  MAINTAINERS                          |   10 ++
>  drivers/Kconfig                      |    2 +
>  drivers/Makefile                     |    1 +
>  drivers/jtag/Kconfig                 |   18 +++
>  drivers/jtag/Makefile                |    1 +
>  drivers/jtag/jtag.c                  |  274 ++++++++++++++++++++++++++++++++++
>  include/linux/jtag.h                 |   41 +++++
>  include/uapi/linux/jtag.h            |  105 +++++++++++++
>  9 files changed, 454 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/jtag/Kconfig
>  create mode 100644 drivers/jtag/Makefile
>  create mode 100644 drivers/jtag/jtag.c
>  create mode 100644 include/linux/jtag.h
>  create mode 100644 include/uapi/linux/jtag.h

> diff --git a/drivers/jtag/Kconfig b/drivers/jtag/Kconfig
> new file mode 100644
> index 0000000..ba72a2b
> --- /dev/null
> +++ b/drivers/jtag/Kconfig
> @@ -0,0 +1,18 @@
> +menuconfig JTAG
> +	tristate "JTAG support"
> +	help
> +	  This provides basic core functionality support for JTAG class devices

(end sentence above with '.')                                           devices.

> +	  Hardware that is equipped with a JTAG microcontroller can be
> +	  supported by using this driver's interfaces.
> +	  This driver exposes a set of IOCTL to the user space for

	                               IOCTLs

> +	  another commands:

	  various commands:
or
	  the following commands:
or
	  associated commands:

> +	  SDR: (Scan Data Register) Performs an IEEE 1149.1 Data Register scan
> +	  SIR: (Scan Instruction Register) Performs an IEEE 1149.1 Instruction
> +	  Register scan.
> +	  RUNTEST: Forces the IEEE 1149.1 bus to a run state for a specified
> +	  number of clocks or a specified time period.
> +
> +	  If you want this support, you should say Y here.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called jtag.
thanks,
-- 
~Randy
