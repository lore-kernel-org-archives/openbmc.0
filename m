Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::241; helo=mail-qk0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bbzhei/t"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="U4gmHeAY"; 
 dkim-atps=neutral
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GSNv48DbzF1Mm;
 Thu, 28 Jun 2018 15:03:58 +1000 (AEST)
Received: by mail-qk0-x241.google.com with SMTP id a132-v6so2330331qkg.3;
 Wed, 27 Jun 2018 22:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=IvqXIzZi3p3meeJg1yvo7ES8eMFJzAPjo+3AMXixJus=;
 b=bbzhei/tO8RKLQHmWWETVFSfx7Ak+UFxuyuW1ej9ois2+/wzWZQYYsFzLQ4L9xAbr0
 MJs/hyWNzdpS3n7SCL1S/KZhQcai5pS8N4OOo60ypU/IXiaJlioNJvH+mTXfKAtGML0B
 UNoWY8cMrK7meWJA2ao0hPbzdjND68/EAnusp10jt4HWT6vqWsrOjemJ/XIEHb1NzsPD
 RhUpNeHY7JPW7EzWVhMoCdniVKf+4+0Ut8fj6TlAV4vw2Jvydz7ekmysXtebmRTLZHjt
 26vEx+1ZH3snSwCEXgbiujI5VboI89LO/NrfsrduFzhac7jdp1hrMoYxg9sL8PTzCuxe
 Zv0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=IvqXIzZi3p3meeJg1yvo7ES8eMFJzAPjo+3AMXixJus=;
 b=U4gmHeAY3Tz4NMtNLlI20Q/kFVQyrs735h7ZSbOtfCCh/LhvsFL4XkxMkk5ZXFHqfk
 7C8457liAPIBu7lSG/MAlzuQM+hp6Lj3KO/N2WSNEwm6hhTdiMTRmAEC+uwi92pKH7tH
 SVvRzjMpRqCr16n+lxX24ytobW4uluoeVtzXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=IvqXIzZi3p3meeJg1yvo7ES8eMFJzAPjo+3AMXixJus=;
 b=o+0dsuk4aixBqb+48IGwG7Pr0XbpOWSklR6eVGnxOHG+iDE0m7iERjkpFKpYDG+dsp
 H6fj5DATKd8/SM8ufsM0dk4cgDB224YJ+y+ZbILbee8CiS9b2ciSm8NPmdCIxSq8PGr+
 REBOp7pfMSnc3OGtY3cwED+T4T3yg3g+/yX+5CNLQvrPXZIgq5IZ2C0Vt5UCBgHWmD8k
 opVKAiMnkORmTPDXedBBPWqv5uYuR8LXJFmF4RS6eVcNNM/S7ePglWNIBJepjrHIx36Y
 OmvdfxpjsEZd+a+0hziwgO2O83fRIiA3p0TAsylKBY7ONku7SRMFA5LZ29wcLolN9yOt
 eRkQ==
X-Gm-Message-State: APt69E3deyHF6BFOyxZrrWuZrb8DpNt119DjuXGWCUGzNO9yGNIBDlkq
 WcV9mJZljFcB1bp46CUB5jQ6ubXQVlg2VqbzoQo=
X-Google-Smtp-Source: AAOMgpcDFw+/UoGWPaItsNh6ru6g3MZk5gPgWpiMVSVLDaJ7EeCmIoX11kwjd0gUBJV8dWvVTUBNx/sd6W0brJv65aA=
X-Received: by 2002:a37:dd4e:: with SMTP id
 n75-v6mr7251665qki.370.1530162236186; 
 Wed, 27 Jun 2018 22:03:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 22:03:35
 -0700 (PDT)
In-Reply-To: <20180626232605.13420-13-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
 <20180626232605.13420-13-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 14:33:35 +0930
X-Google-Sender-Auth: GgRuN2oz9WJvEOZZF7RG-7KTByY
Message-ID: <CACPK8XfkxFZixL+5e5Spzo-=uJDXgojNMncn6k+upxJH+D=+eQ@mail.gmail.com>
Subject: Re: [PATCH 12/14] fsi: master-ast-cf: Add new FSI master using Aspeed
 ColdFire
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 28 Jun 2018 05:04:02 -0000

Hi Ben,

On 27 June 2018 at 08:56, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> The Aspeed AST2x00 can contain a ColdFire v1 coprocessor which
> is currently unused on OpenPower systems.
>
> This adds an alternative to the fsi-master-gpio driver that
> uses that coprocessor instead of bit banging from the ARM
> core itself. The end result is about 4 times faster.
>
> The firmware for the coprocessor and its source code can be
> found at https://github.com/ozbenh/cf-fsi and is system specific.
>
> Currently tested on Romulus and Palmetto systems.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Nice work. I gave this a spin on Romulus and it looked good.

If you run it through sparse there are a bunch of things to fix. I've
also got some comments below.

