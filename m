Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.196; helo=mail-oi1-f196.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42RhSl10qszF3cC;
 Sat,  6 Oct 2018 06:39:34 +1000 (AEST)
Received: by mail-oi1-f196.google.com with SMTP id 22-v6so10460316oiz.2;
 Fri, 05 Oct 2018 13:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CkGf5wPbkzH+vS8XlJqtwYTTlXEgJeIqSANdnaucbS8=;
 b=cWl6/erzAuzqGwzH+7QpgsPY85YlfgCU0uyAmnIlGPYK4FzXnfQIB/lLknHpZyH3Ou
 X5k8odoVv+8/Kp1ktHTIm+pq+QK2/UbXT7aOGTD+g2LmQwVp8buGzP5oe+hoWfqE4MbD
 U9GNbMprSmnXTLUfWgUuUVKuIB8ZzY9tmydxYvCW2Bn6147WG8W84wNySkUZWzDiVyQC
 yHNoWhRgddWEjWjlhl4nKiK0Arp/Dp8iG614mDMLvzW04Qdi7Nddub/XjuzSNd3vp/D1
 z1raokvBP+/LSXnRKY9CQOIaCTgYzDN19n6NL2ZQR5GbMWilMp8qOJH7CfIS63VPb4wd
 SROg==
X-Gm-Message-State: ABuFfojHPdrgFFAFevZpRUxDMEubY75I59wpdPGoy9+JLL57TJXL7N6c
 fnb6mgKCmlYY/QGnQiUTxA==
X-Google-Smtp-Source: ACcGV61wp/mP4pV+/lqEXLgdRNt88FJ+ZfOJRZ11Iy5h9LIMFlGS+hTAPd2GRLaVzK8xJx0B77njsg==
X-Received: by 2002:aca:e6c4:: with SMTP id
 d187-v6mr299340oih.237.1538771972110; 
 Fri, 05 Oct 2018 13:39:32 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 14sm691458otk.49.2018.10.05.13.39.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Oct 2018 13:39:31 -0700 (PDT)
Date: Fri, 5 Oct 2018 15:39:30 -0500
From: Rob Herring <robh@kernel.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH i2c-next v6 1/5] dt-bindings: i2c: Add 'timeout-ms' and
 '#retries' properties as common optional
Message-ID: <20181005203930.GA12987@bogus>
References: <20181004204322.20665-1-jae.hyun.yoo@linux.intel.com>
 <20181004204322.20665-2-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181004204322.20665-2-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Fri, 05 Oct 2018 20:39:35 -0000

On Thu, Oct 04, 2018 at 01:43:18PM -0700, Jae Hyun Yoo wrote:
> This commit adds 'timeout-ms' and '#retries' properties as common
> optional properties that can be used for setting 'timeout' and
> 'retries' values of 'struct i2c_adapter'. With this patch, the bus
> timeout value and the master transfer retries count can be set
> through these properties at the registration time of an adapter.
> Still the values can be set by I2C_TIMEOUT and I2C_RETRIES ioctls
> on cdev at runtime too.
> 
> These properties may not be supported by all drivers. However, if
> a driver wants to support one of them, it should adapt the
> bindings in this document.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index 11263982470e..6d7a6e919cf8 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -80,6 +80,12 @@ wants to support one of the below features, it should adapt the bindings below.
>  	Names of map programmable addresses.
>  	It can contain any map needing another address than default one.
>  
> +- timeout-ms

bus-timeout-ms in case we have some other timeout needed.

> +	Bus timeout in milliseconds.
> +
> +- #retries
> +	Number of retries for master transfer.
> +
>  Binding may contain optional "interrupts" property, describing interrupts
>  used by the device. I2C core will assign "irq" interrupt (or the very first
>  interrupt if not using interrupt names) as primary interrupt for the slave.
> -- 
> 2.19.0
> 
