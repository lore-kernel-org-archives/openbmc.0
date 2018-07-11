Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KB0nluSs"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="H65AbUEz"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QSNF523jzF35w
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:31:09 +1000 (AEST)
Received: by mail-qt0-x243.google.com with SMTP id q12-v6so20386566qtp.6
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 22:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=i/bO6jKfs8iwSyNlbZH1G++MrFmjyfndZhPIBKQSZ7k=;
 b=KB0nluSs0XJbKdDPERXPq/hW+MxtptkOBHOgubp1jyyjDfbLr1V6Q3DkhBKxlLAVga
 dHyvDJ1nkYpnNSCr4otBgPkxK7eBD1nXYu0gc/pQI8sk4PNN9n8tXJHeK8IwJGRrwQtd
 KVa2TXDcJFtqCGieNJUocXRxv+ZxbDrwqrO0BqSoDK/IZQkSgZs/qmd9qB0gdlteRZtv
 5jOrN/hkpsVzpwL4kn8c5TKCBzTGOak90NHVl9+jpPVAT6XBBa6vfXLDArlXVKgteKUf
 5CzBdKTOjErWEb5OSgJ8NzqI4HnWhwg2kqe1yqyQ7TD5ZBX8Mk7ml0Q1NM5/qjO1rNcA
 HNQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=i/bO6jKfs8iwSyNlbZH1G++MrFmjyfndZhPIBKQSZ7k=;
 b=H65AbUEz+i8AQ4UdkuZcxbVAYP3cI9Juk7nCatCE3UdHjBuDS0UhbEpTwE2O/YQMVr
 NsxE+AuW2L+RvUf2mksCQr4aIJFLfNrgAHA7yyApEad/QH8GM275FaO55S1omZyx0YYN
 LK5PY6CXQZ4iNp0fuySp4Di39MGRcrc+MvVE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=i/bO6jKfs8iwSyNlbZH1G++MrFmjyfndZhPIBKQSZ7k=;
 b=QlLaMPhfPzEnr/Sz/TOH+kYf9ffmMboUT88MHIteTI4u+IQJxpFCoOxxmH29xZ8pGm
 bWIcV00k+ZcxsBDgKfFGWMabm9Aiogyy6loTBTEAi5Tjar51TW8A5n0ksfmO0uGi5u6R
 uw+0KDCn3FQocqniBHDPr0XWIaUspoFzEulCOXWMoK5W8ZAHINCNHAGsm6y8GtE9sI98
 7RRUQ2JR4dtp/PCGQF7FwEQXhdBn+hhPaIsA35ZWS30gM+dGWhMdsfOhzjru+6Wn6eoZ
 xz6axIckZzB9F+XDxNnV2Qi0GXryjUeJaxPReCZkF5rCjlLd/HUplkv1piK09GRAkh7Y
 QMfg==
X-Gm-Message-State: APt69E1/EDs8nCDqVwqHcPZbEGHncCH2BoUleOD+cxZkr1IPlnHYNrB/
 rRr4UrC8u3VNH6wMHTvTEW6QJNP7WsOLossMuJ4=
X-Google-Smtp-Source: AAOMgpeBRfuOgHW8eduSVdRoJmA/Zp8OUM+KJl1/yzTlVKPNzqlzL9Nxg/tSZv0ytX40TUl+fjTEdCcPhJ+2Ox6HJj0=
X-Received: by 2002:ac8:17ee:: with SMTP id
 r43-v6mr26535071qtk.106.1531287067276; 
 Tue, 10 Jul 2018 22:31:07 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 22:30:46
 -0700 (PDT)
In-Reply-To: <1531286230-28453-5-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531286230-28453-5-git-send-email-ryanchen.aspeed@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Jul 2018 15:30:46 +1000
X-Google-Sender-Auth: _cdUywQbkDmQq4kIpMThLkUs7q8
Message-ID: <CACPK8XeChd5o9z3vazUTprUSNvMOVT0dEYY7gN8NSUS9O9=ZFw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.17 4/7] dts: Aspeed: Add Aspeed sdhci dts
 document
To: Ryan Chen <ryanchen.aspeed@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Lei YU <mine260309@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 11 Jul 2018 05:31:10 -0000

