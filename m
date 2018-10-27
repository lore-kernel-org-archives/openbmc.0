Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AFgTj4Om"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42j78y0wRPzF0h9
 for <openbmc@lists.ozlabs.org>; Sun, 28 Oct 2018 04:27:29 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id z2-v6so1974982pgp.0
 for <openbmc@lists.ozlabs.org>; Sat, 27 Oct 2018 10:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=P1O500X1TTR8Xl8kYycFNw5YkkZvbdiQTaHr8j1ZkFs=;
 b=AFgTj4Omrg+5Lu711Vfkwo8hKv5d5MLb274dQ2VEzEhYPkj3OIkT1OzaEXGyRm/mOi
 e0KsX292gas1tjVA02jPSF7IACvgyKic790iyTzrxp8a5IWSradU0KlPc4xae8HY4FLX
 kSiMSqvlJY0nzlpcGj1rvA2UI72Y3lS891Dd/5W+pov7KzqEYfKWqIZx7CSdHVNfzD41
 8kfjG5ON5Bqrvmv4WJcub40KUM8ig4D7BsHK/HRvbKkD8nnocWaXYAvJeTb4gSLPG+hN
 ZBtNUFIuGO/EHCJGDx8Gmo6XpIgouHKdamEWmuqACKzmG8YABh6XKAuM+b3Qcul6bDKN
 bP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=P1O500X1TTR8Xl8kYycFNw5YkkZvbdiQTaHr8j1ZkFs=;
 b=uiNw5vDBclOPuQU6158pWZcpCfydZ6tB0z1KszZak8oP/warvxmCRsmgcAC4EW/3wj
 +UPnlz0aJPH7M8BwF5lNbQUO3k5JaqjOnObT5lfKCCeVv6SWnm2Euni9Pq6Vf5OAUSws
 p7NkF7Vi4CUQdUAQ6rtNAExUn/6pqQMwNutbar0ZMutK2SOZRMD0kk1DELQUm1GUi7o7
 nN1Z3xQgX+m+SgxUYg2Hd8djJN9hBpQXO6gHggkbgg1ny85/MmwvMeKRJ2A9z2PeBbtH
 rwQofGZzjEBotd5ZdYtebhespbEgSiq2+LDtzC0WbOnRLONz/Z6UP5V36YkQh74hRBm3
 Mb7Q==
X-Gm-Message-State: AGRZ1gJtBkdKgY3Y7BXjiiieMVnsNY8KsT+Ai15iQmM45gJ57ph0M3FI
 KCLe6H+JhiIuYqRetwtmBmU=
X-Google-Smtp-Source: AJdET5cRAX10dZ7BbvEEp1m/czoIcqqe9ZP8LQ9Q8fTQU/u06jt1jjLNY/xYOHTxp9Rak09FCWK/vg==
X-Received: by 2002:a63:4243:: with SMTP id
 p64-v6mr7860180pga.127.1540661247370; 
 Sat, 27 Oct 2018 10:27:27 -0700 (PDT)
Received: from localhost (99-61-165-247.lightspeed.sntcca.sbcglobal.net.
 [99.61.165.247])
 by smtp.gmail.com with ESMTPSA id s13-v6sm41097228pgs.76.2018.10.27.10.27.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Oct 2018 10:27:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 27 Oct 2018 10:27:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kun Yi <kunyi@google.com>
Cc: no To-header on input <;, openbmc@lists.ozlabs.org,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: Add adm127x documentation
Message-ID: <20181027172725.GA24915@roeck-us.net>
References: <20181017222710.254994-1-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017222710.254994-1-kunyi@google.com>
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
X-List-Received-Date: Sat, 27 Oct 2018 17:27:31 -0000

On Wed, Oct 17, 2018 at 03:27:09PM -0700, Kun Yi wrote:
> adm127x are hot-swap controllers that allow a circuit board to be removed from
> or inserted into a live backplane. This patch adds the device tree
> bindings documentation.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  .../devicetree/bindings/hwmon/adm1275.txt     | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> new file mode 100644
> index 000000000000..1ecd03f3da4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> @@ -0,0 +1,25 @@
> +adm1275 properties
> +
> +Required properties:
> +- compatible: Must be one of the supported compatible strings:
> +	- "adi,adm1075" for adm1075
> +	- "adi,adm1272" for adm1272
> +	- "adi,adm1275" for adm1275
> +	- "adi,adm1276" for adm1276
> +	- "adi,adm1278" for adm1278
> +	- "adi,adm1293" for adm1293
> +	- "adi,adm1294" for adm1294
> +- reg: I2C address
> +
> +Optional properties:
> +
> +- shunt-resistor-micro-ohms
> +	Shunt resistor value in micro-Ohm
> +
> +Example:
> +
> +adm1272@10 {
> +	compatible = "adi,adm1272";
> +	reg = <0x10>;
> +	shunt-resistor-micro-ohms = <500>;
> +};