> --- /dev/null
> +++ b/drivers/fsi/cf-fsi-fw.h
> @@ -0,0 +1,131 @@


Copyright?

> +#ifndef __CF_FSI_FW_H
> +#define __CF_FSI_FW_H
> +
> +/*
> + * uCode file layout
> + *
> + * 0000...03ff : m68k exception vectors
> + * 0400...04ff : Header info & boot config block
> + * 0500....... : Code & stack
> + */

> diff --git a/drivers/fsi/fsi-master-ast-cf.c b/drivers/fsi/fsi-master-ast-cf.c
> new file mode 100644
> index 000000000000..6b17f27c27f6
> --- /dev/null
> +++ b/drivers/fsi/fsi-master-ast-cf.c
> @@ -0,0 +1,1376 @@
> +// SPDX-License-Identifier: GPL-2.0

Normally 2+ for new IBM code? You also need something like this on the
next line:

// Copyright 2018 IBM Corp

> +static int read_copro_response(struct fsi_master_acf *master, uint8_t size,
> +                              __be32 *response, u8 *tag)
> +{
> +       u8 rtag = readb(master->sram + STAT_RTAG);
> +       u8 rcrc = readb(master->sram + STAT_RCRC);
> +       __be32 rdata = 0;
> +       u32 crc;
> +       u8 ack;
> +
> +       *tag = ack = rtag & 3;
> +
> +       /* we have a whole message now; check CRC */
> +       crc = crc4(0, 1, 1);
> +       crc = crc4(crc, rtag, 4);
> +       if (ack == FSI_RESP_ACK && size) {
> +               rdata = readl(master->sram + RSP_DATA);
> +               crc = crc4(crc, be32_to_cpu(rdata), 32);
> +               if (response)
> +                       *response = rdata;
> +       }
> +       crc = crc4(crc, rcrc, 4);
> +
> +       trace_fsi_master_acf_copro_response(master, rtag, rcrc, rdata, crc == 0);
> +
> +       if (crc) {
> +               /*
> +                * Check if it's all 1's or all 0's, that probably means
> +                * the host is off
> +                */
> +               if ((rtag == 0xf && rcrc == 0xf) || (rtag == 0 && rcrc == 0))
> +                       return -ENODEV;
> +               dev_dbg(master->dev, "Bad response CRC !\n");
> +               return -EAGAIN;
> +       }
> +       return 0;
> +}
> +
> +static int send_term(struct fsi_master_acf *master, uint8_t slave)
> +{
> +       struct fsi_msg cmd;
> +       uint8_t tag;
> +       int rc;
> +
> +       build_term_command(&cmd, slave);
> +
> +       rc = send_request(master, &cmd, true);
> +       if (rc) {
> +               dev_warn(master->dev, "Error %d sending term\n", rc);
> +               return rc;
> +       }
> +
> +       rc = read_copro_response(master, 0, NULL, &tag);
> +       if (rc < 0) {
> +               dev_err(master->dev,
> +                               "TERM failed; lost communication with slave\n");
> +               return -EIO;
> +       } else if (tag != FSI_RESP_ACK) {
> +               dev_err(master->dev, "TERM failed; response %d\n", tag);
> +               return -EIO;
> +       }
> +       return 0;
> +}
> +
> +static void dump_trace(struct fsi_master_acf *master)
> +{
> +       char trbuf[52];

I was checking that this was big enough.

52 = 16 * 3 + '\n' + \0' = 50?

Looks to be okay.

> +       char *p;
> +       int i;
> +
> +       dev_dbg(master->dev,
> +               "CMDSTAT:%08x RTAG=%02x RCRC=%02x RDATA=%02x #INT=%08x\n",
> +              be32_to_cpu(readl(master->sram + CMD_STAT_REG)),
> +              readb(master->sram + STAT_RTAG),
> +              readb(master->sram + STAT_RCRC),
> +              be32_to_cpu(readl(master->sram + RSP_DATA)),
> +              be32_to_cpu(readl(master->sram + INT_CNT)));
> +
> +       for (i = 0; i < 512; i++) {
> +               uint8_t v;
> +               if ((i % 16) == 0)
> +                       p = trbuf;
> +               v = readb(master->sram + TRACEBUF + i);
> +               p += sprintf(p, "%02x ", v);
> +               if (((i % 16) == 15) || v == TR_END)
> +                       dev_dbg(master->dev, "%s\n", trbuf);
> +               if (v == TR_END)
> +                       break;
> +       }
> +}
> +
> +static int handle_response(struct fsi_master_acf *master,
> +                          uint8_t slave, uint8_t size, void *data)
> +{
> +       int busy_count = 0, rc;
> +       int crc_err_retries = 0;
> +       struct fsi_msg cmd;
> +       __be32 response;
> +       uint8_t tag;
> +retry:
> +       rc = read_copro_response(master, size, &response, &tag);
> +
> +       /* Handle retries on CRC errors */
> +       if (rc == -EAGAIN) {
> +               /* Too many retries ? */
> +               if (crc_err_retries++ > FSI_CRC_ERR_RETRIES) {
> +                       /*
> +                        * Pass it up as a -EIO otherwise upper level will retry
> +                        * the whole command which isn't what we want here.
> +                        */
> +                       rc = -EIO;
> +                       goto bail;
> +               }
> +               trace_fsi_master_acf_crc_rsp_error(master, crc_err_retries);
> +               if (master->trace_enabled)
> +                       dump_trace(master);
> +               rc = clock_zeros(master, FSI_MASTER_EPOLL_CLOCKS);
> +               if (rc) {
> +                       dev_warn(master->dev,
> +                                "Error %d clocking zeros for E_POLL\n", rc);
> +                       return rc;
> +               }
> +               build_epoll_command(&cmd, slave);
> +               rc = send_request(master, &cmd, size == 0);
> +               if (rc) {
> +                       dev_warn(master->dev, "Error %d sending E_POLL\n", rc);
> +                       return -EIO;
> +               }
> +               goto retry;
> +       }
> +       if (rc)
> +               return rc;
> +
> +       switch (tag) {
> +       case FSI_RESP_ACK:
> +               if (size && data) {
> +                       if (size == 4)
> +                               *(__be32 *)data = response;
> +                       else if (size == 2)
> +                               *(__be16 *)data = response;
> +                       else
> +                               *(u8 *)data = response;

Response is a u32, the idea here is to discard the top two or three byes?

> +
> +static int fsi_master_acf_setup(struct fsi_master_acf *master)
> +{
> +       int timeout, rc;
> +       u32 val;
> +

> +
> +       /* Wait for status register to indicate command completion
> +        * which signals the initialization is complete
> +        */
> +       for (timeout = 0; timeout < 10; timeout++) {
> +               val = readb(master->sram + CF_STARTED);
> +               if (val)
> +                       break;
> +               msleep(1);
> +       };

drivers/fsi/fsi-master-ast-cf.c:920:2-3: Unneeded semicolon

> +       if (!val) {
> +               dev_err(master->dev, "Coprocessor startup timeout !\n");
> +               rc = -ENODEV;
> +               goto err;
> +       }
> +
> +       /* Configure echo & send delay */
> +       writeb(master->t_send_delay, master->sram + SEND_DLY_REG);
> +       writeb(master->t_echo_delay, master->sram + ECHO_DLY_REG);
> +
> +       /* Enable SW interrupt to copro if any */
> +       if (master->cvic) {
> +               rc = copro_enable_sw_irq(master);
> +               if (rc)
> +                       goto err;
> +       }
> +       return 0;
> + err:
> +       /* An error occurred, don't leave the coprocessor running */
> +       reset_cf(master);
> +
> +       /* Release the GPIOs */
> +       release_copro_gpios(master);
> +
> +       return rc;
> +}

> +static int fsi_master_acf_gpio_request(void *data)
> +{
> +       struct fsi_master_acf *master = data;
> +       int timeout;
> +       u8 val;
> +
> +       /* Note: This doesn't require holding out mutex */
> +
> +       /* Write reqest */
> +       writeb(ARB_ARM_REQ, master->sram + ARB_REG);
> +
> +       /* Read back to avoid ordering issue */
> +       (void)readb(master->sram + ARB_REG);
> +
> +       /*
> +        * There is a race (which does happen at boot time) when we get an
> +        * arbitration request as we are either about to or just starting
> +        * the coprocessor.
> +        *
> +        * To handle it, we first check if we are running. If not yet we
> +        * check whether the copro is started in the SCU.
> +        *
> +        * If it's not started, we can basically just assume we have arbitration
> +        * and return. Otherwise, we wait normally expecting for the arbitration
> +        * to eventually complete.
> +        */
> +       if (readl(master->sram + CF_STARTED) == 0) {
> +               unsigned int reg = 0;
> +
> +               regmap_read(master->scu, SCU_COPRO_CTRL, &reg);
> +               if (!reg & SCU_COPRO_CLK_EN)

Is this correct? Looks like it might be missing some ( )

> +                       return 0;
> +       }
> +
> +       /* Ring doorbell if any */
> +       if (master->cvic)
> +               writel(0x2, master->cvic + CVIC_TRIG_REG);
> +
> +       for (timeout = 0; timeout < 10000; timeout++) {
> +               val = readb(master->sram + ARB_REG);
> +               if (val != ARB_ARM_REQ)
> +                       break;
> +               udelay(1);
> +       }
> +
> +       /* If it failed, override anyway */
> +       if (val != ARB_ARM_ACK)
> +               dev_warn(master->dev, "GPIO request arbitration timeout\n");
> +
> +       return 0;
> +}
> +
