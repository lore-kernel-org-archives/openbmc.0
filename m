Return-Path: <f.fainelli@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c44; helo=mail-yw1-xc44.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jSnlSt+Z"; 
 dkim-atps=neutral
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42pnh75QmRzF27h
 for <openbmc@lists.ozlabs.org>; Tue,  6 Nov 2018 09:40:39 +1100 (AEDT)
Received: by mail-yw1-xc44.google.com with SMTP id h21-v6so4375171ywa.3
 for <openbmc@lists.ozlabs.org>; Mon, 05 Nov 2018 14:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ke3psiyvAYjx3z57jrZiZhH5yaHJb1XSmwoVKkWSKVE=;
 b=jSnlSt+Z3homCR4+qZTEYsjHTHky6qOXIzhJHLx/WIvYNPxOBTlzXeTOrS6ah39iXW
 G3LlzCs8KnyORwAsxQLLJD0exYv1YbH/73vV6b3ZB498aI44Lsq8yfH08eHTzjBe8yAv
 pgJbOs+GE7nDZAEhcD9flSe1eHn8TW0WJGNtmL0WBiQNT/czIpS6HUwJtDDaBWQ2k7Nz
 m+VBWNnsH4FMuyvtuv9zWTsc3+M6IdZYboSakWwMGcxIbuCMIZfZNozD8IpZdO7QAgrK
 0+c/a3jBFxexrmuqEpgF7iPUbWibraBXIyGZSMnj772wOAPiDCccPKxv2KjBH8jdXuLB
 w6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Ke3psiyvAYjx3z57jrZiZhH5yaHJb1XSmwoVKkWSKVE=;
 b=YH09VewB5h0UB+wOGdkMuNl9HuR3Xl7VvrCuWhNSwkES2U8m5eJKUEpEnhfIPy5zEr
 DSRu/dloYQnw9pBKWb+y3ze6GLp1z0NbRuN3DHm0h/dezxaKLsORKcrXjjMN7DQ4O89V
 OMqYobc8IfUi6+iWs2lntLBB/sSQEqz1OwwuBJEFcjePTrFJ/BxPBUwEGOOpL4SlLnui
 CY6WX/63yA6CeZeQYX+RRD8kwfQY4svcuFsQXTWce3ZBYeKwXRVWEDw6K2AMx9f+ITPY
 p4bIacns4AioxVfFw/xsNwr4eLY9lfsNOxKzNmRT2LgtpJxg9Bqr8pVEu2K8OYS/eP1l
 1RrA==
X-Gm-Message-State: AGRZ1gIkbpmfTUt4ZKIuTUMN66NafKwmArP1N3XSu+xnukUDlhTFwqw8
 Q13+KcK1kLkuE2xv00mBqTKM6mSB
X-Google-Smtp-Source: AJdET5f+wGZg3FN+3R9r7yJwxT5LBKO8jDlwt/4ZqSt0446x0i9GO8reH+A281uzXi68Zir+3aI8DA==
X-Received: by 2002:a81:708f:: with SMTP id
 l137-v6mr22458992ywc.146.1541457636060; 
 Mon, 05 Nov 2018 14:40:36 -0800 (PST)
Received: from [10.67.51.179] ([192.19.223.250])
 by smtp.googlemail.com with ESMTPSA id
 q2-v6sm30112341ywa.24.2018.11.05.14.40.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Nov 2018 14:40:35 -0800 (PST)
Subject: Re: [PATCH net] net: phy: Allow BCM54616S PHY to setup internal TX/RX
 clock delay
To: Tao Ren <taoren@fb.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: openbmc@lists.ozlabs.org
References: <20181105223540.1897084-1-taoren@fb.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
Message-ID: <4844a371-ed1f-9f74-1674-e649a9283f12@gmail.com>
Date: Mon, 5 Nov 2018 14:40:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181105223540.1897084-1-taoren@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 05 Nov 2018 22:40:40 -0000

On 11/5/18 2:35 PM, Tao Ren wrote:
> This patch allows users to enable/disable internal TX and/or RX clock
> delay for BCM54616S PHYs so as to satisfy RGMII timing specifications.
> 
> On a particular platform, whether TX and/or RX clock delay is required
> depends on how PHY connected to the MAC IP. This requirement can be
> specified through "phy-mode" property in the platform device tree.
> 
> The patch is inspired by commit 733336262b28 ("net: phy: Allow BCM5481x
> PHYs to setup internal TX/RX clock delay").

I will let David be the judge whether this is appropriate as a bugfix
(thus targeting the "net" tree) or a feature, which would have to wait
for net-next to re-open.

> 
> Signed-off-by: Tao Ren <taoren@fb.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

> ---
>  drivers/net/phy/broadcom.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
> index e86ea105c802..704537010453 100644
> --- a/drivers/net/phy/broadcom.c
> +++ b/drivers/net/phy/broadcom.c
> @@ -92,7 +92,7 @@ static int bcm54612e_config_init(struct phy_device *phydev)
>  	return 0;
>  }
>  
> -static int bcm5481x_config(struct phy_device *phydev)
> +static int bcm54xx_config_clock_delay(struct phy_device *phydev)
>  {
>  	int rc, val;
>  
> @@ -429,7 +429,7 @@ static int bcm5481_config_aneg(struct phy_device *phydev)
>  	ret = genphy_config_aneg(phydev);
>  
>  	/* Then we can set up the delay. */
> -	bcm5481x_config(phydev);
> +	bcm54xx_config_clock_delay(phydev);
>  
>  	if (of_property_read_bool(np, "enet-phy-lane-swap")) {
>  		/* Lane Swap - Undocumented register...magic! */
> @@ -442,6 +442,19 @@ static int bcm5481_config_aneg(struct phy_device *phydev)
>  	return ret;
>  }
>  
> +static int bcm54616s_config_aneg(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	/* Aneg firsly. */
> +	ret = genphy_config_aneg(phydev);
> +
> +	/* Then we can set up the delay. */
> +	bcm54xx_config_clock_delay(phydev);
> +
> +	return ret;
> +}
> +
>  static int brcm_phy_setbits(struct phy_device *phydev, int reg, int set)
>  {
>  	int val;
> @@ -636,6 +649,7 @@ static struct phy_driver broadcom_drivers[] = {
>  	.features	= PHY_GBIT_FEATURES,
>  	.flags		= PHY_HAS_INTERRUPT,
>  	.config_init	= bcm54xx_config_init,
> +	.config_aneg	= bcm54616s_config_aneg,
>  	.ack_interrupt	= bcm_phy_ack_intr,
>  	.config_intr	= bcm_phy_config_intr,
>  }, {
> 


-- 
Florian
