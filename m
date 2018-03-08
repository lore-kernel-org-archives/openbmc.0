Return-Path: <Chen.KenYY@inventec.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inventec.com
 (client-ip=218.32.67.167; helo=mail.inventec.com;
 envelope-from=chen.kenyy@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inventec.com
Received: from mail.inventec.com (hub02.inventec.com [218.32.67.167])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zxdm94MXmzF1dJ
 for <openbmc@lists.ozlabs.org>; Thu,  8 Mar 2018 16:07:04 +1100 (AEDT)
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2010-04.iec.inventec (10.1.254.157) with Microsoft SMTP Server id
 14.3.361.1; Thu, 8 Mar 2018 13:06:58 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])	by
 IEC1-MSE-FE2.inventec.com with ESMTP id w2856r8a099026	for
 <openbmc@lists.ozlabs.org>; Thu, 8 Mar 2018 13:06:53 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: from mail-lf0-f71.google.com (mail-lf0-f71.google.com
 [209.85.215.71])	by IEC1-SPAM-2.inventec.com with ESMTP id w2856nZo060689
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Thu, 8 Mar 2018 13:06:51 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: by mail-lf0-f71.google.com with SMTP id p202-v6so1506223lfe.3
 for <openbmc@lists.ozlabs.org>; Wed, 07 Mar 2018 21:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=TPZD8RMHEcgmkWdm0jD32pb6QPsBsW9wkvyorqHGSig=;
 b=U0Q+JjKXqMEpPJMn/K15t3EymGh2ZvwShtVb+E+4/nDwzYgafdJftH6Xwvw68wTseE
 NdpDJmIINEPWkh6tQNlW8XVZa4qWuZ8yZX+xiYn3jQBPlCjIxT2IytSYmmIR3QKjlPzL
 EmNl/N15q9X61KTWshmwlshhFINKCEObo9WifzsKcjGqhpXvQPFz/2p5byo9v9e64K5z
 +C+XxHobXvbPGMMe51xMKRkhJmYEn9hRtmzR50POKIUn8U8rLFAbl0d68ad3IJD3jC7U
 8rQwoTGAodPubJ7UwvIDaJ0tsCVoSTp3dFdo3uV8YckEclctmO+g2yOBoAiqQ24FBnKx
 gFsg==
X-Gm-Message-State: AElRT7HKGfmLa40gQFUCaZTXQViNvq5mhCLIHiabAzookb7NzxK/5Eos
 jEJcEQuPkgJJDFYlFDueHdX2m1yjjud825HJfsR3v3j3XReiE2O/cEvvKzyII9adR3fo4lQyFa+
 mQlnEYh9FvJiVJ4u/SOzfhXyHaDLrpKzzsj66Kg==
X-Received: by 10.25.28.196 with SMTP id c187mr16538866lfc.44.1520485607805;
 Wed, 07 Mar 2018 21:06:47 -0800 (PST)
X-Google-Smtp-Source: AG47ELug6BcEIG9pvVFR7HFu8MT7RhWnMtNYrRhHrjgqfB4JnBGHEFfw9kncEokJfsYnicztK5O41UfFkfJNJ2BR+f4=
X-Received: by 10.25.28.196 with SMTP id c187mr16538847lfc.44.1520485607321;
 Wed, 07 Mar 2018 21:06:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.83.67 with HTTP; Wed, 7 Mar 2018 21:06:45 -0800 (PST)
In-Reply-To: <CACPK8Xejwb_7pGZAz-eriuE2rohxzWJ=me3a2PSgUntM2pqNLg@mail.gmail.com>
References: <20180223052250.10024-1-chen.kenyy@inventec.com>
 <CACPK8Xejwb_7pGZAz-eriuE2rohxzWJ=me3a2PSgUntM2pqNLg@mail.gmail.com>
From: =?UTF-8?B?Q2hlbktlbllZIOmZs+awuOeHnyBUQU8=?= <chen.kenyy@inventec.com>
Date: Thu, 8 Mar 2018 13:06:45 +0800
Message-ID: <CADo_Z42yOJYCXaki3Y7W2QbA3jchazEwAZmhB=EydNyYrrmNOQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] drivers: i2c: master arbiter: create driver
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE2.inventec.com w2856r8a099026
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
X-List-Received-Date: Thu, 08 Mar 2018 05:07:06 -0000

Hi Joel,

Sure, I can take it, but I need some instructions on the next action.

Thanks,
Ken

