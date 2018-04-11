Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DUyPo2ab"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ivyWI6KY"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Lj8Z1crLzF1RP;
 Wed, 11 Apr 2018 21:52:46 +1000 (AEST)
Received: by mail-qt0-x243.google.com with SMTP id g5so1527142qth.7;
 Wed, 11 Apr 2018 04:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+xF/QQrbDaB/C2STWUBftaDCOueXgSmK3FO0WBIu0SA=;
 b=DUyPo2ab8NghpHM5I10oN2D6a0p48a1M37TL8+zJ2fYE5S3u0c3NKhD57JOyh3Q13/
 v9XAg7qBZGoQpoHk5OMSwWpDOUQVwGAenxRlt24fG+EbIFnyH5ev/cwz0hRTAfzImZYb
 lTdbh46NvaedRrPxezoBkL9IeUxHZBJa153UGn1PQsFXgqUdA4nNh90dgO+to058HWZZ
 5DfwJcaQNxPvvObG7NbGVq5HQrezIUGiQbL62tjieDSmeBD8QpX4OfhlMLUYbPVxXhUw
 iBbUL5XLlSno5Rh++v77ojp6y9Un5MLVcqmuhK4z98CgNiU1q7FRwX9ORDljCFY6nz7t
 6xNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+xF/QQrbDaB/C2STWUBftaDCOueXgSmK3FO0WBIu0SA=;
 b=ivyWI6KY6erQ8CRwDR3jeNv0sxebnDS3jGiAycByc+1f+1MtYT4kc2nMjux357uN/Q
 W7zCgGNN5NeTxSIO90kIk/h8tkMC9P/rnWfgUrt7Al5DZ+s1GBB9SjyQDrEvhd9DI1dZ
 4mFw6CsLO5BpCUIGwscXtNXN3Ml62cnpH5ZMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+xF/QQrbDaB/C2STWUBftaDCOueXgSmK3FO0WBIu0SA=;
 b=bj9B5PUfBeQ5jaf07Ax2ZOgJv9zZsRjDdmTGrPy8NMoo8MmYoOjYfuWtMYKs1lxEH4
 ON9PNdnxuSuC6d7+nQriZIGfSKdOd6+MFCPNt5dj5Nqvomzi0oZpFiNRyzGK5YkbN870
 7p9JzncilybH9UrawTCB7Udzkm/joQuWdbj9N8jU5v7yD+gWgPsWhhcgmOccmgooo3hw
 843Q+/03eeWYNhSRa6tLkfssG6JvOMZc9D0lUzcR8wOZ5zbUrAZD5iEyd5WSHC7Dy+8X
 DcJMZLyOF5qyuiNWsF15RAaLgvORsDT316xJi5SAHiINaquyfAxqhAS1UR81ob4LdYbR
 CMwg==
X-Gm-Message-State: ALQs6tBIA5GPIyKgopUP2/aWIlyTKdgYCHl0NcjdrN4VAx0+6c1M9N+e
 rq7f7I4Vt/m5a4u8/5PARD91Uael2NxF8vkAEmA=
X-Google-Smtp-Source: AIpwx4/Aqmu5PtGzNci0HuzuI7OnTYQrQEc2oFxPJYTA5ygPhGTacIJEvlXMAE/2pTiQQ7y6Wkc4Z3EEJJ6tbmF6zbw=
X-Received: by 10.237.36.74 with SMTP id s10mr6792417qtc.23.1523447563885;
 Wed, 11 Apr 2018 04:52:43 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.63.197 with HTTP; Wed, 11 Apr 2018 04:52:23 -0700 (PDT)
