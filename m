Return-Path: <rdunlap@infradead.org>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="HGsLYnI5"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wNFY26V1zDr4h
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 04:54:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fbkfEP+xhpryin3s1ch9hxPWLFA4E3pTb2gsESkxG20=; b=HGsLYnI5o+5m5by+0/IFnLPROc
 IQ4GxULdf0dSm5zCjbNjrDUdZBCHOOvaXAAvVpRe5omhbNRhlcqFBaZK8YtBAwt4kl3DG/6Kb+JI7
 arAyAK5UmLORlu+qh/B2WFIpkRL+HeJJfasfWRF00jTNzuKC04Xhf1tGmT0dDsLlKlqjqgyvldGKk
 s/5tuvxzYjvd/6g+p9HFA0+SrgCDL9HioLbxdavwin14HjZHZQYBcKwht008M21zwGCJ72IFAmzJ6
 9+E2EHZifyFJWJB/gcHr9LJlCorQY5U80HkIhHKiuAxhrmPFZTmUUqXjFz8sxWm/V2IBB1GH48MPH
 QKq8HeEg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNjlQ-0008Io-Ju; Tue, 29 May 2018 18:54:32 +0000
Subject: Re: [patch v25 4/4] Documentation: jtag: Add ABI documentation
To: Oleksandr Shamray <oleksandrs@mellanox.com>, gregkh@linuxfoundation.org,
 arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jiri@resnulli.us, tklauser@distanz.ch, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com, robh+dt@kernel.org,
 openocd-devel-owner@lists.sourceforge.net, linux-api@vger.kernel.org,
 davem@davemloft.net, mchehab@kernel.org
References: <1527605618-15705-1-git-send-email-oleksandrs@mellanox.com>
 <1527605618-15705-5-git-send-email-oleksandrs@mellanox.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b1afae1e-b93b-3b86-1a45-ab0e408087e1@infradead.org>
Date: Tue, 29 May 2018 11:54:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1527605618-15705-5-git-send-email-oleksandrs@mellanox.com>
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
X-List-Received-Date: Tue, 29 May 2018 18:55:01 -0000

On 05/29/2018 07:53 AM, Oleksandr Shamray wrote:
> Added document that describe the ABI for JTAG class drivrer

Sorry, there are still a few typos.  Please see below.

> ---
>  Documentation/ABI/testing/gpio-cdev |    1 -
>  Documentation/ABI/testing/jtag-dev  |   23 +++++++
>  Documentation/jtag/overview         |   27 +++++++++
>  Documentation/jtag/transactions     |  109 +++++++++++++++++++++++++++++++++++
>  MAINTAINERS                         |    1 +
>  5 files changed, 160 insertions(+), 1 deletions(-)
>  create mode 100644 Documentation/ABI/testing/jtag-dev
>  create mode 100644 Documentation/jtag/overview
>  create mode 100644 Documentation/jtag/transactions
> 

> diff --git a/Documentation/jtag/overview b/Documentation/jtag/overview
> new file mode 100644
> index 0000000..f179095
> --- /dev/null
> +++ b/Documentation/jtag/overview
> @@ -0,0 +1,27 @@
> +Linux kernel JTAG support
> +=========================
> +
> +JTAG is an industry standard for verifying hardware.JTAG provides access to

needs space:
                                              hardware. JTAG provides

> +many logic signals of a complex integrated circuit, including the device pins.
> +
> +A JTAG interface is a special interface added to a chip.
> +Depending on the version of JTAG, two, four, or five pins are added.
> +
> +The connector pins are:
> +	TDI (Test Data In)
> +	TDO (Test Data Out)
> +	TCK (Test Clock)
> +	TMS (Test Mode Select)
> +	TRST (Test Reset) optional
> +
> +JTAG interface is designed to have two parts - basic core driver and
> +hardware specific driver. The basic driver introduces a general interface
> +which is not dependent of specific hardware. It provides communication
> +between user space and hardware specific driver.
> +Each JTAG device is represented as a char device from (jtag0, jtag1, ...).
> +Access to a JTAG device is performed through IOCTL calls.
> +
> +Call flow example:
> +User: open  -> /dev/jatgX
> +User: ioctl -> /dev/jtagX -> JTAG core driver -> JTAG hardware specific driver
> +User: close -> /dev/jatgX

> diff --git a/Documentation/jtag/transactions b/Documentation/jtag/transactions
> new file mode 100644
> index 0000000..c5176a7
> --- /dev/null
> +++ b/Documentation/jtag/transactions
> @@ -0,0 +1,109 @@
> +The JTAG API
> +=============
> +
> +JTAG master devices can be accessed through a character misc-device.
> +Each JTAG master interface can be accessed by using /dev/jtagN.
> +
> +JTAG system calls set:
> +- SIR (Scan Instruction Register, IEEE 1149.1 Instruction Register scan);
> +- SDR (Scan Data Register, IEEE 1149.1 Data Register scan);
> +- RUNTEST (Forces the IEEE 1149.1 bus to a run state for a specified
> +number of clocks.
> +
> +open(), close()
> +-------
> +open() opens JTAG device.
> +
> +Open/Close  device:
> +- jtag_fd = open("/dev/jtag0", O_RDWR);
> +- close(jtag_fd);
> +
> +ioctl()
> +-------
> +All access operations to JTAG devices are erformed through ioctl interface.

                                             performed

> +The IOCTL interface supports these requests:
> +	JTAG_IOCRUNTEST - Force JTAG state machine to RUN_TEST/IDLE state
> +	JTAG_SIOCFREQ - Set JTAG TCK frequency
> +	JTAG_GIOCFREQ - Get JTAG TCK frequency
> +	JTAG_IOCXFER - send JTAG data Xfer
> +	JTAG_GIOCSTATUS - get current JTAG TAP status
> +	JTAG_SIOCMODE - set JTAG mode flags.



-- 
~Randy
