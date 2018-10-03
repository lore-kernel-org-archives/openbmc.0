Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="FcSVKPjv"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Q7Td2mpDzF399;
 Wed,  3 Oct 2018 17:49:56 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id q40-v6so4935666qte.0;
 Wed, 03 Oct 2018 00:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v0DuBfrTnfQCiyuMwCJZZ3CnYAFbgXosdK8G7lLtCDQ=;
 b=FcSVKPjvo+41ArJUhTph0/YbGs+njhFP2RsRWfIwvl/eNBaLL7hUaN/5Y/kHh/xCqP
 Oa/ryGGFx325Tt4f5b4mUiyChyfD7VOUaRGHN+naxPtOZLxeNYhsmGSvIJodHcfkQgbr
 bGFTTcJr8EN5tXsLHduz0314UQoDAhCsL9KcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v0DuBfrTnfQCiyuMwCJZZ3CnYAFbgXosdK8G7lLtCDQ=;
 b=kuwBQ3hBe3p2U1j/9FwuYryAnYmA1O9aZvdnpF/Ui+EYfPAAxO33wCEbkVR00RcUOy
 UhxsbUD0JA7Miv+MSk2qeeFAE3eM3ib0qt2PU3zOLNhS2+lb0vl+eI8OGMRP6KobeeIT
 UGh2jPHDT5e+wZdkTtVbV3nIo5Pd5S+Jcu/79dn6vBDgmJNz23XXPA1qC1NkcsR8mXre
 xG+iZ1O9OHvEehUIPsqdxFYch4HZXLZ9MIkB9a5efHj7NCNOh4S7wUCHG2XJioEF9H6k
 HqqMfZDFAgasMkcL1ZHAOnWrSBkxPvIYasnUmKzHA1SRAh/+XYrG+axl67tpH84qMH1j
 jH5g==
X-Gm-Message-State: ABuFfoh8NMY1lGbgldG5vLp4pLMz67ZJRiXT0f2fnMv7DjsPO+L4rwhb
 GmCryUCU+C1b7C2UpXNohtT/UjDhndrv4D4LCHc=
X-Google-Smtp-Source: ACcGV62smntijufm1xMOhQTmPSjD6t65hLUHwJRBSbty48oML6aocL876NiDvTV26XReumK2b8Lg/MneH5b1mKBD6Fc=
X-Received: by 2002:ac8:4145:: with SMTP id e5-v6mr211383qtm.330.1538552994425; 
 Wed, 03 Oct 2018 00:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20181001202748.8030-1-jae.hyun.yoo@linux.intel.com>
 <20181001202748.8030-3-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20181001202748.8030-3-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Oct 2018 09:49:41 +0200
Message-ID: <CACPK8XeuFm_GYFhe-KimOHV7y7PBdFjhMGG+QAmfNrfOcb488A@mail.gmail.com>
Subject: Re: [PATCH i2c-next v4 2/3] i2c: aspeed: Add 'timeout' DT property
 reading code
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2018 07:49:58 -0000

Hello Jae,

On Mon, 1 Oct 2018 at 22:28, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds reading code of the 'timeout' DT property to set
> bus timeout value in adapter configuration. This value still
> can be configured through an I2C_TIMEOUT ioctl on cdev too.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 8dc9161ced38..6d31f54a6653 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -885,6 +885,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>         struct clk *parent_clk;
>         struct resource *res;
>         int irq, ret;
> +       u32 timeout_ms;
>
>         bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
>         if (!bus)
> @@ -918,6 +919,11 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>                 bus->bus_frequency = 100000;
>         }
>
> +       ret = of_property_read_u32(pdev->dev.of_node, "timeout",
> +                                  &timeout_ms);
> +       if (ret)
> +               timeout_ms = 0; /* then adap.timeout will be set by i2c-core */

Is it possible to implement the parsing of this property in the i2c
core instead?
