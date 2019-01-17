Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mLcpzNHG"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43gc064hfMzDqs3
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jan 2019 07:59:50 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id 64so5400063pfr.9
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 12:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wnubO1lujWGA0YOWaVjKgFKf1tN0F6G5nRARQJOP2rI=;
 b=mLcpzNHGD3d89yoeoMgHrAJx1QiJ/X6btQFc5h0vzgFq5GZnL837St0z8eh3CZVGHV
 HjrnAG5hYttO9C/ESDm78D9maRQeWol8bGSa2x5Zj+3yCwp4RKZnaj/OR5rQjFpF5Hr0
 A44ejAVHdYr7Quae0j9JCvJPvTo/rWZGCAyzKrvyxXSnTP9eiSBDMYkrxl1ioAJf6qEw
 HAjWrQG78RjRY3QqyZBuepfne0kfAo55LewRZAZyt2fKgQslKmEYGlpxCcfstquw6kCA
 iZ8aNugoWVRUTp0wWstti8HavOQTLAz9M+lRT0Xps+XJfIblu57PYPiG7nGfxDwi8FIP
 wi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=wnubO1lujWGA0YOWaVjKgFKf1tN0F6G5nRARQJOP2rI=;
 b=LVi4gKinTxCj1J3aQ5Zx8NznNSo+WVlRzkvEoSaTfxJdtdhwv/b1aoOzUGCaM/LNP/
 CG6wYALIEO/FrxsHjdwwxI85A4MaJUf/Xd1HdssPUrYcwN+88247MVdvQp5QBGp0LQRU
 jXWi2ISTlj6Ist/FKD8CC453SFGgnqe6EIePJXpfuvMdOIDUDq8cKUSloinEUrSnQQ1m
 u3zHg0YFBorfSMBClE/17wA6D5U/IEh/nZLSQL2ctsDLYMZMVbGrm2ZBbNl/xaCCC7z1
 FvzJz5M+FIVWGMlwpjZSZHhe2d69YkCyHziqd3UehL/bUs4Ig5iC08LuWoqKUkViBpOf
 0s9Q==
X-Gm-Message-State: AJcUukcx9Hr52jkB3btvOPS6Xu6ggsaOsdl1HzGCzZxpi8Zgt474uAEy
 Rcm58EupXM5yQUPVro2H2BA=
X-Google-Smtp-Source: ALg8bN7nHG4HlG/JQTJ74qMuX+s0deveSgJVPEEd6EFUmFBmxfSp0htuqOAgwcIUTgogWR4RQ4a5RA==
X-Received: by 2002:a63:ff62:: with SMTP id s34mr14958572pgk.325.1547758787915; 
 Thu, 17 Jan 2019 12:59:47 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id t24sm3355178pfh.21.2019.01.17.12.59.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jan 2019 12:59:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 17 Jan 2019 12:59:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, shunyong.yang@hxt-semitech.com,
 dongsheng.wang@hxt-semitech.com
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: add dps650ab documentation
Message-ID: <20190117205946.GA11509@roeck-us.net>
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
X-List-Received-Date: Thu, 17 Jan 2019 20:59:51 -0000

On Thu, Jan 10, 2019 at 10:24:33AM +0800, Xiaoting Liu wrote:
> Bindings for Delta Electronics DPS-650-AB power supply.
> 
> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>

Applied to hwmon-next.

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
