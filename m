Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfykX50QYzDqFH
 for <openbmc@lists.ozlabs.org>; Sat,  3 Jun 2017 20:59:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="AEXI9pOd";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pgiw8H288nr74Ewl+5uLws8QEHehVqLwfIqgDZAKJyU=; b=AEXI9pOdtbUxJdHR6V4YJjdwRt
 gvFxFmDiihHfAU3VyEpTLfXsNPzmVzXGE5/I3XJ66yNJOAjyOmTF/Y99bjPStQlx9lo6r/zhDlQsV
 2cAx0BdhwqwavDBwz2ZqvIXOrLcaHiakHyr2ImNb4N1IoPFtwFPau2ZSdZ8yjmZD7B8VFQaPLVaqX
 3Amwr4CSUmjRvIwfU1q/D6K3q/pjd5W4TNZk5apDg2saHcVYijACCbCafbHZ7R1EhXGJuWiUTTS9N
 Om5W6AvYJNd29Gam0utUGw96rfN7THAnj2gbVdjNYtNOEPVH4TQ0LZHyn760WmAuGr11fP//SfBcW
 TJoDJMpw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:42488 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.87) (envelope-from <linux@roeck-us.net>)
 id 1dH6lk-001TsI-Gj; Sat, 03 Jun 2017 10:58:57 +0000
Date: Sat, 3 Jun 2017 03:58:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stefan Schaeckeler <sschaeck@cisco.com>
Cc: Joel Stanley <joel@jms.id.au>, Jean Delvare <jdelvare@suse.com>,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH] drivers: hwmon: aspeed fan driver: call of_node_put() on
 a node not claimed
Message-ID: <20170603105855.GA16274@roeck-us.net>
References: <20170602194208.GA23541@sjc-ads-246.cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170602194208.GA23541@sjc-ads-246.cisco.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Jun 2017 10:59:01 -0000

On Fri, Jun 02, 2017 at 12:42:08PM -0700, Stefan Schaeckeler wrote:
> Delete call of_node_put() on a node not claimed with
> of_node_get() or by any other means such as for_each_child_of_node().
> 
> Signed-off-by: Stefan Schaeckeler <sschaeck@cisco.com>

Applied, but please cc linux-hwmon@vger.kernel.org in future patches.
Also please watch out for the subject line commonly used in hwmon drivers.

Thanks,
Guenter

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 48403a2..d9161cd 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -802,7 +802,6 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>  		if (ret)
>  			return ret;
>  	}
> -	of_node_put(np);
>  
>  	priv->groups[0] = &pwm_dev_group;
>  	priv->groups[1] = &fan_dev_group;
> -- 
> 2.9.3
> 