In-Reply-To: <20180410183212.16787-5-jae.hyun.yoo@linux.intel.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-5-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Apr 2018 21:22:23 +0930
X-Google-Sender-Auth: FToGwyE2BzKPG5iVm8whVxLh0Rw
Message-ID: <CACPK8XcfrheC+UDB7mLPkgPRCuk8f+P830NG+cy2v6F_PJvUTw@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] Documentations: dt-bindings: Add a document of
 PECI adapter driver for Aspeed AST24xx/25xx SoCs
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, 
 linux-aspeed@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Lunn <andrew@lunn.ch>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fengguang Wu <fengguang.wu@intel.com>, 
 Greg KH <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Haiyue Wang <haiyue.wang@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, 
 Jason M Biils <jason.m.bills@linux.intel.com>, Jean Delvare <jdelvare@suse.com>,
 Julia Cartwright <juliac@eso.teric.us>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Milton Miller II <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>,
 Randy Dunlap <rdunlap@infradead.org>, 
 Stef van Os <stef.van.os@prodrive-technologies.com>, 
 Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 12 Apr 2018 13:05:57 +1000
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
X-List-Received-Date: Wed, 11 Apr 2018 11:52:46 -0000

On 11 April 2018 at 04:02, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> This commit adds a dt-bindings document of PECI adapter driver for Aspeed

We try to capitalise ASPEED.

> AST24xx/25xx SoCs.
> ---
>  .../devicetree/bindings/peci/peci-aspeed.txt       | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.txt
>
> diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.txt b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
> new file mode 100644
> index 000000000000..4598bb8c20fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
> @@ -0,0 +1,60 @@
> +Device tree configuration for PECI buses on the AST24XX and AST25XX SoCs.
> +
> +Required properties:
> +- compatible        : Should be "aspeed,ast2400-peci" or "aspeed,ast2500-peci"
> +                     - aspeed,ast2400-peci: Aspeed AST2400 family PECI
> +                                            controller
> +                     - aspeed,ast2500-peci: Aspeed AST2500 family PECI
> +                                            controller
> +- reg               : Should contain PECI controller registers location and
> +                     length.
> +- #address-cells    : Should be <1>.
> +- #size-cells       : Should be <0>.
> +- interrupts        : Should contain PECI controller interrupt.
> +- clocks            : Should contain clock source for PECI controller.
> +                     Should reference clkin.

Are you sure that this is driven by clkin? Most peripherals on the
Aspeed are attached to the apb, so should reference that clock.

> +- clock_frequency   : Should contain the operation frequency of PECI controller
> +                     in units of Hz.
> +                     187500 ~ 24000000

Can you explain why you need both the parent clock and this frequency
to be specified?

> +
> +Optional properties:
> +- msg-timing-nego   : Message timing negotiation period. This value will

Perhaps msg-timing-period? Or just msg-timing?

> +                     determine the period of message timing negotiation to be
> +                     issued by PECI controller. The unit of the programmed
> +                     value is four times of PECI clock period.
> +                     0 ~ 255 (default: 1)
> +- addr-timing-nego  : Address timing negotiation period. This value will
> +                     determine the period of address timing negotiation to be
> +                     issued by PECI controller. The unit of the programmed
> +                     value is four times of PECI clock period.
> +                     0 ~ 255 (default: 1)
> +- rd-sampling-point : Read sampling point selection. The whole period of a bit
> +                     time will be divided into 16 time frames. This value will
> +                     determine the time frame in which the controller will
> +                     sample PECI signal for data read back. Usually in the
> +                     middle of a bit time is the best.
> +                     0 ~ 15 (default: 8)
> +- cmd_timeout_ms    : Command timeout in units of ms.
> +                     1 ~ 60000 (default: 1000)
> +
> +Example:
> +       peci: peci@1e78b000 {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x1e78b000 0x60>;
> +
> +               peci0: peci-bus@0 {
> +                       compatible = "aspeed,ast2500-peci";
> +                       reg = <0x0 0x60>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       interrupts = <15>;
> +                       clocks = <&clk_clkin>;
> +                       clock-frequency = <24000000>;
> +                       msg-timing-nego = <1>;
> +                       addr-timing-nego = <1>;
> +                       rd-sampling-point = <8>;
> +                       cmd-timeout-ms = <1000>;
> +               };
> +       };
> --
> 2.16.2
>
