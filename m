Return-Path: <rdunlap@infradead.org>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="SeMfM0yh"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hg8r3P1nzF157
 for <openbmc@lists.ozlabs.org>; Fri, 11 May 2018 03:25:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SABOTITqXMwKn7IAohtFjeH+cfej2rxVGRX4TCg20aM=; b=SeMfM0yhOMj169jkIfeB5qUCF3
 5qNWjj8ynqQrgoQwLr/ezURcO9mEI2hFsR+txMD73ZJhvT0EowMhzjq+BBKLEkODXzKyZNo8l7LWv
 +LumvhK4PTcCa/DiJejhYUbypkWlLPnga3jRaz2E6ALsax5E9aYtu85B0v0GUKfg/lI9jFJdsTkdW
 CDB//91EBfsbdjlurnt7PttCuc7xwua6HJoddnNS1lH9Hx3HIhBF/nWcgDDkBUTBujlogufcOSn3v
 JJLx0sFnMQLkJbFYrhzWQTgYwjCXqFOuihQxSsGbe2NFZTmEcQuQWYbKexRL72vVW+HIWRkOCR5FJ
 YG9pzaiA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGpJB-0001jX-Pc; Thu, 10 May 2018 17:24:49 +0000
Subject: Re: [patch v19 4/4] Documentation: jtag: Add ABI documentation
To: Oleksandr Shamray <oleksandrs@mellanox.com>, gregkh@linuxfoundation.org,
 arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jiri@resnulli.us, tklauser@distanz.ch, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com, robh+dt@kernel.org,
 openocd-devel-owner@lists.sourceforge.net, linux-api@vger.kernel.org,
 davem@davemloft.net, mchehab@kernel.org, Pavel Machek <pavel@ucw.cz>
References: <1525967064-10760-1-git-send-email-oleksandrs@mellanox.com>
 <1525967064-10760-5-git-send-email-oleksandrs@mellanox.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <987ed5f9-38c9-319e-ccd7-509b3a9eae1c@infradead.org>
Date: Thu, 10 May 2018 10:24:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1525967064-10760-5-git-send-email-oleksandrs@mellanox.com>
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
X-List-Received-Date: Thu, 10 May 2018 17:25:17 -0000

On 05/10/2018 08:44 AM, Oleksandr Shamray wrote:
> Added document that describe the ABI for JTAG class drivrer
> 
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v18-v19
> Pavel Machek <pavel@ucw.cz>
> - Added JTAG doccumentation to Documentation/jtag
> 
> v17->v18
> v16->v17
> v15->v16
> v14->v15
> v13->v14
> v12->v13
> v11->v12
> Tobias Klauser <tklauser@distanz.ch>
> - rename /Documentation/ABI/testing/jatg-dev -> jtag-dev
> - Typo: s/interfase/interface
> v10->v11
> v9->v10
> Fixes added by Oleksandr:
> - change jtag-cdev to jtag-dev in documentation
> - update Kernel Version and Date in jtag-dev documentation;
> v8->v9
> v7->v8
> v6->v7
> Comments pointed by Pavel Machek <pavel@ucw.cz>
> - Added jtag-cdev documentation to Documentation/ABI/testing folder
> ---
>  Documentation/ABI/testing/jtag-dev |   27 +++++++++
>  Documentation/jtag/overview        |   31 ++++++++++
>  Documentation/jtag/transactions    |  108 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 166 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/ABI/testing/jtag-dev
>  create mode 100644 Documentation/jtag/overview
>  create mode 100644 Documentation/jtag/transactions

> diff --git a/Documentation/jtag/overview b/Documentation/jtag/overview
> new file mode 100644
> index 0000000..e35afc0
> --- /dev/null
> +++ b/Documentation/jtag/overview
> @@ -0,0 +1,31 @@
> +Linux kernel JTAG support
> +=========================
> +
> +The JTAG (Joint Test Action Group) is an industry standard for hardware

just: JTAG
drop the "The"

maybe:                                                        for verifying
hardware designs
(although that's not quite what wikipedia says)

> +verifying designs and testing printed circuit boards after manufacture.
> +JTAG provides access to many logic signals of a complex integrated circuit,
> +including the device pins

                        pins.
Oh. Just drop the 2 lines above since they are repeated below.

> +
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
> +	TRST (Test Reset) optional.
> +
> +JTAG interface is supposed to have two parts - basic core driver and

                  is designed

> +hardware specific driver.
> +The basic driver introduces general interface which is not dependent of specific

                    introduces a general interface

> +hardware. It  provides communication between user space and hardware specific

                                                           and a hardware specific

> +driver.
> +Each JTAG device is represented as char device from (jtag0, jtag1, ...).

                                   as a char device

> +Access to JTAG device is performed through IOCTL call.

   Access to a JTAG device is performed through IOCTL calls.

> +
> +Call flow example:

   User: open /dev/jtagX

> +User (IOCTL) -> /dev/jtagX -> JTAG core driver -> JTAG hw specific driver

   User: close /dev/jtagX

> diff --git a/Documentation/jtag/transactions b/Documentation/jtag/transactions
> new file mode 100644
> index 0000000..91f7f92
> --- /dev/null
> +++ b/Documentation/jtag/transactions
> @@ -0,0 +1,108 @@
> +The JTAG API
> +=============
> +
> +JTAG master devices can be accessed through a character misc-device.
> +Each JTAG master interface can be accessed by using /dev/jtagN
> +
> +JTAG system calls set:
> +- SIR (Scan Instruction Register, IEEE 1149.1 Data Register scan);

     Why is SIR for                              Data Register?

> +- SDR (Scan Data Register, IEEE 1149.1 Instruction Register scan);

     Why is SDR for                       Instruction Register?

> +- RUNTEST (Forces the IEEE 1149.1 bus to a run state for a specified
> +number of clocks.
> +
> +open(), close()
> +-------
> +open() opens JTAG device. Only one open operation per JTAG device
> +can be performed. Twice and more open for one device will return error

                     Two or more opens for one device will return errors.

> +
> +Open/Close  device:
> +- open('/dev/jtag0', O_RDWR);

     open("/dev/jtag0", O_RDWR);

> +- close(jtag_fd');

     close(jtag_fd);

> +
> +ioctl()
> +-------
> +All access operations to JTAG device performed trougth ioctl interface.

                                 devices are performed through the ioctl interface.

> +It support another requests:

   The IOCTL interface supports these requests:

> +	JTAG_IOCRUNTEST - Force JTAG state machine to RUN_TEST/IDLE state
> +	JTAG_SIOCFREQ - Set JTAG TCK frequency
> +	JTAG_GIOCFREQ - GET JTAG TCK frequency
> +	JTAG_IOCXFER - send JTAG data Xfer
> +	JTAG_GIOCSTATUS - get current JTAG TAP status
> +	JTAG_SIOCMODE - set JTAG mode flags.
> +
> +JTAG_SIOCFREQ, JTAG_GIOCFREQ
> +------
> +Set/Get JTAG clock speed:
> +
	unsigned int frq;

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
> +end: completion flag

   endstate:

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
> +length: xfer data len in bits
> +tdio : xfer data array
> +endir: xfer end state after transaction finish

   endstate:

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
> +If hw driver can support different running modes you can change it.
> +
> +Example:
> +	int mode;

+#define JTAG_SIOCMODE	_IOW(__JTAG_IOCTL_MAGIC, 5, unsigned int)
so:
	unsigned int mode;

> +	mode = JTAG_XFER_HW_MODE;
> +	ioctl(jtag_fd, JTAG_SIOCMODE, &mode);
> 


-- 
~Randy
