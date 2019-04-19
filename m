Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="K7wolyKi"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AIyupWug"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lgSG5THFzDqSh
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 12:50:06 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C336421E90;
 Thu, 18 Apr 2019 22:50:03 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 22:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=ybeWm28HtjSdtE8EJm6g2tN22ljRgbb
 jYlXqqQnoPvc=; b=K7wolyKipnu52s0vA44JVJTMHsqTxW6sBFviNR4RnN29zP0
 5Bw1y/gL8W4KZvnSUX3vpVZZbJiEIJP28bJGAQzEnn8MfEz5L0o/heDj9XQMpmeq
 E1YL/x6c3i24LHMx+bk741N7FeLu4oJP7XMd0eDyjk+OdS9Xuhsz2NrUDIKqw7BW
 n2r+9z/jvB504Hx2YFwAbMF1bCAQZZBhLrV9vLA3n8qvqvNl1fAL5TohZsiwUhB0
 m6U7KUZuHXjGlHkSaGnsIXIMrOq1zJh/8tPm1klIqw/WRvZBVgBwCKvyQVMM5PCB
 7kWiXgjfpKeqaba7EfHy57P7cEzBheLdgWhIRxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ybeWm2
 8HtjSdtE8EJm6g2tN22ljRgbbjYlXqqQnoPvc=; b=AIyupWugoUwEPfgwV6zl4T
 y9+S1lNv/Njmg5SpxO9qdk+JW+JTDEHpcUpgP6oJJOfW5Qbch+cvD8EIh+40yVOG
 wn1lzRWJhMaB8S/Uvy7ISssBAD0IxNJQxQhBGemXgGegjmfnZ7uNL2SXmMHMuDY8
 nYUp25CLT1D0k2QFP3+4xQ0zaUiS+I5DsZAGzxhIhiKAXYKVoSARgsjwWzeioBfe
 SkED1rVh1FM7e6gWXWcF8lrRhckz8CQWN2V5thLLCvHvS4jZ9HOd5QZxVaI6ABa3
 tVYoZkzR2fyPpavYKu3z7/nEQNdOSR/qqhjtGhKp2LxeHhX1yes4PU1ctg0rcj9w
 ==
X-ME-Sender: <xms:Wje5XLTufMmlOIIJ_R5sLyTIbtAtR0WXNw89wu1dDQXeO9U3FFE4Xw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeigdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:Wze5XIn6Xdtyp0qmL8SgTT8D70hdzjTWgyd2fWme88-17OIxq1OgBQ>
 <xmx:Wze5XHTmzbWvue_Ex43lMff16KYpyj7UD4uwWVYUdGnuCwK7-nlnWA>
 <xmx:Wze5XHtc0gQEP8UENUy3tbaYH42sz80mHVinnGwUKy9fmMqriOjp2w>
 <xmx:Wze5XOXmpVToMf1xR637mb_HlfQoWgQPT4mXcuuvPaMRHolA7XX1gA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C8EA87C199; Thu, 18 Apr 2019 22:50:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <0b67f33a-2c14-4cc9-b549-faf97933944b@www.fastmail.com>
In-Reply-To: <20190418143604.27628-1-venture@google.com>
References: <20190418143604.27628-1-venture@google.com>
Date: Thu, 18 Apr 2019 22:50:02 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Venture" <venture@google.com>, "Joel Stanley" <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH dev-5.0 1/2] pmbus: support for custom sysfs attributes
Content-Type: text/plain
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Apr 2019 02:50:07 -0000



On Fri, 19 Apr 2019, at 00:06, Patrick Venture wrote:
> From: "krzysztof.adamski@nokia.com" <krzysztof.adamski@nokia.com>
> 
> This patch makes it possible to pass custom struct attribute_group array
> via the pmbus_driver_info struct so that those can be added to the
> attribute groups passed to hwmon_device_register_with_groups().
> 
> This makes it possible to register custom sysfs attributes by PMBUS
> drivers similar to how you can do this with most other busses/classes.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Applied to dev-5.0

Cheers,

Andrew

> ---
>  drivers/hwmon/pmbus/pmbus.h      |  3 +++
>  drivers/hwmon/pmbus/pmbus_core.c | 13 ++++++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 1d24397d36ec..fb267ec11623 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -417,6 +417,9 @@ struct pmbus_driver_info {
>  	/* Regulator functionality, if supported by this chip driver. */
>  	int num_regulators;
>  	const struct regulator_desc *reg_desc;
> +
> +	/* custom attributes */
> +	const struct attribute_group **groups;
>  };
>  
>  /* Regulator ops */
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 7200e80235db..6e3320bb1361 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -103,7 +103,7 @@ struct pmbus_data {
>  	int max_attributes;
>  	int num_attributes;
>  	struct attribute_group group;
> -	const struct attribute_group *groups[2];
> +	const struct attribute_group **groups;
>  	struct dentry *debugfs;		/* debugfs device directory */
>  
>  	struct pmbus_sensor *sensors;
> @@ -2313,6 +2313,7 @@ int pmbus_do_probe(struct i2c_client *client, 
> const struct i2c_device_id *id,
>  	struct device *dev = &client->dev;
>  	const struct pmbus_platform_data *pdata = dev_get_platdata(dev);
>  	struct pmbus_data *data;
> +	size_t groups_num = 0;
>  	int ret;
>  
>  	if (!info)
> @@ -2327,6 +2328,15 @@ int pmbus_do_probe(struct i2c_client *client, 
> const struct i2c_device_id *id,
>  	if (!data)
>  		return -ENOMEM;
>  
> +	if (info->groups)
> +		while (info->groups[groups_num])
> +			groups_num++;
> +
> +	data->groups = devm_kcalloc(dev, groups_num + 2, sizeof(void *),
> +				    GFP_KERNEL);
> +	if (!data->groups)
> +		return -ENOMEM;
> +
>  	i2c_set_clientdata(client, data);
>  	mutex_init(&data->update_lock);
>  	data->dev = dev;
> @@ -2354,6 +2364,7 @@ int pmbus_do_probe(struct i2c_client *client, 
> const struct i2c_device_id *id,
>  	}
>  
>  	data->groups[0] = &data->group;
> +	memcpy(data->groups + 1, info->groups, sizeof(void *) * groups_num);
>  	data->hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
>  							    data, data->groups);
>  	if (IS_ERR(data->hwmon_dev)) {
> -- 
> 2.21.0.593.g511ec345e18-goog
> 
>
