Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4DFF1mdPzDt3Q
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 15:20:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=RYCV9VTR; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id p136so2502167oic.1
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 21:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=xCDRlb1PLEIc1SG3PaxO3Wv6gfSUNE22OLjsua+nZCk=;
 b=RYCV9VTRPCclhmb14hHH5eqzmVpHCmXUvNfsJAnT2NJkku0RC001L2S1AmWmEABras
 Y9qlvSDRbSQeIANriaehfiXtZ2O3L7aUtZO4/V6ddGYFzg8PIeIU5zsSOndSFL4pbq8w
 WOVSbamoakcIwb9p4J11ea/7tx9uYvsyGWoP21pJcQBnvtoNkqGYNtA4t7lmVZ4T8m0m
 FcJbeS54nWupTxTH4QIKQVGjpgfiIhUdYmfmkiKHCJ3Aj2lqNlIlcMD7aNNagXXhZjFh
 GS+UAZcpK7MXZ7YbwNOAjXXbN2AQMUGfgEs6CTwlXOvYtsq+0KPNEHJ8ksl8HToXUx3s
 9fQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=xCDRlb1PLEIc1SG3PaxO3Wv6gfSUNE22OLjsua+nZCk=;
 b=ULlG9rODNGwHIBXhTUcmYM8iTDGwirCszhihaL7TTR8Ng8bcTWDZwNfKjYOOHMDXGr
 /DfmSdvnfQ+OGSBncgUn4rY9qX0bHeRhBAKoriMOWrOOKbegPTiddI1Jg/Q8eJJkcGml
 EUc915qt2b9ka6oiAMuhLEA9fXtF6iGqhjjhrfZUJdV6jGMmrYhYnYXMlIYcZ8o90+w8
 Ol72DpuPLLLgHlNYXw00uFNJYs44FGglVEdnvAehs3N6xIG4KUtS8T5tndd4K8jQpBBi
 cJyM4eiQ6HB6Sp9CWeemff1/wBZaMDMEkCSRRE1Dd1IgN/ebyxDz/ZUhY3oy9inMK0XM
 jAKw==
X-Gm-Message-State: ABUngvcgIl0jLNtPUjZU85Qmy/pugpSb7wlVdivC+Scjziak84qd8asnoEmCyaDIrW3A5rGR7RtZlZcgdKMmcw==
X-Received: by 10.202.252.133 with SMTP id a127mr4309584oii.124.1477541998825; 
 Wed, 26 Oct 2016 21:19:58 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Wed, 26 Oct 2016 21:19:38 -0700 (PDT)
In-Reply-To: <1477535233-7760-2-git-send-email-alastair@au1.ibm.com>
References: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
 <1477535233-7760-2-git-send-email-alastair@au1.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Oct 2016 14:49:38 +1030
X-Google-Sender-Auth: UfMDh7W6b9HrBMe2VzcCf8yBEyQ
Message-ID: <CACPK8XfwJ=84bc_ME2df84PA=7fba9aN9Ai0o26KLaUh+jdtgw@mail.gmail.com>
Subject: Re: [PATCH 1/3] Add Epson RX8900 RTC support
To: alastair@au1.ibm.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, clg@koad.org, 
 "Alastair D'Silva" <alastair@d-silva.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 27 Oct 2016 04:20:02 -0000

Hi Alastair,

Thanks for the patches. Please run them through checkpatch.pl from the
Qemu tree before your next submission.

As we use the openbmc list for code from a few different projects,
next time use --subject-prefix to add qemu to your series.

