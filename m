Return-Path: <openbmc+bounces-2383-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAF6C56208
	for <openbmc@archiver.kernel.org>; Thu,  6 Aug 2026 21:10:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hGKgP3MQtz3brM;
	Fri, 07 Aug 2026 07:10:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1786023096;
	cv=none; b=WnpoptMQoCWcIoPYmxNGhHx9ld1FuWPAV/rAp8qbQuh23hv5iCr3ZkA1gmGCAD25j6T5Bh4ChkUnwItWjmz9VstJpbTovgxq8oDGUJps8LF0lyhcEDekOplzmy066x76/M3aNI/+U9lNpFqyzf6ot/53M7oqKHT4AIJYPjDpxOYRmoFQLRmXJKta8bAPaqinNOcIpk7LBStTLPGKamF+Dr+67qvWzzblFbSmSFldg+MmXy8Txh36ivU4ceDcrtzkMPUjl+mK6CK2x4RLNbvu+1mBqXMS10Q6DlL3y6RDoP4PxNHzDch9VlXWxuqRwueAqwFYUiEV8bJIzhHbLSTWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1786023096; c=relaxed/relaxed;
	bh=+266hrS7mEktQxRGxY5IZKFbj9rEORb0vFzpxiZg8KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bB/F4F2sm6568DRyotpgpkDtg0Sby3rKmWoWeWge13BJZyKJw9dQjiB3NE+FY7tUwNh6eklT+IcqOhgJycA6TW1sZEsYVPyYnr3j5/gMHEoj8LPRGFS9wkmdOtF1hVNSTpJCEO2Jso6TuUT0vq7uf5mcQ52ppGGDnrvxN2WfoSwMEAbtQWC2prZWh1o80FD2MF4HddekAwBlN9z+bydZJUJC0hR4V7Y67RyVBpMSNZyBbDF53aoilad2n9RmKjpzT/rw9snb8x/co/81WT+VrjyeJMPapWZBF/oVLC7uc02HoH6L0zXlT/zaMmZRlIttepVq8YQiv27ud1mpstwPtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I0ZTclcE; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I0ZTclcE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hG7Tv1Khlz3080
	for <openbmc@lists.ozlabs.org>; Thu, 06 Aug 2026 23:31:29 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-496b7622a83so18657625e9.2
        for <openbmc@lists.ozlabs.org>; Thu, 06 Aug 2026 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786023086; x=1786627886; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+266hrS7mEktQxRGxY5IZKFbj9rEORb0vFzpxiZg8KU=;
        b=I0ZTclcE4hmzoYgtQjZTM8WEB9HMLRRJnCjkFvm9shjwMj0rep73PRrP3SadnWHHvj
         B3rUr/ij9+RmIxeDPXZoARX7u1s9XQlqGBxWgLThOUe7BMO+KI552iRAPqGLq3UG/qCg
         7N3QDU43FBRV6ip+J7Wm8LqhA6wgrSSf69hJD3wplEulp+nBvtv0OY6ThQQ8PrwgEa+v
         mm6fhhD3Msw6tBaCAdVCyD3CQL7vUlUIcPmrdN6ZMEFAB8HSI8cbTHNy1+gDoQ91t9+Z
         nlHu9fkz8Zg47lxPr0Xjs9uaeAh59F9KwcfYdhhhASgtabkhkInNg2Uq/n9O2+eQovZn
         jlew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786023086; x=1786627886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+266hrS7mEktQxRGxY5IZKFbj9rEORb0vFzpxiZg8KU=;
        b=nswvsP2GWgl32YZNHUGdz+LuwX1RZdGKx+j8t6wFku0cGhiet90cUXSpjZrKbrrSX1
         YU1VNKTjste92HKiSIwZEgp7YH1dJ383Ardp1WpmkxW7vPRHOuWP4Tti+4d4rgWlUwsL
         WIRkdc7+fht0290580kaWOXifFX0cXXTKGxYVEs9a3mjCS+Arc/HCMJLmGLtvqvdLtmH
         v5eGmK5tt8RB8096p5vSKe3aW8M8hxICh98CUTr60P3rEmLiv7OZlkupBEnfV8MTsaxF
         Hpr2MvlBA5yKQmu1Mb1Xrw7NLrt+KRciTKotr2Qp0ZOmWwFSRGcyyaXvaYMee7Vg0bwe
         bVHw==
