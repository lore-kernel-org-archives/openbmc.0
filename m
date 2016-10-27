Return-Path: <alastair@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4FDM0t6MzDvLw
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 16:04:18 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9R54Gw7014190
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 01:04:16 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0b-001b2d01.pphosted.com with ESMTP id 26b6xarcf5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 01:04:15 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 27 Oct 2016 15:03:55 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 27 Oct 2016 15:03:53 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 51CB82CE8054
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 16:03:53 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9R53rAw19464348
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 16:03:53 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9R53qkC019438
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 16:03:53 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9R53qYR019425; Thu, 27 Oct 2016 16:03:52 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4BC81A019C;
 Thu, 27 Oct 2016 16:03:52 +1100 (AEDT)
Subject: Re: [PATCH 1/3] Add Epson RX8900 RTC support
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, clg@koad.org
Date: Thu, 27 Oct 2016 16:03:51 +1100
In-Reply-To: <CACPK8XfwJ=84bc_ME2df84PA=7fba9aN9Ai0o26KLaUh+jdtgw@mail.gmail.com>
References: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
 <1477535233-7760-2-git-send-email-alastair@au1.ibm.com>
 <CACPK8XfwJ=84bc_ME2df84PA=7fba9aN9Ai0o26KLaUh+jdtgw@mail.gmail.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102705-0008-0000-0000-000000D5CF8D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102705-0009-0000-0000-0000085B291C
Message-Id: <1477544631.2176.111.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-27_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610270085
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
X-List-Received-Date: Thu, 27 Oct 2016 05:04:19 -0000

On Thu, 2016-10-27 at 14:49 +1030, Joel Stanley wrote:
<snip>
> index 0000000..4c15da8
> > --- /dev/null
> > +++ b/hw/timer/rx8900.c
> > @@ -0,0 +1,426 @@
> > +/*
> > + * Epson RX8900SA/CE Realtime Clock Module
> > + *
> > + * Copyright (c) 2016 IBM Corporation
> > + * Authors:
> > + *      Alastair D'Silva <alastair@d-silva.org>
> > + *
> > + * This library is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU Lesser General Public
> > + * License as published by the Free Software Foundation; either
> > + * version 2 of the License, or (at your option) any later
> > version.
> > + *
> > + * This library is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > GNU
> > + * Lesser General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU Lesser General
> > Public
> > + * License along with this library; if not, see <http://www.gnu.or
> > g/licenses/>
> 
> Qemu tends to use a brief copyright header. Take a look at
> hw/arm/aspeed_soc.c:
> 

Ok.

> > +#include "qemu/osdep.h"
> > +#include "qemu-common.h"
> > +#include "hw/i2c/i2c.h"
> > +#include "qemu/bcd.h"
> > +#include "qemu/error-report.h"
> > +
> > +#define TYPE_RX8900 "rx8900"
> > +#define RX8900(obj) OBJECT_CHECK(RX8900State, (obj), TYPE_RX8900)
> > +
> > +#define NVRAM_SIZE 0x20
> > +
> > +typedef enum RX8900Addresses {
> 
> This typedef is unnecessary.
> 

How so? It add semantics that define the context that these values can
be used, so from a maintainability point of view, it is necessary. A
similar pattern is used in i2c-omap.c.

> > 
> > +    SECONDS = 0x00,
> > +    MINUTES = 0x01,
> > +    HOURS = 0x02,
> > +    WEEKDAY = 0x03,
> > +    DAY = 0x04,
> > +    MONTH = 0x05,
> > +    YEAR = 0x06,
> > +    RAM = 0x07,
> > +    ALARM_MINUTE = 0x08,
> > +    ALARM_HOUR = 0x09,
> > +    ALARM_WEEK_DAY = 0x0A,
> > +    TIMER_COUNTER_0 = 0x0B,
> > +    TIMER_COUNTER_1 = 0x0C,
> > +    EXTENSION_REGISTER = 0x0D,
> > +    FLAG_REGISTER = 0X0E,
> > +    CONTROL_REGISTER = 0X0F,
> > +    EXT_SECONDS = 0x010, /* Alias of SECONDS */
> > +    EXT_MINUTES = 0x11, /* Alias of MINUTES */
> > +    EXT_HOURS = 0x12, /* Alias of HOURS */
> > +    EXT_WEEKDAY = 0x13, /* Alias of WEEKDAY */
> > +    EXT_DAY = 0x14, /* Alias of DAY */
> > +    EXT_MONTH = 0x15, /* Alias of MONTH */
> > +    EXT_YEAR = 0x16, /* Alias of YEAR */
> > +    TEMPERATURE = 0x17,
> > +    BACKUP_FUNCTION = 0x18,
> > +    NO_USE_1 = 0x19,
> > +    NO_USE_2 = 0x1A,
> > +    EXT_TIMER_COUNTER_0 = 0x1B, /* Alias of TIMER_COUNTER_0 */
> > +    EXT_TIMER_COUNTER_1 = 0x1C, /* Alias of TIMER_COUNTER_1 */
> > +    EXT_EXTENSION_REGISTER = 0x1D, /* Alias of EXTENSION_REGISTER
> > */
> > +    EXT_FLAG_REGISTER = 0X1E, /* Alias of FLAG_REGISTER */
> > +    EXT_CONTROL_REGISTER = 0X1F /* Alias of CONTROL_REGISTER */
> 
> Do you use all of these values? I suggest only including the
> definitions for the ones you need.
> 

