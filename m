Return-Path: <Chen.KenYY@inventec.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inventec.com
 (client-ip=61.220.76.161; helo=mail.inventec.com;
 envelope-from=chen.kenyy@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inventec.com
Received: from mail.inventec.com (hub01.inventec.com [61.220.76.161])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4007fj41zLzDr47
 for <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 17:41:00 +1100 (AEDT)
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2010-03.iec.inventec (10.1.254.155) with Microsoft SMTP Server id
 14.3.174.1; Mon, 12 Mar 2018 14:40:53 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])	by
 IEC1-MSE-FE2.inventec.com with ESMTP id w2C6egQY094884	for
 <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 14:40:42 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: from mail-lf0-f71.google.com (mail-lf0-f71.google.com
 [209.85.215.71])	by IEC1-SPAM-2.inventec.com with ESMTP id w2C6eWtv073198
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 14:40:35 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: by mail-lf0-f71.google.com with SMTP id 78-v6so2240467lfy.17
 for <openbmc@lists.ozlabs.org>; Sun, 11 Mar 2018 23:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RSi7dCmPFhYy3upjmES58DGcMfNlSfU2Hvc7NJADMtg=;
 b=Uw+yn0U4BwF6Qz/4uxU1LVtyv2co9tilTpxx7qiu07N8DRBxv5YWraGPCDFipmMTkB
 xiYkRJ4fid4DIGhBA77C8F7e/X/3SoqImyr6azZE51i8O1yq1yDB6yqYngkH8mXUPcwT
 NjaU+/yvSzfoR1+psA26PacUuLlGWNFnmSdVmd7oIgDAumCMorvBaT1DN7gLckG2JRKh
 RCWm9ypwyDWlOLNSYSuz+TdYr9DICPxoo35Y7Jcfswkq3EMkObronNmmLHyI4T/PISMi
 JCFpYWXfRloiSYLKHojq+MNY4Cnc5cNLdjP6TxixNDgTyTj145dnHkzMgZOL71+rJt3V
 V/Ng==
X-Gm-Message-State: AElRT7Eh7ctFdR4SY3LE2gTMGqpIZa80S63FWa8j9B8lcXyJb+hvVBUe
 vXUgitXcIbR4V3vSS6cUB5U+0gABp1bsA/NWucXsJNgEmZr8r0mJ5TVnZJTdmfMMwJjR4WroGQC
 UwX36ReCuq/vZ05NSpRxPE/2KBHU499frHpcwKg==
X-Received: by 2002:a19:f20:: with SMTP id e32-v6mr377223lfi.69.1520836831242; 
 Sun, 11 Mar 2018 23:40:31 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs+qPTJVBbJExECz4WRic49sEmsybTxuVWgsRCUJk+o9Qw7GtYI1+7Al10CKWZOr5J8XfIMkghuhjRFHPg0GYM=
X-Received: by 2002:a19:f20:: with SMTP id e32-v6mr377207lfi.69.1520836830626; 
 Sun, 11 Mar 2018 23:40:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:1dc5:0:0:0:0:0 with HTTP; Sun, 11 Mar 2018 23:40:29
 -0700 (PDT)
In-Reply-To: <CACPK8XeDKWvieorWyUoBo4s5OC9sRdPS5wRmVqDPOEg9bGCSaA@mail.gmail.com>
References: <20180223052250.10024-1-chen.kenyy@inventec.com>
 <CACPK8Xejwb_7pGZAz-eriuE2rohxzWJ=me3a2PSgUntM2pqNLg@mail.gmail.com>
 <CADo_Z42yOJYCXaki3Y7W2QbA3jchazEwAZmhB=EydNyYrrmNOQ@mail.gmail.com>
 <CACPK8XeDKWvieorWyUoBo4s5OC9sRdPS5wRmVqDPOEg9bGCSaA@mail.gmail.com>
