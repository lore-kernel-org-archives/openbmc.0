Return-Path: <eajames.ibm@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSzWC6rxfzDvnR
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 09:59:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HwnDPPG/"; 
 dkim-atps=neutral
Received: by mail-wm0-x244.google.com with SMTP id a20so26813425wme.2
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 14:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=WKcEnYStHuJtZFtLdJqZAXWuduOcxb3x0XQc8oN00l8=;
 b=HwnDPPG/kleG9TNFep2fkScNvbRrNS+btRRZVHkkF1qDrM9PJh7L1uZZ7aL3dPaDqA
 GbdvNgQUEcYXwkYmzkTl6lH3N6UyiPja/32iVa5GYR34RK9Ffp+iLmu/BDXXgSADuMVW
 5EfWbbxQMyExkjxxNEtMeUU0RjMX1df2CYt7dopKUEL8MPc7RiIAd/+RUhBKsrnnM+zg
 X6zJ9enB0vXuQWPPCdPxd4/7h0t7Rftiti4v3NRLm9mgi9qsI08pcuYklImup3uSzWgH
 CTXNMC8nh5mXRlh9l/TO25PxZFMwUt0LBNuUkgpG+GK6JjgV/kjf5iXGStIu4YPPJMcQ
 XFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=WKcEnYStHuJtZFtLdJqZAXWuduOcxb3x0XQc8oN00l8=;
 b=FaEoxfe7TcsIu4HejHq+O/6aMSMo8TEO0nH3HMOkM2WVZXk6cWD0w6D7uaeTmHXpmX
 JTiUd2r5rn/OEgTBXvSW7vNXXnDe/JncFGKAjiTF7E5KYDhCwNvbtZ9B2bdJLDeCojLK
 h8IsRWEs7lNFcya6OTXdwR5vMKXTvLvekTiA7aOtWHbEEpSLSsRHd6y6k5kv2R8WJlqy
 KQNaw4vjzvWa9Ikel379vlS8bEPBD1xxHWUJY9NGzjP/mryOb4x71xWkKf61hy+C+0sj
 DGV9YNpbOFoGHJKKPFsP7PinLaW1NtsGx0me6KKdZuF7YTDaFXGXxqiRHQbHRhq7PrvF
 a/9Q==
X-Gm-Message-State: AKaTC003awhbqW2Nq+ULPwtG7IW3y0FoahQY9kapyoQ+XOTobp9YgalVSNqvX0ZuH0beciGOm5LT6+BD7F6fAg==
X-Received: by 10.28.31.65 with SMTP id f62mr27518606wmf.108.1480460339808;
 Tue, 29 Nov 2016 14:58:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.37.229 with HTTP; Tue, 29 Nov 2016 14:58:59 -0800 (PST)
In-Reply-To: <cover.1478835488.git.andrew@aj.id.au>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
From: Eddie James <eajames.ibm@gmail.com>
Date: Tue, 29 Nov 2016 16:58:59 -0600
Message-ID: <CALpMbd=ORWLG-D69YBr-xZ_E1zm=JtWKjeWWuMjw+sLFX1NbQQ@mail.gmail.com>
Subject: Re: [RFC PATCH linux 0/9] On-Chip Controller (OCC) hwmon driver
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
X-List-Received-Date: Tue, 29 Nov 2016 22:59:05 -0000

Hi Andrew,

Thanks a lot for putting together this new patchset! On the whole, it
looks very good! The split between sysfs, occ, and hardware transport
layers is solid. I'm pretty satisfied with your modified structuring,
although I had a couple of comments and questions. I'll send those out
in the applicable patches.

I also tested this on palmetto and barreleye systems and fixed a
couple of bugs. I went ahead and put them in a new patchset, which I'm
about to send out. For reference, here's my only diffs though:

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/occ.c       |  2 ++
 drivers/hwmon/occ/occ_sysfs.c | 15 +++++++--------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
