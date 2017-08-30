Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhph55sD2zDq5b
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 12:03:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="3L3S+2vx";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=farqvDBNb9gwSbDhcOjeiIr6oh2A/WzBZ2COMFIEPHs=; b=3L3S+2vxIujH+CoZIv4AGk5mAl
 D7PW63nlZhA1Xg6Q4Y/7QjiKhImtbOWaTKmoH5XUf3P+9xWgp/AnstfEBhcj4WoB372iXpIQ920gN
 yNITuStx+cj+wrMY+o+J3NHxk6NZID4MiOA5SUPd+tqxjQF6Cauqh6uppqu/sv5Y8uB/iITh24Ozp
 2WCipXZKndPKLyUehKk60UFCHcDEFNk9dHqDwcV35FA1rtyubXwxLTEXjbuM/E4JGARwB7LsVsePn
 9r3TpwLu65XeexoQfD/qLYaQMBwkSj/FKwMMU7RiGk+jRwXfeGqGFBrTd5Da+kLrErHJhJX6hDunI
 hg6g9yIg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:49818 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dmsLq-003SMk-9K; Wed, 30 Aug 2017 02:03:31 +0000
Date: Tue, 29 Aug 2017 19:03:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Xo Wang <xow@google.com>
Cc: jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [2/2] hwmon: (pmbus/lm25066) Add support for TI LM5066I
Message-ID: <20170830020329.GA22035@roeck-us.net>
References: <20170829212117.143441-3-xow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170829212117.143441-3-xow@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Wed, 30 Aug 2017 02:03:34 -0000

On Tue, Aug 29, 2017 at 02:21:17PM -0700, Xo Wang wrote:
> The TI LM5066I hotswap controller is a more accurate version of the
> LM5066 device already supported. It has different measurement conversion
> coefficients than the LM5066, so it needs to be recognized as a
> different device.
> 
> Signed-off-by: Xo Wang <xow@google.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/hwmon/lm25066   |  9 +++++++--
>  drivers/hwmon/pmbus/lm25066.c | 41 +++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 46 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/hwmon/lm25066 b/Documentation/hwmon/lm25066
> index 2cb20ebb234d..3fa6bf820c88 100644
> --- a/Documentation/hwmon/lm25066
> +++ b/Documentation/hwmon/lm25066
> @@ -29,6 +29,11 @@ Supported chips:
>      Addresses scanned: -
>      Datasheet:
>  	http://www.national.com/pf/LM/LM5066.html
> +  * Texas Instruments LM5066I
> +    Prefix: 'lm5066i'
> +    Addresses scanned: -
> +	Datasheet:
> +    http://www.ti.com/product/LM5066I
>  
>  Author: Guenter Roeck <linux@roeck-us.net>
>  
> @@ -37,8 +42,8 @@ Description
>  -----------
>  
>  This driver supports hardware monitoring for National Semiconductor / TI LM25056,
> -LM25063, LM25066, LM5064, and LM5066 Power Management, Monitoring, Control, and
> -Protection ICs.
> +LM25063, LM25066, LM5064, and LM5066/LM5066I Power Management, Monitoring,
> +Control, and Protection ICs.
>  
>  The driver is a client driver to the core PMBus driver. Please see
>  Documentation/hwmon/pmbus for details on PMBus client drivers.
> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> index 232b4af13e12..10d17fb8f283 100644
> --- a/drivers/hwmon/pmbus/lm25066.c
> +++ b/drivers/hwmon/pmbus/lm25066.c
> @@ -28,7 +28,7 @@
>  #include <linux/i2c.h>
>  #include "pmbus.h"
>  
> -enum chips { lm25056, lm25063, lm25066, lm5064, lm5066 };
> +enum chips { lm25056, lm25063, lm25066, lm5064, lm5066, lm5066i };
>  
>  #define LM25066_READ_VAUX		0xd0
>  #define LM25066_MFR_READ_IIN		0xd1
> @@ -65,7 +65,7 @@ struct __coeff {
>  #define PSC_CURRENT_IN_L	(PSC_NUM_CLASSES)
>  #define PSC_POWER_L		(PSC_NUM_CLASSES + 1)
>  
> -static struct __coeff lm25066_coeff[5][PSC_NUM_CLASSES + 2] = {
> +static struct __coeff lm25066_coeff[6][PSC_NUM_CLASSES + 2] = {
>  	[lm25056] = {
>  		[PSC_VOLTAGE_IN] = {
>  			.m = 16296,
> @@ -210,6 +210,41 @@ static struct __coeff lm25066_coeff[5][PSC_NUM_CLASSES + 2] = {
>  			.m = 16,
>  		},
>  	},
> +	[lm5066i] = {
> +		[PSC_VOLTAGE_IN] = {
> +			.m = 4617,
> +			.b = -140,
> +			.R = -2,
> +		},
> +		[PSC_VOLTAGE_OUT] = {
> +			.m = 4602,
> +			.b = 500,
> +			.R = -2,
> +		},
> +		[PSC_CURRENT_IN] = {
> +			.m = 15076,
> +			.b = -504,
> +			.R = -2,
> +		},
> +		[PSC_CURRENT_IN_L] = {
> +			.m = 7645,
> +			.b = 100,
> +			.R = -2,
> +		},
> +		[PSC_POWER] = {
> +			.m = 1701,
> +			.b = -4000,
> +			.R = -3,
> +		},
> +		[PSC_POWER_L] = {
> +			.m = 861,
> +			.b = -965,
> +			.R = -3,
> +		},
> +		[PSC_TEMPERATURE] = {
> +			.m = 16,
> +		},
> +	},
>  };
>  
>  struct lm25066_data {
> @@ -250,6 +285,7 @@ static int lm25066_read_word_data(struct i2c_client *client, int page, int reg)
>  			ret = DIV_ROUND_CLOSEST(ret * 70, 453);
>  			break;
>  		case lm5066:
> +		case lm5066i:
>  			/* VIN: 2.18 mV VAUX: 725 uV LSB */
>  			ret = DIV_ROUND_CLOSEST(ret * 725, 2180);
>  			break;
> @@ -511,6 +547,7 @@ static const struct i2c_device_id lm25066_id[] = {
>  	{"lm25066", lm25066},
>  	{"lm5064", lm5064},
>  	{"lm5066", lm5066},
> +	{"lm5066i", lm5066i},
>  	{ }
>  };
>  
