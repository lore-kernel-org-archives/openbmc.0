Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPFV74tXvzDq6y
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 11:14:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=N6oyFwSS; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id u190so214933pfb.2
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2016 17:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tBOk3fKe/4By7NbPaqite+GQhYejwSRNQIFA4hm17Nw=;
 b=N6oyFwSSAVZZkkvJmcxvT888t3/KOHChyHigeiHqxuLnNlJr9WbkIoYjY3ji/bf160
 WrnVEeW/lb5AsyV5a3Ga6MA8obsRAv+8v6lhfzHttc/vTVHC/dEAKczrrlaFyQB+gDZN
 +ex2kPuYrmZ3CxfZkrmiHODuDkpUiqZLHkHV8xX49Uh3Nnyjr8dJx8RR2C2p6/H0agPT
 xrwrOG47JfYuXzvVEXW14YMsgXnvlMet1KMo13rUA6wVGEpBcDxhMZiOkbibC1jVbTc3
 oU/N3w6Et5XB41m6G2pAQ3So9kfuF4yh/ZQ6WBFP9r2gchVJBVfaBCHQab2FgEljH3ul
 z7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tBOk3fKe/4By7NbPaqite+GQhYejwSRNQIFA4hm17Nw=;
 b=Vzk+BgmdVVQiaIkGK/TNqx7wDHf/VuErNKTV1rPLETl9IRTbGMI9emWvc3gCE2yITY
 /nL6Pw6I/A3sIUCCNq5Jg3wgM6jHKzOvhRME8RAqk/7jXnpBiUY1B/rAKWj2gsyI1xHO
 do7obJHotPZS7mwJdaxvj6FVvPgEViNRMJZ8y9bu/wbQeHqwIeyGs8gTP3Xf4/mc6PLv
 BM2zC+8OOqsZo6srDD39Z2/uvE3McfOsIwl/dWonQtluEA1uEDwkKO9Jm9poBqHI5niv
 L4b3QPJnyBae1DYUsa4ecqTqpk3KTI0VF9GijzBuPMCmqSHjdnuHG8MsJZrxJOb94y12
 0xfw==
X-Gm-Message-State: AD7BkJIQco5j8CX5zSkTIZ+z+8btKVgotf09YAkLW00BWt2K8Opeyj9l55gcKCm1+rZEIw==
X-Received: by 10.98.42.20 with SMTP id q20mr34570292pfq.146.1458000861921;
 Mon, 14 Mar 2016 17:14:21 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id q26sm34719293pfi.57.2016.03.14.17.14.19
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 14 Mar 2016 17:14:21 -0700 (PDT)
Date: Tue, 15 Mar 2016 11:14:14 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: miltonm@us.ibm.com
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot 2/5] net: aspeednic: Do not start hardware in
 initialize
Message-ID: <20160315111414.6ac649b8@camb691>
In-Reply-To: <1457721644-29871-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457721644-29871-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457721644-29871-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Mar 2016 00:14:24 -0000

On Fri, 11 Mar 2016 12:40:41 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: "Milton D. Miller II" <miltonm@us.ibm.com>
> 
> Delete the call to aspeenic_init from the aspeenic_initialize
> function.  Instead rely on the framework to call the write_hwaddr
> method to set the MAC address for the operating system to use.
> 
> The aspeednic driver was calling init before registering the
> hardware, causing the dma engine to be left running writing
> incoming ethernet packets to memory when handing control to the
> operating system.
> 
> The initialize function is specifically documented to not touch
> the hardware or probe in doc/README.drivers.net.
> 
> Also, the init method can take a significant amount of time
> especially when NC-SI and retries are involved.  In addition
> extra work is being performed to find the MAC address which the
> framework will do again later.
> 
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>

Reviewed-by: Cyril Bur <cyrilbur@gmail.com>

> ---
>  drivers/net/aspeednic.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
> index b8ce24c..90c0f0d 100644
> --- a/drivers/net/aspeednic.c
> +++ b/drivers/net/aspeednic.c
> @@ -574,8 +574,6 @@ int aspeednic_initialize(bd_t *bis)
>      udelay(10 * 1000);
>    }
>  
> -  dev->init(dev, bis);
> -
>    eth_register(dev);
>  
>  #if defined(CONFIG_MII) || defined(CONFIG_CMD_MII)
