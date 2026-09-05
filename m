Return-Path: <openbmc+bounces-2566-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF042C624DB
	for <openbmc@archiver.kernel.org>; Sat,  5 Sep 2026 12:31:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hcXkL4BM5z2yvC;
	Sat, 05 Sep 2026 22:31:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788611466;
	cv=none; b=DNkoFxzoYHpjr9R4tEpELLQS17UhYfmIkqvGjzhMi/6an941/MrS7GIxHw7vcmmIPrw5id6jNlrpDeAEGXamoWFuvALzx1yAWDCS0c/ODOHX1CZ3U3sD/NGGY95phORcEkF06Oz/TnVo7NZMqjKjdDFHLUCJRpbgX+dcrbXmMjFWO10YdGs3m1NJJcZqJxZ/XCPMQs7sr4xiWlOa2paAamycKdg55sLP2NQIskaFpO1T2N8VwSo40xpUNWm3qToTUzqFwDtALXAu1q3BAtaRN6/rKiXN3emsN9WTjmIhEePu/q0wS6DCGqxUxX4rnb+4KHSGfcQGUSS6UcQY4oFhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788611466; c=relaxed/relaxed;
	bh=nF28nbshD2BPWEClB77TT3QHqkwal9Tdd0g3hy+SqKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G50tm6TC7eVPo2vmWd7/B5LTCaqTkewvuc2oE6svzGX5ZqrayGzPoy8zCLZq3jnb2uOKbc5svQ1GrgeJpcKkJsNlyKXzEOjxQEaMLS58S/q+xbChy83KBTIQEG1WYH8CJMJuR0HfbPbx/Lxp5RJbr0/cC9RKXKzpZe8ESiY2UqDapPwESWqPg65//0rjz6WBxamO9AHI9Z6lxNOwHLztiy6JM9YQtFp0KNmSPDsnKtt85YuB61i5Z4D6NpEbkALtKDFd0mY10OlW/78H1P1Lcq3sVe0XHRDie23Xo9sScFI5AR5qNv/Mppj0wRSTqkLMgN84WBTiMe/GC46Zo1DLRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pzsjrlt8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=julianbraha@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pzsjrlt8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=julianbraha@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hcXkJ2b2Mz2ytj
	for <openbmc@lists.ozlabs.org>; Sat, 05 Sep 2026 22:31:03 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-485850cbac3so1231102f8f.3
        for <openbmc@lists.ozlabs.org>; Sat, 05 Sep 2026 05:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611455; x=1789216255; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nF28nbshD2BPWEClB77TT3QHqkwal9Tdd0g3hy+SqKw=;
        b=Pzsjrlt8LJZs0HBTVQjfGVlcNwOhC1Ga1vOhBGZvg18drtblvTbKgF8UlIH9tvrXJD
         pnbPq42m2yXMRMjgCtBcmyISWXCOK+I8i0in2K7OxInjwRRfHgKPnvVcXHruy1DnM9wb
         PWlMPx1SqwWgXJPCqhhWk2PgMWhX2KCaNRSW26JE4WyKALUOsmj3CfZfROWiRjXi1xGK
         7lzp1cpohS0WZOmoDQJwAjuyAtrw/vdET6agoOEKyMKZzJwvSDQY51AHAArbJdHynYuT
         utZ5VKh3KCxpAW0sfQOe9ByhCMm0m3HJ8uiS090HZAJmABAFCRUfOwAJysGAI6DTtMEL
         02kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611455; x=1789216255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nF28nbshD2BPWEClB77TT3QHqkwal9Tdd0g3hy+SqKw=;
        b=OlBIKdyRa9LyZHZMgLSeKkkeesAKtGVpBoUhKD5nWcHLnloul/0Dbq0Ot6D21pC1a/
         WjK8ur/FK1NlKidoGlwjG2+bxcenpgb5hV2/o659YSTPcg4V3S10nm6tft0J6wfZyKTY
         2ZczDFnWuxb6uNJmvLI9+wHlWvecaOdXXNxUhKZHKSnrNOaW5YRgXsfu5wjG9PuHDlJJ
         uUqcr/AfyvvhbGj4nfRua5ri0zvMt6MY9GCD+YX3vQPLdyNF//ejLBamzUnkxEM1s1Aa
         yZlN5xZ3wJU/N4jGq/PpmoZ2/Y+p1eUTFxKJdSFUK1iit5VcRuqmETL2hVLSu+dfkP4v
         XepA==
