Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTLJh472NzDq8M
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 15:06:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uRlnE/DK"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id 2so1653175ywn.3
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 20:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=NK1550Ta6O0Siu+SqRfsIdkmES3SGtVDqkO0a5qELhc=;
 b=uRlnE/DKf9rqzKAoMAilT4jxVhFj/w7Bg2YhwEj3p2WFnCuWwCKuhu8dISVGjdMtEC
 yr2WevNPReICq34OlxhfHTUTEhgC9H98q22f9o91MAGr/3WfNw0zcjbSxw+MXhgBRBY8
 +KyCMJoxlCD1DH5GuPhABDLN2lDVtc10Zi6PyTgD15/ZxQEwraX9kQCgbS0O/vQCk1uI
 oims0g10/6tRxoXqBCXUVQm+FbKNJcxDxDH5Uxk/YqIQCL4cyTE0RUALU5PXwsjbWsO+
 onStT9dxmmXG1iAt8F06YReNrn0G+8CXbff4dIaz3lCyiQV8CeeVejdJX4xsNvYIGuex
 qnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=NK1550Ta6O0Siu+SqRfsIdkmES3SGtVDqkO0a5qELhc=;
 b=pTNde0PNDiXL1aHK4aRlqCDyf9Poybzt2ca/JY397QmgQOSplzzym8Ti8SXtzDacXM
 4zAOAd3i9vE2qi8/E+C3Sif7i5Pcb7FRAJ+8ZPak4aoucrgFeOONlSldD+wmlCoR8ftG
 pWQ12QMy3ym07yU+moqK2jztf9DW7nPTdw+kTUi1oNJIms0VYMg7tftFsJ5v4kbf9IIW
 naUVzzmeIAoX1Yuzaq8o0jsuUcHnHvBntTcX6jA8u9JIywnX+95RwNJsCY3xV2PcRSX5
 ucoPaEeqtNbRzYdON0RHQEXOJnkFWbioVyLapvfru626A9xqdM1cu29OaUgLLhQulC1g
 thdA==
X-Gm-Message-State: AMke39lab3KZ6DvByVuYrG+0l6+QACncVN1+MGb7WMLApthW3rGKNHWOtZqfc6CI4sRJmU1ODeslxAVHzJf3PQ==
X-Received: by 10.129.118.82 with SMTP id j18mr26224117ywk.10.1487822786125;
 Wed, 22 Feb 2017 20:06:26 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Wed, 22 Feb 2017 20:06:05 -0800 (PST)
In-Reply-To: <1487808141-28293-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1487808141-28293-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Feb 2017 14:36:05 +1030
X-Google-Sender-Auth: RD6XAR4yi_n4nUpdc4OZrEB8WHo
Message-ID: <CACPK8XdKWo=NCavc035_npqDk3YmiTy8JMxBu7uA8dzHS9y=7g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: i2c: Fixup probe to allow
 multiple engines
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
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
X-List-Received-Date: Thu, 23 Feb 2017 04:06:29 -0000

On Thu, Feb 23, 2017 at 10:32 AM, Eddie James
<eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Getting duplicate sysfs when probe a second I2C engine off second proc.
> So use ida API to get unique bus numbers. Also change sysfs interface:
> /dev/i2cfsi00 -> /dev/i2cfsi1.00
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Acked-by: Joel Stanley <joel@jms.id.au>

Will merge once Chris has taken a look.

Cheers,

Joel