X-Forwarded-Encrypted: i=1; AHgh+RqPktohg3alC3ifFQKAzchFhJ14Upn8jH15PaZt+y76TccthYBRYx8f4f+X+W3svnrxqVV2m08m@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzYCOxqm5LYdjIezwO/8qErQxEQlVedzSfOrK7qEQ2JK2nxObnd
	ffBxiamgenMcUbct1fPMvoweDzNDdGC0lrlJB0AThnLpFN2nRfcgygU4jW7q+KCBpkQ=
X-Gm-Gg: AR+sD12+FqfQSuRXBBDpZwy8wfQn4qkSaMlwibzJyS54mo55rHKajjpsQI83FAfdRxp
	Kt3pJYnkSlQcLJKLaje9ZX7E74d37iCXcz+H4HiKBv2usDJdEen4iUOt0pAsgFt+cwCpXP9T0tS
	EOOIzIy8g3MhFjKE0T4iWPMc8F3TSy5ccWsDXkSiTQtKSuHk8jtT8tgRj7TakUfFUdVH5Q1fLZY
	zGuHGRcDF6G1WuMpne+70KzXjPRknLSMSLlO5MO9aVe57jvC9DiQj2bvfrQC1KWvp7hhNQVHTlZ
	94GErZaUmUDqXIJ5g1/0ghQPaz/03aX26onqU4nYjTaSjQrRkzojpJNeT65sNqnt/d+LXWxa/Q7
	je2eo8eNaewHG24NjnzJN1ciyDsn/AyKXgXJiUZtXBukXrpQKJV4u4tuu8R8w2555XlrmEA4SXs
	SFwOfdkWPYGZbDd9NQtpe/EWK0jsEVww/+Xfy9GnFfP5Fd6I00h9eVsdEUcMjYobD0DayGhGJdH
	R/3Hn2FkECG2KR+fw9wQiADfkV5Yd1vFtuaoGUqz8dCS19NDRQZBgATy4ik4Is=
X-Received: by 2002:a05:600c:4691:b0:495:7426:c392 with SMTP id 5b1f17b1804b1-4994e72823emr175267365e9.1.1786023085603;
        Thu, 06 Aug 2026 06:31:25 -0700 (PDT)
