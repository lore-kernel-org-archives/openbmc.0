Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VRSBdK+q"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bFGv1CfqzDqxs
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 05:42:30 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id b5so5563440plr.4
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 10:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GmBKVju7YpXYxZxfMod0Ao5g3yfsoyp7zP+gkrAEqrk=;
 b=VRSBdK+qlxZFezxWlJF0twycu102H5+rmtO01buiToMpWnbKVsumyVzg+oYFwlwhNT
 k734y0PlEmqk4Ldr1NzYJmOOhkGKVWIV3CSlQDF0uZmXYVJk5QzS2E62P3awtbrfQPig
 lxFJyF6GVQkRHwBImj6te2NAJ0V0ry8PqZYM+vOa4Bgao6mdJSgdd1lv+4dV7IJi3Sjh
 SCcFRkhqd5wPKEajt/gaNW3UwUxCNXV559NYyXctlrMyHejqhCKK6n7c4d8X0OdrlcSl
 XEf6LzjVlAr11jhNLr5JiQOs/mXWusRnNDgM/Zwvu5WiLuWamwc1/ABiivxtccGNgdR4
 PUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=GmBKVju7YpXYxZxfMod0Ao5g3yfsoyp7zP+gkrAEqrk=;
 b=mok8hYKPBO9TnYSIrHgHGlTQjkC/wjagj/Xah3QCRFAwPeWKHbqz8bmzItO8y63tLO
 kZF5ky4cRDZ6k3kCWremyUtR9RJSVlO4vxXbb8OQAWnXA9s16smOubrvSuvz5wY3f7v8
 Yq2M5I608/a78vNisOyot9h2YPUAPCl413zXEw43pjMmNCmrcsTbjB2kOcNyYd3bHrko
 rpzjfruQ1rZsNr1rGco1owt+/01/YFmDoiefHrK7HOi9CTFYzJQH8yRPRFLSn++/jufC
 PzUsLUJE1dDMecK+ROXnQb6Ex5MufTls4KW0HQBYuHyg7PVy70QHLslfEjiWXdKRMaRJ
 vJSw==
X-Gm-Message-State: AJcUukcNlKEhUjh7fSo+voFjGaaUMjh11rlZ8TjcdTjK8QisigajEz5m
 totQqwE1nxNmpd6TCG1DISA=
X-Google-Smtp-Source: ALg8bN58bphF34IBddXD21DM+2+BSjyaYpSwmsYXMavtJtI2y9DMA/O/E86C3rAu9yW4B/Y1QgnJhA==
X-Received: by 2002:a17:902:9a81:: with SMTP id
 w1mr10941431plp.19.1547145748937; 
 Thu, 10 Jan 2019 10:42:28 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id d69sm104501339pfg.168.2019.01.10.10.42.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Jan 2019 10:42:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Jan 2019 10:42:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Cc: jdelvare@suse.com, openbmc@lists.ozlabs.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 shunyong.yang@hxt-semitech.com, dongsheng.wang@hxt-semitech.com
Subject: Re: [PATCH v3 4/4] hwmon: (pmbus) add support for DPS-650AB
Message-ID: <20190110184227.GB9010@roeck-us.net>
References: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com>
 <625d047f0f42d30bb5ceb75ada529b5fa0c9a21a.1546918172.git.xiaoting.liu@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <625d047f0f42d30bb5ceb75ada529b5fa0c9a21a.1546918172.git.xiaoting.liu@hxt-semitech.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 10 Jan 2019 18:42:32 -0000

On Thu, Jan 10, 2019 at 10:31:44AM +0800, Xiaoting Liu wrote:
> Provide support for PSU DPS-650AB from Delta Electronics, INC.
> 
> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> v3:
>   No change.
> ---
> v2:
>   Change the patch subject and commit message.
>   Drop dps650ab.c file.
>   Replace struct name dps650ab_pmbus_info with pmbus_info_one_skip.
> ---
>  drivers/hwmon/pmbus/pmbus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> index ef845a1310fa..e648ed8d926a 100644
> --- a/drivers/hwmon/pmbus/pmbus.c
> +++ b/drivers/hwmon/pmbus/pmbus.c
> @@ -212,6 +212,7 @@ static int pmbus_probe(struct i2c_client *client,
>  	{"bmr453", (kernel_ulong_t)&pmbus_info_one},
>  	{"bmr454", (kernel_ulong_t)&pmbus_info_one},
>  	{"dps460", (kernel_ulong_t)&pmbus_info_one_skip},
> +	{"dps650ab", (kernel_ulong_t)&pmbus_info_one_skip},
>  	{"dps800", (kernel_ulong_t)&pmbus_info_one_skip},
>  	{"mdt040", (kernel_ulong_t)&pmbus_info_one},
>  	{"ncp4200", (kernel_ulong_t)&pmbus_info_one},
> -- 
> 1.8.3.1
> 
