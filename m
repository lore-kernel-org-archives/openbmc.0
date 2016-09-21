Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sfSVd25dKzDsgj
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 04:16:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=nsJJwM/m; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id a62so4440586oib.1
 for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2016 11:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=e4BoZKmPA66oyRqnqbr4ZKp7QC9ntWayVox65aAtMrU=;
 b=nsJJwM/mf+/o0mp8tl2rTeHhGARuKTYDGEAb/BapHMSJZ20OrrzH1x7QZ8FEG9T+Q0
 stWcBdpVWNPrH6aZw9oS3bVva8bImhA4k78O4U14FbZsBJTKs9H5FPfrE9C8QtRHnNjw
 +bEdeN4eyYA9VakSYMvKv0/UFSNarZen9NbtTuo2yzQrvQVR9hx6cws9DMJV5hnq91k7
 8r5wbP6aJFqjZ/AVyGKQTqoBTfQSREoEe65LYNSGG3hUnWz1T8z+SxfF+g8IzRi3HuPt
 tm132IiRnzg2geshZZ4eZFzH1CnZLYIsqyoTJs18F736gSAOraa98T+YXe4UmiBEyBKj
 so1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=e4BoZKmPA66oyRqnqbr4ZKp7QC9ntWayVox65aAtMrU=;
 b=mHNVXrpPh3jYJi8szQ8u/kKjUM/Ya/h+y1ae/E5HlgRSXeuQXt2W0sLjzG/PfkBYVT
 /3VcCj2InmASdWkMc8PQ732wW55s9p0HiOJ0YZHJl/vRsbTrMbu0uSFBNKrTvPpOFI5e
 jaKMHRXv2/R9wIzvEnhV9sK3ez9V7DPHJ82BiAQywyer9dLMzlR0jcoVz1hiqlrW5/l1
 DAJrS3xvfJMj6SL2vcb2E2ee5dF1GVZdYQRIqXaIE9jnipNjUiO4gabU1hJHScQ9nMQ1
 wAutdbwj0+UEvGtbUMYUvuciJ3nyaIS+Dbhw/CyVOmpr6sUNx0hKv5RPnicVgZ8fzpH9
 bjQw==
X-Gm-Message-State: AE9vXwNEz/W/3pCRUgnjLcvtspFDFHBmXoCsWQoPCsQJD8Nrxo7pdl30PCFWYYfTNpAeQLeitZoLcV9NeWCHHw==
X-Received: by 10.202.95.130 with SMTP id t124mr4531075oib.159.1474481766902; 
 Wed, 21 Sep 2016 11:16:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.218.85 with HTTP; Wed, 21 Sep 2016 11:16:06 -0700 (PDT)
In-Reply-To: <CACPK8XcKuNAdrCiDuXpj5QgM+_U_+7hGKZd0ueZEGPcuurL=1g@mail.gmail.com>
References: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1472068452-32048-6-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8XcKuNAdrCiDuXpj5QgM+_U_+7hGKZd0ueZEGPcuurL=1g@mail.gmail.com>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Wed, 21 Sep 2016 13:16:06 -0500
Message-ID: <CAA0LjjV=vmDZ_cYJKHL202Q=xeXu7tEW46HYxjqZBkihK+i6RQ@mail.gmail.com>
Subject: Re: [PATCH linux v5 5/7] drivers/fsi: Add FSI bus type and hook into
 LDM
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 21 Sep 2016 18:16:11 -0000