From: =?UTF-8?B?Q2hlbktlbllZIOmZs+awuOeHnyBUQU8=?= <chen.kenyy@inventec.com>
Date: Mon, 12 Mar 2018 14:40:29 +0800
Message-ID: <CADo_Z424u2vTJGU5TDsmYAkOCZn_B5kkQTzLOjeSSooChre5ZQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] drivers: i2c: master arbiter: create driver
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE2.inventec.com w2C6egQY094884
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
X-List-Received-Date: Mon, 12 Mar 2018 06:41:03 -0000

Hi Joel,

Could I use an independent .c file(PCA9641) to upstream this driver?
Because the reference code has probe issue and sperate the difference
device behavior between PCA9541 and PCA9641 by function.
So I think It would be better using an independent .c file.


Best Regards,
Ken

2018-03-08 13:34 GMT+08:00 Joel Stanley <joel@jms.id.au>:
> On Thu, Mar 8, 2018 at 3:36 PM, ChenKenYY =E9=99=B3=E6=B0=B8=E7=87=9F TAO
> <chen.kenyy@inventec.com> wrote:
>> Hi Joel,
>>
>> Sure, I can take it, but I need some instructions on the next action.
>
> Okay. I suggest you download the patch from patchwork and apply it to
> the latest kernel release, 4.16-rc4:
>
> https://patchwork.ozlabs.org/patch/726491/
>
> You can download it by clicking the 'mbox' link at the top right of the p=
age.
>
> Now you will have a file called
> RFC-i2c-mux-Driver-for-PCA9641-I2C-Master-Arbiter.patch.
>
> $ git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
> $ cd linux
> $ git checkout -b pca9641-mux v4.16-rc4
> $ git am ~/Downloads/RFC-i2c-mux-Driver-for-PCA9641-I2C-Master-Arbiter.pa=
tch
>
>
> From there, take a look at the comments on the two reviews that Vidya had=
:
>
>  https://patchwork.ozlabs.org/patch/726491/#1580479
>  https://patchwork.ozlabs.org/patch/726491/#1582916
>
> Fix those issues, and add your signed off by:
>
> $ git add drivers/i2c/muxes/i2c-mux-pca9541.c
> $ git commit --amend -s
>
> Then test this driver on your board. To do this, modify the device
> tree. You should be able to do this by modifying the ast2500-evb
> device tree, and boot that on your system.
>
> Once this is working, use the checkpatch.pl tool to check for common mist=
akes:
>
> $ ./scripts/checkpatch.pl drivers/i2c/muxes/i2c-mux-pca9541.c
>
> Then use get_maintainer.pl to get a list of people you should send the pa=
tch to:
>
> $ ./scripts/get_maintainer.pl -f drivers/i2c/muxes/i2c-mux-pca9541.c
> Guenter Roeck <linux@roeck-us.net> (maintainer:PCA9541 I2C BUS MASTER
> SELECTOR DRIVER)
> Peter Rosin <peda@axentia.se> (maintainer:I2C MUXES)
> Wolfram Sang <wsa@the-dreams.de> (maintainer:I2C SUBSYSTEM)
> linux-i2c@vger.kernel.org (open list:PCA9541 I2C BUS MASTER SELECTOR DRIV=
ER)
> linux-kernel@vger.kernel.org (open list)
>
> In addition, please add me to this list so I can help. Then send the
> patch out, with a comment in the commit message (below the ---) that
> you have continued this work from the previous author, and have tested
> it on your system.
>
> Cheers,
>
> Joel
>
>>
>> Thanks,
>> Ken
>>
>> 2018-03-08 11:02 GMT+08:00 Joel Stanley <joel@jms.id.au>:
>>> Hello Ken,
>>>
>>> On Fri, Feb 23, 2018 at 3:52 PM, Ken Chen <chen.kenyy@inventec.com> wro=
te:
>>>> Initial PCA9641 2 chennel I2C bus master arbiter
>>>>
>>>> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
>>>
>>> The code here looks good. I did some searching, and found that someone
>>> submitted a driver for this part about a year ago:
>>>
>>>  https://patchwork.ozlabs.org/patch/726491/
>>>
>>> Unfortunately the submitter did not send another version after it was
>>> reviewed. I suggest we take up the patch that was submitted, make the
>>> changes suggested, and submit it upstream. Are you able to take on
>>> that work?
>>>
>>> Cheers,
>>>
>>> Joel
>>>
>>>> ---
>>>>  drivers/i2c/muxes/Kconfig           |   9 +
>>>>  drivers/i2c/muxes/Makefile          |   1 +
>>>>  drivers/i2c/muxes/i2c-mux-pca9641.c | 372 +++++++++++++++++++++++++++=
+++++++++
>>>>  3 files changed, 382 insertions(+)
>>>>  create mode 100644 drivers/i2c/muxes/i2c-mux-pca9641.c
>>>>
>>>> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
>>>> index 1712132..1cd1ad3 100644
>>>> --- a/drivers/i2c/muxes/Kconfig
>>>> +++ b/drivers/i2c/muxes/Kconfig
>>>> @@ -73,6 +73,15 @@ config I2C_MUX_PCA954x
>>>>           This driver can also be built as a module.  If so, the modul=
e
>>>>           will be called i2c-mux-pca954x.
>>>>
>>>> +config I2C_MUX_PCA9641
>>>> +       tristate "NXP PCA9641 I2C Master demultiplexer"
>>>> +       help
>>>> +         If you say yes here you get support for the NXP PCA9641
>>>> +         I2C Master demultiplexer with an arbiter function.
>>>> +
>>>> +         This driver can also be built as a module.  If so, the modul=
e
>>>> +         will be called i2c-mux-pca9641.
>>>> +
>>>>  config I2C_MUX_PINCTRL
>>>>         tristate "pinctrl-based I2C multiplexer"
>>>>         depends on PINCTRL
>>>> diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
>>>> index 4a67d31..f95d5f5 100644
>>>> --- a/drivers/i2c/muxes/Makefile
>>>> +++ b/drivers/i2c/muxes/Makefile
>>>> @@ -11,6 +11,7 @@ obj-$(CONFIG_I2C_MUX_LTC4306) +=3D i2c-mux-ltc4306.o
>>>>  obj-$(CONFIG_I2C_MUX_MLXCPLD)  +=3D i2c-mux-mlxcpld.o
>>>>  obj-$(CONFIG_I2C_MUX_PCA9541)  +=3D i2c-mux-pca9541.o
>>>>  obj-$(CONFIG_I2C_MUX_PCA954x)  +=3D i2c-mux-pca954x.o
>>>> +obj-$(CONFIG_I2C_MUX_PCA9641)  +=3D i2c-mux-pca9641.o
>>>>  obj-$(CONFIG_I2C_MUX_PINCTRL)  +=3D i2c-mux-pinctrl.o
>>>>  obj-$(CONFIG_I2C_MUX_REG)      +=3D i2c-mux-reg.o
>>>>
>>>> diff --git a/drivers/i2c/muxes/i2c-mux-pca9641.c b/drivers/i2c/muxes/i=
2c-mux-pca9641.c
>>>> new file mode 100644
>>>> index 0000000..ca7b816
>>>> --- /dev/null
>>>> +++ b/drivers/i2c/muxes/i2c-mux-pca9641.c
>>>> @@ -0,0 +1,372 @@
>>>> +/*
>>>> + * I2C demultiplexer driver for PCA9641 bus master demultiplexer
>>>> + *
>>>> + * Copyright (c) 2010 Ericsson AB.
>>>> + *
>>>> + * Author: Ken Chen <chen.kenyy@inventec.com>
>>>> + *
>>>> + * Derived from:
>>>> + *
>>>> + * This file is licensed under the terms of the GNU General Public
>>>> + * License version 2. This program is licensed "as is" without any
>>>> + * warranty of any kind, whether express or implied.
>>>> + */
>>>> +
>>>> +#include <linux/module.h>
>>>> +#include <linux/jiffies.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/slab.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/i2c-mux.h>
>>>> +
>>>> +#include <linux/i2c/pca954x.h>
>>>> +
>>>> +/*
>>>> + * The PCA9641 is two I2C bus masters demultiplexer. It supports two =
I2C masters
>>>> + * connected to a single slave bus.
>>>> + *
>>>> + * It is designed for high reliability dual master I2C bus applicatio=
ns where
>>>> + * correct system operation is required, even when two I2C master iss=
ue their
>>>> + * commands at the same time. The arbiter will select a winner and le=
t it work
>>>> + * uninterrupted, and the losing master will take control of the I2C =
bus after
>>>> + * the winnter has finished. The arbiter also allows for queued reque=
sts where
>>>> + * a master requests the downstream bus while the other master has co=
ntrol.
>>>> + *
>>>> + */
>>>> +
>>>> +#define PCA9641_ID             0x01
>>>> +#define PCA9641_ID_MAGIC       0x38
>>>> +
>>>> +#define PCA9641_CONTROL                0x01
>>>> +#define PCA9641_STATUS         0x02
>>>> +#define PCA9641_TIME           0x03
>>>> +
>>>> +#define PCA9641_CTL_LOCK_REQ            (1 << 0)
>>>> +#define PCA9641_CTL_LOCK_GRANT          (1 << 1)
>>>> +#define PCA9641_CTL_BUS_CONNECT         (1 << 2)
>>>> +#define PCA9641_CTL_BUS_INIT            (1 << 3)
>>>> +#define PCA9641_CTL_SMBUS_SWRST         (1 << 4)
>>>> +#define PCA9641_CTL_IDLE_TIMER_DIS      (1 << 5)
>>>> +#define PCA9641_CTL_SMBUS_DIS           (1 << 6)
>>>> +#define PCA9641_CTL_PRIORITY            (1 << 7)
>>>> +
>>>> +#define PCA9641_STS_OTHER_LOCK          (1 << 0)
>>>> +#define PCA9641_STS_BUS_INIT_FAIL       (1 << 1)
>>>> +#define PCA9641_STS_BUS_HUNG            (1 << 2)
>>>> +#define PCA9641_STS_MBOX_EMPTY          (1 << 3)
>>>> +#define PCA9641_STS_MBOX_FULL           (1 << 4)
>>>> +#define PCA9641_STS_TEST_INT            (1 << 5)
>>>> +#define PCA9641_STS_SCL_IO              (1 << 6)
>>>> +#define PCA9641_STS_SDA_IO              (1 << 7)
>>>> +
>>>> +#define PCA9641_RES_TIME       0x03
>>>> +
>>>> +#define other_lock(x)  ((x) & PCA9641_STS_OTHER_LOCK)
>>>> +#define lock_grant(x)  ((x) & PCA9641_CTL_LOCK_GRANT)
>>>> +
>>>> +/* arbitration timeouts, in jiffies */
>>>> +#define ARB_TIMEOUT    (HZ / 8)        /* 125 ms until forcing bus ow=
nership */
>>>> +#define ARB2_TIMEOUT   (HZ / 4)        /* 250 ms until acquisition fa=
ilure */
>>>> +
>>>> +/* arbitration retry delays, in us */
>>>> +#define SELECT_DELAY_SHORT     50
>>>> +#define SELECT_DELAY_LONG      1000
>>>> +
>>>> +struct pca9641 {
>>>> +       struct i2c_client *client;
>>>> +       unsigned long select_timeout;
>>>> +       unsigned long arb_timeout;
>>>> +};
>>>> +
>>>> +static const struct i2c_device_id pca9641_id[] =3D {
>>>> +       {"pca9641", 0},
>>>> +       {}
>>>> +};
>>>> +
>>>> +MODULE_DEVICE_TABLE(i2c, pca9641_id);
>>>> +
>>>> +#ifdef CONFIG_OF
>>>> +static const struct of_device_id pca9641_of_match[] =3D {
>>>> +       { .compatible =3D "nxp,pca9641" },
>>>> +       {}
>>>> +};
>>>> +#endif
>>>> +
>>>> +/*
>>>> + * Write to chip register. Don't use i2c_transfer()/i2c_smbus_xfer()
>>>> + * as they will try to lock the adapter a second time.
>>>> + */
>>>> +static int pca9641_reg_write(struct i2c_client *client, u8 command, u=
8 val)
>>>> +{
>>>> +       struct i2c_adapter *adap =3D client->adapter;
>>>> +       int ret;
>>>> +
>>>> +       if (adap->algo->master_xfer) {
>>>> +               struct i2c_msg msg;
>>>> +               char buf[2];
>>>> +
>>>> +               msg.addr =3D client->addr;
>>>> +               msg.flags =3D 0;
>>>> +               msg.len =3D 2;
>>>> +               buf[0] =3D command;
>>>> +               buf[1] =3D val;
>>>> +               msg.buf =3D buf;
>>>> +               ret =3D __i2c_transfer(adap, &msg, 1);
>>>> +       } else {
>>>> +               union i2c_smbus_data data;
>>>> +
>>>> +               data.byte =3D val;
>>>> +               ret =3D adap->algo->smbus_xfer(adap, client->addr,
>>>> +                                            client->flags,
>>>> +                                            I2C_SMBUS_WRITE,
>>>> +                                            command,
>>>> +                                            I2C_SMBUS_BYTE_DATA, &dat=
a);
>>>> +       }
>>>> +
>>>> +       return ret;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Read from chip register. Don't use i2c_transfer()/i2c_smbus_xfer()
>>>> + * as they will try to lock adapter a second time.
>>>> + */
>>>> +static int pca9641_reg_read(struct i2c_client *client, u8 command)
>>>> +{
>>>> +       struct i2c_adapter *adap =3D client->adapter;
>>>> +       int ret;
>>>> +       u8 val;
>>>> +
>>>> +       if (adap->algo->master_xfer) {
>>>> +               struct i2c_msg msg[2] =3D {
>>>> +                       {
>>>> +                               .addr =3D client->addr,
>>>> +                               .flags =3D 0,
>>>> +                               .len =3D 1,
>>>> +                               .buf =3D &command
>>>> +                       },
>>>> +                       {
>>>> +                               .addr =3D client->addr,
>>>> +                               .flags =3D I2C_M_RD,
>>>> +                               .len =3D 1,
>>>> +                               .buf =3D &val
>>>> +                       }
>>>> +               };
>>>> +               ret =3D __i2c_transfer(adap, msg, 2);
>>>> +               if (ret =3D=3D 2)
>>>> +                       ret =3D val;
>>>> +               else if (ret >=3D 0)
>>>> +                       ret =3D -EIO;
>>>> +       } else {
>>>> +               union i2c_smbus_data data;
>>>> +
>>>> +               ret =3D adap->algo->smbus_xfer(adap, client->addr,
>>>> +                                            client->flags,
>>>> +                                            I2C_SMBUS_READ,
>>>> +                                            command,
>>>> +                                            I2C_SMBUS_BYTE_DATA, &dat=
a);
>>>> +               if (!ret)
>>>> +                       ret =3D data.byte;
>>>> +       }
>>>> +       return ret;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Arbitration management functions
>>>> + */
>>>> +static void pca9641_release_bus(struct i2c_client *client)
>>>> +{
>>>> +       int reg;
>>>> +
>>>> +       pca9641_reg_write(client, PCA9641_CONTROL, 0);
>>>> +}
>>>> +
>>>> +/*
>>>> + * Channel arbitration
>>>> + *
>>>> + * Return values:
>>>> + *  <0: error
>>>> + *  0 : bus not acquired
>>>> + *  1 : bus acquired
>>>> + */
>>>> +static int pca9641_arbitrate(struct i2c_client *client)
>>>> +{
>>>> +       struct i2c_mux_core *muxc =3D i2c_get_clientdata(client);
>>>> +       struct pca9641 *data =3D i2c_mux_priv(muxc);
>>>> +       int reg_ctl, reg_sts;
>>>> +
>>>> +       reg_ctl =3D pca9641_reg_read(client, PCA9641_CONTROL);
>>>> +       if (reg_ctl < 0)
>>>> +               return reg_ctl;
>>>> +       reg_sts =3D pca9641_reg_read(client, PCA9641_STATUS);
>>>> +
>>>> +       if (!other_lock(reg_sts) && !lock_grant(reg_ctl)) {
>>>> +               /*
>>>> +                * Bus is off. Request ownership or turn it on unless
>>>> +                * other master requested ownership.
>>>> +                */
>>>> +                reg_ctl |=3D PCA9641_CTL_LOCK_REQ;
>>>> +                pca9641_reg_write(client, PCA9641_CONTROL, reg_ctl);
>>>> +
>>>> +                udelay(100);
>>>> +
>>>> +               reg_ctl =3D pca9641_reg_read(client, PCA9641_CONTROL);
>>>> +
>>>> +                if (lock_grant(reg_ctl)) {
>>>> +                        /*
>>>> +                         * Other master did not request ownership,
>>>> +                         * or arbitration timeout expired. Take the b=
us.
>>>> +                         */
>>>> +                        reg_ctl |=3D PCA9641_CTL_BUS_CONNECT | PCA964=
1_CTL_LOCK_REQ;
>>>> +                        pca9641_reg_write(client, PCA9641_CONTROL, re=
g_ctl);
>>>> +                        data->select_timeout =3D SELECT_DELAY_SHORT;
>>>> +
>>>> +                        return 1;
>>>> +                } else {
>>>> +                        /*
>>>> +                         * Other master requested ownership.
>>>> +                         * Set extra long timeout to give it time to =
acquire it.
>>>> +                         */
>>>> +                        data->select_timeout =3D SELECT_DELAY_LONG * =
2;
>>>> +                }
>>>> +       } else if (lock_grant(reg_ctl)) {
>>>> +                /*
>>>> +                 * Bus is on, and we own it. We are done with acquisi=
tion.
>>>> +                 */
>>>> +                reg_ctl |=3D PCA9641_CTL_BUS_CONNECT | PCA9641_CTL_LO=
CK_REQ;
>>>> +                pca9641_reg_write(client, PCA9641_CONTROL, reg_ctl);
>>>> +
>>>> +                return 1;
>>>> +       } else if (other_lock(reg_sts)) {
>>>> +                /*
>>>> +                 * Other master owns the bus.
>>>> +                 * If arbitration timeout has expired, force ownershi=
p.
>>>> +                 * Otherwise request it.
>>>> +                 */
>>>> +                data->select_timeout =3D SELECT_DELAY_LONG;
>>>> +                reg_ctl |=3D PCA9641_CTL_LOCK_REQ;
>>>> +                pca9641_reg_write(client, PCA9641_CONTROL, reg_ctl);
>>>> +
>>>> +                /*
>>>> +                 * if (time_is_before_eq_jiffies(data->arb_timeout)) =
{
>>>> +                 * TODO:Time is up, take the bus and reset it.
>>>> +                 *
>>>> +                 *} else {
>>>> +                 * TODO: Request bus ownership if needed
>>>> +                 *
>>>> +                 *}
>>>> +                 */
>>>> +        }
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int pca9641_select_chan(struct i2c_mux_core *muxc, u32 chan)
>>>> +{
>>>> +       struct pca9641 *data =3D i2c_mux_priv(muxc);
>>>> +       struct i2c_client *client =3D data->client;
>>>> +       int ret;
>>>> +       unsigned long timeout =3D jiffies + ARB2_TIMEOUT;
>>>> +               /* give up after this time */
>>>> +
>>>> +       data->arb_timeout =3D jiffies + ARB_TIMEOUT;
>>>> +               /* force bus ownership after this time */
>>>> +
>>>> +       do {
>>>> +               ret =3D pca9641_arbitrate(client);
>>>> +               if (ret)
>>>> +                       return ret < 0 ? ret : 0;
>>>> +
>>>> +               if (data->select_timeout =3D=3D SELECT_DELAY_SHORT)
>>>> +                       udelay(data->select_timeout);
>>>> +               else
>>>> +                       msleep(data->select_timeout / 1000);
>>>> +       } while (time_is_after_eq_jiffies(timeout));
>>>> +
>>>> +       return -ETIMEDOUT;
>>>> +}
>>>> +
>>>> +static int pca9641_release_chan(struct i2c_mux_core *muxc, u32 chan)
>>>> +{
>>>> +       struct pca9641 *data =3D i2c_mux_priv(muxc);
>>>> +       struct i2c_client *client =3D data->client;
>>>> +
>>>> +       pca9641_release_bus(client);
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * I2C init/probing/exit functions
>>>> + */
>>>> +static int pca9641_probe(struct i2c_client *client,
>>>> +                        const struct i2c_device_id *id)
>>>> +{
>>>> +       struct i2c_adapter *adap =3D client->adapter;
>>>> +       struct pca954x_platform_data *pdata =3D dev_get_platdata(&clie=
nt->dev);
>>>> +       struct i2c_mux_core *muxc;
>>>> +       struct pca9641 *data;
>>>> +       int force;
>>>> +       int ret;
>>>> +
>>>> +       if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_BYTE_DATA))
>>>> +               return -ENODEV;
>>>> +
>>>> +       /*
>>>> +        * I2C accesses are unprotected here.
>>>> +        * We have to lock the adapter before releasing the bus.
>>>> +        */
>>>> +       i2c_lock_adapter(adap);
>>>> +       pca9641_release_bus(client);
>>>> +       i2c_unlock_adapter(adap);
>>>> +
>>>> +       /* Create mux adapter */
>>>> +
>>>> +       force =3D 0;
>>>> +       if (pdata)
>>>> +               force =3D pdata->modes[0].adap_id;
>>>> +       muxc =3D i2c_mux_alloc(adap, &client->dev, 8, sizeof(*data),
>>>> +                            I2C_MUX_ARBITRATOR,
>>>> +                            pca9641_select_chan, pca9641_release_chan=
);
>>>> +       if (!muxc)
>>>> +               return -ENOMEM;
>>>> +
>>>> +       data =3D i2c_mux_priv(muxc);
>>>> +       data->client =3D client;
>>>> +
>>>> +       i2c_set_clientdata(client, muxc);
>>>> +
>>>> +
>>>> +       ret =3D i2c_mux_add_adapter(muxc, force, 0, 0);
>>>> +       if (ret) {
>>>> +               dev_err(&client->dev, "failed to register master demul=
tiplexer\n");
>>>> +               return ret;
>>>> +       }
>>>> +
>>>> +       dev_info(&client->dev, "registered master demultiplexer for I2=
C %s\n",
>>>> +                client->name);
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int pca9641_remove(struct i2c_client *client)
>>>> +{
>>>> +       struct i2c_mux_core *muxc =3D i2c_get_clientdata(client);
>>>> +
>>>> +       i2c_mux_del_adapters(muxc);
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static struct i2c_driver pca9641_driver =3D {
>>>> +       .driver =3D {
>>>> +                  .name =3D "pca9641",
>>>> +                  .of_match_table =3D of_match_ptr(pca9641_of_match),
>>>> +                  },
>>>> +       .probe =3D pca9641_probe,
>>>> +       .remove =3D pca9641_remove,
>>>> +       .id_table =3D pca9641_id,
>>>> +};
>>>> +
>>>> +module_i2c_driver(pca9641_driver);
>>>> +
>>>> +MODULE_AUTHOR("Ken Chen <chen.kenyy@inventec.com>");
>>>> +MODULE_DESCRIPTION("PCA9641 I2C master demultiplexer driver");
>>>> +MODULE_LICENSE("GPL v2");
>>>> --
>>>> 2.9.3
>>>>