Most are at the moment, and all will be required for a full
implementation (at which point, one would have to play "guess which
item is missing from the list").

> Some models in Qemu chose not to have #defines (or enums) for the
> registers, and instead use comments in the switch statements for the
> operations they support.

This sounds like it would lead to unmaintainable code, especially when
the same "magic numbers" are used in multiple places.
+
> > +    switch (event) {
> > +    case I2C_START_RECV:
> > +        /* In h/w, capture happens on any START condition, not
> > just a
> > +         * START_RECV, but there is no need to actually capture on
> > +         * START_SEND, because the guest can't get at that data
> > +         * without going through a START_RECV which would
> > overwrite it.
> > +         */
> 
> This comment is hard to understand. Can you reword it please.

Whoops, that was brought over from ds1338.c, I'll have a look.

> > +static int rx8900_recv(I2CSlave *i2c)
> > +{
> > +    RX8900State *s = RX8900(i2c);
> > +    uint8_t res = s->nvram[s->ptr];
> 
> What happens when ->ptr is larger than your nvram array?

s->ptr is wrapped to stay within the array.

> > +
> > +static void validate_extension_register(RX8900State *s, uint8_t
> > data)
> > +{
> > +    uint8_t diffmask = data ^ s->nvram[EXTENSION_REGISTER];
> > +
> > +    if ((diffmask & 1 << EXT_REG_TSEL0) || (diffmask & 1 <<
> > EXT_REG_TSEL1)) {
> > +        error_report("WARNING: RX8900 - "
> > +            "Timer select modified but is unimplemented");
> > +    }
> > +
> > +    if ((diffmask & 1 << EXT_REG_FSEL0) || (diffmask & 1 <<
> > EXT_REG_FSEL1)) {
> > +        error_report("WARNING: RX8900 - "
> > +            "FOut Frequency modified but is unimplemented");
> > +    }
> > +
> > +    if (diffmask & 1 << EXT_REG_TE) {
> > +        error_report("WARNING: RX8900 - "
> > +            "Timer enable modified but is unimplemented");
> > +    }
> > +
> > +    if (diffmask & 1 << EXT_REG_USEL) {
> > +        error_report("WARNING: RX8900 - "
> > +            "Update interrupt modified but is unimplemented");
> > +    }
> > +
> > +    if (diffmask & 1 << EXT_REG_WADA) {
> > +        error_report("WARNING: RX8900 - "
> > +            "Week/day alarm modified but is unimplemented");
> > +    }
> > +
> > +    if (data & 1 << EXT_REG_TEST) {
> > +        error_report("WARNING: RX8900 - "
> > +            "Test bit is enabled but is forbidden by the
> > manufacturer");
> > +    }
> 
> All that this function does is print "unimplemented". Why do we need
> it?

So that when a user pokes these registers expecting something to
happen, they know what they poked and why it did not have the effect
the requested. Just printing out "unimplemented" does not give the user
enough context to diagnose the problem.

> > 
> > +
> > +static int rx8900_send(I2CSlave *i2c, uint8_t data)
> > +{
> > +    RX8900State *s = RX8900(i2c);
> > +    struct tm now;
> > +
> > +    if (s->addr_byte) {
> > +        s->ptr = data & (NVRAM_SIZE - 1);
> > +        s->addr_byte = false;
> > +        return 0;
> > +    }
> > +
> > +    qemu_get_timedate(&now, s->offset);
> > +    switch (s->ptr) {
> > +    case SECONDS:
> > +    case EXT_SECONDS:
> > +        now.tm_sec = from_bcd(data & 0x7f);
> > +        s->nvram[SECONDS] = data;
> > +        s->nvram[EXT_SECONDS] = data;
> > +        break;
> > +
> > +    case MINUTES:
> > +    case EXT_MINUTES:
> > +        now.tm_min = from_bcd(data & 0x7f);
> > +        s->nvram[MINUTES] = data;
> > +        s->nvram[EXT_MINUTES] = data;
> > +        break;
> > +
> > +    case HOURS:
> > +    case EXT_HOURS:
> > +        now.tm_hour = from_bcd(data & 0x3f);
> > +        s->nvram[HOURS] = data;
> > +        s->nvram[EXT_HOURS] = data;
> > +        break;
> > +
> > +    case WEEKDAY:
> > +    case EXT_WEEKDAY: {
> > +        int user_wday = 0;
> > +        /* The day field is supposed to contain a value in
> > +         * the range 0-6. Otherwise behavior is undefined.
> > +         */
> > +        switch (data) {
> > +        case 0x01:
> > +            user_wday = 0;
> > +            break;
> > +        case 0x02:
> > +            user_wday = 1;
> > +            break;
> > +        case 0x04:
> > +            user_wday = 2;
> > +            break;
> > +        case 0x08:
> > +            user_wday = 3;
> > +            break;
> > +        case 0x10:
> > +            user_wday = 4;
> > +            break;
> > +        case 0x20:
> > +            user_wday = 5;
> > +            break;
> > +        case 0x40:
> > +            user_wday = 6;
> > +            break;
> 
> The weekday is the bit index in data. You can use ffs or log2 to
> assign this to user_wday instead of having the nested switch
> statement.

Ok, thanks, this code was quite horrible.

> > +static int rx8900_init(I2CSlave *i2c)
> > +{
> > +    return 0;
> > +}
> 
> This does nothing. Does Qemu let you omit the callback?
> 

I'm not sure, this was taken from ds1338.c.

> > 
> > +
> > +static void rx8900_reset(DeviceState *dev)
> > +{
> > +    RX8900State *s = RX8900(dev);
> > +
> > +    /* The clock is running and synchronized with the host */
> > +    s->offset = 0;
> > +    memset(s->nvram, 0, NVRAM_SIZE);
> > +
> > +    /* Temperature formulation from the datasheet
> > +     * ( TEMP[ 7:0 ] * 2 – 187.19) / 3.218
> > +     *
> > +     * Hardcode it to 25 degrees Celcius
> > +     */
> > +    s->nvram[TEMPERATURE] = 135; /* (25 * 3.218 + 187.19) / 2 */
> 
> Instead of hardcoding, expose it as a property. This way it can be
> set
> by the monitor at runtime.
> 
> Take a look at the temp423 model.

Ok, that sounds good.

> > 
> > +
> > +    s->nvram[CONTROL_REGISTER] = 1 << CTRL_REG_CSEL0;
> 
> You can use BIT(CTRL_REG_CSEL0) to make this more redable.

Ok.

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819