Received: from localhost (p200300f65f0171047a0a39ae84ac36f8.dip0.t-ipconnect.de. [2003:f6:5f01:7104:7a0a:39ae:84ac:36f8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49952da50bfsm29818385e9.1.2026.08.06.06.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:31:23 -0700 (PDT)
Date: Thu, 6 Aug 2026 15:31:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Krishnamoorthi M <krishnamoorthi.m@amd.com>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, 
	broonie@kernel.org, linux-spi@vger.kernel.org, akshata.mukundshetty@amd.com, 
	bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	corbet@lwn.net, linux-doc@vger.kernel.org, skhan@linuxfoundation.org, 
	andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: [RFC PATCH 1/4] espi: add core bus framework
Message-ID: <anSGjRK8spayFnKw@monoceros>
References: <20260804115259.4065638-1-krishnamoorthi.m@amd.com>
 <20260804115259.4065638-2-krishnamoorthi.m@amd.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4cyzarwpv5f6fyd6"
Content-Disposition: inline
In-Reply-To: <20260804115259.4065638-2-krishnamoorthi.m@amd.com>


--4cyzarwpv5f6fyd6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC PATCH 1/4] espi: add core bus framework
MIME-Version: 1.0

Hello,

On Tue, Aug 04, 2026 at 05:22:56PM +0530, Krishnamoorthi M wrote:
> diff --git a/drivers/espi/Kconfig b/drivers/espi/Kconfig
> new file mode 100644
> index 000000000000..4411d8336e82
> --- /dev/null
> +++ b/drivers/espi/Kconfig
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# eSPI (Enhanced Serial Peripheral Interface) bus configuration
> +#
> +
> +menuconfig ESPI
> +	bool "eSPI (Enhanced Serial Peripheral Interface) bus support"

Can this be tristate instead?

> +	help
> +	  Enhanced Serial Peripheral Interface (eSPI) bus framework.
> +
> [...]
> +const struct bus_type espi_bus_type = {
> +	.name	= "espi",
> +	.match	= espi_bus_match,
> +	.uevent	= espi_bus_uevent,
> +	.probe	= espi_bus_probe,
> +	.remove	= espi_bus_remove,
> +};
> +EXPORT_SYMBOL_GPL(espi_bus_type);

Do you really need this exported?

> +static ssize_t supported_channels_show(struct device *dev,
> +				       struct device_attribute *attr, char *buf)
> +{
> +	struct espi_controller *ctrl = to_espi_controller(dev);
> +
> +	return sysfs_emit(buf, "0x%02x\n", ctrl->caps.supported_channels);
> +}
> +static DEVICE_ATTR_RO(supported_channels);
> +
> +static ssize_t max_freq_mhz_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct espi_controller *ctrl = to_espi_controller(dev);
> +
> +	return sysfs_emit(buf, "%u\n", ctrl->caps.max_freq_mhz);

Is the unit here mHz or MHz? Maybe pick a better name that answers this
question.

> +}
> +static DEVICE_ATTR_RO(max_freq_mhz);
> +
> +static ssize_t io_mode_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	struct espi_controller *ctrl = to_espi_controller(dev);
> +	static const char * const modes[] = { "single", "dual", "quad" };
> +	u8 m = ctrl->caps.io_mode;
> +
> +	if (WARN_ON_ONCE(m > ESPI_IO_MODE_QUAD))
> +		return sysfs_emit(buf, "unknown\n");
> +	return sysfs_emit(buf, "%s\n", modes[m]);
> +}
> +static DEVICE_ATTR_RO(io_mode);
> +
> +static ssize_t channel_enabled_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	struct espi_controller *ctrl = to_espi_controller(dev);
> +
> +	return sysfs_emit(buf, "0x%02x\n", READ_ONCE(ctrl->channel_enabled));
> +}
> +static DEVICE_ATTR_RO(channel_enabled);
> +
> +static struct attribute *espi_controller_attrs[] = {
> +	&dev_attr_supported_channels.attr,
> +	&dev_attr_max_freq_mhz.attr,
> +	&dev_attr_io_mode.attr,
> +	&dev_attr_channel_enabled.attr,
> +	NULL,

No , after the list terminator please.

> +};
> +ATTRIBUTE_GROUPS(espi_controller);
> +
> +static void espi_controller_release(struct device *dev)
> +{
> +	struct espi_controller *ctrl = to_espi_controller(dev);
> +
> +	mutex_destroy(&ctrl->lock);
> +	mutex_destroy(&ctrl->device_list_lock);
> +	kfree(ctrl);
> +}
> +
> +static const struct device_type espi_controller_type = {
> +	.groups	 = espi_controller_groups,
> +	.release = espi_controller_release,
> +};
> +
> +struct espi_controller *espi_controller_alloc(struct device *parent,
> +					      unsigned int size)
> +{
> +	struct espi_controller *ctrl;
> +
> +	if (!parent)
> +		return ERR_PTR(-EINVAL);
> +
> +	ctrl = kzalloc(sizeof(*ctrl) + size, GFP_KERNEL);

You might want to align sizeof(*ctrl) to something like
ARCH_DMA_MINALIGN, to ensure that devdata below is aligned
appropriately. Also use size_add() instead of direct arithmetic with
sizes.

> +	if (!ctrl)
> +		return ERR_PTR(-ENOMEM);
> +
> +	device_initialize(&ctrl->dev);
> +	ctrl->dev.parent = parent;
> +	ctrl->dev.type = &espi_controller_type;
> +
> +	mutex_init(&ctrl->lock);
> +	INIT_LIST_HEAD(&ctrl->device_list);
> +	mutex_init(&ctrl->device_list_lock);
> +	BLOCKING_INIT_NOTIFIER_HEAD(&ctrl->notifier_list);
> +
> +	if (size)
> +		espi_controller_set_devdata(ctrl, (void *)ctrl + sizeof(*ctrl));
> +
> +	return ctrl;
> +}
> +EXPORT_SYMBOL_GPL(espi_controller_alloc);
> +
> +int espi_controller_register(struct espi_controller *ctrl)
> +{
> +	int ret;
> +	u32 id;
> +
> +	if (!ctrl || !ctrl->ops)
> +		return -EINVAL;
> +
> +	ret = xa_alloc(&espi_controllers, &id, ctrl, xa_limit_31b,
> +		       GFP_KERNEL);
> +	if (ret)
> +		return ret;
> +
> +	ctrl->bus_num = id;
> +	ret = dev_set_name(&ctrl->dev, "espi%d", ctrl->bus_num);
> +	if (ret)
> +		goto err_erase;
> +
> +	if (ctrl->ops->setup) {
> +		ret = ctrl->ops->setup(ctrl);
> +		if (ret) {
> +			dev_err(&ctrl->dev, "controller setup failed: %d\n", ret);
> +			goto err_erase;
> +		}
> +	}

is ops->setup supposed to be only called in espi_controller_register()?
If yes, why does it exist? The driver specific stuff in it can just be
done before espi_controller_register() is called, can it not?

> +	ret = device_add(&ctrl->dev);
> +	if (ret) {
> +		dev_err(&ctrl->dev, "device_add failed: %d\n", ret);

Better use %pe for error codes.

> +		if (ctrl->ops->cleanup)
> +			ctrl->ops->cleanup(ctrl);
> +		goto err_erase;
> +	}
> +
> +	dev_info(&ctrl->dev, "registered: channels=0x%02x freq=%uMHz\n",
> +		 ctrl->caps.supported_channels, ctrl->caps.max_freq_mhz);

Please degrade that to dev_dbg. We're already have too many messages
during boot that are not really usefull once driver/subsystem debugging
is done.

Also I'd add a space between "%u" and "MHz".

> +	return 0;
> +
> +err_erase:
> +	xa_erase(&espi_controllers, ctrl->bus_num);
> +	ctrl->bus_num = -1;
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(espi_controller_register);
> +
> +void espi_controller_unregister(struct espi_controller *ctrl)
> +{
> +	if (!ctrl)
> +		return;
> +	/*
> +	 * Remove from the lookup table before dropping the device reference,
> +	 * so a concurrent espi_controller_get_by_bus_num() can never take a
> +	 * reference on a controller that is going away.
> +	 */
> +	xa_erase(&espi_controllers, ctrl->bus_num);
> +	if (ctrl->ops && ctrl->ops->cleanup)
> +		ctrl->ops->cleanup(ctrl);
> +	device_unregister(&ctrl->dev);
> +}
> +EXPORT_SYMBOL_GPL(espi_controller_unregister);
> +
> +void espi_controller_put(struct espi_controller *ctrl)
> +{
> +	if (ctrl)
> +		put_device(&ctrl->dev);
> +}
> +EXPORT_SYMBOL_GPL(espi_controller_put);
> +
> +struct espi_controller *espi_controller_get_by_bus_num(int bus_num)
> +{
> +	struct espi_controller *ctrl;
> +
> +	guard(spinlock)(&espi_controllers.xa_lock);
> +	ctrl = xa_load(&espi_controllers, bus_num);
> +	if (ctrl)
> +		get_device(&ctrl->dev);
> +	return ctrl;
> +}
> +EXPORT_SYMBOL_GPL(espi_controller_get_by_bus_num);
> +
> +int espi_get_capabilities(struct espi_controller *ctrl,
> +			  struct espi_capabilities *caps)
> +{
> +	if (!ctrl || !caps)
> +		return -EINVAL;
> +	guard(mutex)(&ctrl->lock);
> +	*caps = ctrl->caps;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(espi_get_capabilities);
> +
> +bool espi_channel_is_enabled(struct espi_controller *ctrl, u8 channel)
> +{
> +	if (!ctrl || channel >= ESPI_CHANNEL_COUNT)
> +		return false;
> +	guard(mutex)(&ctrl->lock);
> +	return !!(ctrl->channel_enabled & BIT(channel));
> +}
> +EXPORT_SYMBOL_GPL(espi_channel_is_enabled);
> +
> +int espi_get_configuration(struct espi_controller *ctrl,
> +			   u32 slave_reg_addr, u32 *config)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->get_configuration)
> +		return -EOPNOTSUPP;
> +	if (!config)
> +		return -EINVAL;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->get_configuration(ctrl, slave_reg_addr, config);
> +}
> +EXPORT_SYMBOL_GPL(espi_get_configuration);
> +
> +int espi_set_configuration(struct espi_controller *ctrl,
> +			   u32 slave_reg_addr, u32 config)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->set_configuration)
> +		return -EOPNOTSUPP;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->set_configuration(ctrl, slave_reg_addr, config);
> +}
> +EXPORT_SYMBOL_GPL(espi_set_configuration);
> +
> +int espi_inband_reset(struct espi_controller *ctrl)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->inband_reset)
> +		return -EOPNOTSUPP;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->inband_reset(ctrl);
> +}
> +EXPORT_SYMBOL_GPL(espi_inband_reset);
> +
> +int espi_get_status(struct espi_controller *ctrl,
> +		    struct espi_slave_status *status)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->get_status)
> +		return -EOPNOTSUPP;
> +	if (!status)
> +		return -EINVAL;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->get_status(ctrl, status);
> +}
> +EXPORT_SYMBOL_GPL(espi_get_status);
> +
> +int espi_enable_channel(struct espi_controller *ctrl, u8 channel)
> +{
> +	int ret;
> +
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->enable_channel)
> +		return -EOPNOTSUPP;
> +	if (channel >= ESPI_CHANNEL_COUNT)
> +		return -EINVAL;
> +	guard(mutex)(&ctrl->lock);
> +	ret = ctrl->ops->enable_channel(ctrl, channel);
> +	if (!ret)
> +		ctrl->channel_enabled |= BIT(channel);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(espi_enable_channel);
> +
> +int espi_disable_channel(struct espi_controller *ctrl, u8 channel)
> +{
> +	int ret;
> +
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->disable_channel)
> +		return -EOPNOTSUPP;
> +	if (channel >= ESPI_CHANNEL_COUNT)
> +		return -EINVAL;
> +	guard(mutex)(&ctrl->lock);
> +	ret = ctrl->ops->disable_channel(ctrl, channel);
> +	if (!ret)
> +		ctrl->channel_enabled &= ~BIT(channel);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(espi_disable_channel);
> +
> +int espi_periph_io_read(struct espi_controller *ctrl,
> +			u16 port, u8 width, u32 *value)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->periph_io_read)
> +		return -EOPNOTSUPP;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->periph_io_read(ctrl, port, width, value);
> +}
> +EXPORT_SYMBOL_GPL(espi_periph_io_read);
> +
> +int espi_periph_io_write(struct espi_controller *ctrl,
> +			 u16 port, u8 width, u32 value)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->periph_io_write)
> +		return -EOPNOTSUPP;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->periph_io_write(ctrl, port, width, value);
> +}
> +EXPORT_SYMBOL_GPL(espi_periph_io_write);
> +
> +int espi_periph_mem_read(struct espi_controller *ctrl,
> +			 u32 addr, void *buf, size_t len)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->periph_mem_read)
> +		return -EOPNOTSUPP;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->periph_mem_read(ctrl, addr, buf, len);
> +}
> +EXPORT_SYMBOL_GPL(espi_periph_mem_read);
> +
> +int espi_periph_mem_write(struct espi_controller *ctrl,
> +			  u32 addr, const void *buf, size_t len)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->periph_mem_write)
> +		return -EOPNOTSUPP;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->periph_mem_write(ctrl, addr, buf, len);
> +}
> +EXPORT_SYMBOL_GPL(espi_periph_mem_write);
> +
> +int espi_vwire_get(struct espi_controller *ctrl, u8 index, u8 *value, u8 *valid)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->vwire_get)
> +		return -EOPNOTSUPP;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->vwire_get(ctrl, index, value, valid);
> +}
> +EXPORT_SYMBOL_GPL(espi_vwire_get);
> +
> +int espi_vwire_put(struct espi_controller *ctrl, u8 index, u8 value, u8 valid)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->vwire_put)
> +		return -EOPNOTSUPP;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->vwire_put(ctrl, index, value, valid);
> +}
> +EXPORT_SYMBOL_GPL(espi_vwire_put);
> +
> +int espi_oob_send(struct espi_controller *ctrl, const void *buf, size_t len, u8 tag)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->oob_send)
> +		return -EOPNOTSUPP;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->oob_send(ctrl, buf, len, tag);
> +}
> +EXPORT_SYMBOL_GPL(espi_oob_send);
> +
> +int espi_oob_recv(struct espi_controller *ctrl, void *buf, size_t *len, u8 *tag)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->oob_recv)
> +		return -EOPNOTSUPP;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->oob_recv(ctrl, buf, len, tag);
> +}
> +EXPORT_SYMBOL_GPL(espi_oob_recv);
> +
> +int espi_flash_read(struct espi_controller *ctrl, u32 offset, void *buf, size_t len)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->flash_read)
> +		return -EOPNOTSUPP;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->flash_read(ctrl, offset, buf, len);
> +}
> +EXPORT_SYMBOL_GPL(espi_flash_read);
> +
> +int espi_flash_write(struct espi_controller *ctrl, u32 offset, const void *buf, size_t len)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->flash_write)
> +		return -EOPNOTSUPP;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->flash_write(ctrl, offset, buf, len);
> +}
> +EXPORT_SYMBOL_GPL(espi_flash_write);
> +
> +int espi_flash_erase(struct espi_controller *ctrl, u32 offset, size_t len)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->flash_erase)
> +		return -EOPNOTSUPP;
> +	guard(mutex)(&ctrl->lock);
> +	return ctrl->ops->flash_erase(ctrl, offset, len);
> +}
> +EXPORT_SYMBOL_GPL(espi_flash_erase);
> +
> +/*
> + * espi_handle_alert - dispatch a hardware alert to the controller
> + *
> + * Must be called from process context (threaded IRQ or workqueue).
> + *
> + * ctrl->lock is NOT held across ops->handle_alert so that the driver
> + * callback can call espi_notify_event() without deadlocking: notifier
> + * callbacks may in turn call channel APIs that also acquire ctrl->lock.
> + * The driver is responsible for taking ctrl->lock around any register
> + * accesses that need serialisation with the channel API.
> + */
> +int espi_handle_alert(struct espi_controller *ctrl)
> +{
> +	if (!ctrl || !ctrl->ops || !ctrl->ops->handle_alert)
> +		return -EOPNOTSUPP;
> +	return ctrl->ops->handle_alert(ctrl);
> +}
> +EXPORT_SYMBOL_GPL(espi_handle_alert);
> +
> +int __espi_register_driver(struct module *owner, struct espi_driver *drv)
> +{
> +	drv->driver.owner = owner;
> +	drv->driver.bus = &espi_bus_type;
> +	return driver_register(&drv->driver);
> +}
> +EXPORT_SYMBOL_GPL(__espi_register_driver);
> +
> +void espi_unregister_driver(struct espi_driver *drv)
> +{
> +	driver_unregister(&drv->driver);
> +}
> +EXPORT_SYMBOL_GPL(espi_unregister_driver);
> +
> +static int __init espi_init(void)
> +{
> +	int ret = bus_register(&espi_bus_type);
> +
> +	if (ret)
> +		pr_err("failed to register eSPI bus: %d\n", ret);
> +	return ret;
> +}
> +postcore_initcall(espi_init);
> +
> +MODULE_AUTHOR("Krishnamoorthi M <krishnamoorthi.m@amd.com>");
> +MODULE_DESCRIPTION("eSPI core framework");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/espi/espi.h b/include/linux/espi/espi.h
> new file mode 100644
> index 000000000000..a191ddc10cdd
> --- /dev/null
> +++ b/include/linux/espi/espi.h
> @@ -0,0 +1,345 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * eSPI (Enhanced Serial Peripheral Interface) framework
> + *
> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + */
> +#ifndef _LINUX_ESPI_ESPI_H
> +#define _LINUX_ESPI_ESPI_H
> +
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. I think you're not even
using a symbol defined by it, so you can just drop it.

