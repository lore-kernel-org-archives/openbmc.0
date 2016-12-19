Return-Path: <eajames.ibm@gmail.com>
Received: from mail-wj0-x244.google.com (mail-wj0-x244.google.com
 [IPv6:2a00:1450:400c:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tjGk55D5tzDwVv
 for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2016 10:06:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OYIAtdnZ"; 
 dkim-atps=neutral
Received: by mail-wj0-x244.google.com with SMTP id j10so25509982wjb.3
 for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2016 15:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=prTLRZOZSWCENiCtQNRwCkHMD2TmcMjS5FYbQ2btAio=;
 b=OYIAtdnZe/livpPckoOBRGdDYmtjGbDpLJHIpP5tEnvlsMQ2CEYwnpVvQ6szSpy5fR
 wf9+lfOZEpINtKjEuB5zJvje50mE5hWWRJfZgAybdeynS1PBW2teNdsqIkPX9KD2WU8e
 iQS3aCgqN5SedzGQD69czbZQDl1Y1JcTAtyRmUU2caXgEAKWPABlMIjx4JNd8gy8svxo
 v1LkpA389hqkYHDzqIWVNqgr2HsLSYHDYm3nlgwxggkKb+FrF4zcyJSWnb+y6SZnrG9F
 KwvcBa94cU0WOpmyyrPmUtnaGqSWsIs1+POrSqqHBCNocdT34r1w8FTn73fKz3qP+IFK
 TOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=prTLRZOZSWCENiCtQNRwCkHMD2TmcMjS5FYbQ2btAio=;
 b=Grjz074q4Yb5LZv+rSQKLGUHjUoEPhvH1+p9f+Fu3/SuwYdnNX/z/0j6KNs1YnAYql
 xkLYtZuMCGUTO2dKsivnm0SCZh/dv5OgoB/7TmRaFkczBM37yuvX4QqhCAR9vWCVX2aG
 Z4NurswOy2w/2Z/u8UylDjk7N5pBs4+8YaHbfsY/H0VX/UMrxjovdMR1kkmX5MXNG9mE
 H6b+vC58h3njdy5coa2cVOsJ9OGQ/qsPuVH0fkf94y17IU2dUKmmXJzjkDHKoCc5Scqh
 gAtXQsaOVqS30Rjg3pFK636JWChofqqdxgpQlTeDNxhG43xFwcklvcohnNCGeYXZq5fM
 UeVw==
X-Gm-Message-State: AIkVDXIop3+VydAhz1skDPSW0TNiXKBTJNZ/S2r7yFITqdeCjZiiRGdlgcsxQOZI91pfd0uD/im92QTlqxZMEA==
X-Received: by 10.194.169.227 with SMTP id ah3mr15723461wjc.2.1482188760430;
 Mon, 19 Dec 2016 15:06:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.37.229 with HTTP; Mon, 19 Dec 2016 15:05:59 -0800 (PST)
In-Reply-To: <1482127573.3419.4.camel@aj.id.au>
References: <1481920475-6638-1-git-send-email-eajames.ibm@gmail.com>
 <1482127573.3419.4.camel@aj.id.au>
From: Eddie James <eajames.ibm@gmail.com>
Date: Mon, 19 Dec 2016 17:05:59 -0600
Message-ID: <CALpMbdmje6ofrDpn1j_ZDB1mJ6j9vVt+Bhe7x-DLQG_s3wB6FA@mail.gmail.com>
Subject: Re: [PATCH linux 1/7] hwmon: Add core On-Chip Controller support for
 POWER CPUs
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Mon, 19 Dec 2016 23:06:07 -0000

Hi Andrew,

Thanks for the comments, I will address most of these and push up a new set.

On Mon, Dec 19, 2016 at 12:06 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Eddie,
>
> I think this is looking good. A few comments below.
>
> On Fri, 2016-12-16 at 14:34 -0600, eajames.ibm@gmail.com wrote:
>> > From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Add core support for polling the OCC for it's sensor data and parsing
>> that
>> data into sensor-specific information.
>>
>> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>
>> ---
>>  Documentation/hwmon/occ    |  40 ++++
>>  drivers/hwmon/Kconfig      |   2 +
>>  drivers/hwmon/Makefile     |   1 +
>>  drivers/hwmon/occ/Kconfig  |  15 ++
>>  drivers/hwmon/occ/Makefile |   1 +
>>  drivers/hwmon/occ/occ.c    | 519
>> +++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/hwmon/occ/occ.h    |  86 ++++++++
>>  drivers/hwmon/occ/scom.h   |  48 +++++
>>  8 files changed, 712 insertions(+)
>>  create mode 100644 Documentation/hwmon/occ
>>  create mode 100644 drivers/hwmon/occ/Kconfig
>>  create mode 100644 drivers/hwmon/occ/Makefile
>>  create mode 100644 drivers/hwmon/occ/occ.c
>>  create mode 100644 drivers/hwmon/occ/occ.h
>>  create mode 100644 drivers/hwmon/occ/scom.h
>>
>> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
>> new file mode 100644
>> index 0000000..79d1642
>> --- /dev/null
>> +++ b/Documentation/hwmon/occ
>> @@ -0,0 +1,40 @@
>> +Kernel driver occ
>> +=================
>> +
>> +Supported chips:
>> + * ASPEED AST2400
>> + * ASPEED AST2500
>> +
>> +Please note that the chip must be connected to a POWER8 or POWER9
>> processor
>> +(see the BMC - Host Communications section).
>> +
>> > +Author: Eddie James <eajames@us.ibm.com>
>>
>> +
>> +Description
>> +-----------
>> +
>> +This driver implements support for the OCC (On-Chip Controller) on
>> the IBM
>> +POWER8 and POWER9 processors, from a BMC (Baseboard Management
>> Controller). The
>> +OCC is an embedded processor that provides real time power and
>> thermal
>> +monitoring.
>> +
>> +This driver provides an interface on a BMC to poll OCC sensor data,
>> set user
>> +power caps, and perform some basic OCC error handling.
>> +
>> +Currently, all versions of the OCC support four types of sensor
>> data: power,
>> +temperature, frequency, and "caps," which indicate limits and
>> thresholds used
>> +internally on the OCC.
>> +
>> +BMC - Host Communications
>> +-------------------------
>> +
>> +For the POWER8 application, the BMC can communicate with the P8 over
>> I2C bus.
>> +However, to access the OCC register space, any data transfer must
>> use a SCOM
>> +operation. SCOM is a procedure to initiate a data transfer,
>> typically of 8
>> +bytes. SCOMs consist of writing a 32-bit command register and then
>> +reading/writing two 32-bit data registers. This driver implements
>> these
>> +SCOM operations over I2C bus in order to communicate with the OCC.
>> +
>> +For the POWER9 application, the BMC can communicate with the P9 over
>> FSI bus
>> +and SBE engine. Once again, SCOM operations are required. This
>> driver will
>> +implement SCOM ops over FSI/SBE. This will require the FSI driver.
>
> Great!
>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 45cef3d..75b83d9 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -1229,6 +1229,8 @@ config SENSORS_NSA320
>> >       This driver can also be built as a module. If so, the
>> > module
>> >       will be called nsa320-hwmon.
>>
>>
>> +source drivers/hwmon/occ/Kconfig
>> +
>>  config SENSORS_PCF8591
>> >     tristate "Philips PCF8591 ADC/DAC"
>> >     depends on I2C
>>
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index aecf4ba..8339696 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> > @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_WM831X)    += wm831x-
>> > hwmon.o
>> >  obj-$(CONFIG_SENSORS_WM8350)       += wm8350-hwmon.o
>> >  obj-$(CONFIG_SENSORS_XGENE)        += xgene-hwmon.o
>>
>>
>> > +obj-$(CONFIG_SENSORS_PPC_OCC)      += occ/
>> >  obj-$(CONFIG_PMBUS)                += pmbus/
>>
>>
>>  ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
>> diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
>> new file mode 100644
>> index 0000000..cdb64a7
>> --- /dev/null
>> +++ b/drivers/hwmon/occ/Kconfig
>> @@ -0,0 +1,15 @@
>> +#
>> +# On Chip Controller configuration
>> +#
>> +
>> +menuconfig SENSORS_PPC_OCC
>> > +   bool "PPC On-Chip Controller"
>> > +   help
>> > +     If you say yes here you get support to monitor Power CPU
>> > +     sensors via the On-Chip Controller (OCC).
>>
>> +
>> > +     Generally this is used by management controllers such as
>> > a BMC
>> > +     on an OpenPower system.
>>
>> +
>> > +     This driver can also be built as a module. If so, the
>> > module
>> > +     will be called occ.
>>
>> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
>> new file mode 100644
>> index 0000000..93cb52f
>> --- /dev/null
>> +++ b/drivers/hwmon/occ/Makefile
>> @@ -0,0 +1 @@
>> +obj-$(CONFIG_SENSORS_PPC_OCC) += occ.o
>> diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
>> new file mode 100644
>> index 0000000..6cb8df5
>> --- /dev/null
>> +++ b/drivers/hwmon/occ/occ.c
>> @@ -0,0 +1,519 @@
>> +/*
>> + * occ.c - OCC hwmon driver
>> + *
>> + * This file contains the methods and data structures for the OCC
>> hwmon driver.
>> + *
>> + * Copyright 2016 IBM Corp.
>> + *
>> + * This program is free software; you can redistribute it and/or
>> modify
>> + * it under the terms of the GNU General Public License as published
>> by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/init.h>
>> +#include <linux/slab.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/err.h>
>> +#include <linux/mutex.h>
>> +#include <linux/delay.h>
>> +#include <linux/kernel.h>
>> +#include <linux/device.h>
>> +#include <asm/unaligned.h>
>> +
>> +#include "occ.h"
>> +
>> > +#define OCC_DATA_MAX               4096
>> > +#define OCC_BMC_TIMEOUT_S  20
>>
>> +
>> +/* To generate attn to OCC */
>> > +#define ATTN_DATA          0x0006B035
>>
>> +
>> +/* For BMC to read/write SRAM */
>> > +#define OCB_ADDRESS                0x0006B070
>> > +#define OCB_DATA           0x0006B075
>> > +#define OCB_STATUS_CONTROL_AND     0x0006B072
>> > +#define OCB_STATUS_CONTROL_OR      0x0006B073
>>
>> +
>> +/* To init OCB */
>> > +#define OCB_AND_INIT0              0xFBFFFFFF
>> > +#define OCB_AND_INIT1              0xFFFFFFFF
>> > +#define OCB_OR_INIT0               0x08000000
>> > +#define OCB_OR_INIT1               0x00000000
>>
>> +
>> +/* To generate attention on OCC */
>> > +#define ATTN0                      0x01010000
>> > +#define ATTN1                      0x00000000
>>
>> +
>> +/* OCC return status for "command in progress" */
>> > +#define RESP_RETURN_CMD_IN_PRG     0xFF
>>
>> +/* time interval to retry on "command in progress" return status */
>> +#define CMD_IN_PRG_INT_MS    100
>
> Out of curiosity, why are we defining one period in MS and another in S
> (OCC_BMC_TIMEOUT_S)? It feels like it would make sense to use
> consistent units.
>
> Regardless, thanks for defining the macros above rather than using the
> magic numbers.
>
>> +
>> +/* OCC command definitions */
>> > +#define OCC_POLL           0
>> > +#define OCC_SET_USER_POWR_CAP      0x22
>>
>> +
>> +/* OCC poll command data */
>> > +#define OCC_POLL_STAT_SENSOR       0x10
>>
>> +
>> +/* OCC response data offsets */
>> > +#define RESP_RETURN_STATUS 2
>> > +#define RESP_DATA_LENGTH   3
>> > +#define RESP_HEADER_OFFSET 5
>> > +#define SENSOR_STR_OFFSET  37
>> > +#define SENSOR_BLOCK_NUM_OFFSET    43
>> > +#define SENSOR_BLOCK_OFFSET        45
>>
>> +
>> +/* occ_poll_header
>> + * structure to match the raw occ poll response data
>> + */
>> +struct occ_poll_header {
>> > +   u8 status;
>> > +   u8 ext_status;
>> > +   u8 occs_present;
>> > +   u8 config;
>> > +   u8 occ_state;
>> > +   u8 mode;
>> > +   u8 ips_status;
>> > +   u8 error_log_id;
>> > +   u32 error_log_addr_start;
>> > +   u16 error_log_length;
>> > +   u8 reserved2;
>> > +   u8 reserved3;
>> > +   u8 occ_code_level[16];
>> > +   u8 sensor_eye_catcher[6];
>> > +   u8 sensor_block_num;
>> > +   u8 sensor_data_version;
>>
>> +} __attribute__((packed, aligned(4)));
>> +
>> +struct occ_response {
>> > +   struct occ_poll_header header;
>> > +   struct occ_blocks data;
>>
>> +};
>> +
>> +struct occ {
>> > +   struct device *dev;
>> > +   void *bus;
>> > +   struct occ_bus_ops bus_ops;
>> > +   struct occ_ops ops;
>> > +   struct occ_config config;
>> > +   unsigned long update_interval;
>> > +   unsigned long last_updated;
>> > +   struct mutex update_lock;
>> > +   struct occ_response response;
>> > +   bool valid;
>>
>> +};
>> +
>> +static void deinit_occ_resp_buf(struct occ_response *resp)
>> +{
>> > +   int i;
>>
>> +
>> > +   if (!resp)
>> > +           return;
>>
>> +
>> > +   if (!resp->data.blocks)
>> > +           return;
>>
>> +
>> > +   for (i = 0; i < resp->header.sensor_block_num; ++i)
>> > +           kfree(resp->data.blocks[i].sensors);
>>
>> +
>> > +   kfree(resp->data.blocks);
>>
>> +
>> > +   memset(resp, 0, sizeof(struct occ_response));
>>
>> +
>> > +   for (i = 0; i < MAX_OCC_SENSOR_TYPE; ++i)
>> > +           resp->data.sensor_block_id[i] = -1;
>>
>> +}
>> +
>> +static void *occ_get_sensor_by_type(struct occ_response *resp,
>> > +                               enum sensor_type t)
>>
>> +{
>> > +   if (!resp->data.blocks)
>> > +           return NULL;
>>
>> +
>> > +   if (resp->data.sensor_block_id[t] == -1)
>> > +           return NULL;
>>
>> +
>> > +   return resp->data.blocks[resp-
>> > >data.sensor_block_id[t]].sensors;
>>
>> +}
>> +
>> +static int occ_check_sensor(struct occ *driver, u8 sensor_length,
>> > +                       u8 sensor_num, enum sensor_type t, int
>> > block)
>>
>> +{
>> > +   void *sensor;
>> > +   int type_block_id;
>> > +   struct occ_response *resp = &driver->response;
>>
>> +
>> > +   sensor = occ_get_sensor_by_type(resp, t);
>>
>> +
>> > +   /* empty sensor block, release older sensor data */
>> > +   if (sensor_num == 0 || sensor_length == 0) {
>> > +           kfree(sensor);
>> > +           dev_err(driver->dev, "no sensor blocks
>> > available\n");
>> > +           return -ENODATA;
>> > +   }
>>
>> +
>> > +   type_block_id = resp->data.sensor_block_id[t];
>> > +   if (!sensor || sensor_num !=
>> > +       resp->data.blocks[type_block_id].header.sensor_num) {
>> > +           kfree(sensor);
>> > +           resp->data.blocks[block].sensors =
>> > +                   driver->ops.alloc_sensor(t, sensor_num);
>> > +           if (!resp->data.blocks[block].sensors)
>> > +                   return -ENOMEM;
>> > +   }
>>
>> +
>> > +   return 0;
>>
>> +}
>> +
>> +static int parse_occ_response(struct occ *driver, u8 *data,
>> > +                         struct occ_response *resp)
>>
>> +{
>> > +   int b;
>> > +   int s;
>> > +   int rc;
>> > +   int offset = SENSOR_BLOCK_OFFSET;
>> > +   int sensor_type;
>> > +   u8 sensor_block_num;
>>
>> +     char sensor_type_string[5] = { 0 };
>
> Given how you rearranged things below, do you think we can get away
> with removing sensor_type_string? Also, struct sensor_data_block_type
> defines sensor_type as a char * that can't be null-terminated as its
> size is 4, which still makes me feel uncomfortable. What are your
> thoughts here?

The idea of sensor_type_string was to have a null-terminated string
that I could use in the debug statements below. sensor_type is
restricted to 4 chars because that's how its' formatted in the OCC
data block. Anywhere I use sensor_type I use the length-limited string
function, such as strncmp or the like, and restrict it to 4 chars. I
feel this is an acceptable solution, but you're right,
sensor_type_string isn't strictly necessary, just useful to be able to
print that out.

>
>> +     struct sensor_data_block_header *block;
>> > +   struct device *dev = driver->dev;
>>
>> +
>> > +   /* check if the data is valid */
>> > +   if (strncmp(&data[SENSOR_STR_OFFSET], "SENSOR", 6) != 0) {
>> > +           dev_err(dev, "no SENSOR string in response\n");
>> > +           rc = -ENODATA;
>> > +           goto err;
>> > +   }
>>
>> +
>> > +   sensor_block_num = data[SENSOR_BLOCK_NUM_OFFSET];
>> > +   if (sensor_block_num == 0) {
>> > +           dev_err(dev, "no sensor blocks available\n");
>> > +           rc = -ENODATA;
>> > +           goto err;
>> > +   }
>>
>> +
>> > +   /* if number of sensor block has changed, re-malloc */
>> > +   if (sensor_block_num != resp->header.sensor_block_num) {
>> > +           deinit_occ_resp_buf(resp);
>> > +           resp->data.blocks = kcalloc(sensor_block_num,
>> > +                                       sizeof(struct
>> > sensor_data_block),
>> > +                                       GFP_KERNEL);
>> > +           if (!resp->data.blocks)
>> > +                   return -ENOMEM;
>> > +   }
>>
>> +
>> > +   memcpy(&resp->header, &data[RESP_HEADER_OFFSET],
>> > +          sizeof(struct occ_poll_header));
>> > +   resp->header.error_log_addr_start =
>> > +           be32_to_cpu(resp->header.error_log_addr_start);
>> > +   resp->header.error_log_length =
>> > +           be16_to_cpu(resp->header.error_log_length);
>>
>> +
>> > +   dev_dbg(dev, "Reading %d sensor blocks\n",
>> > +           resp->header.sensor_block_num);
>> > +   for (b = 0; b < sensor_block_num; b++) {
>>
>> +             block = (struct sensor_data_block_header
>> *)&data[offset];
>
> +               /* copy to a null terminated string */
>> > +           strncpy(sensor_type_string, block->sensor_type,
>> > 4);
>> > +           offset += 8;
>>
>> +
>> > +           dev_dbg(dev, "sensor block[%d]: type: %s,
>> > sensor_num: %d\n", b,
>> > +                   sensor_type_string, block->sensor_num);
>>
>> +
>> > +           if (strncmp(block->sensor_type, "FREQ", 4) == 0)
>> > +                   sensor_type = FREQ;
>> > +           else if (strncmp(block->sensor_type, "TEMP", 4) ==
>> > 0)
>> > +                   sensor_type = TEMP;
>> > +           else if (strncmp(block->sensor_type, "POWR", 4) ==
>> > 0)
>> > +                   sensor_type = POWER;
>> > +           else if (strncmp(block->sensor_type, "CAPS", 4) ==
>> > 0)
>> > +                   sensor_type = CAPS;
>> > +           else {
>> > +                   dev_err(dev, "sensor type not supported
>> > %s\n",
>> > +                           sensor_type_string);
>> > +                   continue;
>> > +           }
>>
>> +
>> > +           rc = occ_check_sensor(driver, block-
>> > >sensor_length,
>> > +                                 block->sensor_num,
>> > sensor_type, b);
>> > +           if (rc == -ENOMEM)
>> > +                   goto err;
>> > +           else if (rc)
>> > +                   continue;
>>
>> +
>> > +           resp->data.sensor_block_id[sensor_type] = b;
>> > +           for (s = 0; s < block->sensor_num; s++) {
>> > +                   driver->ops.parse_sensor(data,
>> > +                                            resp-
>> > >data.blocks[b].sensors,
>> > +                                            sensor_type,
>> > offset, s);
>> > +                   offset += block->sensor_length;
>> > +           }
>>
>> +
>> > +           /* copy block data over to response pointer */
>> > +           resp->data.blocks[b].header = *block;
>> > +   }
>>
>> +
>> > +   return 0;
>>
>> +err:
>> > +   deinit_occ_resp_buf(resp);
>> > +   return rc;
>>
>> +}
>> +
>> +static u8 occ_send_cmd(struct occ *driver, u8 seq, u8 type, u16
>> length,
>> > +                  u8 *data, u8 *resp)
>>
>> +{
>> > +   u32 cmd1, cmd2;
>> > +   u16 checksum = 0;
>> > +   u16 length_be = cpu_to_be16(length);
>> > +   int i, rc, tries = 0;
>>
>> +     const int max_tries = (OCC_BMC_TIMEOUT_S * 1000) /
>> CMD_IN_PRG_INT_MS;
>
> I expect we should just #define the expression?
>
>> +
>> > +   cmd1 = (seq << 24) | (type << 16) | length_be;
>> > +   memcpy(&cmd2, data, length);
>> > +   cmd2 <<= ((4 - length) * 8);
>>
>> +
>> > +   /* checksum: sum of every bytes of cmd1, cmd2 */
>> > +   for (i = 0; i < 4; i++) {
>> > +           checksum += (cmd1 >> (i * 8)) & 0xFF;
>>
>> +             checksum += (cmd2 >> (i * 8)) & 0xFF;
>
> I have to apologise here, as my review was wrong: Addition is
> commutative, but not when we're masking the result! So the original
> approach is probably more correct, and it only occurred to me when
> reading over this patch. Sorry! Did you get checksum errors as a
> result?

No worries, I didn't catch it either, but I think it worked out OK
since the mask is really applied to the shifted cmd, but I will test
both ways to make sure... Thanks!

>
>> +     }
>> +
>> > +   cmd2 |= checksum << ((2 - length) * 8);
>>
>> +
>> > +   /* Init OCB */
>> > +   rc = driver->bus_ops.putscom(driver->bus,
>> > OCB_STATUS_CONTROL_OR,
>> > +                                OCB_OR_INIT0, OCB_OR_INIT1);
>> > +   if (rc)
>> > +           goto err;
>>
>> +
>> > +   rc = driver->bus_ops.putscom(driver->bus,
>> > OCB_STATUS_CONTROL_AND,
>> > +                                OCB_AND_INIT0,
>> > OCB_AND_INIT1);
>> > +   if (rc)
>> > +           goto err;
>>
>> +
>> > +   /* Send command, 2nd half of the 64-bit addr is unused
>> > (write 0) */
>> > +   rc = driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
>> > +                                driver->config.command_addr,
>> > 0);
>> > +   if (rc)
>> > +           goto err;
>>
>> +
>> > +   rc = driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
>> > +                                driver->config.command_addr,
>> > 0);
>> > +   if (rc)
>>
>> +             goto err;
>
> This change highlighted to me that we're sending command_addr twice -
> is this necessary?

I'm not sure... I'll test both without and see if everything works OK.
I noticed it was sent twice, but I assumed Yi had some reason for
doing it.

>
>> +
>> > +   rc = driver->bus_ops.putscom(driver->bus, OCB_DATA, cmd1,
>> > cmd2);
>> > +   if (rc)
>> > +           goto err;
>>
>> +
>> > +   /* Trigger attention */
>> > +   rc = driver->bus_ops.putscom(driver->bus, ATTN_DATA,
>> > ATTN0, ATTN1);
>> > +   if (rc)
>> > +           goto err;
>>
>> +
>> > +   /* Get response data */
>> > +   rc = driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
>> > +                                driver->config.response_addr,
>> > 0);
>> > +   if (rc)
>> > +           goto err;
>>
>> +
>> > +   do {
>> > +           rc = driver->bus_ops.getscom(driver->bus,
>> > OCB_DATA, resp);
>> > +           if (rc)
>> > +                   goto err;
>>
>> +
>> > +           /* retry if we get "command in progress" return
>> > status */
>> > +           if (resp[RESP_RETURN_STATUS] ==
>> > RESP_RETURN_CMD_IN_PRG) {
>> > +                   set_current_state(TASK_INTERRUPTIBLE);
>> > +                   schedule_timeout(msecs_to_jiffies(CMD_IN_P
>> > RG_INT_MS));
>> > +                   tries++;
>> > +           } else
>> > +                   break;
>>
>> +     } while (tries < max_tries);
>
> I'll bikeshed this to try save the break and a timeout, which is really
> picking at the nits but reduces cyclomatic complexity and saves some
> time. What do you think of:
>
>     bool retry = false;
>     int tries = 0;
>
>     ...
>
>     do {
>         if (retry) {
>             set_current_state(TASK_INTERRUPTIBLE);
>             shedule_timeout(msecs_to_jiffies(CMD_IN_PRG_INT_MS));
>         }
>
>         rc = driver->bus_ops.getscom(driver->bus, OCB_DATA, resp);
>         if (rc)
>             goto err;
>
>         retry = (resp[RESP_RETURN_STATUS] == RESP_RETURN_CMD_IN_PRG) && tries++ < max_tries);
>     } while (retry);
>
> Are we okay with returning RESP_RETURN_CMD_IN_PRG to the caller?
> Because that's what happens in either case if we exceed max_tries.

