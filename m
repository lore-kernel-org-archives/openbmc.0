Return-Path: <eajames.ibm@gmail.com>
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com
 [IPv6:2a00:1450:400c:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSzWv6MyNzDvnR
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 09:59:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kBFEzEQC"; 
 dkim-atps=neutral
Received: by mail-wm0-x242.google.com with SMTP id g23so26821440wme.1
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 14:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=YtT38MQ7bu9wOiy38limJCGchARDveEH3zYAq+UR+rg=;
 b=kBFEzEQCiMmCYiY86hxJ4/Hwh0uKBy4SQkv/cyqBz4NiZmv4QSCwUm7MHPE4lgdCTI
 lyRfyEmfYPS0n1EIw5Z61bZdcAp1Dkwh+kFCRpHGDsiV+ccS5RPPbM34MY2XRdsXVVrf
 Pz9C36eiCWtLZn1KB0P1vTT3iuexlvJezCa2mX9N1AVWNSQMrWRU/77k/qkQuz2wvWT5
 k6+wsQwAo7U3yKxC8LVS+68I1+Wkh0PX09oImlO5R8/yoX3GAe9r3GoGJQ8CA+5ZOygi
 1hcnUQ1zniPgPjComU5CnLtqs2gWPkJiLSg7bmx622gGoek3qgr6Qf3rwoxHMvcQsf49
 h3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=YtT38MQ7bu9wOiy38limJCGchARDveEH3zYAq+UR+rg=;
 b=NU7z6U0k+aKrFVYSh8awLSxUnpZLzdk7QmrvQfbRtcX1ND+paGcK34H4mLTRoRE062
 ZYxflk9178tVD3NuE5fZDJZU3IxjGPNVfVG+JUgNp6s4+JXmIjS8q/GcoUUSd9RYW+2D
 b8Ug2P1qEk7vRaZ9H//GbnooDz+hYLwnfYf2D6tUqvR/lJM6KzyedvJSzjJfW34rVktU
 ku6ywIEQfDUfOQfYYSEsGlTWhlFEcEifiSIeWjZf3Lf1guD8lmzqB63jaWt14liQwVm6
 NKXhaRA8KDt5FwIYTY8glg9PVuTJatf/A4SOkKY8lE+2f3EB/ODEJ/y4Ul0q7EXo2PEv
 jxcA==
X-Gm-Message-State: AKaTC03mdDwZBFtf1xiOToSmQaDkOXrj5uXHeWSB8UUHdSfSlwy0NfAB+V4XvAtLG0OMzFvAQI/9Tz7Wp+oopw==
X-Received: by 10.28.224.5 with SMTP id x5mr24871001wmg.70.1480460376921; Tue,
 29 Nov 2016 14:59:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.37.229 with HTTP; Tue, 29 Nov 2016 14:59:36 -0800 (PST)
In-Reply-To: <f9d045f67c7c79bbe7299cffd829d0848154a46c.1478835488.git.andrew@aj.id.au>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
 <f9d045f67c7c79bbe7299cffd829d0848154a46c.1478835488.git.andrew@aj.id.au>
From: Eddie James <eajames.ibm@gmail.com>
Date: Tue, 29 Nov 2016 16:59:36 -0600
Message-ID: <CALpMbd=F8Jj7ObkYog7paNyaEa5Qj-0PETBDd+faZGd8_MkVxQ@mail.gmail.com>
Subject: Re: [RFC PATCH linux 4/9] hwmon: occ: Add I2C SCOM transport
 implementation
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, "Edward A . James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 29 Nov 2016 22:59:40 -0000

Hi Andrew,

Just a general comment on this one. I'm not sure it's worth having an
extra layer just to isolate these functions from the
p8_i2c_getscom/putscom. Those just do the address shift for P8. But
there's no situation where i2c is used that's not on the P8. So this
seems like unnecessary complexity to me. I'm not sure, just a thought.

Thanks,
Eddie

On Thu, Nov 10, 2016 at 10:12 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The BMC queries the OCC on POWER8 chips with SCOMs over I2C.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/hwmon/occ/occ_scom_i2c.c | 68 ++++++++++++++++++++++++++++++++++++++++
>  drivers/hwmon/occ/occ_scom_i2c.h | 20 ++++++++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
>  create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h
>
> diff --git a/drivers/hwmon/occ/occ_scom_i2c.c b/drivers/hwmon/occ/occ_scom_i2c.c
> new file mode 100644
> index 000000000000..b1a060331c4a
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_scom_i2c.c
> @@ -0,0 +1,68 @@
> +/*
> + * occ_i2c.c - hwmon OCC driver
> + *
> + * This file contains the i2c layer for accessing the OCC over i2c bus.
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#include "scom.h"
> +#include "occ_scom_i2c.h"
> +
> +#define OCC_I2C_NAME   "occ-p8-i2c"
> +
> +int occ_i2c_getscom(void *bus, u32 address, u8 *data, size_t offset)
> +{
> +       ssize_t rc;
> +       u64 buf;
> +       struct i2c_client *client = bus;
> +
> +       rc = i2c_master_send(client, (const char *)&address, sizeof(u32));
> +       if (rc != sizeof(u32))
> +               return -SCOM_WRITE_ERROR;
> +
> +       rc = i2c_master_recv(client, (char *)&buf, sizeof(u64));
> +       if (rc != sizeof(u64))
> +               return -SCOM_READ_ERROR;
> +
> +       *((u64 *)&data[offset]) = be64_to_cpu(buf);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(occ_i2c_getscom);
> +
> +int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
> +{
> +       u32 buf[3];
> +       ssize_t rc;
> +       struct i2c_client *client = bus;
> +
> +       buf[0] = address;
> +       buf[1] = data1;
> +       buf[2] = data0;
> +
> +       rc = i2c_master_send(client, (const char *)buf, sizeof(u32) * 3);
> +       if (rc != sizeof(u32) * 3)
> +               return -SCOM_WRITE_ERROR;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(occ_i2c_putscom);
> +
> +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("I2C OCC SCOM transport");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/occ/occ_scom_i2c.h b/drivers/hwmon/occ/occ_scom_i2c.h
> new file mode 100644
> index 000000000000..92225f4cd584
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_scom_i2c.h
> @@ -0,0 +1,20 @@
> +/*
> + * occ_i2c.c - hwmon OCC driver
> + *
> + * This file contains the i2c layer for accessing the OCC over i2c bus.
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +int occ_i2c_getscom(void *bus, u32 address, u8 *data, size_t offset);
> +int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1);
> --
> 2.9.3
>