On Thu, Oct 27, 2016 at 12:57 PM,  <alastair@au1.ibm.com> wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  default-configs/arm-softmmu.mak |   1 +
>  hw/timer/Makefile.objs          |   1 +
>  hw/timer/rx8900.c               | 426 ++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 428 insertions(+)
>  create mode 100644 hw/timer/rx8900.c
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
> index 6de3e16..adb600e 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -29,6 +29,7 @@ CONFIG_SMC91C111=3Dy
>  CONFIG_ALLWINNER_EMAC=3Dy
>  CONFIG_IMX_FEC=3Dy
>  CONFIG_DS1338=3Dy
> +CONFIG_RX8900=3Dy
>  CONFIG_PFLASH_CFI01=3Dy
>  CONFIG_PFLASH_CFI02=3Dy
>  CONFIG_MICRODRIVE=3Dy
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 7ba8c23..ea072ca 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -17,6 +17,7 @@ common-obj-$(CONFIG_IMX) +=3D imx_epit.o
>  common-obj-$(CONFIG_IMX) +=3D imx_gpt.o
>  common-obj-$(CONFIG_LM32) +=3D lm32_timer.o
>  common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-sysctl.o
> +common-obj-$(CONFIG_RX8900) +=3D rx8900.o
>
>  obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o
>  obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pwm.o
> diff --git a/hw/timer/rx8900.c b/hw/timer/rx8900.c
> new file mode 100644
> index 0000000..4c15da8
> --- /dev/null
> +++ b/hw/timer/rx8900.c
> @@ -0,0 +1,426 @@
> +/*
> + * Epson RX8900SA/CE Realtime Clock Module
> + *
> + * Copyright (c) 2016 IBM Corporation
> + * Authors:
> + *      Alastair D'Silva <alastair@d-silva.org>
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>

Qemu tends to use a brief copyright header. Take a look at hw/arm/aspeed_so=
c.c:

 * Copyright 2016 IBM Corp.
 *
 * This code is licensed under the GPL version 2 or later.  See
 * the COPYING file in the top-level directory.

> + *
> + * Datasheet available at:
> + *     https://support.epson.biz/td/api/doc_check.php?dl=3Dapp_RX8900CE&=
lang=3Den
> + *
> + * Not implemented:
> + *     Implement Alarm functions
> + *     Implement Timer Counters
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "hw/i2c/i2c.h"
> +#include "qemu/bcd.h"
> +#include "qemu/error-report.h"
> +
> +#define TYPE_RX8900 "rx8900"
> +#define RX8900(obj) OBJECT_CHECK(RX8900State, (obj), TYPE_RX8900)
> +
> +#define NVRAM_SIZE 0x20
> +
> +typedef enum RX8900Addresses {

This typedef is unnecessary.

> +    SECONDS =3D 0x00,
> +    MINUTES =3D 0x01,
> +    HOURS =3D 0x02,
> +    WEEKDAY =3D 0x03,
> +    DAY =3D 0x04,
> +    MONTH =3D 0x05,
> +    YEAR =3D 0x06,
> +    RAM =3D 0x07,
> +    ALARM_MINUTE =3D 0x08,
> +    ALARM_HOUR =3D 0x09,
> +    ALARM_WEEK_DAY =3D 0x0A,
> +    TIMER_COUNTER_0 =3D 0x0B,
> +    TIMER_COUNTER_1 =3D 0x0C,
> +    EXTENSION_REGISTER =3D 0x0D,
> +    FLAG_REGISTER =3D 0X0E,
> +    CONTROL_REGISTER =3D 0X0F,
> +    EXT_SECONDS =3D 0x010, /* Alias of SECONDS */
> +    EXT_MINUTES =3D 0x11, /* Alias of MINUTES */
> +    EXT_HOURS =3D 0x12, /* Alias of HOURS */
> +    EXT_WEEKDAY =3D 0x13, /* Alias of WEEKDAY */
> +    EXT_DAY =3D 0x14, /* Alias of DAY */
> +    EXT_MONTH =3D 0x15, /* Alias of MONTH */
> +    EXT_YEAR =3D 0x16, /* Alias of YEAR */
> +    TEMPERATURE =3D 0x17,
> +    BACKUP_FUNCTION =3D 0x18,
> +    NO_USE_1 =3D 0x19,
> +    NO_USE_2 =3D 0x1A,
> +    EXT_TIMER_COUNTER_0 =3D 0x1B, /* Alias of TIMER_COUNTER_0 */
> +    EXT_TIMER_COUNTER_1 =3D 0x1C, /* Alias of TIMER_COUNTER_1 */
> +    EXT_EXTENSION_REGISTER =3D 0x1D, /* Alias of EXTENSION_REGISTER */
> +    EXT_FLAG_REGISTER =3D 0X1E, /* Alias of FLAG_REGISTER */
> +    EXT_CONTROL_REGISTER =3D 0X1F /* Alias of CONTROL_REGISTER */

Do you use all of these values? I suggest only including the
definitions for the ones you need.

Some models in Qemu chose not to have #defines (or enums) for the
registers, and instead use comments in the switch statements for the
operations they support.

> +} RX8900Addresses;
> +
> +typedef enum ExtRegBits {
> +    EXT_REG_TSEL0 =3D 0,
> +    EXT_REG_TSEL1 =3D 1,
> +    EXT_REG_FSEL0 =3D 2,
> +    EXT_REG_FSEL1 =3D 3,
> +    EXT_REG_TE =3D 4,
> +    EXT_REG_USEL =3D 5,
> +    EXT_REG_WADA =3D 6,
> +    EXT_REG_TEST =3D 7
> +} ExtRegBits;
> +