2018-03-08 11:02 GMT+08:00 Joel Stanley <joel@jms.id.au>:
> Hello Ken,
>
> On Fri, Feb 23, 2018 at 3:52 PM, Ken Chen <chen.kenyy@inventec.com> wrote:
>> Initial PCA9641 2 chennel I2C bus master arbiter
>>
>> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
>
> The code here looks good. I did some searching, and found that someone
> submitted a driver for this part about a year ago:
>
>  https://patchwork.ozlabs.org/patch/726491/
>
> Unfortunately the submitter did not send another version after it was
> reviewed. I suggest we take up the patch that was submitted, make the
> changes suggested, and submit it upstream. Are you able to take on
> that work?
>
> Cheers,
>
> Joel
>
>> ---
>>  drivers/i2c/muxes/Kconfig           |   9 +
>>  drivers/i2c/muxes/Makefile          |   1 +
>>  drivers/i2c/muxes/i2c-mux-pca9641.c | 372 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 382 insertions(+)
>>  create mode 100644 drivers/i2c/muxes/i2c-mux-pca9641.c
>>
>> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
>> index 1712132..1cd1ad3 100644
>> --- a/drivers/i2c/muxes/Kconfig
>> +++ b/drivers/i2c/muxes/Kconfig
>> @@ -73,6 +73,15 @@ config I2C_MUX_PCA954x
>>           This driver can also be built as a module.  If so, the module
>>           will be called i2c-mux-pca954x.
>>
>> +config I2C_MUX_PCA9641
>> +       tristate "NXP PCA9641 I2C Master demultiplexer"
>> +       help
>> +         If you say yes here you get support for the NXP PCA9641
>> +         I2C Master demultiplexer with an arbiter function.
>> +
>> +         This driver can also be built as a module.  If so, the module
>> +         will be called i2c-mux-pca9641.
>> +
>>  config I2C_MUX_PINCTRL
>>         tristate "pinctrl-based I2C multiplexer"
>>         depends on PINCTRL
>> diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
>> index 4a67d31..f95d5f5 100644
>> --- a/drivers/i2c/muxes/Makefile
>> +++ b/drivers/i2c/muxes/Makefile
>> @@ -11,6 +11,7 @@ obj-$(CONFIG_I2C_MUX_LTC4306) += i2c-mux-ltc4306.o
>>  obj-$(CONFIG_I2C_MUX_MLXCPLD)  += i2c-mux-mlxcpld.o
>>  obj-$(CONFIG_I2C_MUX_PCA9541)  += i2c-mux-pca9541.o
>>  obj-$(CONFIG_I2C_MUX_PCA954x)  += i2c-mux-pca954x.o
>> +obj-$(CONFIG_I2C_MUX_PCA9641)  += i2c-mux-pca9641.o
>>  obj-$(CONFIG_I2C_MUX_PINCTRL)  += i2c-mux-pinctrl.o
>>  obj-$(CONFIG_I2C_MUX_REG)      += i2c-mux-reg.o
>>
>> diff --git a/drivers/i2c/muxes/i2c-mux-pca9641.c b/drivers/i2c/muxes/i2c-mux-pca9641.c
>> new file mode 100644
>> index 0000000..ca7b816
>> --- /dev/null
>> +++ b/drivers/i2c/muxes/i2c-mux-pca9641.c
>> @@ -0,0 +1,372 @@
>> +/*
>> + * I2C demultiplexer driver for PCA9641 bus master demultiplexer
>> + *
>> + * Copyright (c) 2010 Ericsson AB.
>> + *
>> + * Author: Ken Chen <chen.kenyy@inventec.com>
>> + *
>> + * Derived from:
>> + *
>> + * This file is licensed under the terms of the GNU General Public
>> + * License version 2. This program is licensed "as is" without any
>> + * warranty of any kind, whether express or implied.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/delay.h>
>> +#include <linux/slab.h>
>> +#include <linux/device.h>
>> +#include <linux/i2c.h>
>> +#include <linux/i2c-mux.h>
>> +
>> +#include <linux/i2c/pca954x.h>
>> +
>> +/*
>> + * The PCA9641 is two I2C bus masters demultiplexer. It supports two I2C masters
>> + * connected to a single slave bus.
>> + *
>> + * It is designed for high reliability dual master I2C bus applications where
>> + * correct system operation is required, even when two I2C master issue their
>> + * commands at the same time. The arbiter will select a winner and let it work
>> + * uninterrupted, and the losing master will take control of the I2C bus after
>> + * the winnter has finished. The arbiter also allows for queued requests where
>> + * a master requests the downstream bus while the other master has control.
>> + *
>> + */
>> +
>> +#define PCA9641_ID             0x01
>> +#define PCA9641_ID_MAGIC       0x38
>> +
>> +#define PCA9641_CONTROL                0x01
>> +#define PCA9641_STATUS         0x02
>> +#define PCA9641_TIME           0x03
>> +
>> +#define PCA9641_CTL_LOCK_REQ            (1 << 0)
>> +#define PCA9641_CTL_LOCK_GRANT          (1 << 1)
>> +#define PCA9641_CTL_BUS_CONNECT         (1 << 2)
>> +#define PCA9641_CTL_BUS_INIT            (1 << 3)
>> +#define PCA9641_CTL_SMBUS_SWRST         (1 << 4)
>> +#define PCA9641_CTL_IDLE_TIMER_DIS      (1 << 5)
>> +#define PCA9641_CTL_SMBUS_DIS           (1 << 6)
>> +#define PCA9641_CTL_PRIORITY            (1 << 7)
>> +
>> +#define PCA9641_STS_OTHER_LOCK          (1 << 0)
>> +#define PCA9641_STS_BUS_INIT_FAIL       (1 << 1)
>> +#define PCA9641_STS_BUS_HUNG            (1 << 2)
>> +#define PCA9641_STS_MBOX_EMPTY          (1 << 3)
>> +#define PCA9641_STS_MBOX_FULL           (1 << 4)
>> +#define PCA9641_STS_TEST_INT            (1 << 5)
>> +#define PCA9641_STS_SCL_IO              (1 << 6)
>> +#define PCA9641_STS_SDA_IO              (1 << 7)
>> +
>> +#define PCA9641_RES_TIME       0x03
>> +
>> +#define other_lock(x)  ((x) & PCA9641_STS_OTHER_LOCK)
>> +#define lock_grant(x)  ((x) & PCA9641_CTL_LOCK_GRANT)
>> +
>> +/* arbitration timeouts, in jiffies */
>> +#define ARB_TIMEOUT    (HZ / 8)        /* 125 ms until forcing bus ownership */
>> +#define ARB2_TIMEOUT   (HZ / 4)        /* 250 ms until acquisition failure */
>> +
>> +/* arbitration retry delays, in us */
>> +#define SELECT_DELAY_SHORT     50
>> +#define SELECT_DELAY_LONG      1000
>> +
>> +struct pca9641 {
>> +       struct i2c_client *client;
>> +       unsigned long select_timeout;
>> +       unsigned long arb_timeout;
>> +};
>> +
>> +static const struct i2c_device_id pca9641_id[] = {
>> +       {"pca9641", 0},
>> +       {}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(i2c, pca9641_id);
>> +
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id pca9641_of_match[] = {
>> +       { .compatible = "nxp,pca9641" },
>> +       {}
>> +};
>> +#endif
>> +
>> +/*
>> + * Write to chip register. Don't use i2c_transfer()/i2c_smbus_xfer()
>> + * as they will try to lock the adapter a second time.
>> + */
>> +static int pca9641_reg_write(struct i2c_client *client, u8 command, u8 val)
>> +{
>> +       struct i2c_adapter *adap = client->adapter;
>> +       int ret;
>> +
>> +       if (adap->algo->master_xfer) {
>> +               struct i2c_msg msg;
>> +               char buf[2];
>> +
>> +               msg.addr = client->addr;
>> +               msg.flags = 0;
>> +               msg.len = 2;
>> +               buf[0] = command;
>> +               buf[1] = val;
>> +               msg.buf = buf;
>> +               ret = __i2c_transfer(adap, &msg, 1);
>> +       } else {
>> +               union i2c_smbus_data data;
>> +
>> +               data.byte = val;
>> +               ret = adap->algo->smbus_xfer(adap, client->addr,
>> +                                            client->flags,
>> +                                            I2C_SMBUS_WRITE,
>> +                                            command,
>> +                                            I2C_SMBUS_BYTE_DATA, &data);
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +/*
>> + * Read from chip register. Don't use i2c_transfer()/i2c_smbus_xfer()
>> + * as they will try to lock adapter a second time.
>> + */
>> +static int pca9641_reg_read(struct i2c_client *client, u8 command)
>> +{
>> +       struct i2c_adapter *adap = client->adapter;
>> +       int ret;
>> +       u8 val;
>> +
>> +       if (adap->algo->master_xfer) {
>> +               struct i2c_msg msg[2] = {
>> +                       {
>> +                               .addr = client->addr,
>> +                               .flags = 0,
>> +                               .len = 1,
>> +                               .buf = &command
>> +                       },
>> +                       {
>> +                               .addr = client->addr,
>> +                               .flags = I2C_M_RD,
>> +                               .len = 1,
>> +                               .buf = &val
>> +                       }
>> +               };
>> +               ret = __i2c_transfer(adap, msg, 2);
>> +               if (ret == 2)
>> +                       ret = val;
>> +               else if (ret >= 0)
>> +                       ret = -EIO;
>> +       } else {
>> +               union i2c_smbus_data data;
>> +
>> +               ret = adap->algo->smbus_xfer(adap, client->addr,
>> +                                            client->flags,
>> +                                            I2C_SMBUS_READ,
>> +                                            command,
>> +                                            I2C_SMBUS_BYTE_DATA, &data);
>> +               if (!ret)
>> +                       ret = data.byte;
>> +       }
>> +       return ret;
>> +}
>> +
>> +/*
>> + * Arbitration management functions
>> + */
>> +static void pca9641_release_bus(struct i2c_client *client)
>> +{
>> +       int reg;
>> +
>> +       pca9641_reg_write(client, PCA9641_CONTROL, 0);
>> +}
>> +
>> +/*
>> + * Channel arbitration
>> + *
>> + * Return values:
>> + *  <0: error
>> + *  0 : bus not acquired
>> + *  1 : bus acquired
>> + */
>> +static int pca9641_arbitrate(struct i2c_client *client)
>> +{
>> +       struct i2c_mux_core *muxc = i2c_get_clientdata(client);
>> +       struct pca9641 *data = i2c_mux_priv(muxc);
>> +       int reg_ctl, reg_sts;
>> +
>> +       reg_ctl = pca9641_reg_read(client, PCA9641_CONTROL);
>> +       if (reg_ctl < 0)
>> +               return reg_ctl;
>> +       reg_sts = pca9641_reg_read(client, PCA9641_STATUS);
>> +
>> +       if (!other_lock(reg_sts) && !lock_grant(reg_ctl)) {
>> +               /*
>> +                * Bus is off. Request ownership or turn it on unless
>> +                * other master requested ownership.
>> +                */
>> +                reg_ctl |= PCA9641_CTL_LOCK_REQ;
>> +                pca9641_reg_write(client, PCA9641_CONTROL, reg_ctl);
>> +
>> +                udelay(100);
>> +
>> +               reg_ctl = pca9641_reg_read(client, PCA9641_CONTROL);
>> +
>> +                if (lock_grant(reg_ctl)) {
>> +                        /*
>> +                         * Other master did not request ownership,
>> +                         * or arbitration timeout expired. Take the bus.
>> +                         */
>> +                        reg_ctl |= PCA9641_CTL_BUS_CONNECT | PCA9641_CTL_LOCK_REQ;
>> +                        pca9641_reg_write(client, PCA9641_CONTROL, reg_ctl);
>> +                        data->select_timeout = SELECT_DELAY_SHORT;
>> +
>> +                        return 1;
>> +                } else {
>> +                        /*
>> +                         * Other master requested ownership.
>> +                         * Set extra long timeout to give it time to acquire it.
>> +                         */
>> +                        data->select_timeout = SELECT_DELAY_LONG * 2;
>> +                }
>> +       } else if (lock_grant(reg_ctl)) {
>> +                /*
>> +                 * Bus is on, and we own it. We are done with acquisition.
>> +                 */
>> +                reg_ctl |= PCA9641_CTL_BUS_CONNECT | PCA9641_CTL_LOCK_REQ;
>> +                pca9641_reg_write(client, PCA9641_CONTROL, reg_ctl);
>> +
>> +                return 1;
>> +       } else if (other_lock(reg_sts)) {
>> +                /*
>> +                 * Other master owns the bus.
>> +                 * If arbitration timeout has expired, force ownership.
>> +                 * Otherwise request it.
>> +                 */
>> +                data->select_timeout = SELECT_DELAY_LONG;
>> +                reg_ctl |= PCA9641_CTL_LOCK_REQ;
>> +                pca9641_reg_write(client, PCA9641_CONTROL, reg_ctl);
>> +
>> +                /*
>> +                 * if (time_is_before_eq_jiffies(data->arb_timeout)) {
>> +                 * TODO:Time is up, take the bus and reset it.
>> +                 *
>> +                 *} else {
>> +                 * TODO: Request bus ownership if needed
>> +                 *
>> +                 *}
>> +                 */
>> +        }
>> +       return 0;
>> +}
>> +
>> +static int pca9641_select_chan(struct i2c_mux_core *muxc, u32 chan)
>> +{
>> +       struct pca9641 *data = i2c_mux_priv(muxc);
>> +       struct i2c_client *client = data->client;
>> +       int ret;
>> +       unsigned long timeout = jiffies + ARB2_TIMEOUT;
>> +               /* give up after this time */
>> +
>> +       data->arb_timeout = jiffies + ARB_TIMEOUT;
>> +               /* force bus ownership after this time */
>> +
>> +       do {
>> +               ret = pca9641_arbitrate(client);
>> +               if (ret)
>> +                       return ret < 0 ? ret : 0;
>> +
>> +               if (data->select_timeout == SELECT_DELAY_SHORT)
>> +                       udelay(data->select_timeout);
>> +               else
>> +                       msleep(data->select_timeout / 1000);
>> +       } while (time_is_after_eq_jiffies(timeout));
>> +
>> +       return -ETIMEDOUT;
>> +}
>> +
>> +static int pca9641_release_chan(struct i2c_mux_core *muxc, u32 chan)
>> +{
>> +       struct pca9641 *data = i2c_mux_priv(muxc);
>> +       struct i2c_client *client = data->client;
>> +
>> +       pca9641_release_bus(client);
>> +       return 0;
>> +}
>> +
>> +/*
>> + * I2C init/probing/exit functions
>> + */
>> +static int pca9641_probe(struct i2c_client *client,
>> +                        const struct i2c_device_id *id)
>> +{
>> +       struct i2c_adapter *adap = client->adapter;
>> +       struct pca954x_platform_data *pdata = dev_get_platdata(&client->dev);
>> +       struct i2c_mux_core *muxc;
>> +       struct pca9641 *data;
>> +       int force;
>> +       int ret;
>> +
>> +       if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_BYTE_DATA))
>> +               return -ENODEV;
>> +
>> +       /*
>> +        * I2C accesses are unprotected here.
>> +        * We have to lock the adapter before releasing the bus.
>> +        */
>> +       i2c_lock_adapter(adap);
>> +       pca9641_release_bus(client);
>> +       i2c_unlock_adapter(adap);
>> +
>> +       /* Create mux adapter */
>> +
>> +       force = 0;
>> +       if (pdata)
>> +               force = pdata->modes[0].adap_id;
>> +       muxc = i2c_mux_alloc(adap, &client->dev, 8, sizeof(*data),
>> +                            I2C_MUX_ARBITRATOR,
>> +                            pca9641_select_chan, pca9641_release_chan);
>> +       if (!muxc)
>> +               return -ENOMEM;
>> +
>> +       data = i2c_mux_priv(muxc);
>> +       data->client = client;
>> +
>> +       i2c_set_clientdata(client, muxc);
>> +
>> +
>> +       ret = i2c_mux_add_adapter(muxc, force, 0, 0);
>> +       if (ret) {
>> +               dev_err(&client->dev, "failed to register master demultiplexer\n");
>> +               return ret;
>> +       }
>> +
>> +       dev_info(&client->dev, "registered master demultiplexer for I2C %s\n",
>> +                client->name);
>> +
>> +       return 0;
>> +}
>> +
>> +static int pca9641_remove(struct i2c_client *client)
>> +{
>> +       struct i2c_mux_core *muxc = i2c_get_clientdata(client);
>> +
>> +       i2c_mux_del_adapters(muxc);
>> +       return 0;
>> +}
>> +
>> +static struct i2c_driver pca9641_driver = {
>> +       .driver = {
>> +                  .name = "pca9641",
>> +                  .of_match_table = of_match_ptr(pca9641_of_match),
>> +                  },
>> +       .probe = pca9641_probe,
>> +       .remove = pca9641_remove,
>> +       .id_table = pca9641_id,
>> +};
>> +
>> +module_i2c_driver(pca9641_driver);
>> +
>> +MODULE_AUTHOR("Ken Chen <chen.kenyy@inventec.com>");
>> +MODULE_DESCRIPTION("PCA9641 I2C master demultiplexer driver");
>> +MODULE_LICENSE("GPL v2");
>> --
>> 2.9.3
>>