Looks a little bit cleaner, I'll incorporate this. And yes, any
non-zero return will be flagged as an error. If we timeout and are are
still getting the busy response we do want an error.

>
>> +
>> > +   return resp[RESP_RETURN_STATUS];
>>
>> +
>> +err:
>> > +   dev_err(driver->dev, "scom op failed rc:%d\n", rc);
>> > +   return rc;
>>
>> +}
>> +
>> +static int occ_get_all(struct occ *driver)
>> +{
>> > +   int i = 0, rc;
>> > +   u8 *occ_data;
>> > +   u16 num_bytes;
>> > +   const u8 poll_cmd_data = OCC_POLL_STAT_SENSOR;
>> > +   struct device *dev = driver->dev;
>> > +   struct occ_response *resp = &driver->response;
>>
>> +
>> > +   occ_data = devm_kzalloc(dev, OCC_DATA_MAX, GFP_KERNEL);
>> > +   if (!occ_data)
>> > +           return -ENOMEM;
>>
>> +
>> > +   rc = occ_send_cmd(driver, 0, OCC_POLL, 1, &poll_cmd_data,
>> > occ_data);
>> > +   if (rc) {
>> > +           dev_err(dev, "OCC poll failed: 0x%x\n", rc);
>> > +           rc = -EINVAL;
>> > +           goto out;
>> > +   }
>>
>> +
>> > +   num_bytes = get_unaligned((u16
>> > *)&occ_data[RESP_DATA_LENGTH]);
>> > +   num_bytes = be16_to_cpu(num_bytes);
>> > +   dev_dbg(dev, "OCC data length: %d\n", num_bytes);
>>
>> +
>> > +   if (num_bytes > OCC_DATA_MAX) {
>> > +           dev_err(dev, "OCC data length must be < 4KB\n");
>> > +           rc = -EINVAL;
>> > +           goto out;
>> > +   }
>>
>> +
>> > +   if (num_bytes <= 0) {
>> > +           dev_err(dev, "OCC data length is zero\n");
>> > +           rc = -EINVAL;
>> > +           goto out;
>> > +   }
>>
>> +
>> > +   /* read remaining data */
>> > +   for (i = 8; i < num_bytes + 8; i += 8) {
>> > +           rc = driver->bus_ops.getscom(driver->bus,
>> > OCB_DATA,
>> > +                                        &occ_data[i]);
>> > +           if (rc) {
>> > +                   dev_err(dev, "scom op failed rc:%d\n",
>> > rc);
>> > +                   goto out;
>> > +           }
>> > +   }
>>
>> +
>> > +   /* don't need more sanity checks; buffer is alloc'd for
>> > max response
>> > +    * size so we just check for valid data in
>> > parse_occ_response
>>
>> +      */
>
> Thanks for the comment.
>
>> +     rc = parse_occ_response(driver, occ_data, resp);
>> +
>> +out:
>> > +   devm_kfree(dev, occ_data);
>> > +   return rc;
>>
>> +}
>> +
>> +int occ_update_device(struct occ *driver)
>> +{
>> > +   int rc = 0;
>>
>> +
>> > +   mutex_lock(&driver->update_lock);
>>
>> +
>> > +   if (time_after(jiffies, driver->last_updated + driver-
>> > >update_interval)
>> > +       || !driver->valid) {
>> > +           driver->valid = 1;
>>
>> +
>> > +           rc = occ_get_all(driver);
>> > +           if (rc)
>> > +                   driver->valid = 0;
>>
>> +
>> > +           driver->last_updated = jiffies;
>> > +   }
>>
>> +
>> > +   mutex_unlock(&driver->update_lock);
>>
>> +
>> > +   return rc;
>>
>> +}
>> +EXPORT_SYMBOL(occ_update_device);
>> +
>> +void *occ_get_sensor(struct occ *driver, int sensor_type)
>> +{
>> > +   int rc;
>>
>> +
>> > +   /* occ_update_device locks the update lock */
>> > +   rc = occ_update_device(driver);
>> > +   if (rc != 0) {
>> > +           dev_err(driver->dev, "cannot get occ sensor data:
>> > %d\n",
>> > +                   rc);
>> > +           return NULL;
>> > +   }
>>
>> +
>> > +   return occ_get_sensor_by_type(&driver->response,
>> > sensor_type);
>>
>> +}
>> +EXPORT_SYMBOL(occ_get_sensor);
>> +
>> +int occ_get_sensor_value(struct occ *occ, int sensor_type, int snum)
>> +{
>> > +   return occ->ops.get_sensor_value(occ, sensor_type, snum);
>>
>> +}
>> +EXPORT_SYMBOL(occ_get_sensor_value);
>> +
>> +int occ_get_sensor_id(struct occ *occ, int sensor_type, int snum)
>> +{
>> > +   return occ->ops.get_sensor_id(occ, sensor_type, snum);
>>
>> +}
>> +EXPORT_SYMBOL(occ_get_sensor_id);
>> +
>> +int occ_get_caps_value(struct occ *occ, void *sensor, int snum, int
>> caps_field)
>> +{
>> > +   return occ->ops.get_caps_value(sensor, snum, caps_field);
>>
>> +}
>> +EXPORT_SYMBOL(occ_get_caps_value);
>> +
>> +void occ_get_response_blocks(struct occ *occ, struct occ_blocks
>> **blocks)
>> +{
>> > +   *blocks = &occ->response.data;
>>
>> +}
>> +EXPORT_SYMBOL(occ_get_response_blocks);
>> +
>> +void occ_set_update_interval(struct occ *occ, unsigned long
>> interval)
>> +{
>> > +   occ->update_interval = msecs_to_jiffies(interval);
>>
>> +}
>> +EXPORT_SYMBOL(occ_set_update_interval);
>> +
>> +int occ_set_user_powercap(struct occ *occ, u16 cap)
>> +{
>> > +   u8 resp[8];
>>
>> +
>> > +   cap = cpu_to_be16(cap);
>>
>> +
>> > +   return occ_send_cmd(occ, 0, OCC_SET_USER_POWR_CAP, 2, (u8
>> > *)&cap,
>> > +                       resp);
>>
>> +}
>> +EXPORT_SYMBOL(occ_set_user_powercap);
>> +
>> +struct occ *occ_start(struct device *dev, void *bus,
>> > +                 struct occ_bus_ops *bus_ops, const struct
>> > occ_ops *ops,
>> > +                 const struct occ_config *config)
>>
>> +{
>> > +   struct occ *driver = devm_kzalloc(dev, sizeof(struct occ),
>> > GFP_KERNEL);
>>
>> +
>> > +   if (!driver)
>> > +           return ERR_PTR(-ENOMEM);
>>
>> +
>> > +   driver->dev = dev;
>> > +   driver->bus = bus;
>> > +   driver->bus_ops = *bus_ops;
>> > +   driver->ops = *ops;
>> > +   driver->config = *config;
>>
>> +
>> > +   driver->update_interval = HZ;
>> > +   mutex_init(&driver->update_lock);
>>
>> +
>> > +   return driver;
>>
>> +}
>> +EXPORT_SYMBOL(occ_start);
>> +
>> +int occ_stop(struct occ *occ)
>> +{
>> > +   devm_kfree(occ->dev, occ);
>>
>> +
>> > +   return 0;
>>
>> +}
>> +EXPORT_SYMBOL(occ_stop);
>> +
>> > +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
>>
>> +MODULE_DESCRIPTION("OCC hwmon core driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/hwmon/occ/occ.h b/drivers/hwmon/occ/occ.h
>> new file mode 100644
>> index 0000000..8c08607
>> --- /dev/null
>> +++ b/drivers/hwmon/occ/occ.h
>> @@ -0,0 +1,86 @@
>> +/*
>> + * occ.h - hwmon OCC driver
>> + *
>> + * This file contains data structures and function prototypes for
>> common access
>> + * between different bus protocols and host systems.
>> + *
>> + * Copyright 2016 IBM Corp.
>> + *
>> + * This program is free software; you can redistribute it and/or
>> modify
>> + * it under the terms of the GNU General Public License as published
>> by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#ifndef __OCC_H__
>> +#define __OCC_H__
>> +
>> +#include "scom.h"
>> +
>> +struct device;
>> +struct occ;
>> +
>> +/* sensor_data_block_header
>> + * structure to match the raw occ sensor block header
>> + */
>> +struct sensor_data_block_header {
>> > +   u8 sensor_type[4];
>> > +   u8 reserved0;
>> > +   u8 sensor_format;
>> > +   u8 sensor_length;
>> > +   u8 sensor_num;
>>
>> +} __attribute__((packed, aligned(4)));
>> +
>> +struct sensor_data_block {
>> > +   struct sensor_data_block_header header;
>> > +   void *sensors;
>>
>> +};
>> +
>> +enum sensor_type {
>> > +   FREQ = 0,
>> > +   TEMP,
>> > +   POWER,
>> > +   CAPS,
>> > +   MAX_OCC_SENSOR_TYPE
>>
>> +};
>> +
>> +struct occ_ops {
>> > +   void (*parse_sensor)(u8 *data, void *sensor, int
>> > sensor_type, int off,
>> > +                        int snum);
>> > +   void *(*alloc_sensor)(int sensor_type, int num_sensors);
>> > +   int (*get_sensor_value)(struct occ *driver, int
>> > sensor_type, int snum);
>> > +   int (*get_sensor_id)(struct occ *driver, int sensor_type,
>> > int snum);
>> > +   int (*get_caps_value)(void *sensor, int snum, int
>> > caps_field);
>>
>> +};
>> +
>> +struct occ_config {
>> > +   u32 command_addr;
>> > +   u32 response_addr;
>>
>> +};
>> +
>> +struct occ_blocks {
>> > +   int sensor_block_id[MAX_OCC_SENSOR_TYPE];
>> > +   struct sensor_data_block *blocks;
>>
>> +};
>> +
>> +struct occ *occ_start(struct device *dev, void *bus,
>> > +                 struct occ_bus_ops *bus_ops, const struct
>> > occ_ops *ops,
>> > +                 const struct occ_config *config);
>>
>> +int occ_stop(struct occ *occ);
>> +
>> +void *occ_get_sensor(struct occ *occ, int sensor_type);
>> +int occ_get_sensor_value(struct occ *occ, int sensor_type, int
>> snum);
>> +int occ_get_sensor_id(struct occ *occ, int sensor_type, int snum);
>> +int occ_get_caps_value(struct occ *occ, void *sensor, int snum,
>> > +                  int caps_field);
>>
>> +void occ_get_response_blocks(struct occ *occ, struct occ_blocks
>> **blocks);
>> +int occ_update_device(struct occ *driver);
>> +void occ_set_update_interval(struct occ *occ, unsigned long
>> interval);
>> +int occ_set_user_powercap(struct occ *occ, u16 cap);
>> +
>> +#endif /* __OCC_H__ */
>> diff --git a/drivers/hwmon/occ/scom.h b/drivers/hwmon/occ/scom.h
>> new file mode 100644
>> index 0000000..409a861
>> --- /dev/null
>> +++ b/drivers/hwmon/occ/scom.h
>> @@ -0,0 +1,48 @@
>> +/*
>> + * scom.h - hwmon OCC driver
>> + *
>> + * This file contains data structures for scom operations to the OCC
>> + *
>> + * Copyright 2016 IBM Corp.
>> + *
>> + * This program is free software; you can redistribute it and/or
>> modify
>> + * it under the terms of the GNU General Public License as published
>> by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#ifndef __SCOM_H__
>> +#define __SCOM_H__
>> +
>> +/*
>> + * occ_bus_ops - represent the low-level transfer methods to
>> communicate with
>> + * the OCC.
>> + *
>> + * getscom - OCC scom read
>> + * @bus: handle to slave device
>> + * @address: address
>> + * @data: where to store data read from slave; buffer size must be
>> greater than
>> + * or equal to offset + 8 bytes.
>> + * @offset: offset into data pointer
>> + *
>> + * Returns 0 on success or one of -SCOM_READ_ERROR,
>> -SCOM_WRITE_ERROR.
>
> We deleted these macros. What's the plan?
>
>> + *
>> + * putscom - OCC scom write
>> + * @bus: handle to slave device
>> + * @address: address
>> + * @data0: first data byte to write
>> + * @data1: second data byte to write
>> + *
>> + * Returns 0 on success or -SCOM_WRITE_ERROR on error
>
> Again, this macro was deleted.
>
>> + */
>> +struct occ_bus_ops {
>> > +   int (*getscom)(void *bus, u32 address, u8 *data);
>> > +   int (*putscom)(void *bus, u32 address, u32 data0, u32
>> > data1);
>>
>> +};
>> +
>> +#endif /* __SCOM_H__ */
>
> Cheers,
>
> Andrew

Thanks,
Eddie