X-Forwarded-Encrypted: i=1; AKwUvByG645DqLJzfT1c3jVfXbEbsl3sDtlFOVtGt6RCwM7iTjJtf4rx193J5jKnVQA64PHmyxd8QFZO@lists.ozlabs.org
X-Gm-Message-State: AFuF++leXA7vyNcb26uJS90cULmvp4Bmd/yA7U7igUS956AVrPK2GYnz
	2POGs6q3Ru/dXrAIQSMgi4bU6g5lPITCpRASiDgIcBOMCgnOgeo/qKSv
X-Gm-Gg: AYBFou0INEqz5nHd2Z8FAL+ggFeXsMWtK7Jaa/pXzn77SuekJsOSXqc1PUkRN/slfTv
	3/JC/QIZ58VtLOUL+YWbMUn67OhCUu+iV/vorCjQobS5R/CS93oQ35iJ9wNC9ES7pXjc0Y344Bz
	jzHZLImzf0+ldY+s2MH5jTH5UrXbifIT205+V+dr1rWj/xIfBSqQMNmLfAwqIL4U2CGesqVtO6B
	L3ULu2cn5yb6augtuNbzGt3WPAsoOmIzzt0RQKre1ZCIcDfSNUm9ZXKezEYBpp4QYCYy9RfV8va
	QigUu3C8F/1u0TadID7vVJ3ZAbe9Cfe2X7qOwBWVoHvH9WefuHRnSs42/O60CHKI2IhHdQ/16U7
	uIY4N1eFqDcHnhurVpJZaT4EfEu+NkG5KRKcy36TU6JbMO7le/T/3vu0mN1dklwJAXdO0dP+3/l
	95zPQwoDPT7lweC+PQLsk2co70abnONpfg5TvH5TfbGlxwG8/cku9fhNnGq12aH7kEM+3kcVzc3
	PoS3WRSEXQcLyWHioUixZGVm8/AiRBxNZOpJyBa7RjkqKP0x+PTwIbG
X-Received: by 2002:a05:600c:1d08:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49cf825168cmr134783585e9.13.1788611455009;
        Sat, 05 Sep 2026 05:30:55 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be01bsm12862413f8f.31.2026.09.05.05.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 05:30:54 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <1a21d17b-686a-4efe-9d47-fb8a9e826b39@gmail.com>
Date: Sat, 5 Sep 2026 13:30:50 +0100
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] uart-routing: Add common UART routing framework
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Oskar Senft <osk@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Jani Nikula <jani.nikula@intel.com>, Vitaly Lubart <lubvital@gmail.com>,
 Hanjun Guo <guohanjun@huawei.com>, Andrew Morton
 <akpm@linux-foundation.org>, Alexander Usyskin
 <alexander.usyskin@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Breno Leitao <leitao@debian.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 James Morse <james.morse@arm.com>, Paolo Abeni <pabeni@redhat.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Dave Penkler <dpenkler@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Dan Williams <djbw@kernel.org>,
 Mukesh Rathor <mrathor@linux.microsoft.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Karthikeyan KS <karthiproffesional@gmail.com>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
References: <20260905102901.126035-1-changhuang.liang@starfivetech.com>
 <20260905102901.126035-2-changhuang.liang@starfivetech.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260905102901.126035-2-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/26 11:28, Changhuang Liang wrote:
