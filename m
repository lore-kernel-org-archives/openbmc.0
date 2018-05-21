Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RzlVsKDq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="McrzYgXI"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40q75L1CjyzDqNY
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 15:44:38 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 79D7F20D5F;
 Mon, 21 May 2018 01:44:35 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Mon, 21 May 2018 01:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=q1MpigXihS0xUBH8pjCfrxqSKp7aR
 nXOWs4oNy9Z/ak=; b=RzlVsKDq5ubfUclmbHlGLiRUtifmloGFLiKaYe13eMylE
 HA8jtYahv3aDetXCapoxmSFAlGb+T7Bd+mt0lksimOvTRQSptR7UKXgZfJa2bqeC
 Tkf00/78wLRr61+pKOgtcCWaImA2drXg17ZY9a7db/xNBth5oAarCbh/gHGE1iNm
 v/w4b0QNiO9iRIHPVeuWI3GIygd/uPK3ChczTcELlfqLFt/A6SyG67kWayyNlp8T
 ovr8C5Vk5qIRfvhXdOOBLQdHtIaclRMSMJVTiXsdSM63biRE71PtH9nTtUcKsjZB
 PRTyvVjxv4bUMx7b/cK2dtKlIsJio7HRCcp/xgFHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=q1Mpig
 XihS0xUBH8pjCfrxqSKp7aRnXOWs4oNy9Z/ak=; b=McrzYgXI7oEpgPuOAiiaMf
 0BRQp/HvlYa4yAlH+sebvuqmE1ILjvqImKmlR/YXJbk3cO61TBSTRLhstNuv0QF0
 llAejhbV9gFXJEgmjkIFWGmaZVL/od4QFFnmSsqXDD4QM+M9CQJ5Gx5RcFae1XRI
 JXndxqG1mne12SR5LRgPSteMq3KnaOAxcTPt5Htge/qaU7weyNN/Nri7j/hFklWC
 6Bo9isZLJS0Lj1Ckcupf/H/uhBajFR9UHbAtCJPrbDPZ7/ilS/IjSameX0rBjq31
 KvMJDNbYrCdpz+CbIme/Df0Bs/SZYO3JT3s8PHLzGn81dv2Sj/wcyqJhRoCawyXg
 ==
X-ME-Proxy: <xmx:w1wCWzyTA_KszYcLQ_fcNQf9NZTj60LZiNR1kykNr2wfSBIn6wz0Jw>
X-ME-Proxy: <xmx:w1wCW3oY_kX2I_fkUlWJthKYJ4e-dyxdVcxEYLaC2aZry_hCzu1vag>
X-ME-Proxy: <xmx:w1wCWxyZYbY1EeXpZzmuHFNtwa1R0RnMJuacrWR-Um-dwTyTuoUiXA>
X-ME-Proxy: <xmx:w1wCW7ptIkzuay66cMnbtPi4ll1ramj9RuF0cYV7tEEx5lFO6khM-w>
X-ME-Proxy: <xmx:w1wCWxd0fHk8gA-NI1BLlJIpBbUTJXshZpoLehu96S-EbYLpWM1jTw>
X-ME-Proxy: <xmx:w1wCW_T-3uHVA19U-rfeOZqEGlLS5TcLRa-1kqeJUF4xZzijLzLw7w>
X-ME-Sender: <xms:w1wCW8eOPbvJQAxp8B7TexXvxpNjD1rIgguemAEJb9FQshlQ_lKxnQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 39F5A40DC; Mon, 21 May 2018 01:44:35 -0400 (EDT)
Message-Id: <1526881475.2648677.1378959216.39A6553A@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-a224ff37
Subject: Re: [PATCH linux dev-4.13 4/4] fsi/occ: Don't set driver data late
In-Reply-To: <20180518013500.18005-4-benh@kernel.crashing.org>
References: <20180518013500.18005-1-benh@kernel.crashing.org>
 <20180518013500.18005-4-benh@kernel.crashing.org>
Date: Mon, 21 May 2018 15:14:35 +0930
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
X-List-Received-Date: Mon, 21 May 2018 05:44:38 -0000

On Fri, 18 May 2018, at 11:05, Benjamin Herrenschmidt wrote:
> Until now, the OCC driver was setting the driver data after
> registering the character device and the hwmon device.
> 
> This might have been intentional, as doing so makes the initial
> probe of the OCC by the hwmon device fail while the data is NULL
> (provided you are lucky and the hwmon driver doesn't get bound
> asynchronously). That failure used to be necessary, otherwise
> the driver would try to access the SBE fifo at a time when it's
> not ready, causing all sort of problems.
> 
> The new SBE fifo driver is much more robust and will return an
> appropriate error code, so that (fragile) tweak is no longer
> necessary.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

+1000

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/fsi/fsi-occ.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index 4bda1b435ecb..170fd8020829 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -836,6 +836,8 @@ static int occ_probe(struct platform_device *pdev)
>  		occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX, GFP_KERNEL);
>  	}
>  
> +	platform_set_drvdata(pdev, occ);
> +
>  	snprintf(occ->name, sizeof(occ->name), "occ%d", occ->idx);
>  	occ->mdev.fops = &occ_fops;
>  	occ->mdev.minor = MISC_DYNAMIC_MINOR;
> @@ -854,8 +856,6 @@ static int occ_probe(struct platform_device *pdev)
>  	if (!hwmon_dev)
>  		dev_warn(dev, "failed to create hwmon device\n");
>  
> -	platform_set_drvdata(pdev, occ);
> -
>  	return 0;
>  }
>  
> -- 
> 2.17.0
> 