index 18936c8..d2fd81e 100644
--- a/drivers/hwmon/occ/occ.c
+++ b/drivers/hwmon/occ/occ.c
@@ -469,6 +470,7 @@ struct occ *occ_start(struct device *dev, void
*bus, struct occ_bus_ops bus_ops,
  if (!driver)
  return ERR_PTR(-ENOMEM);

+ driver->dev = dev;
  driver->bus = bus;
  driver->bus_ops = bus_ops;
  driver->ops = ops;
diff --git a/drivers/hwmon/occ/occ_sysfs.c b/drivers/hwmon/occ/occ_sysfs.c
index ef45bd0..aab4fbe 100644
--- a/drivers/hwmon/occ/occ_sysfs.c
+++ b/drivers/hwmon/occ/occ_sysfs.c
@@ -63,9 +63,9 @@ static ssize_t show_input(struct device *dev,
        struct sensor_attr_data *sdata = container_of(attr,
                                                      struct sensor_attr_data,
                                                      dev_attr);
-       struct occ *driver = dev_get_drvdata(dev);
+       struct occ_sysfs *driver = dev_get_drvdata(dev);

-       val = occ_get_sensor_value(driver, sdata->type, sdata->hwmon_index - 1);
+       val = occ_get_sensor_value(driver->occ, sdata->type,
sdata->hwmon_index - 1);
        if (sdata->type == TEMP)
                val *= 1000;    /* in millidegree Celsius */

@@ -79,9 +79,9 @@ static ssize_t show_label(struct device *dev,
        struct sensor_attr_data *sdata = container_of(attr,
                                                      struct sensor_attr_data,
                                                      dev_attr);
-       struct occ *driver = dev_get_drvdata(dev);
+       struct occ_sysfs *driver = dev_get_drvdata(dev);

-       val = occ_get_sensor_id(driver, sdata->type,
+       val = occ_get_sensor_id(driver->occ, sdata->type,
                                        sdata->hwmon_index - 1);

        return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
@@ -95,15 +95,15 @@ static ssize_t show_caps(struct device *dev,
        struct sensor_attr_data *sdata = container_of(attr,
                                                      struct sensor_attr_data,
                                                      dev_attr);
-       struct occ *driver = dev_get_drvdata(dev);
+       struct occ_sysfs *driver = dev_get_drvdata(dev);

-       sensor = occ_get_sensor(driver, CAPS);
+       sensor = occ_get_sensor(driver->occ, CAPS);
        if (!sensor) {
                val = -1;
                return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
        }

-       val = occ_get_caps_value(driver, sensor, sdata->hwmon_index - 1,
+       val = occ_get_caps_value(driver->occ, sensor, sdata->hwmon_index - 1,
                                         sdata->attr_id);

        return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
@@ -467,7 +467,6 @@ struct occ_sysfs *occ_sysfs_start(struct device
*dev, struct occ *occ,
        if (!hwmon)
                return ERR_PTR(-ENOMEM);

-       hwmon->dev = dev;
        hwmon->occ = occ;
        hwmon->num_caps_fields = config->num_caps_fields;
        hwmon->caps_names = config->caps_names;
-- 
1.9.1

On Thu, Nov 10, 2016 at 10:12 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Eddie,
>
>> This patchset provides a new OCC hwmon driver. There are a number
>> of issues with the existing driver. Firstly, i2c access was embedded
>> throughout the driver. Secondly, there is no way to easily differentiate
>> versions of the OCC.
>>
>> This patchset addresses the first issue by abstracting the bus transfer
>> protocol into a modular structure. In this way, any low level transfer
>> method may be easily implemented.
>>
>> The second issue is addressed by separating the "version specific" code
>> for the OCC and the common hwmon code. This task is not yet complete, but
>> the general structure is in place. Ultimately, different OCC versions
>> could be probed up using the device tree.
>
> I agree with all of this. However, I thought some of the layering could still
> be improved, so rather than provide a review through prose I figured it might
> be better for both of us if I mangled the patches directly.
>
> I've attacked two things. The first is I found the series hard to review due to
> the way the patches were split, as the patches went from trivial to huge (and
> complex) in a fairly short step:
>
>>
>> Edward A. James (5):
>>   Revert "hwmon: Add Power8 OCC hwmon driver"
>>   drivers: Add hwmon occ driver framework
>>   drivers: hwmon OCC scom bus operations
>>   drivers: Add hwmon OCC version specific functions
>>   drivers: OCC hwmon driver and sysfs
>
> So I have reworked them into what is now 8 patches (see below) and tried to
> tell a bit more of a story with them (hopefully I succeeded!) Second, I tried
> my hand at reworking the layering as mentioned above, such that hardware
> interaction is split from sysfs, and that the SCOM transport and sensor
> configuration is decoupled from the data parsing. You largely had all of these
> in-place already, I just cut and pasted code around a bit.
>
> Please review the patches and provide feedback! I'd like to hear arguments for
> or against both of our approaches. Note though that I've only tested that these
> patches compile, I absolutely have not done any further testing.
>
> Joel: Any chance you could chime in with an architectural review?
>
> When the dust has settled on the bigger issues we can start to look at the
> finer details of the APIs (there are some bugs, oddities and complexities that
> I would like to address before they are applied to openbmc/linux).
>
> Cheers,
>
> Andrew
>
> Andrew Jeffery (8):
>   hwmon: Add core On-Chip Controller support for POWER CPUs
>   hwmon: occ: Add sysfs interface
>   hwmon: occ: Add I2C SCOM transport implementation
>   hwmon: occ: Add callbacks for parsing P8 OCC datastructures
>   hwmon: occ: Add hwmon implementation for the P8 OCC
>   arm: aspeed: dt: Fix OCC compatible strings
>   hwmon: occ: Add callbacks for parsing P9 OCC datastructures
>   wip: hwmon: occ: Add sketch of the hwmon implementation for the P9 OCC
>
> Edward A. James (1):
>   Revert "hwmon: Add Power8 OCC hwmon driver"
>
>  .../devicetree/bindings/i2c/i2c-ibm-occ.txt        |   13 -
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts     |    4 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts     |    4 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts      |    4 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |    2 +-
>  drivers/hwmon/Kconfig                              |   13 +-
>  drivers/hwmon/Makefile                             |    2 +-
>  drivers/hwmon/occ/Kconfig                          |   38 +
>  drivers/hwmon/occ/Makefile                         |    3 +
>  drivers/hwmon/occ/occ.c                            |  494 ++++++++
>  drivers/hwmon/occ/occ.h                            |   79 ++
>  drivers/hwmon/occ/occ_p8.c                         |  219 ++++
>  drivers/hwmon/occ/occ_p8.h                         |   30 +
>  drivers/hwmon/occ/occ_p8_i2c.c                     |  133 +++
>  drivers/hwmon/occ/occ_p9.c                         |  261 ++++
>  drivers/hwmon/occ/occ_p9.h                         |   30 +
>  drivers/hwmon/occ/occ_p9_fsi.c                     |   93 ++
>  drivers/hwmon/occ/occ_scom_i2c.c                   |   68 ++
>  drivers/hwmon/occ/occ_scom_i2c.h                   |   20 +
>  drivers/hwmon/occ/occ_sysfs.c                      |  498 ++++++++
>  drivers/hwmon/occ/occ_sysfs.h                      |   51 +
>  drivers/hwmon/occ/scom.h                           |   50 +
>  drivers/hwmon/power8_occ_i2c.c                     | 1254 --------------------
>  23 files changed, 2076 insertions(+), 1287 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ibm-occ.txt
>  create mode 100644 drivers/hwmon/occ/Kconfig
>  create mode 100644 drivers/hwmon/occ/Makefile
>  create mode 100644 drivers/hwmon/occ/occ.c
>  create mode 100644 drivers/hwmon/occ/occ.h
>  create mode 100644 drivers/hwmon/occ/occ_p8.c
>  create mode 100644 drivers/hwmon/occ/occ_p8.h
>  create mode 100644 drivers/hwmon/occ/occ_p8_i2c.c
>  create mode 100644 drivers/hwmon/occ/occ_p9.c
>  create mode 100644 drivers/hwmon/occ/occ_p9.h
>  create mode 100644 drivers/hwmon/occ/occ_p9_fsi.c
>  create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
>  create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h
>  create mode 100644 drivers/hwmon/occ/occ_sysfs.c
>  create mode 100644 drivers/hwmon/occ/occ_sysfs.h
>  create mode 100644 drivers/hwmon/occ/scom.h
>  delete mode 100644 drivers/hwmon/power8_occ_i2c.c
>
> --
> 2.9.3
>