> ---
>  drivers/fsi/i2c/iic-fsi.c  | 21 ++++++++++++++++-----
>  drivers/fsi/i2c/iic-int.h  |  4 +++-
>  drivers/fsi/i2c/iic-mstr.c |  3 ++-
>  3 files changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
> index 6ae411f..1f85e91 100644
> --- a/drivers/fsi/i2c/iic-fsi.c
> +++ b/drivers/fsi/i2c/iic-fsi.c
> @@ -19,6 +19,7 @@
>  /*
>   * This file contains the architecture independent IIC FSI code.
>   */
> +#include <linux/idr.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/kernel.h>
> @@ -36,7 +37,10 @@
>  struct class* iic_fsi_class = 0;
>  dev_t iic_devnum_start = 0;
>
> -static const char iic_fsi_version[] = "3.1";
> +static const char iic_fsi_version[] = "3.2";
> +
> +static DEFINE_IDA(iic_ida);
> +static DEFINE_IDA(iic_port_ida);
>
>  int iic_fsi_probe(struct device *dev);
>  int iic_fsi_remove(struct device *dev);
> @@ -185,7 +189,7 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
>         int bus_num = 0;
>         unsigned long flags;
>         iic_bus_t* new_bus = 0;
> -       int minor = 0;
> +       int minor;
>         char name[64];
>         int rc = 0;
>
> @@ -202,6 +206,7 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
>                 if(!(ports_left & 0x1))
>                         continue;
>
> +               minor = ida_simple_get(&iic_port_ida, 0, INT_MAX, GFP_KERNEL);
>
>                 if( minor < 0 ) {
>                         IFLDe(1, "bb_get_minor %d", minor);
> @@ -209,7 +214,7 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
>                         goto exit;
>                 }
>
> -               sprintf(name, "i2cfsi%02d", bus_num);
> +               sprintf(name, "i2cfsi%d.%02d", eng->idx, bus_num);
>
>                 /* results in hotplug event for each master bus */
>                 new_bus = iic_create_bus(iic_fsi_class, eng,
> @@ -219,6 +224,7 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
>                 {
>                         IFLDe(1, "iic_create_bus failed on eng %d", eng->id);
>                         rc = -ENODEV;
> +                       ida_simple_remove(&iic_port_ida, minor);
>                         goto exit;
>                 }
>
> @@ -235,6 +241,7 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
>                          */
>                         rc = -ENODEV;
>                         iic_delete_bus(iic_fsi_class, new_bus);
> +                       ida_simple_remove(&iic_port_ida, minor);
>                         spin_unlock_irqrestore(&eng->lock, flags);
>                         goto exit;
>                 }
> @@ -245,8 +252,6 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
>                         eng->enabled |= 0x1ULL << bus_num;
>                 }
>                 spin_unlock_irqrestore(&eng->lock, flags);
> -
> -               minor++;
>         }
>
>  exit:
> @@ -282,6 +287,7 @@ int iic_del_ports(iic_eng_t* eng, uint64_t ports)
>                         /* found a match, remove it */
>                         *p_abusp = abusp->next;
>                         eng->enabled &= ~(0x1ULL << abusp->port);
> +                       ida_simple_remove(&iic_port_ida, abusp->idx);
>                         iic_delete_bus(iic_fsi_class, abusp);
>                 }
>                 else
> @@ -326,6 +332,7 @@ int iic_fsi_probe(struct device *dev)
>         iic_init_eng(eng);
>         set_bit(IIC_ENG_BLOCK, &eng->flags); //block until resumed
>         eng->id = 0x00F5112C;
> +       eng->idx = ida_simple_get(&iic_ida, 1, INT_MAX, GFP_KERNEL);
>         IFLDi(1, "PROBE    eng[%08x]\n", eng->id);
>         eng->ra = &fsi_reg_access;
>         IFLDd(1, "vaddr=%#08lx\n", eng->base);
> @@ -367,6 +374,9 @@ error:
>                 iic_del_ports(eng, new_ports);
>                 if(eng)
>                 {
> +                       if (eng->idx > 0)
> +                               ida_simple_remove(&iic_ida, eng->idx);
> +
>                         kfree(eng);
>                 }
>         }
> @@ -409,6 +419,7 @@ int iic_fsi_remove(struct device* dev)
>         /* Clean up device files immediately, don't wait for ref count */
>         iic_del_ports(eng, IIC_FSI_PORTS);
>         /* cleans up engine and bus structures if ref count is zero */
> +       ida_simple_remove(&iic_ida, eng->idx);
>         kfree(eng);
>
>  error:
> diff --git a/drivers/fsi/i2c/iic-int.h b/drivers/fsi/i2c/iic-int.h
> index 65b336f..26ea7eb 100644
> --- a/drivers/fsi/i2c/iic-int.h
> +++ b/drivers/fsi/i2c/iic-int.h
> @@ -253,12 +253,14 @@ struct iic_eng
>      unsigned long trace_sz;            //number of trace entries
>      atomic_t xfr_num;                  //index to current trace entry
>      uint64_t enabled;
> +    int idx;                           // ida number
>  };
>
>  struct iic_bus
>  {
>      unsigned char port;                        //the port number of this bus
>      unsigned long bus_id;              //Unique ID for this bus
> +    int idx;                           // ida number
>      struct cdev cdev;
>      struct device* class_dev;
>      dev_t devnum;
> @@ -312,7 +314,7 @@ int iic_eng_ops_is_vaild(struct iic_eng_ops *ops);
>  iic_bus_t*  iic_create_bus(struct class* classp, iic_eng_t* eng,
>                                            dev_t devnum, char* name,
>                                            unsigned char port,
> -                                          unsigned long bus_id);
> +                                          int bus_id);
>  void iic_delete_bus(struct class* classp, iic_bus_t* bus);
>  void iic_register_bus(iic_bus_t * bus, unsigned long type);
>  void iic_unregister_bus(iic_bus_t * bus, unsigned long type);
> diff --git a/drivers/fsi/i2c/iic-mstr.c b/drivers/fsi/i2c/iic-mstr.c
> index a12cf7fc..f968c20 100644
> --- a/drivers/fsi/i2c/iic-mstr.c
> +++ b/drivers/fsi/i2c/iic-mstr.c
> @@ -2114,7 +2114,7 @@ void iic_ffdc_q_unlocked(int scope, void* data)
>  #define IIC_BUS_MAX_FFDC 4
>  iic_bus_t*  iic_create_bus(struct class* classp, iic_eng_t* eng,
>                            dev_t devnum, char* name, unsigned char port,
> -                          unsigned long bus_id)
> +                          int bus_id)
>  {
>         int rc = 0;
>         iic_bus_t* bus = 0;
> @@ -2133,6 +2133,7 @@ iic_bus_t*  iic_create_bus(struct class* classp, iic_eng_t* eng,
>         memset(bus, 0, sizeof(iic_bus_t));
>         bus->port = port;
>         bus->bus_id = bus_id;
> +       bus->idx = bus_id;
>         bus->eng = eng;
>         bus->devnum = devnum;
>         bus->i2c_hz = 400000;
> --
> 1.8.3.1
>
