Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U83lrlEr"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YH6D4LlkzDqDG
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 00:58:12 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id z11so193318pgu.0
 for <openbmc@lists.ozlabs.org>; Mon, 07 Jan 2019 05:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4zs6Zz/1DJZgW8YjZW8JHJMs9OMo+LSQ66u5CYsQHdY=;
 b=U83lrlErW2ykOCdOygq1yQiiSxbDpREHs8CUUS6DmpryKb8ScnDarMfsrtFrOv+tfp
 qPWa3rmlK20lWMdTI0RDnYrvWPLMGveFYFcf5ZgsB3Bo0cwQFHITNBZJoE1WUbWr4sLa
 TyHFEXOzKXsUNa9JQA6nyb0rWRnM8a55uttx3kkrxz0yIJb/XDGMfrB4PbtVfBii16p9
 RXYjl3YSCMaNHTvQu6sJsjQrkx2Ywcs7ZegY2TvKwuKCE6zdl64RmyU37fHrY5+3Gcap
 b65+kf+7cA9h1dlxPmeekmQHikfEdjJ6e7UdBQ+UNPpq/s69/eevymHvO0YA9+7FgwKd
 asnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4zs6Zz/1DJZgW8YjZW8JHJMs9OMo+LSQ66u5CYsQHdY=;
 b=MhHlPB2e63Uce5k1U5KSBkpmR2srOJ7LwFuY8OSEvtzdRB/DyMQnCUnWw4qx2+pO4n
 sALYPDBInsNO2deXqiq1//Ap2nTYBggBuAs1GD/caTU7FI7AgQmnykwFLB1wzRQ99YCc
 sx5aet2vsGPGoGnYL9i5qrndIe6Svp1QiVvwebAh7x6GbYBruAS3+wa52GOBwDKLIyVG
 5TwiMKodPC9/3r6+WVpFPi3EVFX60t8IyrfqN6uuwygWomMK88PsnkpDx3m5zvbYgisq
 47DaGeNblZ53xwN+dRZdpdtT/TwyO6rIBLR4yiGtaHLuoonEKCoUMv8B4Ec4L5vwrTZJ
 8Npg==
X-Gm-Message-State: AJcUukdZygrpQN9GnVggWiBmmeH5z1lv+P3uRAOrCa8QyDr3LA9WkY37
 pviRTkEuwp6E7VR+D1/4pow=
X-Google-Smtp-Source: ALg8bN6K8fA1w3egzAOY/yFHKyx2O+61Fqi8ej6M0tMaRAMzCYVEoAJhWphYYlMUdmba47qIsXvuYw==
X-Received: by 2002:a63:eb52:: with SMTP id b18mr56771951pgk.213.1546869490165; 
 Mon, 07 Jan 2019 05:58:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m65sm115241212pfg.180.2019.01.07.05.58.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 05:58:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: hwmon: add dps650ab documentation
To: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>, jdelvare@suse.com,
 robh+dt@kernel.org, mark.rutland@arm.com, openbmc@lists.ozlabs.org
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, shunyong.yang@hxt-semitech.com,
 dongsheng.wang@hxt-semitech.com
References: <cover.1546851856.git.xiaoting.liu@hxt-semitech.com>
 <0087d2d9c7cd7f38761f76c80d1c37cb2cea6ef2.1546851856.git.xiaoting.liu@hxt-semitech.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <568735a3-1de2-3880-5fe1-7be38a55f33f@roeck-us.net>
Date: Mon, 7 Jan 2019 05:58:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <0087d2d9c7cd7f38761f76c80d1c37cb2cea6ef2.1546851856.git.xiaoting.liu@hxt-semitech.com>
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
X-List-Received-Date: Mon, 07 Jan 2019 13:58:13 -0000

On 1/7/19 3:00 AM, Xiaoting Liu wrote:
> Bindings for DPS650AB power, voltage, temperature, and fan monitering.
> 
> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
> ---
> v2:
>    Change the patch subject.
> ---
>   Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> new file mode 100644
> index 000000000000..6bbbff89f6d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> @@ -0,0 +1,11 @@
> +Bindings for DPS650AB power, voltage, temperature, and fan monitering
> +

Assuming this is the Delta Electronics DPS-650-AB power supply, I think
you should mention that here.

> +Required properties:
> +- compatible : "dps650ab"

Again, assuming this is the Delta Electronics power supply, this should
probably be something like "delta,dps650ab".

Thanks,
Guenter

> +- reg       : I2C address, one of 0x58, 0x59.
> +
> +Example:
> +       dps650ab@58 {
> +                   compatible = "dps650ab";
> +                   reg = <0x58>;
> +       };
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
