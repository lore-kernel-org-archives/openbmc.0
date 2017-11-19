Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UO6pqh8F"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yfyVv3v15zDrST
 for <openbmc@lists.ozlabs.org>; Mon, 20 Nov 2017 03:49:24 +1100 (AEDT)
Received: by mail-pg0-x241.google.com with SMTP id z184so5486513pgd.13
 for <openbmc@lists.ozlabs.org>; Sun, 19 Nov 2017 08:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gga81oY+4+qcFlr6B/y2EMy5vrgqywokhKLFTh4qhfw=;
 b=UO6pqh8FfpKPtITyNO7NIASMnrwHVvKtW6iwt2fSb1IWrsry9zwdKc9LJi/jhe0bye
 sA8ubiJln+HQRzix1SNsCQp3Thczjr23cxRRA3EJdDEu4Ed9c30N8Y+6z7FMLAfG4+vT
 G3iexK7hMqN21yplRXmnV9nZ6Q/UnkSsmL7+s63oaYfpqxArtCQshevuaFBoyk5Fmr6s
 bwFzF/mN+RsYTcr7hrfuh5/iCEeUie1fSg0XEY99chOT266Ue7tPV+12ryyJyMU7aIoU
 FbUalMZfWt6ZJrGrg+Y0oXMOlO/jLb+0/mBfuomzCjfO5axeLJ7dIBn53QAMFwG7tSIB
 bPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gga81oY+4+qcFlr6B/y2EMy5vrgqywokhKLFTh4qhfw=;
 b=QCpcMmh76XWQtmf20ulvr8cEojpLxWuCcLtmmyRMzGGe5XmgF0XJqAkGU76SsFrn0d
 aG9tphjiaX7r+kp9fduim95bUF8m6RMRw4H01CEnOge+zW7Bbxa05FDm6jG+cZVwXHii
 qKPId4kKA9MCdWzW12v2MEoyTTsit93/EYaxkBKKWcFGKafn7MorTxyhA/ou+lEAclTs
 jFiPUJRzP+FeBln11Yc4oX8K1gPjHY3hHN4qjqpNmnIYNrM7yBPkVkLWUVRFUdIVXUFs
 f7phlqbfumdy2JAyCyClrgTgXxdMDqiopJG8xN9TjXk3g4mxdGn4PMsDxwtmabVSnDRR
 5YuQ==
X-Gm-Message-State: AJaThX5W9WfsgDGsMedYZG59kNLiPGZcMHsdIcH/h9sSX9uZLSNzNfhr
 jfmHn77zITXhR7sjyReGL/6wUA==
X-Google-Smtp-Source: AGs4zMa538DjnoMDyAerr4oYrd1G6tGLHUiAxytp4Zgh21F/RC6efWPR3p+UTYFdXgjposlKLwXiJw==
X-Received: by 10.84.232.76 with SMTP id f12mr11117868pln.195.1511110161841;
 Sun, 19 Nov 2017 08:49:21 -0800 (PST)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id r18sm14079148pge.87.2017.11.19.08.49.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 Nov 2017 08:49:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v5 3/4] pmbus (core): Add virtual page config bit
To: Andrew Jeffery <andrew@aj.id.au>, linux-hwmon@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
 corbet@lwn.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
References: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
 <c5ccfeab881181dfbfdbdfb26051bb4cd332f6e6.1510974230.git-series.andrew@aj.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <3e84eca8-7a10-abd3-b8df-babb5f4ac8a0@roeck-us.net>
Date: Sun, 19 Nov 2017 08:49:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <c5ccfeab881181dfbfdbdfb26051bb4cd332f6e6.1510974230.git-series.andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Nov 2017 16:49:32 -0000

On 11/17/2017 07:26 PM, Andrew Jeffery wrote:
> Some circumstances call for virtual pages, to expose multiple values
> packed into an extended PMBus register in a manner non-compliant with
> the PMBus standard. An example of this is the Maxim MAX31785 controller, which
> extends the READ_FAN_SPEED_1 PMBus register from two to four bytes to support
> tach readings for both rotors of a dual rotor fan. This extended register
> contains two word-sized values, one reporting the rate of the fastest rotor,
> the other the rate of the slowest. The concept of virtual pages aids this
> situation by mapping the page number onto the value to be selected from the
> vectored result.
> 
> We should not try to set virtual pages on the device as such a page explicitly
> doesn't exist; add a flag so we can avoid doing so.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/hwmon/pmbus/pmbus.h      |  2 ++
>   drivers/hwmon/pmbus/pmbus_core.c | 10 +++++++---
>   2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index b54d7604d3ef..d39d506aa63e 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -372,6 +372,8 @@ enum pmbus_sensor_classes {
>   #define PMBUS_HAVE_PWM12	BIT(20)
>   #define PMBUS_HAVE_PWM34	BIT(21)
>   
> +#define PMBUS_PAGE_VIRTUAL	BIT(31)
> +
>   enum pmbus_data_format { linear = 0, direct, vid };
>   enum vrm_version { vr11 = 0, vr12, vr13 };
>   
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 631db88526b6..ba97230fcde7 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -164,14 +164,18 @@ int pmbus_set_page(struct i2c_client *client, int page)
>   	int rv = 0;
>   	int newpage;
>   
> -	if (page >= 0 && page != data->currpage) {
> +	if (page < 0 || page == data->currpage)
> +		return 0;
> +
> +	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
>   		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
>   		newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
>   		if (newpage != page)
>   			rv = -EIO;

This should probably be something like
		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
		if (rv < 0)
			return rv;
		newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
		if (newpage < 0)
			return newpage;
		if (newpage != page)
			return -EIO;

We can actually drop 'newpage' and just use 'rv'.

> -		else
> -			data->currpage = page;
>   	}
> +
> +	data->currpage = page;
> +

... otherwise currpage is set even on error.

>   	return rv;

this can then be
	return 0;

>   }
>   EXPORT_SYMBOL_GPL(pmbus_set_page);
> 
