Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::241; helo=mail-pf0-x241.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bauw1b7Q"; 
 dkim-atps=neutral
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynCx54SfPzDr8J
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 08:15:21 +1100 (AEDT)
Received: by mail-pf0-x241.google.com with SMTP id c204so2120380pfc.13
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 13:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/j+TdYMjhERxPVSc9pmKXkWPV5E1pa0lrooGd8JoToE=;
 b=Bauw1b7QP4ruyXq6KET4Qt9Wv40zgOVAkV9BVAkEiZAzGCLvNHyCKgU2J46+ax0sAK
 5Bh1M0PtkQu1pvYiOZEQ3ITUMCwJxihw3wDxEG7iV7e/VuBmzzcE8drzXGrSwa5JquL/
 yi66BLCYBrynRjMSw8lSJju66o037n0KeiT1WqyynU3jq3fTi7UP9G2ThveIVlGqitFH
 EgmwJOYDCpyMNFZPk8FkXIn7tHSDKGp99zOkNEUvfjBe8yb7yJEfcYSNBremhZVOtFYz
 FXKfbRdZ8il5S7M2kMI3imqFTFNWhfSAcIzv9gzuw0WYNOjCgpcLU/Nxk2sMelha9mGD
 9sAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=/j+TdYMjhERxPVSc9pmKXkWPV5E1pa0lrooGd8JoToE=;
 b=rR3nuIKdFKNveORLb/b7m/19zP+OFS4NWkCb9lc6hhV/J7zM6qeXa7TOl8ZppOq8I7
 d60NPy2G+4mDJiLqd9o6UdsScCYrwUsHOa9GSuB3UFh0nS6q2wh2uduAyFH4ulkB/fQ4
 KfQVGGYSwreeW3dbzud0dR/VANZ7KF0C7JDRMim+tHvWZvVlhRpSquPXAHcUjjUq5LKk
 CnmZydU7eDesr3ai7PQRSg1dc5tbes095GRb+lwjWJNHAd4XA9pJQRAY4rj8xrHMhmYS
 ekRRdBq4NXaIw+iBVzNtUfUQPky5sHQmi0PhQScAkmWlSpl4fxbY9wTVBw/jmlzvBiA2
 l1gQ==
X-Gm-Message-State: AJaThX6+LKeuwNSIEKso81H1DBaSW0Gs1DV4UMQJeAdbCC5M8WtZzRr5
 kKN+T1W3yZjhHV5+w1U+p3E=
X-Google-Smtp-Source: AGs4zMazZQyIW7ldGD+nUX6kLZNP94uP6DTANksmfOgxzy53CtEVpQBaoeYV43q55fcZhuWAm/u+YA==
X-Received: by 10.99.55.92 with SMTP id g28mr213095pgn.293.1511990119755;
 Wed, 29 Nov 2017 13:15:19 -0800 (PST)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id d75sm4557290pga.39.2017.11.29.13.15.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Nov 2017 13:15:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Nov 2017 13:15:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [v6,3/4] pmbus (core): Add virtual page config bit
Message-ID: <20171129211518.GA22235@roeck-us.net>
References: <57d31e056da37bab946a42c30c1aa4f0a0a595f1.1511152748.git-series.andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57d31e056da37bab946a42c30c1aa4f0a0a595f1.1511152748.git-series.andrew@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 29 Nov 2017 21:15:21 -0000

On Mon, Nov 20, 2017 at 03:12:05PM +1030, Andrew Jeffery wrote:
> Some circumstances call for virtual pages, to expose multiple values
> packed into an extended PMBus register in a manner non-compliant with
> the PMBus standard. An example of this is the Maxim MAX31785 controller,
> which extends the READ_FAN_SPEED_1 PMBus register from two to four bytes
> to support tach readings for both rotors of a dual rotor fan. This extended
> register contains two word-sized values, one reporting the rate of the
> fastest rotor, the other the rate of the slowest. The concept of virtual
> pages aids this situation by mapping the page number onto the value to be
> selected from the vectored result.
> 
> We should not try to set virtual pages on the device as such a page
> explicitly doesn't exist; add a flag so we can avoid doing so.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus.h      |  2 ++
>  drivers/hwmon/pmbus/pmbus_core.c | 27 ++++++++++++++++++---------
>  2 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index b54d7604d3ef..d39d506aa63e 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -372,6 +372,8 @@ enum pmbus_sensor_classes {
>  #define PMBUS_HAVE_PWM12	BIT(20)
>  #define PMBUS_HAVE_PWM34	BIT(21)
>  
> +#define PMBUS_PAGE_VIRTUAL	BIT(31)
> +
>  enum pmbus_data_format { linear = 0, direct, vid };
>  enum vrm_version { vr11 = 0, vr12, vr13 };
>  
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index edc25efe7552..e215bbd403a5 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -161,18 +161,27 @@ EXPORT_SYMBOL_GPL(pmbus_clear_cache);
>  int pmbus_set_page(struct i2c_client *client, int page)
>  {
>  	struct pmbus_data *data = i2c_get_clientdata(client);
> -	int rv = 0;
> -	int newpage;
> +	int rv;
> +
> +	if (page < 0 || page == data->currpage)
> +		return 0;
>  
> -	if (page >= 0 && page != data->currpage) {
> +	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
>  		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> -		newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> -		if (newpage != page)
> -			rv = -EIO;
> -		else
> -			data->currpage = page;
> +		if (rv < 0)
> +			return rv;
> +
> +		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> +		if (rv < 0)
> +			return rv;
> +
> +		if (rv != page)
> +			return -EIO;
>  	}
> -	return rv;
> +
> +	data->currpage = page;
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(pmbus_set_page);
>  