On Wed, Sep 7, 2016 at 7:08 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Thu, Aug 25, 2016 at 5:24 AM,  <christopher.lee.bostic@gmail.com> wrote:
>> From: Chris Bostic <cbostic@us.ibm.com>
>>
>> Add FSI bus type.  Add fsi device registration hooks into the LDM
>> Provide bus match/probe/remove/etc... callbacks for the LDM to invoke.
>>
>> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
>> ---
>>  drivers/fsi/fsi.h     |  42 ++++++++++++++++
>>  drivers/fsi/fsiinit.c |   6 +++
>>  drivers/fsi/ldm.c     | 136 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 184 insertions(+)
>>
>> diff --git a/drivers/fsi/fsi.h b/drivers/fsi/fsi.h
>> index b723208..67d4666 100644
>> --- a/drivers/fsi/fsi.h
>> +++ b/drivers/fsi/fsi.h
>> @@ -28,6 +28,20 @@ struct fsi_engine_id {
>>         u8 engine_vendor;
>>  };
>>
>> +/*
>> + * Bit fields to search for device/driver match. A driver may handle several
>> + * engines. If a driver handles all versions, just specify the type and
>> + * set match_flags to FSI_ENGINE_ID_MATCH_TYPE.
>> + * If a driver handles only certain versions, specify type and engine and
>> + * set match_flags to FSI_ENGINE_ID_MATCH_TYPE | FSI_ENGINE_ID_MATCH_VERSION.
>> + * Set the engine_vendor identifier and FSI_ENGINE_ID_MATCH_VENDOR if a
>> + * certain vendor has to be supported.
>> + */
>> +#define FSI_ENGINE_ID_MATCH_NONE       0       /* Last entry in chain */
>> +#define FSI_ENGINE_ID_MATCH_TYPE       1       /* Match the type */
>> +#define FSI_ENGINE_ID_MATCH_VERSION    2       /* Match the version */
>> +#define FSI_ENGINE_ID_MATCH_VENDOR     4       /* Match the vendor */
>> +
>>  /* Location information for a FSI device */
>>  struct fsimap {
>>         u8 link;                        /* Master link # */
>> @@ -40,6 +54,18 @@ struct fsimap {
>>         u16 kb_off;                     /* CFAM config table offset data */
>>  };
>>
>> +#define FSI_DEV_MEMRES         1       /* Physical address of device */
>> +#define FSI_DEV_IRQRES         2       /* IRQ resource */
>> +#define FSI_DEV_VARES          3       /* Virtual address of device */
>> +#define FSI_DEV_NONE           4       /* Empty indicator */
>> +#define FSI_DEV_PSEUDO         5       /* Pseudo engine */
>> +#define FSI_DEV_IRQ            6       /* Has an IRQ */
>> +#define FSI_DEV_ACTIVE         7       /* Is activated */
>> +#define FSI_DEV_RLS_SLV                8       /* Release slave */
>> +#define FSI_DEV_PROBE_OK       9       /* Probe succeeded */
>> +#define FSI_DEV_PROBE_ERR      10      /* Probe failed */
>> +
>> +
>>  struct fsidevice {
>>         struct fsi_engine_id id;        /* Engine type/version */
>>         u32 irq_start;                  /* IRQ Number */
>> @@ -47,6 +73,22 @@ struct fsidevice {
>>         struct fsidevice *parent;       /* Parent of this device */
>>         struct device dev;              /* LDM entry for bus */
>>         struct fsimap map;              /* Address & location info */
>> +       unsigned long state;            /* flags for state */
>>  };
>>
>> +#define to_fsidevice(x)        container_of((x), struct fsidevice, dev)
>> +
>> +/*
>> + * FSI driver type
>> + */
>> +struct fsidriver {
>> +       struct module *owner;           /* Module owner */
>> +       struct fsi_engine_id *idlist;   /* List of IDs, terminated by */
>> +                                       /*   FSI_ENGINE_ID_MATCH_NONE */
>> +       struct device_driver driver;    /* LDM hook */
>> +       int (*reset)(void *);           /* Client defined reset method */
>> +};
>> +
>> +#define to_fsidriver(x)        container_of((x), struct fsidriver, driver)
>> +
>>  #endif /* DRIVERS_FSI_H */
>> diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
>> index eaa3582..d83992e 100644
>> --- a/drivers/fsi/fsiinit.c
>> +++ b/drivers/fsi/fsiinit.c
>> @@ -53,6 +53,12 @@ static int fsi_start(void)
>>                 goto err;
>>         }
>>         fsimaster_start(&fsidd.pri_master);
>> +
>> +       if (fsibus_init()) {            /* Create the FSI bus */
>> +               rc = -ENFILE;
>> +               goto err;
>> +       }
>> +
>>         dev_dbg(&fsidd.dev, "FSI DD v%d installation ok\n", FSIDD_VERNO);
>>         return rc;
>>
>> diff --git a/drivers/fsi/ldm.c b/drivers/fsi/ldm.c
>> index 4a2f90b..9fe10b3 100644
>> --- a/drivers/fsi/ldm.c
>> +++ b/drivers/fsi/ldm.c
>> @@ -10,6 +10,7 @@
>>   * as published by the Free Software Foundation; either version
>>   * 2 of the License, or (at your option) any later version.
>>   */
>> +#include <linux/blkdev.h>
>>  #include "fsi.h"
>>  #include "fsi_private.h"
>>
>> @@ -27,3 +28,138 @@ int fsidev_register(struct fsidevice *fsidev, struct device_attribute **ap)
>>         return 0;
>>  }
>>  EXPORT_SYMBOL(fsidev_register);
>> +
>> +/*
>> + * FSI bus functions.
>> + */
>> +
>> +/*
>> + * Call a client's probe function if available
>> + */
>> +static int fsi_bus_probe(struct device *dev)
>> +{
>> +       struct fsidevice *fsidev = to_fsidevice(dev);
>> +       struct device_driver *drv = dev->driver;
>> +       struct fsidriver *fsidrv = to_fsidriver(dev->driver);
>> +       int rc = -ENOENT;
>> +
>> +       dev_dbg(dev, "probe >> fsidrv:%p probe:%p resume:%p\n",
>> +               fsidrv, drv->probe, drv->resume);
>> +
>> +       if (!drv->probe)
>> +               goto err;
>> +       rc = drv->probe(dev);
>> +       dev_dbg(dev, "drv->probe rc:%d\n", rc);
>> +       if (rc) {
>> +               /* Device unsupported or error in probe call back */
>> +               if (rc != -ENODEV && rc != -ENXIO && rc != -ENOLINK) {
>> +                       set_bit(FSI_DEV_PROBE_ERR, &fsidev->state);
>> +                       goto err;
>> +               }
>> +       }
>> +       set_bit(FSI_DEV_PROBE_OK, &fsidev->state);
>> +       rc = 1;
>> +
>> +       if (rc > 0 && drv->resume) {
>> +               rc = drv->resume(dev);
>> +               dev_dbg(dev, "probe resume rc:%d\n", rc);
>> +       }
>> +       rc = 0;
>> +err:
>> +       dev_dbg(dev, "probe << rc:%d\n", rc);
>> +       return rc;
>> +
>> +}
>> +
>> +static int fsi_bus_remove(struct device *dev)
>> +{
>> +       dev_dbg(dev, "remove:%p %s\n", dev, dev_name(dev));
>> +       return 0;
>> +}
>> +
>> +static void fsi_bus_shutdown(struct device *dev)
>> +{
>> +       dev_dbg(dev, "shutdown:%p %s\n", dev, dev_name(dev));
>> +}
>> +
>
> These are empty, delete them.

