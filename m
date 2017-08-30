Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhpfn6qZXzDq5b
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 12:02:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="0pQvQSNq";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xI+fWmdYlTDx65/Fj7bAUSm72QvCmLOuw1ZgfgA5MxI=; b=0pQvQSNq8njwWh7OOZZ+Pe0D75
 tKKN/TfY2QpwQtjvbbaMZBGLKy20vZsPaUi5WSLkfwWBAXxyC28FEIWpRpLteGmZ7SDTLxrN3OgYI
 9dda79u0fJsD2AAUfo37ihhX93VcXCishr7pRPfuSAkz3rVR7zXU6iHvEoFKofBcS2HPOuefT0QK6
 3jJbcG61rCrJiVcULZBdX97MAOwBKMNy6eXctbyqrMZeMOq5XQ4UTMnpjMufa96WDRbym1TP5Bo5W
 aYF30CWK9ajWwo2tcZaF9gpJRH6QUOd2Kt12oGUPer8SOGIHmkpLj71dhMHKDqbxPsmMLzNHWtWVU
 E1EpcoLA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:49808 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dmsKj-003RJy-M2; Wed, 30 Aug 2017 02:02:22 +0000
Date: Tue, 29 Aug 2017 19:02:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Xo Wang <xow@google.com>
Cc: jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [1/2] hwmon: (pmbus/lm25066) Offset coefficient depends on CL
Message-ID: <20170830020214.GA21901@roeck-us.net>
References: <20170829212117.143441-2-xow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170829212117.143441-2-xow@google.com>
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
X-List-Received-Date: Wed, 30 Aug 2017 02:02:26 -0000

On Tue, Aug 29, 2017 at 02:21:16PM -0700, Xo Wang wrote:
> When converting the DIRECT format CURRENT_IN and POWER commands, make
> the offset coefficient ("b") predicate on the value of the current limit
> setting.
> 
> Signed-off-by: Xo Wang <xow@google.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/lm25066.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> index a3d912cd3b8d..232b4af13e12 100644
> --- a/drivers/hwmon/pmbus/lm25066.c
> +++ b/drivers/hwmon/pmbus/lm25066.c
> @@ -488,16 +488,18 @@ static int lm25066_probe(struct i2c_client *client,
>  	info->m[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].m;
>  	info->b[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].b;
>  	info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
> -	info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
>  	info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
> -	info->b[PSC_POWER] = coeff[PSC_POWER].b;
>  	info->R[PSC_POWER] = coeff[PSC_POWER].R;
>  	if (config & LM25066_DEV_SETUP_CL) {
>  		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
> +		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
>  		info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
> +		info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
>  	} else {
>  		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
> +		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
>  		info->m[PSC_POWER] = coeff[PSC_POWER].m;
> +		info->b[PSC_POWER] = coeff[PSC_POWER].b;
>  	}
>  
>  	return pmbus_do_probe(client, id, info);
