Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dxdmbmiq"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="cDyKAo1u"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zxfNF3ySfzF1ph
 for <openbmc@lists.ozlabs.org>; Thu,  8 Mar 2018 16:34:53 +1100 (AEDT)
Received: by mail-qt0-x244.google.com with SMTP id v90so5469227qte.12
 for <openbmc@lists.ozlabs.org>; Wed, 07 Mar 2018 21:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=8Teon6klmKiWNEKTE3JkvARJWkRx7vsTOWT0LKn77XI=;
 b=dxdmbmiql1OkMnyJdY3fCxSGlvb3P8rCKVRhSi9WO/UQQqDlFcyODVyp22WvXHD+9v
 s0GD3a6PvGldBlZLE2TQTmeQSqbudQbtPgA+RbNu3WbWu/HpXNc33shrHnT0kVauootE
 grY31gTp+5rXCjprm7fo9nJta5PEMxMKCWd+g/3zwY6tJRXcxUGzhHveqoK/rOf4+uk0
 rcWqIN7tyghWN4l+kyqBq/DXc6YgLmskLxYSVDp/0kHERwRQ0iI8caeLi0eH0AkdsSnC
 nwLhg2sR81qQH9suJSnIA3zzMaZEQ52GmTj6SRgFXfXEpdZj/NZwYyd9agSr6aqeG3BL
 6WxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=8Teon6klmKiWNEKTE3JkvARJWkRx7vsTOWT0LKn77XI=;
 b=cDyKAo1ubWZ751w/nTnNxXxP8ggUaXZe8j5Kccgjk9IZYuYxSWhuZ0vNNBSf4Fq/UQ
 0rN44+9jL5k3pkYWREq6NE8UP2nBEdQdkbBJqd7AYNl3mUFF9Lt5PH5RIm4BDEY+xgwF
 Dh+u3YJ1WZx5ftWd6ZMnukEbECNT/ueCgmStA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=8Teon6klmKiWNEKTE3JkvARJWkRx7vsTOWT0LKn77XI=;
 b=L2/4bIJt4mIgehcajEqlXwYaYhBR+GleQgEVc2xSqmfV7ccP8w30LS6yTfVj7+ebgG
 WE+hqJVbQ54QJgdC+PRqs1QNaFnnBHZOTYhevFNvV9Wp2tC4Fql5eYqRiBSMR9CkRDei
 R+t4agNbh9A9gvBQc8NkS4y3bWXdqaLVR2PIqsB0gz5e3knMZDTxkf2coPXVwlGD4wwy
 eS3w1M0gpDcy2cX3T/bdHITLWJyYSCPuihoMtVX4SbqGDmC1MOlFKFTmPo+b73gDMT7Q
 WsRyBumGlaV3fvLuKI2oBvqFf1WfOBVQrhg187TUdT57yMJCE9T/fvt3k0a1toLSfSg3
 iQnw==
X-Gm-Message-State: AElRT7Fb/M00RLhUMadBz3ilBn6DWNCabVEgcwl7jvmrpjiyxkGXQwlc
 VANj2qqxUg1yd5trmH+VlItF3iPwPKTxDstqnyY=
X-Google-Smtp-Source: AG47ELvz4j2PeldKyiWvM0LCtAYFLvXTU9Z3t8pNOf8CT2V81caVjkgcOGetDKXZv2gqTIadmClgge5Vx/7pVlViOJ8=
X-Received: by 10.200.40.70 with SMTP id 6mr40273715qtr.285.1520487290665;
 Wed, 07 Mar 2018 21:34:50 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Wed, 7 Mar 2018 21:34:30 -0800 (PST)
In-Reply-To: <CADo_Z42yOJYCXaki3Y7W2QbA3jchazEwAZmhB=EydNyYrrmNOQ@mail.gmail.com>
References: <20180223052250.10024-1-chen.kenyy@inventec.com>
 <CACPK8Xejwb_7pGZAz-eriuE2rohxzWJ=me3a2PSgUntM2pqNLg@mail.gmail.com>
 <CADo_Z42yOJYCXaki3Y7W2QbA3jchazEwAZmhB=EydNyYrrmNOQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Mar 2018 16:04:30 +1030
X-Google-Sender-Auth: -5k7Z-g34ipQ0SRkM_CPOu9-2bA
Message-ID: <CACPK8XeDKWvieorWyUoBo4s5OC9sRdPS5wRmVqDPOEg9bGCSaA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] drivers: i2c: master arbiter: create driver
To: =?UTF-8?B?Q2hlbktlbllZIOmZs+awuOeHnyBUQU8=?= <chen.kenyy@inventec.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 08 Mar 2018 05:34:54 -0000

