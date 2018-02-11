Return-Path: <cyrilbur@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::241; helo=mail-pl0-x241.google.com;
 envelope-from=cyrilbur@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bTZ8TE+5"; 
 dkim-atps=neutral
Received: from mail-pl0-x241.google.com (mail-pl0-x241.google.com
 [IPv6:2607:f8b0:400e:c01::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zfkg62G8czF0W8
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 09:55:58 +1100 (AEDT)
Received: by mail-pl0-x241.google.com with SMTP id 11so4152625plc.9
 for <openbmc@lists.ozlabs.org>; Sun, 11 Feb 2018 14:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LsATxYCmI1MrC+Y0z7DU0h+NfJbF8EHWbvp4UJctwxU=;
 b=bTZ8TE+5/+UbYMWmf75XMjm7d8LOYEx0nTskh+ZdxT0Trjj8aOPV8/seJ2HhEl/Nne
 fPbb1q0aO79JKlKPWy8rOdlnW+wAqfIc167rTRqSpCsnmSur3pCE6BCAhnPuWv9OJIuS
 vps+Usbrxdi6noFL7JkAzWi8dw+WzyVqgNE+uApNzFbMIEkhMShf9/XyFiCgw/DaLomJ
 SM3MHm+EeR0jVeouhP8Pi/dU7i/76i9L2mzJY90cFx4bkZiWiYaXpEt6R0J56NqZOhG6
 5uNmiiQ4S1ceBGZ2v2Gf0rRxXX956nApRzN5m8JB0/zR9Om3f8HL7Ky+TW+Byos/QGaQ
 fEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LsATxYCmI1MrC+Y0z7DU0h+NfJbF8EHWbvp4UJctwxU=;
 b=NoKIY2BGZAWr0qxvS7zl+LPLZmRTnL8Vk06PXqCWRmCy6guaK3oNbig3flVunxcD6X
 n2Oyof/tsB7HokEFuYa7egBKxaOkdoLlsrkKPd64JwWqovgKZrwERR84mdabswhpO3Mu
 X3JUtfGimGihe/k8mmowv+uG81E/V18b7xYl4hqgd3IMs7PeNyS1aujWj0/ekjBsHefL
 arxe0az05C8WhvEm9ATZwYTlOxLeew7Z+/mdP5WeQQDH/1IrtW6pmVNTRJ+GyE8tysbZ
 0RZ90q22/8HnFKxaaDg4cVS5LWTE92t/2SOkIwvlv9bwmdO/4JCsRW0yjtZBhhYrENO7
 991w==
X-Gm-Message-State: APf1xPAyBRJ4nZOJA6pJvs7V55nLpnxIVnsnDcLUdcewnU5H37N9K6T3
 haUWDevDAwpo8098AFvQwrA=
X-Google-Smtp-Source: AH8x22748o/n/zQpYud6/nU/0q6vaccenSkOiu7XXbMwbJw7tYP/5EmpG5m3QoeqLIcWuV48Cw5O/g==
X-Received: by 2002:a17:902:7290:: with SMTP id
 d16-v6mr9240113pll.303.1518389755893; 
 Sun, 11 Feb 2018 14:55:55 -0800 (PST)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id a6sm17111595pgq.56.2018.02.11.14.55.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 11 Feb 2018 14:55:55 -0800 (PST)
Message-ID: <1518389751.6054.5.camel@gmail.com>
Subject: Re: [PATCH linux dev-4.13 v2 2/4] misc: aspeed-lpc: Request and
 enable LPC clock
From: Cyril Bur <cyrilbur@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Andrew Jeffery <andrew@aj.id.au>
Date: Mon, 12 Feb 2018 09:55:51 +1100
In-Reply-To: <20180209051158.32354-3-joel@jms.id.au>
References: <20180209051158.32354-1-joel@jms.id.au>
 <20180209051158.32354-3-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.5 
Mime-Version: 1.0
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
X-List-Received-Date: Sun, 11 Feb 2018 22:56:02 -0000

On Fri, 2018-02-09 at 15:41 +1030, Joel Stanley wrote:
> The LPC device needs to ensure it's clock is enabled before it can do
> anything.
> 
> Tested-by: Lei YU <mine260309@gmail.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/misc/aspeed-lpc-ctrl.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
> index b5439643f54b..4a818ad3827e 100644
> --- a/drivers/misc/aspeed-lpc-ctrl.c
> +++ b/drivers/misc/aspeed-lpc-ctrl.c
> @@ -7,6 +7,7 @@
>   * 2 of the License, or (at your option) any later version.
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/miscdevice.h>
>  #include <linux/mm.h>
> @@ -26,6 +27,7 @@
>  struct aspeed_lpc_ctrl {
>  	struct miscdevice	miscdev;
>  	struct regmap		*regmap;
> +	struct clk		*clk;
>  	phys_addr_t		mem_base;
>  	resource_size_t		mem_size;
>  	u32		pnor_size;
> @@ -180,6 +182,17 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
>  	if (!lpc_ctrl)
>  		return -ENOMEM;
>  
> +	lpc_ctrl->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(lpc_ctrl->clk)) {
> +		dev_err(dev, "couldn't get clock\n");
> +		return PTR_ERR(lpc_ctrl->clk);
> +	}
> +	rc = clk_prepare_enable(lpc_ctrl->clk);
> +	if (rc) {
> +		dev_err(dev, "couldn't enable clock\n");
> +		return rc;
> +	}
> +

Hi Joel,

Shouldn't you be calling clk_disable_unprepare() on error cases in the
rest of aspeed_lpc_ctrl_probe()?

Cyril
>  	node = of_parse_phandle(dev->of_node, "flash", 0);
>  	if (!node) {
>  		dev_err(dev, "Didn't find host pnor flash node\n");
> @@ -239,6 +252,7 @@ static int aspeed_lpc_ctrl_remove(struct platform_device *pdev)
>  	struct aspeed_lpc_ctrl *lpc_ctrl = dev_get_drvdata(&pdev->dev);
>  
>  	misc_deregister(&lpc_ctrl->miscdev);
> +	clk_disable_unprepare(lpc_ctrl->clk);
>  
>  	return 0;
>  }
