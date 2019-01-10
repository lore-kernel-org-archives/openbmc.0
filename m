Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QpCjGaIB"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bFMS31PYzDqxH
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 05:46:28 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id p8so5571650plo.2
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 10:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qdmfkEPHzANqefEUYiYiWKHzOhmx+tGvDPxNGGEwQ9s=;
 b=QpCjGaIBZ5OSeTSuf2Xf4FjR/PCtMtZzsYEfDj0q9BKjAmGE6dt4/aUbTozuZCcGri
 mUc4rw2305ZBHlOEKwu5gMYwIF5LughMsFDN9wRRlzlyDiVdfVohYujaYO3n5C7/ho+K
 Xvz7JK7NHcy4CjKWmAQ1kbcfeQlW+HYtLOSa8W/4JesvIyXVzkcdLDh2Hmt1/ysKc+L5
 jIH7Me6urGKn0ucEWzLFI6j9VSFCBIvySNzj7T+zasQnL+3Xze9aAKLR9wctx/XystSg
 AEeJFI1CFSTxqMIMTkWsIuTvwWgFvsVtX1O5Rj6WvZlZzq1xeMGEjIGE1RByoJGNJkwN
 qAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=qdmfkEPHzANqefEUYiYiWKHzOhmx+tGvDPxNGGEwQ9s=;
 b=WiiMvfbTKq4X9gK3l5lnPPUIM1HBe14kzN06P2Syik8re0VuO+QcsdVCDHvvrYX6F7
 i3exVpCJQ6s1PGto1LoTLVv2OBxH7yYAhqMwewM72e4zi0zd5ULdhTjJWaFdHzWKj2KI
 vIicx7KC2QNARX5OIAxHwSp3k+apjEGwOWwpD9ke4dQvYN3gt83RS53IFyyftRTSvaBa
 GuK4CyJnStd3+0vVfhoQLfJDbuxB2c6cIj/b/JAtPEBgL4RIZcfZwN2JQZjHn7/P1pKP
 B3P+gBqy/AewQJPBAuNdSj8tfBmH+igWyQBXBr02fC1ST/ahbbiGRSlfD4bOmg/yMpdp
 5gEA==
X-Gm-Message-State: AJcUukd6Y9vm2Rk+yhxhzmyHosNXs9zgwiGKhp8MUyVoj4TvmTh96cqx
 we4uGvISEl7WAMSTAs1V6Yw=
X-Google-Smtp-Source: ALg8bN75GJHWo2OJGdMVpmRNYxOHGc6XdcEpMtYhQb9HG3yBlhlLl3JiQkYUz5IkQwl51HSRiNTI+g==
X-Received: by 2002:a17:902:b406:: with SMTP id
 x6mr10925298plr.329.1547145986435; 
 Thu, 10 Jan 2019 10:46:26 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id w185sm113287305pfb.135.2019.01.10.10.46.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Jan 2019 10:46:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Jan 2019 10:46:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, shunyong.yang@hxt-semitech.com,
 dongsheng.wang@hxt-semitech.com
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: add dps650ab documentation
Message-ID: <20190110184624.GC9010@roeck-us.net>
References: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com>
 <0527fcf7155ea12a2a1be680b3617691e6e26d72.1546918172.git.xiaoting.liu@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0527fcf7155ea12a2a1be680b3617691e6e26d72.1546918172.git.xiaoting.liu@hxt-semitech.com>
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
X-List-Received-Date: Thu, 10 Jan 2019 18:46:29 -0000

On Thu, Jan 10, 2019 at 10:24:33AM +0800, Xiaoting Liu wrote:
> Bindings for Delta Electronics DPS-650-AB power supply.
> 
> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>

Waiting for DT maintainer Ack to apply. Note that you did not copy
linux-hwmon@vger.kernel.org. As a result, it _may_ get lost since
https://patchwork.kernel.org/project/linux-hwmon/list/ is my primary
means to track hwmon patches, and it isn't there.
If I don't the patch after the Ack, please resend and remember
to include the hwmon mailing list.

Thanks,
Guenter

> ---
> v3:
>   Change patch commit message.
>   Add vendor delta to the compatible property.
> ---
> v2:
>   Change the patch subject.
> ---
>  Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> new file mode 100644
> index 000000000000..32d89e4f4956
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> @@ -0,0 +1,11 @@
> +Bindings for Delta Electronics DPS-650-AB power supply
> +
> +Required properties:
> +- compatible : "delta,dps650ab"
> +- reg        : I2C address, one of 0x58, 0x59.
> +
> +Example:
> +	dps650ab@58 {
> +		    compatible = "delta,dps650ab";
> +		    reg = <0x58>;
> +	};
> -- 
> 1.8.3.1
> 