On 11 July 2018 at 15:17, Ryan Chen <ryanchen.aspeed@gmail.com> wrote:
> This add Aspeed sdhci irq driver's dts file and devicetree document

The bindings document (Documentation/devicetree) should be a separate
patch to the device tree changes (arch/arm/boot/dts). The bindings
will be merged with the code, while the device tree changes are merged
by the architecture maintainer.


>
> Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
> ---
>  .../aspeed,aspeed-sdhci-ic.txt                     | 25 ++++++++++++++++++++++
>  arch/arm/boot/dts/aspeed-g4.dtsi                   | 20 +++++++++++++++++
>  arch/arm/boot/dts/aspeed-g5.dtsi                   | 20 +++++++++++++++++
>  3 files changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,aspeed-sdhci-ic.txt
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,aspeed-sdhci-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/aspeed,aspeed-sdhci-ic.txt
> new file mode 100644
> index 0000000..e3393c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,aspeed-sdhci-ic.txt
> @@ -0,0 +1,25 @@
> +Device tree configuration for the SDHCI Interrupt Controller on the AST24XX and
> +AST25XX SoCs.
> +
> +Required Properties:
> +- #address-cells       : should be 1
> +- #size-cells          : should be 1
> +- #interrupt-cells     : should be 1
> +- compatible           : should be "aspeed,aspeed-sdhci-ic"
> +- reg                  : address start and range of controller
> +- interrupts           : interrupt number
> +- interrupt-controller : denotes that the controller receives and fires
> +                         new interrupts for child busses
> +
> +Example:
> +
> +sdhci_ic: interrupt-controller@0 {
> +       #interrupt-cells = <1>;
> +       #size-cells = <1>;
> +       #interrupt-cells = <1>;
> +       compatible = "aspeed,aspeed-sdhci-irq";
> +       reg = <0x0 0x100>;
> +       interrupts = <26>;
> +       interrupt-controller;
> +       clocks = <&syscon ASPEED_CLK_GATE_SDCLKCLK>;
> +};
> \ No newline at end of file
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index e86fa80..7ad646d 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -190,6 +190,13 @@
>                                 reg = <0x1e720000 0x8000>;      // 32K
>                         };
>
> +                       sdhci: sdhci@1e740000 {
> +                               compatible = "simple-bus";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               ranges = <0 0x1e740000 0x1000>;
> +                       };
> +
>                         gpio: gpio@1e780000 {
>                                 #gpio-cells = <2>;
>                                 gpio-controller;
> @@ -369,6 +376,19 @@
>         };
>  };
>
> +&sdhci {
> +
> +       sdhci_ic: interrupt-controller@0 {
> +               #interrupt-cells = <1>;
> +               compatible = "aspeed,aspeed-sdhci-irq";
> +               reg = <0x0 0x100>;
> +               interrupts = <26>;
> +               interrupt-controller;
> +               clocks = <&syscon ASPEED_CLK_GATE_SDCLKCLK>;
> +       };
> +
> +};
> +
>  &i2c {
>         i2c_ic: interrupt-controller@0 {
>                 #interrupt-cells = <1>;
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index d92f047..ba850ca 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -256,6 +256,13 @@
>                                 reg = <0x1e720000 0x9000>;      // 36K
>                         };
>
> +                       sdhci: sdhci@1e740000 {
> +                               compatible = "simple-bus";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               ranges = <0 0x1e740000 0x1000>;
> +                       };
> +
>                         gpio: gpio@1e780000 {
>                                 #gpio-cells = <2>;
>                                 gpio-controller;
> @@ -446,6 +453,19 @@
>         };
>  };
>
> +&sdhci {
> +
> +       sdhci_ic: interrupt-controller@0 {
> +               #interrupt-cells = <1>;
> +               compatible = "aspeed,aspeed-sdhci-irq";
> +               reg = <0x0 0x100>;
> +               interrupts = <26>;
> +               interrupt-controller;
> +               clocks = <&syscon ASPEED_CLK_GATE_SDCLKCLK>;
> +       };
> +
> +};
> +
>  &i2c {
>         i2c_ic: interrupt-controller@0 {
>                 #interrupt-cells = <1>;
> --
> 2.7.4
>
