Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DiBJ2NI3"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YHFp65qnzDqGZ
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 01:04:46 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id b7so206005pfi.8
 for <openbmc@lists.ozlabs.org>; Mon, 07 Jan 2019 06:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=80bC7EvBXvwUzeNM76uilRT3B917MijdAdYsd0gcdAM=;
 b=DiBJ2NI3a4b/ydkhc1CPMQCRpf8QzHOO6WHZmXIq2SdBLWOTH3/GxfsPNsPEVKSZFf
 DqUJlvrlsvQ5lTmg9ze0DdM8RpTREbfxU3iXiXFnkaPr8uRkgX8kCLOQbEN7mpDjKsmV
 GNI7hKaWti3KSdrZszgPK3LqBuogMapFr+X3h1bpTWr4ho7bbx+yTmB6jtcu8IkFLuMk
 od50vYEGWwrAeUY8yrorTvyNkLt9zZ91rkXwXgpGaepK+qLekfFI4tTJUdS06mFlPe0K
 qQ4C9jrm1M7q6oqu+ApvlFX83IdTOI/YVuRUcUR42/DaxS4T7qXrcFAyXJfscoacxgVP
 8eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=80bC7EvBXvwUzeNM76uilRT3B917MijdAdYsd0gcdAM=;
 b=pEFoF2lh4bKdL0+QN+cUPRGiKD6eq6Vjv9vPdVwzOgb8H2QLzQdCizBxktMNUhlbfn
 EOHJi0AO+lZRqeojvmzHT1QiyKW2pzrN2/zRxyw0qEa7t3bt/DmBXYCCKNXcO/+vkYjT
 NI4X5YyMFfFUe0DLvc8gOKEOGRh2eobZe+EGAN6dvpPYGN06TyRbGQx2zHxy50CwGn24
 CRblFtRokyiSwHc9C+koj2b6OhX7wkZGeDCm+pPG4oOFwPdcIC0OQL2mvhiR6Z/P5QaO
 HPrEZBGuEzbZ4IeU1uG1lYspB1h2pFS/X+IUF9hvtxxovVllQQ6RHcgelhyTj5gsgXlE
 8FRQ==
X-Gm-Message-State: AJcUukcMMuswM4YQULf/E3y951AeCI0Ro4Od5zDQjPtuigSb9E5FqLgR
 YnRY+UKlw4VB5deS2xNIfYg=
X-Google-Smtp-Source: ALg8bN7HtwoXE3vIX7aHAViJkI1WHNvGPl3YDw5p1KHjEUsmskVkJwWJan4gteEUVNy8e1VTqZq7Ng==
X-Received: by 2002:a63:ae01:: with SMTP id q1mr10858334pgf.402.1546869885076; 
 Mon, 07 Jan 2019 06:04:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u29sm92340056pgn.23.2019.01.07.06.04.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 06:04:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 4/4] hwmon: (pmbus) add support for DPS-650AB
To: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>, jdelvare@suse.com
Cc: openbmc@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, shunyong.yang@hxt-semitech.com,
 dongsheng.wang@hxt-semitech.com
References: <cover.1546851856.git.xiaoting.liu@hxt-semitech.com>
 <2e94eb44c0acf6b90c1d9bbffd1c5c5cc2af59be.1546851856.git.xiaoting.liu@hxt-semitech.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <af54e702-d384-4af8-0cbc-008a1e927b67@roeck-us.net>
Date: Mon, 7 Jan 2019 06:04:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <2e94eb44c0acf6b90c1d9bbffd1c5c5cc2af59be.1546851856.git.xiaoting.liu@hxt-semitech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 07 Jan 2019 14:04:47 -0000

On 1/7/19 3:06 AM, Xiaoting Liu wrote:
> Provide support for PSU DPS-650AB from Delta Electronics, INC.
> 

Where is patch 3/4 ?

> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
> ---
> v2:
>    Change the patch subject and commit message.
>    Drop dps650ab.c file.
>    Replace struct name dps650ab_pmbus_info with pmbus_info_one_skip.
> ---
>   drivers/hwmon/pmbus/pmbus.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> index e38dd97cc49a..f6b35f858db8 100644
> --- a/drivers/hwmon/pmbus/pmbus.c
> +++ b/drivers/hwmon/pmbus/pmbus.c
> @@ -213,6 +213,7 @@ static int pmbus_probe(struct i2c_client *client,
>          {"bmr453", (kernel_ulong_t)&pmbus_info_one},
>          {"bmr454", (kernel_ulong_t)&pmbus_info_one},
>          {"dps460", (kernel_ulong_t)&pmbus_info_one_skip},
> +       {"dps650ab", (kernel_ulong_t)&pmbus_info_one_skip},
>          {"dps800", (kernel_ulong_t)&pmbus_info_one_skip},
>          {"mdt040", (kernel_ulong_t)&pmbus_info_one},
>          {"ncp4200", (kernel_ulong_t)&pmbus_info_one},
> --
> 1.8.3.1
> 
> 
> 
> 
> This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
> 
> 
> 
