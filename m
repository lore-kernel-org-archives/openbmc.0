Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wXbj46K0gzDqcM
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 12:20:40 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.10] drivers/watchdog: Add user space access to
 aspeed ext signal and reset
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1495579753.7794.1.camel@aj.id.au>
Date: Tue, 23 May 2017 22:20:35 -0400
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DC205E45-AB4A-4939-88D6-244369E6F68E@fuzziesquirrel.com>
References: <20170523212845.89898-1-cbostic@linux.vnet.ibm.com>
 <1495579753.7794.1.camel@aj.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Wed, 24 May 2017 02:20:41 -0000


> On May 23, 2017, at 6:49 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> On Tue, 2017-05-23 at 16:28 -0500, Christopher Bostic wrote:
>> Add sysfs files for 'ext signal' mode and 'system reset' mode within
>> the aspeed watchdog device driver for wdt1 and wdt2
>=20
> This commit message explains what the patch does, not why we need it.
> The code change already describes what it does, so can you please
> instead outline in the commit message what the motivation is (or
> potential motivations are). Ultimately what I'm interested in is
> whether this should be a platform design decision (and so should be

Witherspoon has a physical connection between one of the watchdogs on =
the
SOC and the max31785 fan control chip.  We want the line to wiggle if
the watchdog is not pinged by userspace.

That said, the specific watchdog instance on the SOC that has the =
connection
can be configured to wiggle the pin, or not, and to reset the chip, or
not, independently.

So is that platform design or userspace policy?  I=E2=80=99m not sure...

> managed via devicetree), or userspace policy, which is what we have
> here.
>=20
> Separately, given it's fairly generic and assuming the motivation is
> reasonable, I'd suggest also sending it upstream.

Agreed on doing the review directly upstream.

