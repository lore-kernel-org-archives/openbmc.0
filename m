Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::241; helo=mail-pf0-x241.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FI9yKqHt"; 
 dkim-atps=neutral
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4097Ny12bMzF25c
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 09:00:17 +1100 (AEDT)
Received: by mail-pf0-x241.google.com with SMTP id m68so8064173pfm.11
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 15:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DC9JGXbXUY380nnOMvVMzGEbuczW8XdletjNQ1/qPqc=;
 b=FI9yKqHtQ/ZSbQ9c47suSlRZp0ukAUfJQC3xkHk6pt9kX4A7/Kj9dN19h/q+xzJjZC
 GOSj38GEl7rzNf2JCGcjHYS3BmdJjvPBoJHPJSjNjEHTkqtkXiiCQOwxxQKc1GM3UYnD
 1mi+qFugwHW3Hjh0PsZKksHIagLEKWDjUkASU3bRHyzDLiuJDGnSzHvo5SxtjrE5KGry
 kWR6mJDzRK94PM8MODiIdIfqFtzMY7VVvVmS2qFm4RIhOrzsoKlBnz+2MS6RGqUCzrNb
 DuZgW32xNcAmbqouxnbXX3GC42M5U+4GxrgPwk0WyUW8/bULLtutN9b52BQoBFwAIWIF
 SCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DC9JGXbXUY380nnOMvVMzGEbuczW8XdletjNQ1/qPqc=;
 b=uN4ksbKDsqpjI/f2Qi4AERo9v+D1H7TXMlXhqR8suaq1Ia34Wr+l5Gvqu2D9oz40Od
 WDps1BagYTjSZiIdIy//dtrcnpFvQzIwcQX70KhZZtxJb+DOeLZqS823EsbDhWHKTEYj
 RGFq9f0aAqRsOmjpkCmUL796nX1BtsaQGH13YmzIaI8qxBmJkR83VjpYT0KXywsNA2SS
 wlaPiOBaKvDJUjJgV5MmC748Bt75hQecEwNehOtPWSVHCqJPFD7Ki4RUWQEfmu/7LHhI
 NynYdCMhAw6c3G/HQPKKgsXxrn2ek6va3gPZHgr8i5WdIshcY3XpLRMBDzRiyQQhmL9J
 NU0A==
X-Gm-Message-State: AElRT7HFnz7Luveh+M9sVrL5edDZt04EmczL/YoG2kiofWbECfG0ChD6
 Z9LuvNp0s0VLSzjrzRZpNIPgRQ==
X-Google-Smtp-Source: AG47ELvO6DylWzfeMB/deE/MeGdeQu6gU8SNcJQ7kljVzqs2nmoBqsHd7Q4LrNTw6rcV7SlUmpEapg==
X-Received: by 10.99.112.92 with SMTP id a28mr29039225pgn.17.1522101615514;
 Mon, 26 Mar 2018 15:00:15 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id p86sm34788638pfi.55.2018.03.26.15.00.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Mar 2018 15:00:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] aspeed: watchdog: Add status function
To: Eddie James <eajames@linux.vnet.ibm.com>, linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, wim@linux-watchdog.org, joel@jms.id.au,
 openbmc@lists.ozlabs.org
References: <1522099028-20347-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <eeaa2de8-937d-4371-1b32-931b3221f6ce@roeck-us.net>
Date: Mon, 26 Mar 2018 15:00:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1522099028-20347-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2018 22:00:19 -0000

On 03/26/2018 02:17 PM, Eddie James wrote:
> Populate the status watchdog operation to return the "timeout status"
> register of the ASPEED watchdog.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>   drivers/watchdog/aspeed_wdt.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index a5b8eb2..d6dd5c9 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -55,6 +55,7 @@ struct aspeed_wdt_config {
>   #define   WDT_CTRL_WDT_INTR		BIT(2)
>   #define   WDT_CTRL_RESET_SYSTEM		BIT(1)
>   #define   WDT_CTRL_ENABLE		BIT(0)
> +#define WDT_TIMEOUT_STATUS	0x10
>   
>   /*
>    * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
> @@ -138,6 +139,13 @@ static int aspeed_wdt_ping(struct watchdog_device *wdd)
>   	return 0;
>   }
>   
> +static unsigned int aspeed_wdt_status(struct watchdog_device *wdd)
> +{
> +	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
> +
> +	return readl(wdt->base + WDT_TIMEOUT_STATUS);
> +}

Does the register report WDIOF_* status flags/bits as defined in the API ?
This seems more than unlikely.

Guenter

> +
>   static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
>   				  unsigned int timeout)
>   {
> @@ -171,6 +179,7 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
>   	.start		= aspeed_wdt_start,
>   	.stop		= aspeed_wdt_stop,
>   	.ping		= aspeed_wdt_ping,
> +	.status		= aspeed_wdt_status,
>   	.set_timeout	= aspeed_wdt_set_timeout,
>   	.restart	= aspeed_wdt_restart,
>   	.owner		= THIS_MODULE,
> 