> [...]
> +struct espi_device_id {
> +	char name[ESPI_NAME_SIZE];
> +	kernel_ulong_t driver_data;

There is an effort to replace .driver_data by an anonymous union for the
already existing *_device_id. See
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for details. It would be awesome if you'd do that from the start.

> +};

Best regards
Uwe

--4cyzarwpv5f6fyd6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp0jKYACgkQj4D7WH0S
/k4p9Qf7BUGvxEKKl262VR9b7B6L9bAn/WG96XeigPh/Kw7mzkBJ3bS+0lsmY31R
4+dN6vyZ+qLdoxOsqIln6tMOi+6cqjd5X+b5+HMPUGhsxsR6U+kKH98yjVinzQjN
cHWDA7p9MfENtvOkdDJ2QH3O6tITZPk0xZzIi3uWPlXYybRFIvi7/MC0r/CMYUGE
oEqw0g1lIsM4Bmx5dRYCr5uoI9tM0R8eCIsTz8bWqNyK60a/Lts6+ynl0wGswz+1
BcdJIU2zpUuhwbxk9BqOG7A/Us9Lman7TzvAJw0MPxMNwGLLmMYql/2ncpq4D8qc
svWFOkY6GCkY8GJaQvLMmmJa9vAaTA==
=SCU3
-----END PGP SIGNATURE-----

--4cyzarwpv5f6fyd6--