>=20
> Andrew
>=20
>>=20
>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>>  .../ABI/testing/sysfs-platform-aspeed-wdt          | 40 ++++++++++
>>  drivers/watchdog/aspeed_wdt.c                      | 89 =
+++++++++++++++++++++-
>>  2 files changed, 128 insertions(+), 1 deletion(-)
>>  create mode 100644 =
Documentation/ABI/testing/sysfs-platform-aspeed-wdt
>>=20
>> diff --git a/Documentation/ABI/testing/sysfs-platform-aspeed-wdt =
b/Documentation/ABI/testing/sysfs-platform-aspeed-wdt
>> new file mode 100644
>> index 0000000..a582176
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-platform-aspeed-wdt
>> @@ -0,0 +1,40 @@
>> +What:           =
/sys/bus/platform/devices/1e785000.wdt/watchdog/watchdog0/
>>> +		reset_system
>> +Date:           May 2017
>> +KernelVersion:  4.12
>>> +Contact:        Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> +Description:
>> +                Value indicates if a watchdog time out results in a =
reset of
>>> +		system.  'off': no system reset on timeout.  'on' there =
will
>>> +		be a system reset on timeout.
>> +
>> +                Default: off
>> +
>> +                - Enable 'reset system' on watchdog timeout:
>> +                echo on > =
/sys/bus/platform/devices/1e785000.wdt/watchdog/
>>> +			watchdog0/reset_system;
>> +
>> +                - Disable 'reset system' on watchdog timeout:
>> +                echo off > =
/sys/bus/platform/devices/1e785000.wdt/watchdog/
>>> +			watchdog0/reset_system;
>> +
>> +What:           =
/sys/bus/platform/devices/1e785000.wdt/watchdog/watchdog0/
>>> +		ext_signal
>> +Date:           May 2017
>> +KernelVersion:  4.12
>>> +Contact:        Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> +Description:
>> +                Value indicates if a watchdog time out results in an =
active
>>> +		high pulse sent out an output pin.  'off': No output =
pulse
>>> +		generated on watchdog time out.  'on': output pulse
>>> +		generated on watchdog time out.
>> +
>> +                Default: off
>> +
>> +                - Enable 'external signal' on watchdog timeout:
>> +                echo on > =
/sys/bus/platform/devices/1e785000.wdt/watchdog/
>>> +			watchdog0/ext_signal;
>> +
>> +                - Disable 'external signal' on watchdog timeout:
>> +                echo off > =
/sys/bus/platform/devices/1e785000.wdt/watchdog/
>>> +			watchdog0/ext_signal;
>> diff --git a/drivers/watchdog/aspeed_wdt.c =
b/drivers/watchdog/aspeed_wdt.c
>> index f5ad802..277948b 100644
>> --- a/drivers/watchdog/aspeed_wdt.c
>> +++ b/drivers/watchdog/aspeed_wdt.c
>> @@ -145,6 +145,93 @@ static int aspeed_wdt_remove(struct =
platform_device *pdev)
>>>  	return 0;
>>  }
>> =20
>> +static ssize_t aspeed_wdt_reset_system_store(struct device *dev,
>>> +					     struct device_attribute =
*attr,
>>> +					     const char *buf, size_t =
count)
>> +{
>>> +	struct platform_device *pdev =3D to_platform_device(dev);
>>> +	struct aspeed_wdt *wdt =3D platform_get_drvdata(pdev);
>> +
>>> +	if (!strncmp(buf, "on", strlen("on"))) {
>>> +		wdt->ctrl |=3D WDT_CTRL_RESET_SYSTEM;
>>> +		writel(wdt->ctrl, wdt->base + WDT_CTRL);
>>> +	} else if (!strncmp(buf, "off", strlen("off"))) {
>>> +		wdt->ctrl &=3D ~WDT_CTRL_RESET_SYSTEM;
>>> +		writel(wdt->ctrl, wdt->base + WDT_CTRL);
>>> +	} else {
>>> +		dev_warn(dev, "Unknown reset system mode command: =
[%s]\n", buf);
>>> +		return -EINVAL;
>>> +	}
>> +
>>> +	return count;
>> +}
>> +
>> +static ssize_t aspeed_wdt_reset_system_show(struct device *dev,
>>> +					    struct device_attribute =
*attr,
>>> +					    char *buf)
>> +{
>>> +	struct platform_device *pdev =3D to_platform_device(dev);
>>> +	struct aspeed_wdt *wdt =3D platform_get_drvdata(pdev);
>>> +	int ret;
>> +
>>> +	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_RESET_SYSTEM)
>>> +		ret =3D sprintf(buf, "on\n");
>>> +	else
>>> +		ret =3D sprintf(buf, "off\n");
>> +
>>> +	return ret;
>> +}
>> +
>> +static DEVICE_ATTR(reset_system, 0644,
>>> +		   aspeed_wdt_reset_system_show, =
aspeed_wdt_reset_system_store);
>> +
>> +static ssize_t aspeed_wdt_ext_signal_store(struct device *dev,
>>> +					   struct device_attribute =
*attr,
>>> +					   const char *buf, size_t =
count)
>> +{
>>> +	struct platform_device *pdev =3D to_platform_device(dev);
>>> +	struct aspeed_wdt *wdt =3D platform_get_drvdata(pdev);
>> +
>>> +	if (!strncmp(buf, "on", strlen("on"))) {
>>> +		wdt->ctrl |=3D WDT_CTRL_WDT_EXT;
>>> +		writel(wdt->ctrl, wdt->base + WDT_CTRL);
>>> +	} else if (!strncmp(buf, "off", strlen("off"))) {
>>> +		wdt->ctrl &=3D ~WDT_CTRL_WDT_EXT;
>>> +		writel(wdt->ctrl, wdt->base + WDT_CTRL);
>>> +	} else {
>>> +		dev_warn(dev, "Unknown reset system mode command: %s\n", =
buf);
>>> +		return -EINVAL;
>>> +	}
>> +
>>> +	return count;
>> +}
>> +
>> +static ssize_t aspeed_wdt_ext_signal_show(struct device *dev,
>>> +					  struct device_attribute *attr,
>>> +					  char *buf)
>> +{
>>> +	struct platform_device *pdev =3D to_platform_device(dev);
>>> +	struct aspeed_wdt *wdt =3D platform_get_drvdata(pdev);
>>> +	int ret;
>> +
>>> +	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_WDT_EXT)
>>> +		ret =3D sprintf(buf, "on\n");
>>> +	else
>>> +		ret =3D sprintf(buf, "off\n");
>> +
>>> +	return ret;
>> +}
>> +
>> +static DEVICE_ATTR(ext_signal, 0644,
>> +		   aspeed_wdt_ext_signal_show, =
aspeed_wdt_ext_signal_store);
>=20
> The on/off implementations for show/store callbacks are very similar,
> only differentiated by the bit that we're flipping. We could almost =
cut
> the code in half by parameterising a function with the bit of interest
> and invoking it appropriately in the callback handlers. Thoughts?
>=20
> Andrew
>=20
>> +
>> +static struct attribute *aspeed_wdt_attrs[] =3D {
>>> +	&dev_attr_reset_system.attr,
>>> +	&dev_attr_ext_signal.attr,
>>> +	NULL
>> +};
>> +ATTRIBUTE_GROUPS(aspeed_wdt);
>> +
>>  static int aspeed_wdt_probe(struct platform_device *pdev)
>>  {
>>>  	struct aspeed_wdt *wdt;
>> @@ -169,7 +256,7 @@ static int aspeed_wdt_probe(struct =
platform_device *pdev)
>>>  	wdt->wdd.ops =3D &aspeed_wdt_ops;
>>>  	wdt->wdd.max_hw_heartbeat_ms =3D WDT_MAX_TIMEOUT_MS;
>>>  	wdt->wdd.parent =3D &pdev->dev;
>> -
>>> +	wdt->wdd.groups =3D aspeed_wdt_groups;
>>>  	wdt->wdd.timeout =3D WDT_DEFAULT_TIMEOUT;
>>>  	watchdog_init_timeout(&wdt->wdd, 0, &pdev->dev);
