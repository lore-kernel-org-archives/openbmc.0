Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="PcySZOUI"; 
 dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Vcxd22vrzDqFB
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jan 2019 17:11:32 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id q8so19178196qke.1
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jan 2019 22:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s3Odud8jPIfcXOaep3/Vy6a3quMuqPlvIK4wxaeLNo0=;
 b=PcySZOUIXksstaw3kRNGRPbmSpPsTFyqzBpFhqYnSs94dJKOQcilIU40x6ukkyp9YA
 4N4krm+3/lybM+sRejbEYV9vRuzxPRIu/q5y/KlLzaBKp0H3UONgtZtkaEHYUfEKYv43
 jGzdReZxeR6zk8L8faJTMyhJThS7dUeMj4KMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s3Odud8jPIfcXOaep3/Vy6a3quMuqPlvIK4wxaeLNo0=;
 b=diJ7fQTaUGqaLMomMjGUuBVeVSGMFBhYfqfj+Pf4qbRtP41PYKhDlhwDABo4hc3mYN
 vvv2yYEjoCluJQou1SelxMhBFYurXrI4PiK6IYw15/impflw+p+I7a901r4ZTHWvobL0
 ehSqn+AGFCH6PfKEhePUkNYY72QmF5wUaxH9sYCsS0gtTbdfY3zKKQiJSer2PLO0ADEc
 GeOLm0D825ZlwTipVnARnbBIyV6bnhnCVx+hEokr7NbH8ynU2EK+wEyu15nvSVQc5UMi
 a3wDoBK1c6+kWvQ+OC8i5ErdNeIHgqqVa58CuH2PSBDoH55p4ra810DUvRZi8uNiJQRb
 j9lQ==
X-Gm-Message-State: AJcUukfkVFMg0gB5LiQyuR6jIwd66MfXdF9qa3590KquuG+8OUfSfvG6
 /qvjovE+1ewphJIYFXjKJdiNzJUtdVWtLnTqWkM=
X-Google-Smtp-Source: ALg8bN47UtFVuthIUzXnrjx3tztO1+5ZDe+fA3usXbahQwOlzmE1VLk+0MULTsjynS8TCS7EmbvivWLrI7FG9kvzQ/E=
X-Received: by 2002:a37:a391:: with SMTP id m139mr41759266qke.11.1546495889728; 
 Wed, 02 Jan 2019 22:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20181216110035.151310-1-tmaimon77@gmail.com>
In-Reply-To: <20181216110035.151310-1-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Jan 2019 16:41:18 +1030
Message-ID: <CACPK8XdszEGSCkr=i2iA6MQr9tyeLDUpwn8r0KgRUBKMZoSpZw@mail.gmail.com>
Subject: Re: [linux dev-4.19 00/11] Add NPCM7xx patches to dev-4.19
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 03 Jan 2019 06:11:35 -0000

Hi Tomer,

On Sun, 16 Dec 2018 at 21:30, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add the following NPCM7xx patches to dev-4.19:

I had some email issues where not all of these patches arrived in my
inbox. They are on patchwork, so I was able to review them.

>
> 1. NPCM7xx FIU driver(SPI-NOR).
> 2. NPCM7xx I2C driver.

The i2c does not build, so I did not include that patch:

../drivers/i2c/busses/i2c-npcm7xx.c:9:10: fatal error:
linux/clk/nuvoton.h: No such file or directory
 #include <linux/clk/nuvoton.h>
          ^~~~~~~~~~~~~~~~~~~~~

Please re-send it once you've tested that it applies and builds. It
would be great if you had also tested it on hardware before sending.

> 3. NPCM7xx BIOS post code driver.

This introduces a warning:

../drivers/misc/npcm7xx-lpc-bpc.c: In function =E2=80=98npcm7xx_bpc_irq=E2=
=80=99:
../drivers/misc/npcm7xx-lpc-bpc.c:150:25: warning: =E2=80=98last_addr_bit=
=E2=80=99 may
be used uninitialized in this function [-Wmaybe-uninitialized]
   if (lpc_bpc->en_dwcap && last_addr_bit) {
       ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~

I would strongly encourage you to look at the aspeed snoop driver and
adopt a common userspace interface for this code. It's important to do
that before userspace code is written that depends on this interface.

> 4. NPCM7xx PCI mailbox driver.

I didn't merge this one has it contained a bad size check. Please take
a look at npcm7xx_mbox_write:

+       if (count + *ppos > mbox->max_buf_size)
+               return -EINVAL;

If you resend just the mailbox driver (and bindings) I will merge them
separately.

> 5. NPCM7xx ETHERNET MAC Controller driver.
> 6. NPCM7xx defconfig.

I found some warnings and errors when building your patches

The device tree updates cause this warning when building:

  DTC     arch/arm/boot/dts/nuvoton-npcm750-evb.dtb
arch/arm/boot/dts/nuvoton-npcm750-evb.dtb: Warning (pci_bridge):
/ahb/axi-pcie@e1000000: node name is not "pci" or "pcie"

The ADC driver causes this warning:

../drivers/iio/adc/npcm_adc.c: In function =E2=80=98npcm_adc_probe=E2=80=99=
:
../drivers/iio/adc/npcm_adc.c:301:9: warning: =E2=80=98ret=E2=80=99 may be =
used
uninitialized in this function [-Wmaybe-uninitialized]
  return ret;
         ^~~

I took a look at the driver and it is clear it needs some further work. eg:

                if (PTR_ERR(info->vref) !=3D -ENODEV) {
                        goto err_disable_clk;
                        return PTR_ERR(info->vref);
                }

and:

        if (of_device_is_compatible(np, "nuvoton,npcm750-adc")) {

Can you please take another look at the series before we merge it?
Here's a checklist:

1. Build the code
2. Check for warnings
3. Run the patches through checkpatch.pl

Thanks,

Joel