> Several SoCs contain a serial crossbar, usually called UART routing,
> that lets the RX line of any on-chip UART controller or physical serial
> port be fed from any other endpoint. The Aspeed AST2400/2500/2600 and
> the StarFive JHB100 both have one, and both expose it through the same
> user space interface: one sysfs file per endpoint, listing the routing
> targets with the current one in square brackets.
> 
> The two drivers implementing that interface duplicate the whole sysfs
> plumbing and only really differ in the description of their register
> layout, so factor the common part out into a framework.
> 
> An SoC driver now only describes each mux with a
> struct uart_routing_selector - register offset, bit position, field mask
> and the array of routing target names indexed by the raw field value -
> gathers them in an attribute group and hands the group and a regmap to
> devm_uart_routing_register(). The framework validates the description,
> creates the files and implements the show()/store() handlers.
> 
> The framework keeps its state in a devres node rather than in the device
> drvdata, so drivers stay free to use dev_set_drvdata() for their own
> purposes, and the sysfs files are removed by devres, so drivers do not
> need a remove() callback for them.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  Documentation/driver-api/index.rst        |   1 +
>  Documentation/driver-api/uart-routing.rst | 145 ++++++++++++++++
>  MAINTAINERS                               |   7 +
>  drivers/Kconfig                           |   2 +
>  drivers/Makefile                          |   1 +
>  drivers/uart-routing/Kconfig              |  16 ++
>  drivers/uart-routing/Makefile             |   2 +
>  drivers/uart-routing/uart-routing.c       | 200 ++++++++++++++++++++++
>  drivers/uart-routing/uart-routing.h       |  84 +++++++++
>  9 files changed, 458 insertions(+)
>  create mode 100644 Documentation/driver-api/uart-routing.rst
>  create mode 100644 drivers/uart-routing/Kconfig
>  create mode 100644 drivers/uart-routing/Makefile
>  create mode 100644 drivers/uart-routing/uart-routing.c
>  create mode 100644 drivers/uart-routing/uart-routing.h
> 
> diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
> index 6601a258690f..2a0f375cd206 100644
> --- a/Documentation/driver-api/index.rst
> +++ b/Documentation/driver-api/index.rst
> @@ -146,6 +146,7 @@ Subsystem-specific APIs
>     tee
>     thermal/index
>     tty/index
> +   uart-routing
>     wbrf
>     wmi
>     xilinx/index
> diff --git a/Documentation/driver-api/uart-routing.rst b/Documentation/driver-api/uart-routing.rst
> new file mode 100644
> index 000000000000..67bb84958977
> --- /dev/null
> +++ b/Documentation/driver-api/uart-routing.rst
> @@ -0,0 +1,145 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +======================
> +UART routing framework
> +======================
> +
> +:Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +Overview
> +========
> +
> +Several SoCs contain a serial crossbar, usually called *UART routing*, that
> +sits between the on-chip UART controllers and the physical serial ports
> +exposed on the package pins. The crossbar lets the RX line of any endpoint be
> +fed from any other endpoint, which makes it possible to, for example, snoop
> +the traffic of a host serial console, or to loop two on-chip UARTs back into
> +each other without any external wiring.
> +
> +Two endpoint families are involved:
> +
> +``uartN``
> +	the RX line of the on-chip UART controller number N.
> +
> +``ioN``
> +	the RX line of the physical serial port number N.
> +
> +The crossbar is programmed through bit fields, one per endpoint, spread over
> +one or more registers. The value written into a field picks the endpoint the
> +RX line is connected to; the meaning of a given value differs from field to
> +field and from SoC to SoC.
> +
> +The framework in ``drivers/uart-routing/`` takes a static description of those
> +fields and turns it into a set of sysfs files, one per endpoint, so that SoC
> +drivers only have to describe their hardware.
> +
> +User space interface
> +====================
> +
> +Every endpoint gets one read/write file in the device directory of the
> +platform driver, named after the endpoint. Reading the file lists all the
> +routing targets the endpoint can be connected to, with the current one
> +enclosed in square brackets::
> +
> +	# cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
> +	[io1] io2 io3 io4 uart2 uart3 uart4 io6
> +
> +Writing one of the listed names to the file changes the routing::
> +
> +	# echo uart2 > /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
> +
> +Writing a name that is not part of the list fails with ``-EINVAL``.
> +
> +The list is not necessarily the same for every file: it is ordered by the raw
> +value programmed into the hardware, so the first entry is the target selected
> +when the field reads back as 0. Some SoCs define fields that are wider than
> +the number of documented targets. When such a field holds a value with no
> +name attached, the read appends ``[unknown(N)]`` to the list instead of
> +bracketing one of the names.
> +
> +Fields whose name is ``reserved`` are placeholders for values the hardware
> +does not implement. They are listed so that the position of the following
> +names stays correct, and writing ``reserved`` programs a value that has no
> +defined behaviour, so do not do that.
> +
> +The exact set of files of a given SoC, together with the routing targets each
> +of them accepts, is described in the corresponding
> +``Documentation/ABI/testing/sysfs-driver-*-uart-routing`` file.
> +
> +Writing a driver
> +================
> +
> +An SoC driver describes each mux with a ``struct uart_routing_selector``,
> +defined with the ``UART_ROUTING_SELECTOR()`` helper::
> +
> +	static const char *const foo_uart1_options[] = {
> +		"io1", "io2", "io3", "io4", "uart2", "uart3", NULL,
> +	};
> +	UART_ROUTING_SELECTOR(foo_uart1_sel, uart1, FOO_MUX_REG, 16, 0x7,
> +			      foo_uart1_options);
> +
> +The arguments are, in order, the name of the variable to define, the name of
> +the sysfs file, the offset of the register holding the field, the position of
> +the least significant bit of the field, the field mask and the array of
> +routing targets.
> +
> +The mask is given in field coordinates, that is, it is *not* shifted by the
> +bit position: a three bit field is always described as ``0x7``, whatever its
> +position in the register is.
> +
> +The array of routing targets is indexed by the raw field value, so
> +``options[n]`` is the name of the target selected when the field holds n. It
> +has to be NULL terminated, and it may be shared between several selectors
> +that happen to have the same target order.
> +
> +The selectors are then gathered in an attribute group::
> +
> +	static struct attribute *foo_uart_routing_attrs[] = {
> +		UART_ROUTING_SELECTOR_ATTR(foo_uart1_sel),
> +		/* ... */
> +		NULL,
> +	};
> +
> +	static const struct attribute_group foo_uart_routing_attr_group = {
> +		.attrs = foo_uart_routing_attrs,
> +	};
> +
> +and handed over, along with a regmap covering the selector registers, in
> +probe()::
> +
> +	static int foo_uart_routing_probe(struct platform_device *pdev)
> +	{
> +		struct device *dev = &pdev->dev;
> +		struct regmap *regmap;
> +
> +		regmap = /* ... */;
> +
> +		return devm_uart_routing_register(dev, regmap,
> +						  &foo_uart_routing_attr_group);
> +	}
> +
> +The framework validates the description at registration time and rejects
> +selectors whose target list cannot fit in the field, or whose field does not
> +fit in a 32 bit register.
> +
> +The sysfs files are created and removed by devres, so a driver does not need
> +a remove() callback for them. The framework keeps its own state in a devres
> +node rather than in the device drvdata, so drivers are free to use
> +``dev_set_drvdata()`` for their own purposes.
> +
> +Locking
> +=======
> +
> +The framework does not serialise accesses itself. The read-modify-write of a
> +selector field is done with ``regmap_update_bits()``, so concurrent writes to
> +two endpoints sharing a register are made safe by the regmap lock. Reading a
> +file always reports the current hardware state, which may have been changed
> +by another writer in between.
> +
> +API reference
> +=============
> +
> +.. kernel-doc:: drivers/uart-routing/uart-routing.h
> +
> +.. kernel-doc:: drivers/uart-routing/uart-routing.c
> +   :export:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90919c672d4d..b7fa722755c6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27818,6 +27818,13 @@ F:	drivers/misc/uacce/
>  F:	include/linux/uacce.h
>  F:	include/uapi/misc/uacce/
>  
> +UART ROUTING FRAMEWORK
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/driver-api/uart-routing.rst
> +F:	drivers/uart-routing/
> +
>  UBI FILE SYSTEM (UBIFS)
>  M:	Richard Weinberger <richard@nod.at>
>  R:	Zhihao Cheng <chengzhihao1@huawei.com>
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index f2bed2ddeb66..cb2b5c3b22b0 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -251,6 +251,8 @@ source "drivers/hte/Kconfig"
>  
>  source "drivers/cdx/Kconfig"
>  
> +source "drivers/uart-routing/Kconfig"
> +
>  source "drivers/resctrl/Kconfig"
>  
>  endmenu
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 0841ea851847..fe4b11419496 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -195,6 +195,7 @@ obj-$(CONFIG_DRM_ACCEL)		+= accel/
>  obj-$(CONFIG_CDX_BUS)		+= cdx/
>  obj-$(CONFIG_DPLL)		+= dpll/
>  obj-y				+= resctrl/
> +obj-$(CONFIG_UART_ROUTING)	+= uart-routing/
>  
>  obj-$(CONFIG_DIBS)		+= dibs/
>  obj-$(CONFIG_S390)		+= s390/
> diff --git a/drivers/uart-routing/Kconfig b/drivers/uart-routing/Kconfig
> new file mode 100644
> index 000000000000..a0c45a7bba47
> --- /dev/null
> +++ b/drivers/uart-routing/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menu "UART routing drivers"
> +

Configuring the kernel can be an annoying process, and on platforms that
can't use these options, this menu just appears empty, further
complicating menuconfig...

Maybe it makes sense to add a dependency to the menu like this?
'depends on ARCH_ASPEED || ARCH_STARFIVE || COMPILE_TEST'

- Julian Braha


