Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPFfd4x3WzDq6y
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 11:21:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GU9mMqaq; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id q129so232332pfb.3
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2016 17:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0HJj6FYADkckGklqzaWxbC+70ssQxuNjrLjmuYrxuRI=;
 b=GU9mMqaqcjz++VQ9cF/3uSR7V4mtRy/5gdnYCpJc8Hhw6pQ9FHkRanqcxOTy9Ysvsw
 Y6SqbQTX6EVeqHFqRZWS3B8GiPF8yZKOZpJLkKQBIU99pEGVTGnYp1297mbq/euonQo2
 AIZ76Mht9gXRFXa+899b5f7k9fhyNU04dV9GwG6jS9Z2ZQy0Y+AwQIZUzsAkDF0dlz5K
 +enH1cf0LZyRKaXX6JPdkBqb3MOtWMS80P4Qb9Pgx0Qks8H3cC9fPX7sCpZIMtVjy+7F
 u7Keew6Qf8m90ALzB54pX/iyAYyssGcmJUx2s0IZxWgvLY4SxdA2IbQUUAAMdheSvQCs
 dg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0HJj6FYADkckGklqzaWxbC+70ssQxuNjrLjmuYrxuRI=;
 b=LU9ikFX/FATVdKkOQR5FESENnS/eYM3BEU2VdShUY42qUlTjrU5dz2unm+RI3penIK
 mDL9aW5zil/mMwuX64oYP5O8sI96qpFsxqsP/w0nNMg/pgzYlKrwxeL/xhRBNWugi6Om
 4PR1otPNNEhfLitkZVjL3gsIj/psNuha4UGp7WcM/4YVBkAM1Z+8zMRY/+e5mC0xxszq
 e4PZS4znWW/1Xoed7nNqYZvUTlVr59rH3cpXFbxRuxr7LIbaESUiH/QjDxKlBjo2Sv8g
 mlLcjrHJD3/o+v2MkdtOn56G8sTn1O0KTZLOr8ZQ3jhkyTzTWM2VvjRVk8keoDK1oJeU
 HIvA==
X-Gm-Message-State: AD7BkJJgsEmm0fbhesLieEBDVT5LX2LvzwgLjeNrQFMq7EXYccHFLumjGcurZDOGmVRtWQ==
X-Received: by 10.98.16.69 with SMTP id y66mr34255526pfi.86.1458001303550;
 Mon, 14 Mar 2016 17:21:43 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id m89sm2555375pfi.12.2016.03.14.17.21.41
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 14 Mar 2016 17:21:43 -0700 (PDT)
Date: Tue, 15 Mar 2016 11:21:33 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: miltonm@us.ibm.com
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot 4/5] net: Implement random ethaddr fallback in eth.c
Message-ID: <20160315112133.02fb3d3e@camb691>
In-Reply-To: <1457721644-29871-5-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457721644-29871-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457721644-29871-5-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Mar 2016 00:21:46 -0000

On Fri, 11 Mar 2016 12:40:43 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Joe Hershberger <joe.hershberger@ni.com>
> 
> Commit bef1014b31c5b33052bcaa865ba3618d73e906f0 upstream.
> 
> Backport changes CONFIG_NET_RANDOM_ETHADDR to CONFIG_RANDOM_MACADDR,
> net_random_ethaddr to eth_random_enetaddr, and is_zero_ethaddr to
> is_zero_ether_addr, and keeps existing function order.
> 

Should s/CONFIG_NET_RANDOM_ETHADDR/CONFIG_RANDOM_MACADDR/ have been done
everywhere? It would be best that the README files still reflect what the code
actually does no?

Cyril

> Upstream log:
> 
> Implement the random ethaddr fallback in eth.c so it is in a common
> place and not reimplemented in each board or driver that wants this
> behavior.
> 
> Signed-off-by: Joe Hershberger <joe.hershberger@ni.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> Signed-off-by: Milton D. Miller II <miltonm@us.ibm.com>
> ---
>  README              |  3 ++-
>  doc/README.enetaddr |  2 ++
>  net/eth.c           | 13 ++++++++++++-
>  3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/README b/README
> index bcfffc3..e06dc8a 100644
> --- a/README
> +++ b/README
> @@ -4764,7 +4764,8 @@ o If both the SROM and the environment contain a MAC address, and the
>    warning is printed.
>  
>  o If neither SROM nor the environment contain a MAC address, an error
> -  is raised.
> +  is raised. If CONFIG_NET_RANDOM_ETHADDR is defined, then in this case
> +  a random, locally-assigned MAC is used.
>  
>  If Ethernet drivers implement the 'write_hwaddr' function, valid MAC addresses
>  will be programmed into hardware as part of the initialization process.	 This
> diff --git a/doc/README.enetaddr b/doc/README.enetaddr
> index 1eaeaf9..611d5a4 100644
> --- a/doc/README.enetaddr
> +++ b/doc/README.enetaddr
> @@ -37,6 +37,8 @@ Correct flow of setting up the MAC address (summarized):
>     environment variable will be used unchanged.
>     If the environment variable is not set, it will be initialized from
>     eth_device->enetaddr, and a warning will be printed.
> +   If both are invalid and CONFIG_NET_RANDOM_ETHADDR is defined, a random,
> +   locally-assigned MAC is written to eth_device->enetaddr.
>  4. Program the address into hardware if the following conditions are met:
>  	a) The relevant driver has a 'write_addr' function
>  	b) The user hasn't set an 'ethmacskip' environment variable
> diff --git a/net/eth.c b/net/eth.c
> index 321d5b1..22d5adb 100644
> --- a/net/eth.c
> +++ b/net/eth.c
> @@ -109,6 +109,7 @@ static int __def_eth_init(bd_t *bis)
>  {
>  	return -1;
>  }
> +
>  int cpu_eth_init(bd_t *bis) __attribute__((weak, alias("__def_eth_init")));
>  int board_eth_init(bd_t *bis) __attribute__((weak, alias("__def_eth_init")));
>  
> @@ -214,7 +215,17 @@ int eth_write_hwaddr(struct eth_device *dev, const char *base_name,
>  		eth_setenv_enetaddr_by_index(base_name, eth_number,
>  					     dev->enetaddr);
>  		printf("\nWarning: %s using MAC address from net device\n",
> -			dev->name);
> +		       dev->name);
> +	} else if (is_zero_ether_addr(dev->enetaddr)) {
> +#ifdef CONFIG_RANDOM_MACADDR
> +		eth_random_enetaddr(dev->enetaddr);
> +		printf("\nWarning: %s (eth%d) using random MAC address - %pM\n",
> +		       dev->name, eth_number, dev->enetaddr);
> +#else
> +		printf("\nError: %s address not set.\n",
> +		       dev->name);
> +		return -EINVAL;
> +#endif
>  	}
>  
>  	if (dev->write_hwaddr &&
