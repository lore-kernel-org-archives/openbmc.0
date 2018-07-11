Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4003:c06::244; helo=mail-oi0-x244.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JynqMflL"; 
 dkim-atps=neutral
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QSf331M3zF375
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:43:06 +1000 (AEST)
Received: by mail-oi0-x244.google.com with SMTP id k12-v6so47027044oiw.8
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 22:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b1o2Aoh1iq8Rf+AQ7Vq1j+bTA8DsOk6tU5Yw5sYMx54=;
 b=JynqMflLMLEuEtbFPYIirlKbZRSz1Cp8Ei3s/eIyUP/TUXU1pS+k+jw8x8yCtsoKev
 gtXuI2ooo80vd67vY4S4KW0X9l/lO9NjJ2lflHddRnI8w6hDA2+WWac4Ua1SVbWhbZTE
 K1/rsh8/8yD6A/wo84npLECrELVgf/B6LgY2p7ZmfS1MMToraYAzjb8ENidsviBg6Jk9
 sCAQEyMMVtlNLr/wP//sTavk4HwV+oxZJGJgdm8A9nLunffFYSJP3bDMkx1XiEjaF/so
 F2Sn0qpBb7AFEOJJIH1vkfld6vz4RXyICJNF1pPPp+z4LxEF6OcNEVl67BIO6aX25r0P
 fVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b1o2Aoh1iq8Rf+AQ7Vq1j+bTA8DsOk6tU5Yw5sYMx54=;
 b=iZmUvyceVmtfXtcq1jsp7eEyHlHFaKjiw1AvqZdnAdctFiQlLnlVSME7EiJ6AHeH5W
 5PoPCibQeFMW0299QE+gYNg6fh2mZm6mwgBzoAvifsAJ1s8i8YyO3nnIGtvULZGpriho
 +1AASzD83/EYjVKXLv2svl9sl5lPxzxai5ILbi/T3A/yPvt1mr1On6edxruYnTvPKoKC
 RKipdew83XiMN4HnUtsnbwp/pMJdObXDPdTeMhq+UZ8p2c8hhdTHWkAWlCRDyrlw2e0i
 FyGTnSXtCaBVu0268jr5X9a3zDhgidSEz+S2K3ftHL0eTKi04JxltuE5NVkdCPnpHp28
 ZinA==
X-Gm-Message-State: APt69E1AAWcbF9p0TZWdgM3e8gRfp2iL7ZLsMUZGyKzg40eFUF0JnL6K
 nqb4x4lVQsyMJ4MgjPhjygRF8iZP66nab5X9/x6pNw==
X-Google-Smtp-Source: AAOMgperpPDh+CwyS81DwnNXot10RlhQnYd0JNp//SGlNYjIq9lQGnKydP2w8w/uQHDJPtj3etY9LcyNVFXwwC+oOAw=
X-Received: by 2002:aca:3c02:: with SMTP id
 j2-v6mr32790547oia.238.1531287784072; 
 Tue, 10 Jul 2018 22:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20180702211359.30585-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20180702211359.30585-1-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 10 Jul 2018 22:42:52 -0700
Message-ID: <CAFd5g443wTQJ+0hrprOV949Sr_nRnBGpNo3Wd01xFN4GW4K2Ng@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Add newline characters into message
 printings.
To: jae.hyun.yoo@linux.intel.com
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, 
 james.feist@linux.intel.com, vernon.mauery@linux.intel.com
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
X-List-Received-Date: Wed, 11 Jul 2018 05:43:08 -0000

