Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgQRt0wLJzDsml
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 17:47:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=PxBza+uP; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id 107so1115920uah.2
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 00:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=hQhhYd1MnntTnEwDXfbO4fPipTFlDgQ3HlPYK2ntUe4=;
 b=PxBza+uPAoNwi58oxSO3wJBEkzHb+w6STeNUdoUv+MOmIDRkoiTfUFI3gk7s5pDh8j
 3LayRVZ3PcK5qXUVpRX5HogjZGjnMLeHMKW9aIQQ52pssJZKHD4eDEW/7LuFTnY5C2fC
 +rIDv7OCKXQjYIdSC2UFXg1LcXFByi0KBIO7FA4itqJNdnTNOFXTHeeHaG2KQBZC8Dx5
 gO3f+rHxaJnxzoI49GbV1X6TV0/G5/QszfyZpOGGNR05uFmC4G/yry/sH4irbtc9gYFV
 snXPtcjQQvUVcSnGNhxokUJvPa9Wf+ja4KuBiH8ipA9/b7YM6CZKbrPwFs7523IlC0Qw
 YedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=hQhhYd1MnntTnEwDXfbO4fPipTFlDgQ3HlPYK2ntUe4=;
 b=TLlTdBusmd/Y4/2v9iWUwkiNHxHzK3iwNLr62C3mYqJQg5iGLf4fGay8IiT10BO8vU
 A0WNI8V9n1LUlyASrG0F0NduJp1noUbd1RLVknBEqjD7lLOizNIKLimdtW4HX3Ltcn8d
 GT7vz9jCfhmaVNSsyitnAil/5v9oL+5EPRfWJ1qGcdnbb9HaRjdDsrVmetcFduVLvo+D
 6oPzWMzeUSCSNb1O7W5vrzueshi+U6LLhP/Nh9HZgp4+OTCH6ZKLuyCjDf6RhTRivagV
 OrY3Wjho12cWjCKEzvm2WzOKw1YU+1yNjIuqqeK4fuJ9rs488YddtQAcsshNzfXdupEp
 /X5Q==
X-Gm-Message-State: AA6/9RnqzJoPO4lnz1Y+Gvz1ymy+V1jXHue0D+iU8wML10kWFNUUSSxhGS5MJGFWkE0VwPHViamfhHNDdG58wg==
X-Received: by 10.176.3.206 with SMTP id 72mr2856700uau.145.1474616824156;
 Fri, 23 Sep 2016 00:47:04 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Fri, 23 Sep 2016 00:46:43 -0700 (PDT)
In-Reply-To: <1474058133-27363-3-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-3-git-send-email-tpearson@raptorengineering.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 17:16:43 +0930
X-Google-Sender-Auth: QS8Edz7R1Wd8tivppfvbhmffdPQ
Message-ID: <CACPK8Xd9S9xkUzUp63YfJPTurypwtgcQ1BUAivpMGj+doOpU2g@mail.gmail.com>
Subject: Re: [PATCH 02/17] net/phy: Expose 100base-T capability only
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Timothy Pearson <tpearson@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 23 Sep 2016 07:47:06 -0000

On Sat, Sep 17, 2016 at 6:05 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
> From: Gavin Shan <gwshan@linux.vnet.ibm.com>
>
> I don't know the specific PHY model deployed on Firestone BMC, but
> currently used one (PHY_ID_BCM54210E) isn't correct. BCM54210E
> supports 1000base-T but the PHY on Firestone BMC shouldn't support
> that mode as uboot uses 100base-T mode.
>
> When exposing 1000base-T capability, the MAC is forced to have the
> same mode though the PHY is working in 100base-T mode in fact. It
> causes the mode mismatch between PHY/MAC and the ethernet network
> doesn't work.
>
> It's a temporary fix. After the PHY model is confirmed, we need
> to enable the correct PHY driver instead current one for BCM54210E.

Gavin, have we learnt any more about why this patch might be needed?

Cheers,

Joel

>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
>
> [Cyril]
> The plot thickens, it does appear that this IS the correct PHY on
> firestones. This patch is definitely required for networking to be
> functional though.
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/net/phy/broadcom.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
> index 2d5ba6a..4fd7c53 100644
> --- a/drivers/net/phy/broadcom.c
> +++ b/drivers/net/phy/broadcom.c
> @@ -596,7 +596,7 @@ static struct phy_driver broadcom_drivers[] = {
>         .phy_id         = PHY_ID_BCM54210E,
>         .phy_id_mask    = 0xfffffff0,
>         .name           = "Broadcom BCM54210E",
> -       .features       = PHY_GBIT_FEATURES |
> +       .features       = PHY_BASIC_FEATURES |
>                                 SUPPORTED_Pause | SUPPORTED_Asym_Pause,
>         .flags          = PHY_HAS_MAGICANEG | PHY_HAS_INTERRUPT,
>         .config_init    = bcm54xx_config_init,
> --
> 1.7.9.5
>
