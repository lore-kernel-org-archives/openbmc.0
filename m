Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YyraZLze"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kj9Z707bzDqD5
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 23:04:02 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id v12so12005393pgq.1
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 06:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ytlV7rh3X071IevZI900mMrE6ODbO7Q0m8EjIKkOtSI=;
 b=YyraZLzeeqyoiP94PgL1ck/kJ8usmMbW+9OBsRbM83Sa7Lfy/8EaBrCK1z82EENnTW
 MmQa8yQ3vxc7UhKHF+/WM9iP3/SyJKtc16PNo+eu3zhrBw90cI9p3dEnzN6ZtV4xCstr
 zRqUCNBjig45bYSrN2SulLNi1k+8gaag3o92kYYdxKNMUNu6P+jRr9WLuqwCQ3UweB79
 8+adfQ14EWDS0MjkgVnkIRJdqH4dQjzFoixYTz9+ULSxwjiMkTDZjsoa7B9bHr4Phn2M
 IPDpVxW4Tb9AO9M5z11tM3LYzuhCUMvbeFpkkjTfo7t85+/roueh/SAh9/SaOE5+anvn
 8Rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ytlV7rh3X071IevZI900mMrE6ODbO7Q0m8EjIKkOtSI=;
 b=n2B9YYeRmluvz0VbCGwBFut7EGtkmvmGN5wDQMrUCz9L56dqJ+Rdy7BpI7w+xK5PwL
 aElG6NsYd81hoDRF57zt674qJAP+5dbTMIjfjTkxbD0VXLoIvyanMbwgStgXWkFdiZGJ
 vQ94Cj2lmQJfBjJxgH2LemRkvg3h6pdcDH3AZhvMM2epmEyts1R6VWaGmgQmXF7Zo/9w
 U756kZI4EOJxYBJ8UyrVUgvqyqle97atZLii+FCRUm5p6OQSRYfV6IlG5MBpKl4VdcRs
 j5PAQb66X/3gnPDY+mT5qY+iuluHvyHsXL+A2DdXNvtxOU3nicJ29oClhbS6U6L2SDNK
 wNXA==
X-Gm-Message-State: APjAAAXoCZKt3VDCLzM7xiq/dxTuMhoUfOe/v66p3k1g4OS+aIZRJYY5
 GzGTE1YsfNBmB/eQP36JTpE=
X-Google-Smtp-Source: APXvYqwCaoC+EsnFeKrRo7YCegxwj46eb1KkWeYUeUfb4qKxhGloAiKdUz1l8L9/fdz7xj4thx2oAg==
X-Received: by 2002:a63:ed4f:: with SMTP id m15mr80292165pgk.387.1555506239682; 
 Wed, 17 Apr 2019 06:03:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d69sm45161877pfg.24.2019.04.17.06.03.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 06:03:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/1] hwmon (occ): Add temp sensor value check
To: Alexander Amelkin <a.amelkin@yadro.com>, linux-hwmon@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, Alexander Soldatov <a.soldatov@yadro.com>,
 "Edward A . James" <eajames@us.ibm.com>, Joel Stanley <joel@jms.id.au>
References: <1555500396-11976-1-git-send-email-a.amelkin@yadro.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <87cd75da-8d15-4b1f-47a2-cb55ed214df9@roeck-us.net>
Date: Wed, 17 Apr 2019 06:03:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555500396-11976-1-git-send-email-a.amelkin@yadro.com>
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
X-List-Received-Date: Wed, 17 Apr 2019 13:04:03 -0000

On 4/17/19 4:26 AM, Alexander Amelkin wrote:
> From: Alexander Soldatov <a.soldatov@yadro.com>
> 
> The occ driver supports two formats for the temp sensor value.
> 
> The OCC firmware for P8 supports only the first format, for which
> no range checking or error processing is performed in the driver.
> Inspecting the OCC sources for P8 reveals that OCC may send
> a special value 0xFFFF to indicate that a sensor read timeout
> has occured, see
> 
occurred

> https://github.com/open-power/occ/blob/master_p8/src/occ/cmdh/cmdh_fsp_cmds.c#L395
> 
> That situation wasn't handled in the driver. This patch adds invalid
> temp value check for the sensor data format 1 and handles it the same
> way as it is done for the format 2, where EREMOTEIO is reported for
> this case.
>
ETIMEDOUT ? Though that is really a corner case, so I guess both are fine.

> Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
> Signed-off-by: Alexander Amelkin <a.amelkin@yadro.com>
> Reviewed-by: Alexander Amelkin <a.amelkin@yadro.com>
> Cc: Edward A. James <eajames@us.ibm.com>
> Cc: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/hwmon/occ/common.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 4679acb..825631c 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -235,6 +235,10 @@ static ssize_t occ_show_temp_1(struct device *dev,
>   		val = get_unaligned_be16(&temp->sensor_id);
>   		break;
>   	case 1:
> +		/* If a sensor timed out long enough,

"timed out" is sufficient. "timed out long enough" is difficult to understand.

> +		   OCC returns 0xFFFF for that sensor.*/

/*
  * This is how multi-line comments look like
  */

Please run checkpatch on your patches.

Thanks,
Guenter

> +		if (temp->value == 0xFFFF)
> +			return -EREMOTEIO;
>   		val = get_unaligned_be16(&temp->value) * 1000;
>   		break;
>   	default:
> 
