Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pH4Vf/MK"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42pltg41TCzF2Hd
 for <openbmc@lists.ozlabs.org>; Tue,  6 Nov 2018 08:19:39 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id f8-v6so4796815pgq.5
 for <openbmc@lists.ozlabs.org>; Mon, 05 Nov 2018 13:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8GQfIYxLqXGoh+LrMtJ2OdPSQX6m0kMgXb1fU0CHKaQ=;
 b=pH4Vf/MKd0eKwam9ilmQYJjwgeFgJnzHV0iSijCtSbh1+O5CoNE5Yu4/zlJFQmzxpM
 76FViRRkMiLnluNutl2f6lOzlD87ppSjNxUVU3HBkg2W7oU+UHB8IWyNxv3tKJUptExA
 C2vysWZM8gv+eVHdlmV/xPzbPJC/u/c4C1rIKGHWVYPmWUn4lXMWAThjyAkrCBPDZaB3
 MrTrm7s93XxczGoYmgPOdYYdYBaDkmVpprzFhs/+6sZ5y+lalkm2g3p85TtRbXxN72hb
 Eo4iXc1zx2j42/i74Fj4bqupSK+B6aNpxnqyIqdhykM+Eyz6X/zi84k1fEx9vE4fJH/0
 AoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=8GQfIYxLqXGoh+LrMtJ2OdPSQX6m0kMgXb1fU0CHKaQ=;
 b=H4cnflFIYWqN1i3c8GhCL/wh29K2C+4vJcLvMTDSKRNT0DKu4lYfAKnHpBZFQvIi3O
 ZRGbKeVWDlxxybKT0S3mvxjb87ovtdXyZswBdhxoBGNdeZX99SmeZ7jZNFLeGFMJN+dI
 TBRCYyaXHITvcA1vzFqZPkqksHjTMYHucbXERR44u3kdorHSBMUvLhyjgTjM6c87wLxI
 e+5mZDZc2HBMSoR47RJLVtM3LJ1jJHTlhufUxxfjgv2P+vX93S42xKOU4qQNLQKYLDDi
 yLc1fjEKViQdxbH4vWxrMB/9pz7UgqI8u5nPSGSTWu/vJYuJnmnnbes3MUxCsw3LFWs9
 GuKQ==
X-Gm-Message-State: AGRZ1gLnoYsX/roYH6ufbF9L0bK00wQSxiaUMDp/MiHXNoefMC4Xfolr
 Zritl5GpSjm9GMs3QXzacaA=
X-Google-Smtp-Source: AJdET5factQg0t4fWcUpcyYPEIuV3pmmt0Ygfay9135Xb7lz++EwKaOUg4M0LdyBRyWf8TWE5pcrVw==
X-Received: by 2002:a63:81c7:: with SMTP id
 t190mr19015125pgd.393.1541452777237; 
 Mon, 05 Nov 2018 13:19:37 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id v23-v6sm12270447pfm.170.2018.11.05.13.19.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Nov 2018 13:19:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 5 Nov 2018 13:19:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: wim@linux-watchdog.org, yuenn@google.com, venture@google.com,
 benjaminfair@google.com, brendanhiggins@google.com,
 avifishman70@gmail.com, joel@jms.id.au,
 linux-watchdog@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] watchdog: npcm: Modify npcm watchdog kconfig arch
 parameter
Message-ID: <20181105211935.GB15984@roeck-us.net>
References: <20181105161152.205524-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181105161152.205524-1-tmaimon77@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Mon, 05 Nov 2018 21:19:40 -0000

On Mon, Nov 05, 2018 at 06:11:52PM +0200, Tomer Maimon wrote:
> Modify Nuvoton watchdog Kconfig default supported architecture
> name to ARCH_NPCM7XX because ARCH_NPCM750 architecture name
> is not supported.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 2d64333f4782..746759ec8960 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -538,7 +538,7 @@ config COH901327_WATCHDOG
>  config NPCM7XX_WATCHDOG
>  	bool "Nuvoton NPCM750 watchdog"
>  	depends on ARCH_NPCM || COMPILE_TEST
> -	default y if ARCH_NPCM750
> +	default y if ARCH_NPCM7XX
>  	select WATCHDOG_CORE
>  	help
>  	  Say Y here to include Watchdog timer support for the
> -- 
> 2.14.1
> 
