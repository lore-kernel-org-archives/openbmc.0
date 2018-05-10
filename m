Return-Path: <rdunlap@infradead.org>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="2Oh+25di"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hdVJ6mdPzF2Bv
 for <openbmc@lists.ozlabs.org>; Fri, 11 May 2018 02:10:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6jHl4PArWGT62OQTjIs1/jR+ziCp1Ank/4ivo/gNXM8=; b=2Oh+25did3RZqBlcmuJhvVfo9i
 mvG+h1GFXThEwSEcP+ofDJnx6weaU6PM48Il9FIryj31q59GfRJEFmYUavnGIHNy43BpUhJtkqQ+d
 73uYyA2XUIL7tPqvbFH4SONUCoQV6FQx6yWboKEA9+OUXKnerzcA8km1vG05DbX3zm5tgRotg+Qpg
 nB4zSh6AMXawKi74cp9gFo1/ndbcka3Abh/17OtwCebHUAY4NYsot6c/1wyrOJ7UtfWHt81f5cYid
 dBXxqcIELsOb+37ioEQiOSSaR7TDKWF76PgQ1Oy9jkoOlb7ErOaTqJPE61NXuWNAhohYSc96bs56C
 nPcHXVsg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=dragon.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGo8d-0001Oo-90; Thu, 10 May 2018 16:09:51 +0000
Subject: Re: [patch v19 1/4] drivers: jtag: Add JTAG core driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>, gregkh@linuxfoundation.org,
 arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jiri@resnulli.us, tklauser@distanz.ch, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com, robh+dt@kernel.org,
 openocd-devel-owner@lists.sourceforge.net, linux-api@vger.kernel.org,
 davem@davemloft.net, mchehab@kernel.org, Jiri Pirko <jiri@mellanox.com>
References: <1525967064-10760-1-git-send-email-oleksandrs@mellanox.com>
 <1525967064-10760-2-git-send-email-oleksandrs@mellanox.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a6ff3a11-3fe5-311e-3097-d6477ed86015@infradead.org>
Date: Thu, 10 May 2018 09:09:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1525967064-10760-2-git-send-email-oleksandrs@mellanox.com>
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
X-List-Received-Date: Thu, 10 May 2018 16:10:17 -0000

On 05/10/2018 08:44 AM, Oleksandr Shamray wrote:
> Initial patch for JTAG driver
> JTAG class driver provide infrastructure to support hardware/software
> JTAG platform drivers. It provide user layer API interface for flashing
> and debugging external devices which equipped with JTAG interface
> using standard transactions.

> ---
>  Documentation/ioctl/ioctl-number.txt |    2 +
>  MAINTAINERS                          |   10 ++
>  drivers/Kconfig                      |    2 +
>  drivers/Makefile                     |    1 +
>  drivers/jtag/Kconfig                 |   16 ++
>  drivers/jtag/Makefile                |    1 +
>  drivers/jtag/jtag.c                  |  273 ++++++++++++++++++++++++++++++++++
>  include/linux/jtag.h                 |   41 +++++
>  include/uapi/linux/jtag.h            |  105 +++++++++++++
>  9 files changed, 451 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/jtag/Kconfig
>  create mode 100644 drivers/jtag/Makefile
>  create mode 100644 drivers/jtag/jtag.c
>  create mode 100644 include/linux/jtag.h
>  create mode 100644 include/uapi/linux/jtag.h
> 
> diff --git a/drivers/jtag/Kconfig b/drivers/jtag/Kconfig
> new file mode 100644
> index 0000000..5e2c75b
> --- /dev/null
> +++ b/drivers/jtag/Kconfig
> @@ -0,0 +1,16 @@
> +menuconfig JTAG
> +	tristate "JTAG support"
> +	help
> +	  This provides basic core functionality support for jtag class devices

	                                                     JTAG class devices.

> +	  Hardware equipped with JTAG microcontroller which can be built

I'm having problems understanding the line above + first 1/2 of the line below.
Maybe something like:

	  Hardware that is equipped with a JTAG microcontroller can be
	  supported by using this driver's interfaces.

> +	  on top of this drivers. Driver exposes the set of IOCTL to the

	                          This driver exposes a set of IOCTLs to

> +	  user space for:

> +	  SIR (Scan Instruction Register, IEEE 1149.1 Data Register scan);

	                                              ^^^^? Instruction?

> +	  SDR (Scan Data Register, IEEE 1149.1 Instruction Register scan);

	                                       ^^^^^^^^^^^? Data?

> +	  RUNTEST (Forces IEEE 1149.1 bus to a run state for specified
> +	  number of clocks).
> +
> +	  If you want this support, you should say Y here.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called jtag.


-- 
~Randy