Deleting.

>
>> +/*
>> + * Check if a particular engine matches the driver's list of supported devices.
>> + */
>> +static int fsi_bus_match(struct device *dev, struct device_driver *drv)
>> +{
>> +       struct fsidevice *fsidev = to_fsidevice(dev);
>> +       struct fsidriver *fsidrv = to_fsidriver(drv);
>> +       int match_ok = 0;
>> +       struct fsi_engine_id *idlist = fsidrv->idlist;
>> +
>> +       for (; idlist->match_flags != FSI_ENGINE_ID_MATCH_NONE; ++idlist) {
>> +               match_ok = 0;
>> +
>> +               if ((idlist->match_flags & FSI_ENGINE_ID_MATCH_TYPE) != 0
>> +               && fsidev->id.engine_type == idlist->engine_type)
>> +                       match_ok = 1;
>> +
>> +               if (match_ok
>> +               && (idlist->match_flags & FSI_ENGINE_ID_MATCH_VERSION) != 0)
>> +                       match_ok =
>> +                       fsidev->id.engine_version == idlist->engine_version;
>> +
>> +               if (match_ok
>> +               && (idlist->match_flags & FSI_ENGINE_ID_MATCH_VENDOR) != 0)
>> +                       match_ok =
>> +                       fsidev->id.engine_vendor == idlist->engine_vendor;
>> +
>> +               if (match_ok)
>> +                       break;
>> +       }
>> +       dev_dbg(dev,
>> +               "match type:%02x version:%d vendor:%d match_ok:%d\n",
>> +               fsidev->id.engine_type, fsidev->id.engine_version,
>> +               fsidev->id.engine_vendor, match_ok);
>> +
>> +       return match_ok;
>> +}
>> +
>> +
>> +static int fsi_bus_uevent(struct device *dev, struct kobj_uevent_env *env)
>> +{
>> +
>> +       dev_dbg(dev, "%s device:%p\n", dev_name(dev), dev);
>> +       if (MAJOR(dev->devt)) {
>> +               if (add_uevent_var(env, "MAJOR=%u", MAJOR(dev->devt)))
>> +                       return -ENOMEM;
>> +               if (add_uevent_var(env, "MINOR=%u", MINOR(dev->devt)))
>> +                       return -ENOMEM;
>> +       }
>> +
>> +       /* Add bus name of physical device */
>> +       if (dev->bus) {
>> +               if (add_uevent_var(env, "PHYSDEVBUS=%s", dev->bus->name))
>> +                       return -ENOMEM;
>> +       }
>> +
>> +       /* Add driver name of physical device */
>> +       if (dev->driver) {
>> +               if (add_uevent_var(env, "PHYSDEVDRIVER=%s", dev->driver->name))
>> +                       return -ENOMEM;
>> +       }
>> +       return 0;
>> +};
>> +
>> +struct bus_type fsi_bus_type = {
>> +       .name = "fsi",
>> +       .match = fsi_bus_match,
>> +       .uevent = fsi_bus_uevent,
>> +       .probe = fsi_bus_probe,
>> +       .remove = fsi_bus_remove,
>> +       .shutdown = fsi_bus_shutdown,
>
> Only register the callbacks that are going to do something. You don't
> need to add ones that only print a message and return.

Removing  .remove and .shutdown.

>
>> +};
>> +EXPORT_SYMBOL(fsi_bus_type);
>> +
>> +/*
>> + * Create and install the FSI bus
>> + */
>> +int fsibus_init(void)
>> +{
>> +       return bus_register(&fsi_bus_type);
>> +}
>> --
>> 1.8.2.2
>>
