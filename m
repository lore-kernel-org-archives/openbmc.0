Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4DGy4MWqzDt3Q
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 15:21:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GUon5JXE; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id n202so2500953oig.2
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 21:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=X+JwjHZLi5+LgugD8P1vHCxsphaF5giZwg0JvyKC0dg=;
 b=GUon5JXEmcb//h/f8Kk0evSGqecUxO4v2fc0V3D7Vlp8RDmTB+5xCagE6wcYM/vszK
 ecFqPvvJfNnTJkRDrBOAUxKD1KW/iwPVJ9kqbVX57Wdf17hzpf6uQ0dVkV9tV+HJxTBx
 R3MeI+LpZPLWE7UoBMLciOjqMk0VUSprS21M66mo5OBOLBGuhLiu4eRGCPNi93QRv0w+
 7+GdXVbTsuxyDZkAna49DzXh7JS8115/LTZHPCyfM2QvRM0pBSSHBWKp2WZc0pn1/XHA
 993aI5WZAW65T3IfPncci77iKBIX3VtQ2TVJdDlBWb4T8ensfWhvDE0k7X/PFk80wpZ4
 YQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=X+JwjHZLi5+LgugD8P1vHCxsphaF5giZwg0JvyKC0dg=;
 b=L38ZgpsyYiymXA7JOJoACQFeU+rDaGc5g7K0xfNFUcB54UN0h7bG2nR1HGPj0x8r0h
 qBrSCpU6sBfbmZpMoqNDOQgFuJsgYRpuTVFOclQTAXeK3DETK0D6wNM5B2GkCzipJHEv
 goVbaaYWj51rca5EDUYRbZ7ec+/XY6XmAZKkXZI8ukwDGaph7bComXDc8hvfLdAiAt/z
 7y9yAZVLfJ90/SxiBWvDkBG7KRKdC35bwQgXCjluJjISsYMXFJxVd8VkCyAAFiFaGH1p
 zXUyqgw0OFcJk/wre71Kw54RYQ9JeN4WoV4h0F44OV/SSftYuSXRhCTQiSaZHGNzFfaE
 ZYkQ==
X-Gm-Message-State: ABUngvfi6ELpxVbxpvSsuOii9oaibr30OYzwDrAYhPvOHNCNvqKAnP1GzLE+tojjwqSFUVaVGWEfQBl4nlz1Pg==
X-Received: by 10.202.90.3 with SMTP id o3mr5216095oib.46.1477542088493; Wed,
 26 Oct 2016 21:21:28 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Wed, 26 Oct 2016 21:21:08 -0700 (PDT)
In-Reply-To: <1477535233-7760-4-git-send-email-alastair@au1.ibm.com>
References: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
 <1477535233-7760-4-git-send-email-alastair@au1.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Oct 2016 14:51:08 +1030
X-Google-Sender-Auth: 4M8tTHqxcoMawK6V6hFXl1_nnCw
Message-ID: <CACPK8XfW0VKNaN1dptzMaRQmvw02Uwab0wHcA+m4=cQReWEnTQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] Add a unit test for RX8900 RTC (time functionality
 only)
To: alastair@au1.ibm.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, clg@koad.org, 
 "Alastair D'Silva" <alastair@d-silva.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Oct 2016 04:21:31 -0000

On Thu, Oct 27, 2016 at 12:57 PM,  <alastair@au1.ibm.com> wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>

You need a commit message.

I don't know much about Qemu testing, so I'll let Andrew and Cedric comment.

> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  hw/arm/imx25_pdk.c     |  9 +++---
>  tests/Makefile.include |  2 ++
>  tests/rx8900-test.c    | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 89 insertions(+), 4 deletions(-)
>  create mode 100644 tests/rx8900-test.c
>
> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index 025b608..99a819f 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -134,13 +134,14 @@ static void imx25_pdk_init(MachineState *machine)
>          arm_load_kernel(&s->soc.cpu, &imx25_pdk_binfo);
>      } else {
>          /*
> -         * This I2C device doesn't exist on the real board.
> +         * These I2C devices doesn't exist on the real board.
>           * We add it here (only on qtest usage) to be able to do a bit
>           * of simple qtest. See "make check" for details.
>           */
> -        i2c_create_slave((I2CBus *)qdev_get_child_bus(DEVICE(&s->soc.i2c[0]),
> -                                                      "i2c"),
> -                         "ds1338", 0x68);
> +        I2CBus *i2c = (I2CBus *)qdev_get_child_bus(DEVICE(&s->soc.i2c[0]),
> +                "i2c");
> +        i2c_create_slave(i2c, "ds1338", 0x68);
> +        i2c_create_slave(i2c, "rx8900", 0x32);

I'm not sure how upstream will take this.

Is there a reason you didn't add them to an aspeed board instead?

>      }
>  }
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index cbe38ad..3f08ba9 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -297,6 +297,7 @@ check-qtest-sparc64-y = tests/endianness-test$(EXESUF)
>
>  check-qtest-arm-y = tests/tmp105-test$(EXESUF)
>  check-qtest-arm-y += tests/ds1338-test$(EXESUF)
> +check-qtest-arm-y += tests/rx8900-test$(EXESUF)
>  check-qtest-arm-y += tests/m25p80-test$(EXESUF)
>  gcov-files-arm-y += hw/misc/tmp105.c
>  check-qtest-arm-y += tests/virtio-blk-test$(EXESUF)
> @@ -629,6 +630,7 @@ tests/bios-tables-test$(EXESUF): tests/bios-tables-test.o \
>  tests/pxe-test$(EXESUF): tests/pxe-test.o tests/boot-sector.o $(libqos-obj-y)
>  tests/tmp105-test$(EXESUF): tests/tmp105-test.o $(libqos-omap-obj-y)
>  tests/ds1338-test$(EXESUF): tests/ds1338-test.o $(libqos-imx-obj-y)
> +tests/rx8900-test$(EXESUF): tests/rx8900-test.o $(libqos-imx-obj-y)
>  tests/m25p80-test$(EXESUF): tests/m25p80-test.o
>  tests/i440fx-test$(EXESUF): tests/i440fx-test.o $(libqos-pc-obj-y)
>  tests/q35-test$(EXESUF): tests/q35-test.o $(libqos-pc-obj-y)
> diff --git a/tests/rx8900-test.c b/tests/rx8900-test.c
> new file mode 100644
> index 0000000..8d3ecd8
> --- /dev/null
> +++ b/tests/rx8900-test.c
> @@ -0,0 +1,82 @@
> +/*
> + * QTest testcase for the DS1338 RTC
> + *
> + * Copyright (c) 2013 Jean-Christophe Dubois
> + *
> + *  This program is free software; you can redistribute it and/or modify it
> + *  under the terms of the GNU General Public License as published by the
> + *  Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful, but WITHOUT
> + *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + *  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + *  for more details.
> + *
> + *  You should have received a copy of the GNU General Public License along
> + *  with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +#include "libqos/i2c.h"
> +
> +#define IMX25_I2C_0_BASE 0x43F80000
> +
> +#define RX8900_ADDR 0x32
> +
> +static I2CAdapter *i2c;
> +static uint8_t addr;
> +
> +static inline uint8_t bcd2bin(uint8_t x)
> +{
> +    return ((x) & 0x0f) + ((x) >> 4) * 10;
> +}
> +
> +static void send_and_receive(void)
> +{
> +    uint8_t cmd[1];
> +    uint8_t resp[7];
> +    time_t now = time(NULL);
> +    struct tm *tm_ptr;
> +
> +    /* reset the index in the RTC memory */
> +    cmd[0] = 0;
> +    i2c_send(i2c, addr, cmd, 1);
> +
> +    tm_ptr = gmtime(&now);
> +    /* retrieve the date */
> +    i2c_recv(i2c, addr, resp, 7);
> +
> +    /* check retrieved time against local time */
> +    g_assert_cmpuint(bcd2bin(resp[0]), == , tm_ptr->tm_sec);
> +    g_assert_cmpuint(bcd2bin(resp[1]), == , tm_ptr->tm_min);
> +    g_assert_cmpuint(bcd2bin(resp[2]), == , tm_ptr->tm_hour);
> +    g_assert_cmpuint(bcd2bin(resp[4]), == , tm_ptr->tm_mday);
> +    g_assert_cmpuint(bcd2bin(resp[5]), == , 1 + tm_ptr->tm_mon);
> +    g_assert_cmpuint(2000 + bcd2bin(resp[6]), == , 1900 + tm_ptr->tm_year);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    QTestState *s = NULL;
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    /* Address must match RX8900_ADDR */
> +    s = qtest_start("-display none -machine imx25-pdk");
> +    i2c = imx_i2c_create(IMX25_I2C_0_BASE);
> +    addr = RX8900_ADDR;
> +
> +    qtest_add_func("/rx8900/tx-rx", send_and_receive);
> +
> +    ret = g_test_run();
> +
> +    if (s) {
> +        qtest_quit(s);
> +    }
> +    g_free(i2c);
> +
> +    return ret;
> +}
> --
> 2.7.4
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
