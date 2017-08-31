Return-Path: <groeck7@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjTSy0hprzDq5b
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 14:11:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AamSQdUx"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id r62so2762604pfj.0
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 21:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iDzJYs80a1lTw+1+osTP5Rdh2cht5lAyZei4afmzi58=;
 b=AamSQdUxjsrGyj5rXTyo794NSqPqCUx4QxPc+8sMBxni4HnqFKpnAiPv+75i42h+wL
 LPbdwJQUhGfsd1asUQD+DvoaQ9JhZwpmCbZlAO++HcEeq6GFgmFKmX0AA7dUV/pgSfdJ
 h2DDRIZmFRNz/+OPzcZbKEe2uyRZPtjdxEmH/G4jU9gjeYPNyKID6xK8dlXSVVI+53+O
 6QLi4uudM3oETKG1pEEAC+3t41q+EE7ZkeruHFrateySoMtV07tSfo3LU1wSOcaTxc+K
 qeFZ/0ZQJopepQxmtGeDnRQJuryVmiXZqOXHhX2SIWz3n4W979lVoGylresBUfMyR0Ps
 kjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=iDzJYs80a1lTw+1+osTP5Rdh2cht5lAyZei4afmzi58=;
 b=Cctykp+Rf1868ek835L3yrDheCcZCpZLmRM2s27ahuF4kyy2PZT6rVHNgjAWm1m0NY
 zCu7FcaPjJ8mhy1l6iRSaUYmH7+mHFcVEEODRGcKryDgmnk7dip+b/z9XJWfxqun5R+M
 p1HkpLakztpIrcnY2CH86pItS3+8FcwRqheAT3+gpqXzUTVKyFU4H00SuGHFerDF+IMI
 3JtuZBX5G5judarjUxoN7RA0KyH+sGM7OMXoK+m2RRQkfl6E32epU/nzNghhPxsGazyu
 XV/psYqbmpygIhnx0GlaBI1Pg44beDbIBceoBuCMPMOpTzfXmyEJlQFYayTd1e71oVSA
 z+ag==
X-Gm-Message-State: AHYfb5i7vITBXkeaGJ0HZkvTvYh5jLK/GN6Ry8L6PA//JrhlJCujkH+I
 1b2xoZV97NX6EA==
X-Received: by 10.98.58.220 with SMTP id v89mr918007pfj.19.1504152672399;
 Wed, 30 Aug 2017 21:11:12 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id u187sm10938117pfu.140.2017.08.30.21.11.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Aug 2017 21:11:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 30 Aug 2017 21:11:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/2] hwmon: (ucd9000) Add sysfs attribute to clear logged
 faults
Message-ID: <20170831041111.GC26660@roeck-us.net>
References: <20170830185536.71307-1-cbostic@linux.vnet.ibm.com>
 <20170830185536.71307-3-cbostic@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170830185536.71307-3-cbostic@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 31 Aug 2017 04:11:14 -0000

On Wed, Aug 30, 2017 at 01:55:36PM -0500, Christopher Bostic wrote:
> Add ability to clear logged faults via sysfs.
> 
I am not in favor of such chip specific commands, in this case for several
reasons (besides it being a non-standard attribute).

The logged faults are not read or used by the driver in the first place.
Clearing them doesn't add any benefit for the driver.

The command as written only clears non-paged logged faults, but no paged
faults.

While PMBus "lingo" talks of faults, those are really often just status bits,
not "faults" from hwmon perspective.

The content of the various fault bits and bites is highly chip specific.
On top of that, each chip supported by the driver has different fault bits
and bytes.

To read the logged faults you have to access the chip directly, not through
the driver. I don't see the benefit of providing a sysfs attribute to clear
non-paged logged faults, but not doing anything else with it.

If you want to do something special with those faults (or status bits/nytes),
it might be more appropriate to create debugfs entries.

Thanks,
Guenter

> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  drivers/hwmon/pmbus/ucd9000.c | 45 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
> index b74dbec..8bd8cb1 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -27,6 +27,8 @@
>  #include <linux/slab.h>
>  #include <linux/i2c.h>
>  #include <linux/pmbus.h>
> +#include <linux/sysfs.h>
> +#include <linux/hwmon-sysfs.h>
>  #include "pmbus.h"
>  
>  enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
> @@ -35,6 +37,7 @@
>  #define UCD9000_NUM_PAGES		0xd6
>  #define UCD9000_FAN_CONFIG_INDEX	0xe7
>  #define UCD9000_FAN_CONFIG		0xe8
> +#define UCD9000_LOGGED_FAULTS		0xea
>  #define UCD9000_DEVICE_ID		0xfd
>  
>  #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
> @@ -109,6 +112,36 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
>  	return ret;
>  }
>  
> +static ssize_t ucd9000_clear_logged_faults(struct device *dev,
> +			struct device_attribute *attr, const char *buf,
> +			size_t count)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
> +
> +	/* No page set required */
> +	ret = i2c_smbus_write_byte_data(client, UCD9000_LOGGED_FAULTS, 0);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to clear logged faults: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR(clear_logged_faults, 0200, NULL,
> +			ucd9000_clear_logged_faults);
> +
> +static struct attribute *ucd9000_attributes[] = {
> +	&dev_attr_clear_logged_faults.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group ucd9000_attr_group = {
> +	.attrs = ucd9000_attributes,
> +};
> +
>  static const struct i2c_device_id ucd9000_id[] = {
>  	{"ucd9000", ucd9000},
>  	{"ucd90120", ucd90120},
> @@ -263,9 +296,19 @@ static int ucd9000_probe(struct i2c_client *client,
>  		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
>  	}
>  
> +	ret = sysfs_create_group(&client->dev.kobj, &ucd9000_attr_group);
> +	if (ret < 0)
> +		return ret;
> +
>  	return pmbus_do_probe(client, mid, info);
>  }
>  
> +static int ucd9000_remove(struct i2c_client *client)
> +{
> +	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group);
> +	return pmbus_do_remove(client);
> +}
> +
>  /* This is the driver that will be inserted */
>  static struct i2c_driver ucd9000_driver = {
>  	.driver = {
> @@ -273,7 +316,7 @@ static int ucd9000_probe(struct i2c_client *client,
>  		.of_match_table = of_match_ptr(ucd9000_of_match),
>  	},
>  	.probe = ucd9000_probe,
> -	.remove = pmbus_do_remove,
> +	.remove = ucd9000_remove,
>  	.id_table = ucd9000_id,
>  };
>  
> -- 
> 1.8.2.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