On Thu, Mar 8, 2018 at 3:36 PM, ChenKenYY =E9=99=B3=E6=B0=B8=E7=87=9F TAO
<chen.kenyy@inventec.com> wrote:
> Hi Joel,
>
> Sure, I can take it, but I need some instructions on the next action.

Okay. I suggest you download the patch from patchwork and apply it to
the latest kernel release, 4.16-rc4:

https://patchwork.ozlabs.org/patch/726491/

You can download it by clicking the 'mbox' link at the top right of the pag=
e.

Now you will have a file called
RFC-i2c-mux-Driver-for-PCA9641-I2C-Master-Arbiter.patch.

$ git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git
$ cd linux
$ git checkout -b pca9641-mux v4.16-rc4
$ git am ~/Downloads/RFC-i2c-mux-Driver-for-PCA9641-I2C-Master-Arbiter.patc=
h


From there, take a look at the comments on the two reviews that Vidya had:

 https://patchwork.ozlabs.org/patch/726491/#1580479
 https://patchwork.ozlabs.org/patch/726491/#1582916

Fix those issues, and add your signed off by:

$ git add drivers/i2c/muxes/i2c-mux-pca9541.c
$ git commit --amend -s

Then test this driver on your board. To do this, modify the device
tree. You should be able to do this by modifying the ast2500-evb
device tree, and boot that on your system.

Once this is working, use the checkpatch.pl tool to check for common mistak=
es:

$ ./scripts/checkpatch.pl drivers/i2c/muxes/i2c-mux-pca9541.c

Then use get_maintainer.pl to get a list of people you should send the patc=
h to:

$ ./scripts/get_maintainer.pl -f drivers/i2c/muxes/i2c-mux-pca9541.c
Guenter Roeck <linux@roeck-us.net> (maintainer:PCA9541 I2C BUS MASTER
SELECTOR DRIVER)
Peter Rosin <peda@axentia.se> (maintainer:I2C MUXES)
Wolfram Sang <wsa@the-dreams.de> (maintainer:I2C SUBSYSTEM)
linux-i2c@vger.kernel.org (open list:PCA9541 I2C BUS MASTER SELECTOR DRIVER=
)
linux-kernel@vger.kernel.org (open list)

In addition, please add me to this list so I can help. Then send the
patch out, with a comment in the commit message (below the ---) that
you have continued this work from the previous author, and have tested
it on your system.

Cheers,

Joel

