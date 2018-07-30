Return-Path: <robh+dt@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="LYyUb4Nf"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41fYZ15ZYNzF14h;
 Tue, 31 Jul 2018 08:06:30 +1000 (AEST)
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
 [209.85.216.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3752208C1;
 Mon, 30 Jul 2018 22:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1532988388;
 bh=9ZdJs5meBKxWRx5UNIX0E7L78FwYjZbeBMPSbMUjI6I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LYyUb4NfjF6dYbt3xSZVLJuKx6g5xV3ooT0z+57K8PI/qJpDeZhFupK46cxvKbfAt
 m2eMbOQjuCiTH3HMt6g+Va2TJlbn0NbUWABZRPft7vmxhGNsICKX6dbnhObUdpSkNz
 qz7irutNKCccd3pD5A2wR0g6rZG0LCLEBDzYLay0=
Received: by mail-qt0-f180.google.com with SMTP id q12-v6so13854409qtp.6;
 Mon, 30 Jul 2018 15:06:27 -0700 (PDT)
X-Gm-Message-State: AOUpUlEfPQIv5v5xqpf/rdn5DNFd0MMpbL6QoIyPVlClHjxFSH/16MJ0
 qzJzjik4hc3PuyOi0c5HTO8+hvAFz7MryoKggA==
X-Google-Smtp-Source: AAOMgpfd9GZtkmuMU5VO2AiX5OfvVkeO9yzDxC2JLbph1ixxgtkhCSL7uC0UDMWINLElcU7dQZYBlx3+rLz4jT/Ddac=
X-Received: by 2002:ac8:96b:: with SMTP id
 z40-v6mr18413901qth.362.1532988386011; 
 Mon, 30 Jul 2018 15:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20180723214751.1733-1-jae.hyun.yoo@linux.intel.com>
 <20180723214751.1733-12-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20180723214751.1733-12-jae.hyun.yoo@linux.intel.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Jul 2018 16:06:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK4k=c6k-BJT5fWQH_DCqGhr13fq6M_iZZehaveE-z5Hg@mail.gmail.com>
Message-ID: <CAL_JsqK4k=c6k-BJT5fWQH_DCqGhr13fq6M_iZZehaveE-z5Hg@mail.gmail.com>
Subject: Re: [PATCH v7 11/12] hwmon: Add PECI dimmtemp driver
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, darrick.wong@oracle.com,
 sandeen@redhat.com, 
 Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>,
 kusumi.tomohiro@gmail.com, 
 bryantly@linux.vnet.ibm.com, fbarrat@linux.vnet.ibm.com, 
 David Miller <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, Vinod <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@codeaurora.org>, david.kershner@unisys.com, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, jgross@suse.com, 
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Linux HWMON List <linux-hwmon@vger.kernel.org>, 
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Alan Cox <alan@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jason M Biils <jason.m.bills@linux.intel.com>, 
 Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Stef van Os <stef.van.os@prodrive-technologies.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 31 Jul 2018 10:00:14 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2018 22:06:35 -0000

On Mon, Jul 23, 2018 at 3:49 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds PECI dimmtemp hwmon driver.
>

> +#if IS_ENABLED(CONFIG_OF)
> +static const struct of_device_id peci_dimmtemp_of_table[] = {
> +       { .compatible = "intel,peci-dimmtemp" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, peci_dimmtemp_of_table);
> +#endif

This should be removed. Same for cpu temp driver I'm guessing.

Rob
