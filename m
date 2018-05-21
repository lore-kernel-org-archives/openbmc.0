Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qlr4In+X"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Zp8BwFu4"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40q76b4sDlzF0wM
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 15:45:43 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5F08E21E2B;
 Mon, 21 May 2018 01:45:41 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Mon, 21 May 2018 01:45:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=965/qjPGfVSlq8Vsu+rRieO8wA1ro
 1sqyzbJteBRs/o=; b=qlr4In+Xi6r8CEcIxtbUeDkn0j98fnrTWLmwkOx0NcVox
 vEBYIBd8TsxDrneKu39m6kTIbeS9MI0TamZ4yOr9UlosBu62rV+dUwkkNdGIW1qe
 u8Qt+rCpoOAd0y8siMyPadZ5yO8vGKYCj4Yl06woS91NxhkN+ocPDfVNr+UE6uct
 kXHJvaB6DUax4vbgkUyMTDOBPxrlJqneWuerPj+p5lxdoSmtd6HvovqtmU9LT5u8
 88d7HBDObKpcOdsKZE1yZriCsiJW1JB0uQKBSZT86R2/vGVh9PhCkPu7Ja5QhRnV
 aPAoPvdKbOlEnG0qw/AS9UVeo6C63D78uzrSSuFjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=965/qj
 PGfVSlq8Vsu+rRieO8wA1ro1sqyzbJteBRs/o=; b=Zp8BwFu4YBw9QKi8K1qThy
 X163hyZqhdINnYHKez/2EqgtIHY580NJRwkE+sSQxTKsoxxnalW3p8xaCBmIRV4X
 S3CgNYwqAbETGbgAA3TOsigZuylhpYErA9vizr+ewru6kmBMEuGZR7aQ5jUZNctM
 nK8p9kfVjZEmiJ0cCgIwybi8WeKs9LflheLxXpwAT6dbS4EBWr7I9At0em/GFAaz
 ZPO9K4Nt2gustuA3cY4K13pVj+WblfdJw4TIOk7JGzMN1C3GZc9uT5tlczde6AmO
 lTlTTNUsZxG7A35qKwaw06Udq3pimNHGmeHo4ntGTcLHQ1TNg9FaB9zvF5DT0Tug
 ==
X-ME-Proxy: <xmx:BV0CW5DdbB27eOqGzIsPjXAd5c0ZEWZFSA9YRRWFwOxiGoITGnPj9Q>
X-ME-Proxy: <xmx:BV0CW--t-yjzhPRj5jL3yWdl_0AKvyMHtP1SzAUp3NRwn3cNFZuiKA>
X-ME-Proxy: <xmx:BV0CWx_RP2BFX1DaKimKStRezCjkkVqROFHr1POVR-MBSl1uxJJzpg>
X-ME-Proxy: <xmx:BV0CW9dnbORCrbbsyT1zBsWtI_AT1j0F_4uZlcHBnfWyKy3nWfTPtQ>
X-ME-Proxy: <xmx:BV0CWyHcCD7xJ0PTWVbLSDsywHzFm2Bp3Llw3A6J6d1-93fp3ylcjQ>
X-ME-Proxy: <xmx:BV0CW0W6uP3acOImBWkKe6SJmPartWcF5lENFmmltgb6EBMKcQySKw>
X-ME-Sender: <xms:BV0CWzOrusKturR0f7baZzU_sw8XF3k6HU-SgYmv7MH-MOJz0CpU9Q>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 2B2A240DC; Mon, 21 May 2018 01:45:41 -0400 (EDT)
Message-Id: <1526881541.2648797.1378961240.61A1FFDB@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-a224ff37
Subject: Re: [PATCH linux dev-4.13] hwmon/occ: Silence probe error message when
 host is shutdown
In-Reply-To: <20180518014311.20781-1-benh@kernel.crashing.org>
References: <20180518014311.20781-1-benh@kernel.crashing.org>
Date: Mon, 21 May 2018 15:15:41 +0930
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
X-List-Received-Date: Mon, 21 May 2018 05:45:44 -0000

On Fri, 18 May 2018, at 11:13, Benjamin Herrenschmidt wrote:
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/hwmon/occ/p9_sbe.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index 27886897a3d6..9a1d3ae56d69 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -110,6 +110,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>  static int p9_sbe_occ_probe(struct platform_device *pdev)
>  {
>  	struct occ *occ;
> +	int rc;
>  	struct p9_sbe_occ *ctx = devm_kzalloc(&pdev->dev,
>  						     sizeof(*ctx),
>  						     GFP_KERNEL);
> @@ -126,7 +127,12 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>  	occ->poll_cmd_data = 0x20;		/* P9 OCC poll data */
>  	occ->send_cmd = p9_sbe_occ_send_cmd;
>  
> -	return occ_setup(occ, "p9_occ");
> +	rc = occ_setup(occ, "p9_occ");
> +
> +	/* Host is shutdown, don't spew errors */
> +	if (rc == -ESHUTDOWN)
> +		rc = -ENODEV;
> +	return rc;
>  }
>  
>  static int p9_sbe_occ_remove(struct platform_device *pdev)
> -- 
> 2.17.0
> 
