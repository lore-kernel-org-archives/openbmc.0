Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WjDriN24"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="E9QjblPc"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znfC72nmzzF1hl
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 15:59:14 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CFE6A20D97;
 Thu, 22 Feb 2018 23:59:12 -0500 (EST)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 22 Feb 2018 23:59:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=nYQfQGcyPBKKDNJE3V2AEa7Vmtv0x
 i5o94886HEk+98=; b=WjDriN24SA7ht7q28XZ671sfKLLE3a+RMUWaOdArOXkm/
 MfV8S/rG2e2SbfKn7xa3e1b8HKspSEjiQ7oeZzCh60g/uYTGus3U5If/nRTccdz9
 PKbtpdRtSEJKRQmNWEc8J4j7wLAKl2PyofMAr4s0sce2AeoaqwCZ0sdITKHZR0zG
 T6vq7vy4CY9HibFX3W0fBLTHbpoOq4/mmATD+ZZLz6EXBDYqLDDSJxqecFGiCtCy
 zhewk1l5rbf10eX7uWPJM0XEYDdWf0PqMOVwDzlE4TbRm2lew/3jSsxn1KXpoTcd
 5AWkPkhQUJSzh7ox9DlOexC3P+hplNkwgwBZEFPGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nYQfQG
 cyPBKKDNJE3V2AEa7Vmtv0xi5o94886HEk+98=; b=E9QjblPcFCaeJkaAiT9rYR
 MLCa+xlg8qJP7ySnUvgOpGJ2VrneWsag6XqYUnsfvlcaUw5GowSGZ1nqZVsB5ocJ
 rJhr+KuZQ+pvuFWAKFeLNdfylEnRBjgcnDyiZU/T8W3VyBym8J+cmbTRdgk8vh+L
 2+3R4IaRVs4EWn7NQ2sE6WyNjtayxNh6hO7UbenOncSI4dWNbeMz/i5Fw9xKjDVg
 4SkQxFgmYyJNGaaVyFeLqgc2MQFr1NjO/6xqnBo/HZzHJx7CfYX+D6/b61XU/iaM
 PQQUD17cDvrnQjTjmgrxfm3xGOUYhiS8GBx57pCxf0h+tsWelCa8cts06dYZVObA
 ==
X-ME-Sender: <xms:oJ-PWrigmGFSYLQJXbMUz33eLuHf-RxJNcG5alRaE7ZyER-uRBx1rQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id AD26FBA43B; Thu, 22 Feb 2018 23:59:12 -0500 (EST)
Message-Id: <1519361952.1152684.1280533336.218F419D@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-efbb3405
In-Reply-To: <1519162059-7210-3-git-send-email-eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH linux dev-4.13 2/2] drivers: occ: Create hwmon platform
 device directly
References: <1519162059-7210-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1519162059-7210-3-git-send-email-eajames@linux.vnet.ibm.com>
Date: Fri, 23 Feb 2018 15:29:12 +1030
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
X-List-Received-Date: Fri, 23 Feb 2018 04:59:16 -0000

On Wed, 21 Feb 2018, at 07:57, Eddie James wrote:
> Previously, the OCC driver parses the device tree and creates platform
> devices for each child node found there. This was used to probe the
> OCC hwmon devices. However, this doesn't make sense since hmwon isn't a
> device. Therefore, just directly create a platform device for each OCC
> for the hwmon driver to probe.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>

This reduces our dependence on bad devicetree practices, so:

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/fsi/fsi-occ.c      | 29 ++++++++++++-----------------
>  drivers/hwmon/occ/p9_sbe.c |  6 ------
>  2 files changed, 12 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index 1713550..8a1d0a1 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -21,7 +21,6 @@
>  #include <linux/mutex.h>
>  #include <linux/fsi-occ.h>
>  #include <linux/of.h>
> -#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> @@ -737,24 +736,24 @@ void occ_drv_release(struct occ_client *client)
>  
>  static int occ_unregister_child(struct device *dev, void *data)
>  {
> -	struct platform_device *child = to_platform_device(dev);
> +	struct platform_device *hwmon_dev = to_platform_device(dev);
>  
> -	of_device_unregister(child);
> -	if (dev->of_node)
> -		of_node_clear_flag(dev->of_node, OF_POPULATED);
> +	platform_device_unregister(hwmon_dev);
>  
>  	return 0;
>  }
>  
>  static int occ_probe(struct platform_device *pdev)
>  {
> -	int rc, child_idx = 0;
> +	int rc;
>  	u32 reg;
>  	struct occ *occ;
> -	struct device_node *np;
> -	struct platform_device *child;
> +	struct platform_device *hwmon_dev;
>  	struct device *dev = &pdev->dev;
> -	char child_name[32];
> +	struct platform_device_info hwmon_dev_info = {
> +		.parent = dev,
> +		.name = "occ-hwmon",
> +	};
>  
>  	occ = devm_kzalloc(dev, sizeof(*occ), GFP_KERNEL);
>  	if (!occ)
> @@ -796,14 +795,10 @@ static int occ_probe(struct platform_device *pdev)
>  		return rc;
>  	}
>  
> -	/* create platform devs for dts child nodes (hwmon, etc) */
> -	for_each_available_child_of_node(dev->of_node, np) {
> -		snprintf(child_name, sizeof(child_name), "occ%d-dev%d",
> -			 occ->idx, child_idx++);
> -		child = of_platform_device_create(np, child_name, dev);
> -		if (!child)
> -			dev_warn(dev, "failed to create child node dev\n");
> -	}
> +	hwmon_dev_info.id = occ->idx;
> +	hwmon_dev = platform_device_register_full(&hwmon_dev_info);
> +	if (!hwmon_dev)
> +		dev_warn(dev, "failed to create hwmon device\n");
>  
>  	platform_set_drvdata(pdev, occ);
>  
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index 7dbe4d5..451a393 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -140,15 +140,9 @@ static int p9_sbe_occ_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static const struct of_device_id p9_sbe_occ_of_match[] = {
> -	{ .compatible = "ibm,p9-occ-hwmon" },
> -	{ },
> -};
> -
>  static struct platform_driver p9_sbe_occ_driver = {
>  	.driver = {
>  		.name = "occ-hwmon",
> -		.of_match_table	= p9_sbe_occ_of_match,
>  	},
>  	.probe	= p9_sbe_occ_probe,
>  	.remove = p9_sbe_occ_remove,
> -- 
> 1.8.3.1
> 


-- 
  Andrew Jeffery
  andrew@aj.id.au
