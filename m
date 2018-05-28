Return-Path: <rdunlap@infradead.org>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="fSTCxGGW"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40vpSq24LSzDr2n
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 06:32:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EznaW9tAgVq8RJuFMx4+05FhKxa8wsKfyNd4292FUEQ=; b=fSTCxGGWpDtlaBnEOg2R4GSmRh
 mQgaiXIqmjmOtwBdXO5Rc06iXHtB4kwh5YGF7R3KPma3M+v7wxSJtJL36GiXQCMxdR8PNC8BmJiIJ
 2Jur7UlvM9Y9C8XaedhxQy0aQQtr/cV4jmIqZ8NUMBzjg3p8GDugcp7k51/FkP3i+s4OhgEJ3SE5T
 VF5VnqTMnqPrTriXY3EzjqtEIuO/9ULAp03ZuHkR3cj31hakdpco9G3gxpBt1SaNIwxpLnYMwNBkn
 uYyqxkugmfozq4imDetMKvDVCvxGefuWIcMvBIEpu8LrRM1O8a1/RgcXyDI/Geui96pQwAe4kY+/Z
 wLNrckdw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNOoL-0007NE-Sa; Mon, 28 May 2018 20:32:11 +0000
Subject: Re: [patch v22 4/4] Documentation: jtag: Add ABI documentation
To: Oleksandr Shamray <oleksandrs@mellanox.com>, gregkh@linuxfoundation.org,
 arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jiri@resnulli.us, tklauser@distanz.ch, linux-serial@vger.kernel.org,
 system-sw-low-level@mellanox.com, robh+dt@kernel.org,
 openocd-devel-owner@lists.sourceforge.net, linux-api@vger.kernel.org,
 davem@davemloft.net, mchehab@kernel.org
References: <1527508827-30724-1-git-send-email-oleksandrs@mellanox.com>
 <1527508827-30724-5-git-send-email-oleksandrs@mellanox.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a2645e23-d50a-02c6-02a9-4570f0c5ba65@infradead.org>
Date: Mon, 28 May 2018 13:32:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1527508827-30724-5-git-send-email-oleksandrs@mellanox.com>
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
X-List-Received-Date: Mon, 28 May 2018 20:32:45 -0000

On 05/28/2018 05:00 AM, Oleksandr Shamray wrote:
> Added document that describe the ABI for JTAG class drivrer
> 
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---

> ---
>  Documentation/ABI/testing/jtag-dev |   27 +++++++++
>  Documentation/jtag/overview        |   28 +++++++++
>  Documentation/jtag/transactions    |  109 ++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                        |    1 +
>  4 files changed, 165 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/ABI/testing/jtag-dev
>  create mode 100644 Documentation/jtag/overview
>  create mode 100644 Documentation/jtag/transactions
> 

> diff --git a/Documentation/jtag/overview b/Documentation/jtag/overview
> new file mode 100644
> index 0000000..42b487a
> --- /dev/null
> +++ b/Documentation/jtag/overview
> @@ -0,0 +1,28 @@
> +Linux kernel JTAG support
> +=========================
> +
> +The JTAG is an industry standard for verifying hardware.

JTAG is an

> +JTAG provides access to many logic signals of a complex integrated circuit,
> +including the device pins.
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
> index 0000000..2abf833
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
> +open() opens JTAG device. Only one open operation per JTAG device
> +can be performed. Two or more open for one device will return error.
> +
> +Open/Close  device:
> +- jtag_fd = open("/dev/jtag0", O_RDWR);
> +- close(jtag_fd);
> +
> +ioctl()
> +-------
> +All access operations to JTAG devices performed through ioctl interface.

                         to JTAG devices are performed through

> +The IOCTL interface supports these requests:
> +	JTAG_IOCRUNTEST - Force JTAG state machine to RUN_TEST/IDLE state
> +	JTAG_SIOCFREQ - Set JTAG TCK frequency
> +	JTAG_GIOCFREQ - Get JTAG TCK frequency
> +	JTAG_IOCXFER - send JTAG data Xfer
> +	JTAG_GIOCSTATUS - get current JTAG TAP status
> +	JTAG_SIOCMODE - set JTAG mode flags.
> +
> +JTAG_SIOCFREQ, JTAG_GIOCFREQ
> +------
> +Set/Get JTAG clock speed:
> +
> +	unsigned int jtag_fd;
> +	ioctl(jtag_fd, JTAG_SIOCFREQ, &frq);
> +	ioctl(jtag_fd, JTAG_GIOCFREQ, &frq);
> +
> +JTAG_IOCRUNTEST
> +------
> +Force JTAG state machine to RUN_TEST/IDLE state
> +
> +struct jtag_run_test_idle {
> +	__u8	reset;
> +	__u8	endstate;
> +	__u8	tck;
> +};
> +
> +reset: 0 - run IDLE/PAUSE from current state
> +	   1 - go through TEST_LOGIC/RESET state before  IDLE/PAUSE

	                                         before IDLE/PAUSE


> +endstate: completion flag
> +tck: clock counter
> +
> +Example:
> +	struct jtag_run_test_idle runtest;
> +
> +	runtest.endstate = JTAG_STATE_IDLE;
> +	runtest.reset = 0;
> +	runtest.tck = data_p->tck;
> +	usleep(25 * 1000);
> +	ioctl(jtag_fd, JTAG_IOCRUNTEST, &runtest);
> +
> +JTAG_IOCXFER
> +------
> +Send SDR/SIR transaction
> +
> +struct jtag_xfer {
> +	__u8	type;
> +	__u8	direction;
> +	__u8	endstate;
> +	__u8	padding;
> +	__u32	length;
> +	__u64	tdio;
> +};
> +
> +type: transfer type - JTAG_SIR_XFER/JTAG_SDR_XFER
> +direction: xfer direction - JTAG_SIR_XFER/JTAG_SDR_XFER,

              drop ending comma                           ^

> +length: xfer data len in bits

s/len/length/

> +tdio : xfer data array
> +endstate: xfer end state after transaction finish
> +	   can be: JTAG_STATE_IDLE/JTAG_STATE_PAUSEIR/JTAG_STATE_PAUSEDR
> +
> +Example:
> +	struct jtag_xfer xfer;
> +	static char buf[64];
> +	static unsigned int buf_len = 0;
> +	[...]
> +	xfer.type = JTAG_SDR_XFER;
> +	xfer.tdio = (__u64)buf;
> +	xfer.length = buf_len;
> +	xfer.endstate = JTAG_STATE_IDLE;
> +
> +	if (is_read)
> +		xfer.direction = JTAG_READ_XFER;
> +	else
> +		xfer.direction = JTAG_WRITE_XFER;
> +
> +	ioctl(jtag_fd, JTAG_IOCXFER, &xfer);
> +
> +JTAG_SIOCMODE
> +------
> +If hardware driver can support different running modes you can change it.
> +
> +Example:
> +	unsigned int mode;
> +	mode = JTAG_XFER_HW_MODE;
> +	ioctl(jtag_fd, JTAG_SIOCMODE, &mode);


-- 
~Randy