As above.

> +typedef enum CtrlRegBits {
> +    CTRL_REG_RESET =3D 0,
> +    CTRL_REG_WP0 =3D 1,
> +    CTRL_REG_WP1 =3D 2,
> +    CTRL_REG_AIE =3D 3,
> +    CTRL_REG_TIE =3D 4,
> +    CTRL_REG_UIE =3D 5,
> +    CTRL_REG_CSEL0 =3D 6,
> +    CTRL_REG_CSEL1 =3D 7
> +} CtrlRegBits;

As above.

> +
> +typedef struct RX8900State {
> +    I2CSlave parent_obj;
> +
> +    int64_t offset;
> +    uint8_t wday_offset;
> +    uint8_t nvram[NVRAM_SIZE];
> +    int32_t ptr;
> +    bool addr_byte;
> +} RX8900State;
> +
> +static const VMStateDescription vmstate_rx8900 =3D {
> +    .name =3D "rx8900",
> +    .version_id =3D 2,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[] ) {
> +        VMSTATE_I2C_SLAVE(parent_obj, RX8900State),
> +        VMSTATE_INT64(offset, RX8900State),
> +        VMSTATE_UINT8_V(wday_offset, RX8900State, 2),
> +        VMSTATE_UINT8_ARRAY(nvram, RX8900State, NVRAM_SIZE),
> +        VMSTATE_INT32(ptr, RX8900State),
> +        VMSTATE_BOOL(addr_byte, RX8900State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void capture_current_time(RX8900State *s)
> +{
> +    /* Capture the current time into the secondary registers
> +     * which will be actually read by the data transfer operation.
> +     */
> +    struct tm now;
> +    qemu_get_timedate(&now, s->offset);
> +    s->nvram[SECONDS] =3D to_bcd(now.tm_sec);
> +    s->nvram[MINUTES] =3D to_bcd(now.tm_min);
> +    s->nvram[HOURS] =3D to_bcd(now.tm_hour);
> +
> +    s->nvram[WEEKDAY] =3D 0x01 << ((now.tm_wday + 1) % 7);
> +    s->nvram[DAY] =3D to_bcd(now.tm_mday);
> +    s->nvram[MONTH] =3D to_bcd(now.tm_mon + 1);
> +    s->nvram[YEAR] =3D to_bcd(now.tm_year % 100);
> +
> +    s->nvram[EXT_SECONDS] =3D s->nvram[SECONDS];
> +    s->nvram[EXT_MINUTES] =3D s->nvram[MINUTES];
> +    s->nvram[EXT_HOURS] =3D s->nvram[HOURS];
> +    s->nvram[EXT_WEEKDAY] =3D s->nvram[WEEKDAY];
> +    s->nvram[EXT_DAY] =3D s->nvram[DAY];
> +    s->nvram[EXT_MONTH] =3D s->nvram[MONTH];
> +    s->nvram[EXT_YEAR] =3D s->nvram[YEAR];
> +}
> +
> +static void inc_regptr(RX8900State *s)
> +{
> +    /* The register pointer wraps around after 0x1F
> +     */
> +    s->ptr =3D (s->ptr + 1) & (NVRAM_SIZE - 1);
> +    if (s->ptr =3D=3D 0x00) {
> +        capture_current_time(s);
> +    }
> +}
> +
> +static void rx8900_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    RX8900State *s =3D RX8900(i2c);
> +
> +    switch (event) {
> +    case I2C_START_RECV:
> +        /* In h/w, capture happens on any START condition, not just a
> +         * START_RECV, but there is no need to actually capture on
> +         * START_SEND, because the guest can't get at that data
> +         * without going through a START_RECV which would overwrite it.
> +         */

This comment is hard to understand. Can you reword it please.

> +        capture_current_time(s);
> +        break;
> +    case I2C_START_SEND:
> +        s->addr_byte =3D true;
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static int rx8900_recv(I2CSlave *i2c)
> +{
> +    RX8900State *s =3D RX8900(i2c);
> +    uint8_t res =3D s->nvram[s->ptr];

What happens when ->ptr is larger than your nvram array?

> +    inc_regptr(s);
> +    return res;
> +}
> +
> +static void validate_extension_register(RX8900State *s, uint8_t data)
> +{
> +    uint8_t diffmask =3D data ^ s->nvram[EXTENSION_REGISTER];
> +
> +    if ((diffmask & 1 << EXT_REG_TSEL0) || (diffmask & 1 << EXT_REG_TSEL=
1)) {
> +        error_report("WARNING: RX8900 - "
> +            "Timer select modified but is unimplemented");
> +    }
> +
> +    if ((diffmask & 1 << EXT_REG_FSEL0) || (diffmask & 1 << EXT_REG_FSEL=
1)) {
> +        error_report("WARNING: RX8900 - "
> +            "FOut Frequency modified but is unimplemented");
> +    }
> +
> +    if (diffmask & 1 << EXT_REG_TE) {
> +        error_report("WARNING: RX8900 - "
> +            "Timer enable modified but is unimplemented");
> +    }
> +
> +    if (diffmask & 1 << EXT_REG_USEL) {
> +        error_report("WARNING: RX8900 - "
> +            "Update interrupt modified but is unimplemented");
> +    }
> +
> +    if (diffmask & 1 << EXT_REG_WADA) {
> +        error_report("WARNING: RX8900 - "
> +            "Week/day alarm modified but is unimplemented");
> +    }
> +
> +    if (data & 1 << EXT_REG_TEST) {
> +        error_report("WARNING: RX8900 - "
> +            "Test bit is enabled but is forbidden by the manufacturer");
> +    }

All that this function does is print "unimplemented". Why do we need it?

> +}
> +
> +static void validate_control_register(RX8900State *s, uint8_t data)
> +{
> +    uint8_t diffmask =3D data ^ s->nvram[CONTROL_REGISTER];
> +
> +    if (diffmask & 1 << CTRL_REG_RESET) {
> +        error_report("WARNING: RX8900 - "
> +            "Reset requested but is unimplemented");
> +    }
> +
> +    if (diffmask & 1 << CTRL_REG_WP0) {
> +        error_report("WARNING: RX8900 - "
> +            "Attempt to write to write protected bit %d in control regis=
ter",
> +            CTRL_REG_WP0);
> +    }
> +
> +    if (diffmask & 1 << CTRL_REG_WP1) {
> +        error_report("WARNING: RX8900 - "
> +            "Attempt to write to write protected bit %d in control regis=
ter",
> +            CTRL_REG_WP1);
> +    }
> +
> +    if (diffmask & 1 << CTRL_REG_AIE) {
> +        error_report("WARNING: RX8900 - "
> +            "Alarm interrupt requested but is unimplemented");
> +    }
> +
> +    if (diffmask & 1 << CTRL_REG_TIE) {
> +        error_report("WARNING: RX8900 - "
> +            "Timer interrupt requested but is unimplemented");
> +    }
> +
> +    if (diffmask & 1 << CTRL_REG_UIE) {
> +        error_report("WARNING: RX8900 - "
> +            "Update interrupt requested but is unimplemented");
> +    }
> +
> +}

As above.

> +
> +static int rx8900_send(I2CSlave *i2c, uint8_t data)
> +{
> +    RX8900State *s =3D RX8900(i2c);
> +    struct tm now;
> +
> +    if (s->addr_byte) {
> +        s->ptr =3D data & (NVRAM_SIZE - 1);
> +        s->addr_byte =3D false;
> +        return 0;
> +    }
> +
> +    qemu_get_timedate(&now, s->offset);
> +    switch (s->ptr) {
> +    case SECONDS:
> +    case EXT_SECONDS:
> +        now.tm_sec =3D from_bcd(data & 0x7f);
> +        s->nvram[SECONDS] =3D data;
> +        s->nvram[EXT_SECONDS] =3D data;
> +        break;
> +
> +    case MINUTES:
> +    case EXT_MINUTES:
> +        now.tm_min =3D from_bcd(data & 0x7f);
> +        s->nvram[MINUTES] =3D data;
> +        s->nvram[EXT_MINUTES] =3D data;
> +        break;
> +
> +    case HOURS:
> +    case EXT_HOURS:
> +        now.tm_hour =3D from_bcd(data & 0x3f);
> +        s->nvram[HOURS] =3D data;
> +        s->nvram[EXT_HOURS] =3D data;
> +        break;
> +
> +    case WEEKDAY:
> +    case EXT_WEEKDAY: {
> +        int user_wday =3D 0;
> +        /* The day field is supposed to contain a value in
> +         * the range 0-6. Otherwise behavior is undefined.
> +         */
> +        switch (data) {
> +        case 0x01:
> +            user_wday =3D 0;
> +            break;
> +        case 0x02:
> +            user_wday =3D 1;
> +            break;
> +        case 0x04:
> +            user_wday =3D 2;
> +            break;
> +        case 0x08:
> +            user_wday =3D 3;
> +            break;
> +        case 0x10:
> +            user_wday =3D 4;
> +            break;
> +        case 0x20:
> +            user_wday =3D 5;
> +            break;
> +        case 0x40:
> +            user_wday =3D 6;
> +            break;

The weekday is the bit index in data. You can use ffs or log2 to
assign this to user_wday instead of having the nested switch
statement.

> +        default:
> +            error_report("WARNING: RX8900 - weekday data '%x' is out of =
range,"
> +                    " undefined behavior will result", data);
> +            break;
> +        }
> +        s->wday_offset =3D (user_wday - now.tm_wday + 7) % 7;
> +        s->nvram[WEEKDAY] =3D data;
> +        s->nvram[EXT_WEEKDAY] =3D data;
> +        break;
> +    }
> +
> +    case DAY:
> +    case EXT_DAY:
> +        now.tm_mday =3D from_bcd(data & 0x3f);
> +        s->nvram[DAY] =3D data;
> +        s->nvram[EXT_DAY] =3D data;
> +        break;
> +
> +    case MONTH:
> +    case EXT_MONTH:
> +        now.tm_mon =3D from_bcd(data & 0x1f) - 1;
> +        s->nvram[MONTH] =3D data;
> +        s->nvram[EXT_MONTH] =3D data;
> +        break;
> +
> +    case YEAR:
> +    case EXT_YEAR:
> +        now.tm_year =3D from_bcd(data) + 100;
> +        s->nvram[YEAR] =3D data;
> +        s->nvram[EXT_YEAR] =3D data;
> +        break;
> +
> +    case EXTENSION_REGISTER:
> +    case EXT_EXTENSION_REGISTER:
> +        validate_extension_register(s, data);
> +        s->nvram[EXTENSION_REGISTER] =3D data;
> +        s->nvram[EXT_EXTENSION_REGISTER] =3D data;
> +        break;
> +
> +    case CONTROL_REGISTER:
> +    case EXT_CONTROL_REGISTER:
> +        validate_control_register(s, data);
> +        s->nvram[EXTENSION_REGISTER] =3D data;
> +        s->nvram[EXT_EXTENSION_REGISTER] =3D data;
> +        break;
> +
> +    default:
> +        s->nvram[s->ptr] =3D data;
> +    }
> +
> +    inc_regptr(s);
> +    return 0;
> +}
> +
> +static int rx8900_init(I2CSlave *i2c)
> +{
> +    return 0;
> +}

This does nothing. Does Qemu let you omit the callback?

> +
> +static void rx8900_reset(DeviceState *dev)
> +{
> +    RX8900State *s =3D RX8900(dev);
> +
> +    /* The clock is running and synchronized with the host */
> +    s->offset =3D 0;
> +    memset(s->nvram, 0, NVRAM_SIZE);
> +
> +    /* Temperature formulation from the datasheet
> +     * ( TEMP[ 7:0 ] * 2 =E2=80=93 187.19) / 3.218
> +     *
> +     * Hardcode it to 25 degrees Celcius
> +     */
> +    s->nvram[TEMPERATURE] =3D 135; /* (25 * 3.218 + 187.19) / 2 */

Instead of hardcoding, expose it as a property. This way it can be set
by the monitor at runtime.

Take a look at the temp423 model.

> +
> +    s->nvram[CONTROL_REGISTER] =3D 1 << CTRL_REG_CSEL0;

You can use BIT(CTRL_REG_CSEL0) to make this more redable.

> +
> +    s->ptr =3D 0;
> +    s->addr_byte =3D false;
> +}
> +
> +static void rx8900_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
> +
> +    k->init =3D rx8900_init;
> +    k->event =3D rx8900_event;
> +    k->recv =3D rx8900_recv;
> +    k->send =3D rx8900_send;
> +    dc->reset =3D rx8900_reset;
> +    dc->vmsd =3D &vmstate_rx8900;
> +}
> +
> +static const TypeInfo rx8900_info =3D {
> +    .name =3D TYPE_RX8900,
> +    .parent =3D TYPE_I2C_SLAVE,
> +    .instance_size =3D sizeof(RX8900State),
> +    .class_init =3D rx8900_class_init,
> +};
> +
> +static void rx8900_register_types(void)
> +{
> +    type_register_static(&rx8900_info);
> +}
> +
> +type_init(rx8900_register_types)
> --
> 2.7.4
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