On Mon, Jul 2, 2018 at 2:14 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> There are some log printing without a newline character. This
> patch adds the missing newline characters.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 60e4d0e939a3..e3007c1c4ac5 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -407,7 +407,7 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>          */
>         ret = aspeed_i2c_is_irq_error(irq_status);
>         if (ret < 0) {
> -               dev_dbg(bus->dev, "received error interrupt: 0x%08x",
> +               dev_dbg(bus->dev, "received error interrupt: 0x%08x\n",
>                         irq_status);
>                 bus->cmd_err = ret;
>                 bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
> @@ -416,7 +416,7 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>
>         /* We are in an invalid state; reset bus to a known state. */
>         if (!bus->msgs) {
> -               dev_err(bus->dev, "bus in unknown state");
> +               dev_err(bus->dev, "bus in unknown state\n");
>                 bus->cmd_err = -EIO;
>                 if (bus->master_state != ASPEED_I2C_MASTER_STOP)
>                         aspeed_i2c_do_stop(bus);
> @@ -431,7 +431,7 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>          */
>         if (bus->master_state == ASPEED_I2C_MASTER_START) {
>                 if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
> -                       pr_devel("no slave present at %02x", msg->addr);
> +                       pr_devel("no slave present at %02x\n", msg->addr);

Unless something changed in the last couple versions of the kernel, this is the
only line that actually changes anything. dev_* inserts a newline for every
call.

Admittedly, the rest of the file is pretty inconsistent, so if you really want
to make all these changes, I don't feel super strongly about it.

>                         status_ack |= ASPEED_I2CD_INTR_TX_NAK;
>                         bus->cmd_err = -ENXIO;
>                         aspeed_i2c_do_stop(bus);
> @@ -451,11 +451,11 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>         switch (bus->master_state) {
>         case ASPEED_I2C_MASTER_TX:
>                 if (unlikely(irq_status & ASPEED_I2CD_INTR_TX_NAK)) {
> -                       dev_dbg(bus->dev, "slave NACKed TX");
> +                       dev_dbg(bus->dev, "slave NACKed TX\n");
>                         status_ack |= ASPEED_I2CD_INTR_TX_NAK;
>                         goto error_and_stop;
>                 } else if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
> -                       dev_err(bus->dev, "slave failed to ACK TX");
> +                       dev_err(bus->dev, "slave failed to ACK TX\n");
>                         goto error_and_stop;
>                 }
>                 status_ack |= ASPEED_I2CD_INTR_TX_ACK;
> @@ -478,7 +478,7 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>                 /* fallthrough intended */
>         case ASPEED_I2C_MASTER_RX:
>                 if (unlikely(!(irq_status & ASPEED_I2CD_INTR_RX_DONE))) {
> -                       dev_err(bus->dev, "master failed to RX");
> +                       dev_err(bus->dev, "master failed to RX\n");
>                         goto error_and_stop;
>                 }
>                 status_ack |= ASPEED_I2CD_INTR_RX_DONE;
> @@ -509,7 +509,7 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>                 goto out_no_complete;
>         case ASPEED_I2C_MASTER_STOP:
>                 if (unlikely(!(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))) {
> -                       dev_err(bus->dev, "master failed to STOP");
> +                       dev_err(bus->dev, "master failed to STOP\n");
>                         bus->cmd_err = -EIO;
>                         /* Do not STOP as we have already tried. */
>                 } else {
> @@ -520,7 +520,7 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>                 goto out_complete;
>         case ASPEED_I2C_MASTER_INACTIVE:
>                 dev_err(bus->dev,
> -                       "master received interrupt 0x%08x, but is inactive",
> +                       "master received interrupt 0x%08x, but is inactive\n",
>                         irq_status);
>                 bus->cmd_err = -EIO;
>                 /* Do not STOP as we should be inactive. */
> @@ -851,7 +851,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>         bus->rst = devm_reset_control_get_shared(&pdev->dev, NULL);
>         if (IS_ERR(bus->rst)) {
>                 dev_err(&pdev->dev,
> -                       "missing or invalid reset controller device tree entry");
> +                       "missing or invalid reset controller device tree entry\n");
>                 return PTR_ERR(bus->rst);
>         }
>         reset_control_deassert(bus->rst);
> --
> 2.17.1
>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
