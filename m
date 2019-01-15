Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="PGFOt4XG"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fRDm4FL5zDqPF
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 10:21:44 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id y20so5011370qtm.13
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 15:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uJY4lwOCQUNKRZERBYPlCOhWD3u8IjOlUrsRcWLxW8s=;
 b=PGFOt4XG7tkv/XzZ9jYKTv2a/Fs+ps/iGvjiA8tK0C9GG3H39SvV+A259P1YKKX+Gm
 HZ8p7WrykuuaO8FHP3hFGaTrdUPTXNUv70fqENF3cXj7yqH+fxUvSGrGKuH/mEcT1DpA
 507/DtU8+jooaMDLHsegqLpbeqrkGVnbBFlKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uJY4lwOCQUNKRZERBYPlCOhWD3u8IjOlUrsRcWLxW8s=;
 b=D7isQaxFUU6x2w5u1hPzfMaLgmgKVucdJwScKajc+LPUrVAEv7vWCnbyLXbVc4SOSc
 WXDMW7fVV4ynOB8BnXaIoSAluiRDGNb4xnFMbd8l3aOIkHFLhXExUa9IDRFstXjqfCXP
 okHM2K4DZaabs1uG3RWZrpIFL0qauxmMP95kiuffkjCCAiG2togDF4JynQH1NhyNttSU
 zKP6PXzMRK13D2RBNKsu4Q5NRYHj/Ba0TXak7TNMj9AEwznZMnxzruXTwZm8XgbrBGrG
 yUxMSXqhLRWF4ONj765gHp8+0dIgKkOxKSP/IxiJkZ82LGKgZ0tX0mk0liFa4JwSQihd
 sJ0Q==
X-Gm-Message-State: AJcUukcTl79X6N27PvjZXm02se+BjSYv8otB0EMRPv/5lDolbegissBS
 GmMH6zba4UGw8JEL0SnVBaH2upUlj+aFIXNf3d0=
X-Google-Smtp-Source: ALg8bN4J74fIT+l5wj9d3fnPDj1BYRvZ6aCu+KiVfjam3KMGNuiuhUyiwyQvgjFeZuKhNpJxyQqLPNk+GaiF3HvlbOs=
X-Received: by 2002:ac8:29b7:: with SMTP id 52mr4835382qts.266.1547594501921; 
 Tue, 15 Jan 2019 15:21:41 -0800 (PST)
MIME-Version: 1.0
References: <20190109164343.164205-1-tmaimon77@gmail.com>
 <20190109164343.164205-2-tmaimon77@gmail.com>
In-Reply-To: <20190109164343.164205-2-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Jan 2019 10:21:30 +1100
Message-ID: <CACPK8XebHzVAO2TX25N24S0Pgg_0xA=7GN3j0oXhSyD4LmL4=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: iio: add NPCM ADC documentation
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, 
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Nancy Yuen <yuenn@google.com>, 
 Patrick Venture <venture@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, 
 Avi Fishman <avifishman70@gmail.com>, linux-iio@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
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
X-List-Received-Date: Tue, 15 Jan 2019 23:21:45 -0000

On Thu, 10 Jan 2019 at 03:44, Tomer Maimon <tmaimon77@gmail.com> wrote:

> +Required Node in the NPCM7xx BMC:
> +An additional register is present in the NPCM7xx SOC which is
> +assumed to be in the same device tree, with and marked as
> +compatible with "nuvoton,npcm750-rst".

Is there a reason you don't include a phandle to the reset node?

I think doing that would make more sense.

> +adc: adc@f000c000 {
> +       compatible = "nuvoton,npcm750-adc";
> +       reg = <0xf000c000 0x8>;
> +       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +       clocks = <&clk NPCM7XX_CLK_ADC>;
> +};

> +
> +rst: rst@f0801000 {
> +       compatible = "nuvoton,npcm750-rst", "syscon",
> +       "simple-mfd";
> +       reg = <0xf0801000 0x6C>;
> +};