>
> Thanks,
> Ken
>
> 2018-03-08 11:02 GMT+08:00 Joel Stanley <joel@jms.id.au>:
>> Hello Ken,
>>
>> On Fri, Feb 23, 2018 at 3:52 PM, Ken Chen <chen.kenyy@inventec.com> wrot=
e:
>>> Initial PCA9641 2 chennel I2C bus master arbiter
>>>
>>> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
>>
>> The code here looks good. I did some searching, and found that someone
>> submitted a driver for this part about a year ago:
>>
>>  https://patchwork.ozlabs.org/patch/726491/
>>
>> Unfortunately the submitter did not send another version after it was
>> reviewed. I suggest we take up the patch that was submitted, make the
>> changes suggested, and submit it upstream. Are you able to take on
>> that work?
>>
>> Cheers,
>>
>> Joel
>>
>>> ---
>>>  drivers/i2c/muxes/Kconfig           |   9 +
>>>  drivers/i2c/muxes/Makefile          |   1 +
>>>  drivers/i2c/muxes/i2c-mux-pca9641.c | 372 ++++++++++++++++++++++++++++=
++++++++
>>>  3 files changed, 382 insertions(+)
>>>  create mode 100644 drivers/i2c/muxes/i2c-mux-pca9641.c
>>>
>>> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
>>> index 1712132..1cd1ad3 100644
>>> --- a/drivers/i2c/muxes/Kconfig
>>> +++ b/drivers/i2c/muxes/Kconfig
>>> @@ -73,6 +73,15 @@ config I2C_MUX_PCA954x
>>>           This driver can also be built as a module.  If so, the module
>>>           will be called i2c-mux-pca954x.
>>>
>>> +config I2C_MUX_PCA9641
>>> +       tristate "NXP PCA9641 I2C Master demultiplexer"
>>> +       help
>>> +         If you say yes here you get support for the NXP PCA9641
>>> +         I2C Master demultiplexer with an arbiter function.
>>> +
>>> +         This driver can also be built as a module.  If so, the module
>>> +         will be called i2c-mux-pca9641.
>>> +
>>>  config I2C_MUX_PINCTRL
>>>         tristate "pinctrl-based I2C multiplexer"
>>>         depends on PINCTRL
>>> diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
>>> index 4a67d31..f95d5f5 100644
>>> --- a/drivers/i2c/muxes/Makefile
>>> +++ b/drivers/i2c/muxes/Makefile
>>> @@ -11,6 +11,7 @@ obj-$(CONFIG_I2C_MUX_LTC4306) +=3D i2c-mux-ltc4306.o
>>>  obj-$(CONFIG_I2C_MUX_MLXCPLD)  +=3D i2c-mux-mlxcpld.o
>>>  obj-$(CONFIG_I2C_MUX_PCA9541)  +=3D i2c-mux-pca9541.o
>>>  obj-$(CONFIG_I2C_MUX_PCA954x)  +=3D i2c-mux-pca954x.o
>>> +obj-$(CONFIG_I2C_MUX_PCA9641)  +=3D i2c-mux-pca9641.o
>>>  obj-$(CONFIG_I2C_MUX_PINCTRL)  +=3D i2c-mux-pinctrl.o
>>>  obj-$(CONFIG_I2C_MUX_REG)      +=3D i2c-mux-reg.o
>>>
>>> diff --git a/drivers/i2c/muxes/i2c-mux-pca9641.c b/drivers/i2c/muxes/i2=
c-mux-pca9641.c
>>> new file mode 100644
>>> index 0000000..ca7b816
>>> --- /dev/null
>>> +++ b/drivers/i2c/muxes/i2c-mux-pca9641.c
>>> @@ -0,0 +1,372 @@
>>> +/*
>>> + * I2C demultiplexer driver for PCA9641 bus master demultiplexer
>>> + *
>>> + * Copyright (c) 2010 Ericsson AB.
>>> + *
>>> + * Author: Ken Chen <chen.kenyy@inventec.com>
>>> + *
>>> + * Derived from:
>>> + *
>>> + * This file is licensed under the terms of the GNU General Public
>>> + * License version 2. This program is licensed "as is" without any
>>> + * warranty of any kind, whether express or implied.
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/jiffies.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/device.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/i2c-mux.h>
>>> +
>>> +#include <linux/i2c/pca954x.h>
>>> +
>>> +/*
>>> + * The PCA9641 is two I2C bus masters demultiplexer. It supports two I=
2C masters
>>> + * connected to a single slave bus.
>>> + *
>>> + * It is designed for high reliability dual master I2C bus application=
s where
>>> + * correct system operation is required, even when two I2C master issu=
e their
>>> + * commands at the same time. The arbiter will select a winner and let=
 it work
>>> + * uninterrupted, and the losing master will take control of the I2C b=
us after
>>> + * the winnter has finished. The arbiter also allows for queued reques=
ts where
>>> + * a master requests the downstream bus while the other master has con=
trol.
>>> + *
>>> + */
>>> +
>>> +#define PCA9641_ID             0x01
>>> +#define PCA9641_ID_MAGIC       0x38
>>> +
>>> +#define PCA9641_CONTROL                0x01
>>> +#define PCA9641_STATUS         0x02
>>> +#define PCA9641_TIME           0x03
>>> +
>>> +#define PCA9641_CTL_LOCK_REQ            (1 << 0)
>>> +#define PCA9641_CTL_LOCK_GRANT          (1 << 1)
>>> +#define PCA9641_CTL_BUS_CONNECT         (1 << 2)
>>> +#define PCA9641_CTL_BUS_INIT            (1 << 3)
>>> +#define PCA9641_CTL_SMBUS_SWRST         (1 << 4)
>>> +#define PCA9641_CTL_IDLE_TIMER_DIS      (1 << 5)
>>> +#define PCA9641_CTL_SMBUS_DIS           (1 << 6)
>>> +#define PCA9641_CTL_PRIORITY            (1 << 7)
>>> +
>>> +#define PCA9641_STS_OTHER_LOCK          (1 << 0)
>>> +#define PCA9641_STS_BUS_INIT_FAIL       (1 << 1)
>>> +#define PCA9641_STS_BUS_HUNG            (1 << 2)
>>> +#define PCA9641_STS_MBOX_EMPTY          (1 << 3)
>>> +#define PCA9641_STS_MBOX_FULL           (1 << 4)
>>> +#define PCA9641_STS_TEST_INT            (1 << 5)
>>> +#define PCA9641_STS_SCL_IO              (1 << 6)
>>> +#define PCA9641_STS_SDA_IO              (1 << 7)
>>> +
>>> +#define PCA9641_RES_TIME       0x03
>>> +
>>> +#define other_lock(x)  ((x) & PCA9641_STS_OTHER_LOCK)
>>> +#define lock_grant(x)  ((x) & PCA9641_CTL_LOCK_GRANT)
>>> +
>>> +/* arbitration timeouts, in jiffies */
>>> +#define ARB_TIMEOUT    (HZ / 8)        /* 125 ms until forcing bus own=
ership */
>>> +#define ARB2_TIMEOUT   (HZ / 4)        /* 250 ms until acquisition fai=
lure */
>>> +
>>> +/* arbitration retry delays, in us */
>>> +#define SELECT_DELAY_SHORT     50
>>> +#define SELECT_DELAY_LONG      1000
>>> +
>>> +struct pca9641 {
>>> +       struct i2c_client *client;
>>> +       unsigned long select_timeout;
>>> +       unsigned long arb_timeout;
>>> +};
>>> +
>>> +static const struct i2c_device_id pca9641_id[] =3D {
>>> +       {"pca9641", 0},
>>> +       {}
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(i2c, pca9641_id);
>>> +
>>> +#ifdef CONFIG_OF
>>> +static const struct of_device_id pca9641_of_match[] =3D {
>>> +       { .compatible =3D "nxp,pca9641" },
>>> +       {}
>>> +};
>>> +#endif
>>> +
>>> +/*
>>> + * Write to chip register. Don't use i2c_transfer()/i2c_smbus_xfer()
>>> + * as they will try to lock the adapter a second time.
>>> + */
>>> +static int pca9641_reg_write(struct i2c_client *client, u8 command, u8=
 val)
>>> +{
>>> +       struct i2c_adapter *adap =3D client->adapter;
>>> +       int ret;
>>> +
>>> +       if (adap->algo->master_xfer) {
>>> +               struct i2c_msg msg;
>>> +               char buf[2];
>>> +
>>> +               msg.addr =3D client->addr;
>>> +               msg.flags =3D 0;
>>> +               msg.len =3D 2;
>>> +               buf[0] =3D command;
>>> +               buf[1] =3D val;
>>> +               msg.buf =3D buf;
>>> +               ret =3D __i2c_transfer(adap, &msg, 1);
>>> +       } else {
>>> +               union i2c_smbus_data data;
>>> +
>>> +               data.byte =3D val;
>>> +               ret =3D adap->algo->smbus_xfer(adap, client->addr,
>>> +                                            client->flags,
>>> +                                            I2C_SMBUS_WRITE,
>>> +                                            command,
>>> +                                            I2C_SMBUS_BYTE_DATA, &data=
);
>>> +       }
>>> +
>>> +       return ret;
>>> +}
>>> +
>>> +/*
>>> + * Read from chip register. Don't use i2c_transfer()/i2c_smbus_xfer()
>>> + * as they will try to lock adapter a second time.
>>> + */
>>> +static int pca9641_reg_read(struct i2c_client *client, u8 command)
>>> +{
>>> +       struct i2c_adapter *adap =3D client->adapter;
>>> +       int ret;
>>> +       u8 val;
>>> +
>>> +       if (adap->algo->master_xfer) {
>>> +               struct i2c_msg msg[2] =3D {
>>> +                       {
>>> +                               .addr =3D client->addr,
>>> +                               .flags =3D 0,
>>> +                               .len =3D 1,
>>> +                               .buf =3D &command
>>> +                       },
>>> +                       {
>>> +                               .addr =3D client->addr,
>>> +                               .flags =3D I2C_M_RD,
>>> +                               .len =3D 1,
>>> +                               .buf =3D &val
>>> +                       }
>>> +               };
>>> +               ret =3D __i2c_transfer(adap, msg, 2);
>>> +               if (ret =3D=3D 2)
>>> +                       ret =3D val;
>>> +               else if (ret >=3D 0)
>>> +                       ret =3D -EIO;
>>> +       } else {
>>> +               union i2c_smbus_data data;
>>> +
>>> +               ret =3D adap->algo->smbus_xfer(adap, client->addr,
>>> +                                            client->flags,
>>> +                                            I2C_SMBUS_READ,
>>> +                                            command,
>>> +                                            I2C_SMBUS_BYTE_DATA, &data=
);
>>> +               if (!ret)
>>> +                       ret =3D data.byte;
>>> +       }
>>> +       return ret;
>>> +}
>>> +
>>> +/*
>>> + * Arbitration management functions
>>> + */
>>> +static void pca9641_release_bus(struct i2c_client *client)
>>> +{
>>> +       int reg;
>>> +
>>> +       pca9641_reg_write(client, PCA9641_CONTROL, 0);
>>> +}
>>> +
>>> +/*
>>> + * Channel arbitration
>>> + *
>>> + * Return values:
>>> + *  <0: error
>>> + *  0 : bus not acquired
>>> + *  1 : bus acquired
>>> + */
>>> +static int pca9641_arbitrate(struct i2c_client *client)
>>> +{
>>> +       struct i2c_mux_core *muxc =3D i2c_get_clientdata(client);
>>> +       struct pca9641 *data =3D i2c_mux_priv(muxc);
>>> +       int reg_ctl, reg_sts;
>>> +
>>> +       reg_ctl =3D pca9641_reg_read(client, PCA9641_CONTROL);
>>> +       if (reg_ctl < 0)
>>> +               return reg_ctl;
>>> +       reg_sts =3D pca9641_reg_read(client, PCA9641_STATUS);
>>> +
>>> +       if (!other_lock(reg_sts) && !lock_grant(reg_ctl)) {
>>> +               /*
>>> +                * Bus is off. Request ownership or turn it on unless
>>> +                * other master requested ownership.
>>> +                */
>>> +                reg_ctl |=3D PCA9641_CTL_LOCK_REQ;
>>> +                pca9641_reg_write(client, PCA9641_CONTROL, reg_ctl);
>>> +
>>> +                udelay(100);
>>> +
>>> +               reg_ctl =3D pca9641_reg_read(client, PCA9641_CONTROL);
>>> +
>>> +                if (lock_grant(reg_ctl)) {
>>> +                        /*
>>> +                         * Other master did not request ownership,
>>> +                         * or arbitration timeout expired. Take the bu=
s.
>>> +                         */
>>> +                        reg_ctl |=3D PCA9641_CTL_BUS_CONNECT | PCA9641=
_CTL_LOCK_REQ;
>>> +                        pca9641_reg_write(client, PCA9641_CONTROL, reg=
_ctl);
>>> +                        data->select_timeout =3D SELECT_DELAY_SHORT;
>>> +
>>> +                        return 1;
>>> +                } else {
>>> +                        /*
>>> +                         * Other master requested ownership.
>>> +                         * Set extra long timeout to give it time to a=
cquire it.
>>> +                         */
>>> +                        data->select_timeout =3D SELECT_DELAY_LONG * 2=
;
>>> +                }
>>> +       } else if (lock_grant(reg_ctl)) {
>>> +                /*
>>> +                 * Bus is on, and we own it. We are done with acquisit=
ion.
>>> +                 */
>>> +                reg_ctl |=3D PCA9641_CTL_BUS_CONNECT | PCA9641_CTL_LOC=
K_REQ;
>>> +                pca9641_reg_write(client, PCA9641_CONTROL, reg_ctl);
>>> +
>>> +                return 1;
>>> +       } else if (other_lock(reg_sts)) {
>>> +                /*
>>> +                 * Other master owns the bus.
>>> +                 * If arbitration timeout has expired, force ownership=
.
>>> +                 * Otherwise request it.
>>> +                 */
>>> +                data->select_timeout =3D SELECT_DELAY_LONG;
>>> +                reg_ctl |=3D PCA9641_CTL_LOCK_REQ;
>>> +                pca9641_reg_write(client, PCA9641_CONTROL, reg_ctl);
>>> +
>>> +                /*
>>> +                 * if (time_is_before_eq_jiffies(data->arb_timeout)) {
>>> +                 * TODO:Time is up, take the bus and reset it.
>>> +                 *
>>> +                 *} else {
>>> +                 * TODO: Request bus ownership if needed
>>> +                 *
>>> +                 *}
>>> +                 */
>>> +        }
>>> +       return 0;
>>> +}
>>> +
>>> +static int pca9641_select_chan(struct i2c_mux_core *muxc, u32 chan)
>>> +{
>>> +       struct pca9641 *data =3D i2c_mux_priv(muxc);
>>> +       struct i2c_client *client =3D data->client;
>>> +       int ret;
>>> +       unsigned long timeout =3D jiffies + ARB2_TIMEOUT;
>>> +               /* give up after this time */
>>> +
>>> +       data->arb_timeout =3D jiffies + ARB_TIMEOUT;
>>> +               /* force bus ownership after this time */
>>> +
>>> +       do {
>>> +               ret =3D pca9641_arbitrate(client);
>>> +               if (ret)
>>> +                       return ret < 0 ? ret : 0;
>>> +
>>> +               if (data->select_timeout =3D=3D SELECT_DELAY_SHORT)
>>> +                       udelay(data->select_timeout);
>>> +               else
>>> +                       msleep(data->select_timeout / 1000);
>>> +       } while (time_is_after_eq_jiffies(timeout));
>>> +
>>> +       return -ETIMEDOUT;
>>> +}
>>> +
>>> +static int pca9641_release_chan(struct i2c_mux_core *muxc, u32 chan)
>>> +{
>>> +       struct pca9641 *data =3D i2c_mux_priv(muxc);
>>> +       struct i2c_client *client =3D data->client;
>>> +
>>> +       pca9641_release_bus(client);
>>> +       return 0;
>>> +}
>>> +
>>> +/*
>>> + * I2C init/probing/exit functions
>>> + */
>>> +static int pca9641_probe(struct i2c_client *client,
>>> +                        const struct i2c_device_id *id)
>>> +{
>>> +       struct i2c_adapter *adap =3D client->adapter;
>>> +       struct pca954x_platform_data *pdata =3D dev_get_platdata(&clien=
t->dev);
>>> +       struct i2c_mux_core *muxc;
>>> +       struct pca9641 *data;
>>> +       int force;
>>> +       int ret;
>>> +
>>> +       if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_BYTE_DATA))
>>> +               return -ENODEV;
>>> +
>>> +       /*
>>> +        * I2C accesses are unprotected here.
>>> +        * We have to lock the adapter before releasing the bus.
>>> +        */
>>> +       i2c_lock_adapter(adap);
>>> +       pca9641_release_bus(client);
>>> +       i2c_unlock_adapter(adap);
>>> +
>>> +       /* Create mux adapter */
>>> +
>>> +       force =3D 0;
>>> +       if (pdata)
>>> +               force =3D pdata->modes[0].adap_id;
>>> +       muxc =3D i2c_mux_alloc(adap, &client->dev, 8, sizeof(*data),
>>> +                            I2C_MUX_ARBITRATOR,
>>> +                            pca9641_select_chan, pca9641_release_chan)=
;
>>> +       if (!muxc)
>>> +               return -ENOMEM;
>>> +
>>> +       data =3D i2c_mux_priv(muxc);
>>> +       data->client =3D client;
>>> +
>>> +       i2c_set_clientdata(client, muxc);
>>> +
>>> +
>>> +       ret =3D i2c_mux_add_adapter(muxc, force, 0, 0);
>>> +       if (ret) {
>>> +               dev_err(&client->dev, "failed to register master demult=
iplexer\n");
>>> +               return ret;
>>> +       }
>>> +
>>> +       dev_info(&client->dev, "registered master demultiplexer for I2C=
 %s\n",
>>> +                client->name);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int pca9641_remove(struct i2c_client *client)
>>> +{
>>> +       struct i2c_mux_core *muxc =3D i2c_get_clientdata(client);
>>> +
>>> +       i2c_mux_del_adapters(muxc);
>>> +       return 0;
>>> +}
>>> +
>>> +static struct i2c_driver pca9641_driver =3D {
>>> +       .driver =3D {
>>> +                  .name =3D "pca9641",
>>> +                  .of_match_table =3D of_match_ptr(pca9641_of_match),
>>> +                  },
>>> +       .probe =3D pca9641_probe,
>>> +       .remove =3D pca9641_remove,
>>> +       .id_table =3D pca9641_id,
>>> +};
>>> +
>>> +module_i2c_driver(pca9641_driver);
>>> +
>>> +MODULE_AUTHOR("Ken Chen <chen.kenyy@inventec.com>");
>>> +MODULE_DESCRIPTION("PCA9641 I2C master demultiplexer driver");
>>> +MODULE_LICENSE("GPL v2");
>>> --
>>> 2.9.3
>>>
