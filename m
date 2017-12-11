Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::244; helo=mail-lf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JWuLNqWQ"; 
 dkim-atps=neutral
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ywBbQ2kNmzDqmT
 for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2017 16:39:13 +1100 (AEDT)
Received: by mail-lf0-x244.google.com with SMTP id r143so17765630lfe.13
 for <openbmc@lists.ozlabs.org>; Sun, 10 Dec 2017 21:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=040GvWR+8Ek1DQCiL0pLGyS/Q4Nlhkbsq3XHZFOQnMs=;
 b=JWuLNqWQA19scrRK/abdJ9W6pJpjmzDc3AHvasiVBu4GWNRkcNaLKDqMDI4y7tFax6
 C+/w7oFpQi/2YmnH2JQEIS6T3k7xPB+cstVEFeiU74h7QB2BcbEndiZonGflUTZ6tEp7
 K/WTZQIIG/DSe9RCV+0ILJzwprxHtTGHGnNDm7nrc/n5UdPi/PHeahxluD1S60YvzG+j
 LkT0xUhMZQSe51ol76C79bHHECgZmpcVFgRCh5FhU0O3LPtfR4uic8oj5E+Kio+3oiFR
 GIb3NIUoRb4cooXqBnhxnytCUrRHd75WpQEZzMSl/3HqhsAMxHiunk+/RJ9VFPAxQqoW
 daeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=040GvWR+8Ek1DQCiL0pLGyS/Q4Nlhkbsq3XHZFOQnMs=;
 b=do8khJsRC6nFTwshLPz190NFTg/yL9Lv3/OeRsZFYEZx4pn9MByhn/2G0D1ZGCDxPs
 UtUH4C+dBq5jZoQ13in2+nrmGo8p0+gQvZP4UXEEQ/XgzipenAbO9i3hiHp/OQKjG6ce
 IywJxwDZgeajHVogdkSLKc45vKRY6jzd8OlNYmPGS30KbH/x8B3x3rKZ1H8zjMRl88mV
 X1SAvHyddoUlAu+MexOUThBlzAmd3BK7YoGLlAbLNdxeOOMsmQAnvG5SrK39uTLLe01h
 F0VRcRfQ1Rrze9UC4XXenllAxn4TbK3u8YpuWwyECpNhUPS0Wx+rUA6lJNSfL86wtxZB
 DrMw==
X-Gm-Message-State: AJaThX6ZO48qHEdH1AIXaH8/YFO0Cp71NlP5QnwJgwwb1mRngeiu3M8F
 Tf5ubzUWqxIbMURHcUPq7WkDGTBDVaOt85A3cRc=
X-Google-Smtp-Source: AGs4zMYodrX0go4bs2/EX9LwEES1RrxQ0VTln/X0k5a116rEtUDT+dsv2uizHezHJoGPqmvwCcpTMFaFaryUGXzvFME=
X-Received: by 10.25.178.86 with SMTP id b83mr15533619lff.152.1512970750315;
 Sun, 10 Dec 2017 21:39:10 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Sun, 10 Dec 2017 21:38:49 -0800 (PST)
In-Reply-To: <1512759652-9684-1-git-send-email-james.feist@linux.intel.com>
References: <1512759652-9684-1-git-send-email-james.feist@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Dec 2017 16:08:49 +1030
X-Google-Sender-Auth: j1uXEjDbAfbNDxPDmmsvPcW0-0k
Message-ID: <CACPK8XfN0is=oSEVnxsM3ZemMRfBf_Bkwy=LWxoi9SRMo4UVxg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v4 1/1] ARM: dts: Add S2600WF BMC Machine
To: James Feist <james.feist@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Dec 2017 05:39:15 -0000

On Sat, Dec 9, 2017 at 5:30 AM, James Feist <james.feist@linux.intel.com> wrote:
> S2600WF is a Intel platform family with an Aspeed ast2500 BMC.

Thanks! I can search for that term and see what it is; that's much clearer.

I've been doing a bunch of work upstreaming device trees, and after
taking a closer look I've seen some other nits in your patch. Please
fix them up and we can get this merged.

>
> Signed-off-by: James Feist <james.feist@linux.intel.com>
> ---
>  changes since v3:
>   - use full product family name
>
>  arch/arm/boot/dts/Makefile                     |   1 +
>  arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts | 128 +++++++++++++++++++++++++
>  2 files changed, 129 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6d6c9eb..7c54fc8 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -992,6 +992,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-opp-lanyang.dtb \
>         aspeed-bmc-mellanox-msn.dtb \
>         aspeed-bmc-quanta-q71l.dtb \
> +       aspeed-bmc-intel-s2600wf.dtb \
>         aspeed-ast2500-evb.dtb
>  endif
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
> new file mode 100644
> index 0000000..ef0ba3c
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
> @@ -0,0 +1,128 @@

Add a copyright header. The new way of doing this in kernel land is
with the SPDX tag on the first line of your source file:

// SPDX-License-Identifier: GPL-2.0+


> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +       model = "S2600WF BMC";
> +       compatible = "intel,s2600wf-bmc", "aspeed,ast2500";
> +
> +       aliases {
> +               serial4 = &uart5;
> +       };

Drop this; all of the aliases are in aspeed-g5.dtsi.

> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "earlyprintk";
> +       };
> +
> +       memory {
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               vga_memory: framebuffer@7f000000 {
> +                       no-map;
> +                       reg = <0x7f000000 0x01000000>;
> +               };
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +                       <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +                       <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +       };
> +
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";

Most of the flash chips we are using support the fast-read property.
Have you tried this with your system(s)?

  m25p,fast-read

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts#n39

> +#include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +       flash@0 {
> +               status = "okay";
> +               label = "pnor";

Same here.

> +       };
> +};
> +
