Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rg9pb15NQzDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 17:17:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=tE+eePdT; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id i123so6624378pfg.3
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 00:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5/60+yOld7hPEfzSwTX5mhCNtd3MUayW9HLUCTXMOZk=;
 b=tE+eePdTXJ0y5jgoZV2LT/jaHiBh65Go1R/138HVEU0V5DS66B+nS1QGfKRa/rxhQc
 wPwkdqisIxSqpXudYvOj2QPA20OWwy8v3lX5oCS09BbMZzqMWkR76pNS8LhOGQCr131l
 E3ZeKmfFxsq/bI1lpOahF7MKJxufy+w9/dpNZzurArgeTO1peEPXwbTGmPLu90OLf3ME
 aRkSk4v0pesUzgo0WleSangPVxdHyqCdVERUS9++cvhMVqFZAyhWXPd7CJkO/6oFk6n/
 /Y3zLqA6YucSzd5Lu4saBEK2MsaWeldp+XT34g4UguMkX3GFapbB7PGcFWBnVWwT6nE9
 WHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5/60+yOld7hPEfzSwTX5mhCNtd3MUayW9HLUCTXMOZk=;
 b=e5lZX8LEZiTcztWM3HnfBlOSInd0YzvmUiu0+7IkB7N9w1NzI7p0kcEYr1drTymqY9
 G6rzMZ6Pqkn1hnShXooxSE2xGpzoP0V3cOjaRUWEVsk7ghaPBUUn25oJdwBN+qD73iOD
 lntHQXmAEbxs5OmymEBVOCNmBVz72fGruAr6QAI9lE9IutqFv/VcgVsP2/NfqEexQJWT
 jb+FAo+ewZoBR8xr2m4XoSVf6OXtjPBnjNo+do+rX7dJbC7H89EjY1TjJMpYnpNIOXNO
 X4qihEEdahTfveVHydQJXySZTB+GB07mo6o4R8tANZXusoD5XaddcEZck3jKzR+2jqHK
 SZzg==
X-Gm-Message-State: ALyK8tJrDayVhSSs+nQhPKsn8xC6Ehfvu4eudpaGXO3A59pMfQ1ERZp9SQIa8XnPRwunkA==
X-Received: by 10.98.106.133 with SMTP id f127mr18540587pfc.139.1467271029278; 
 Thu, 30 Jun 2016 00:17:09 -0700 (PDT)
Received: from aurora ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id f2sm2846035pfb.76.2016.06.30.00.17.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2016 00:17:08 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1467271024.6386.34.camel@jms.id.au>
Subject: Re: [PATCH uboot v2016.05-aspeed-openbmc 7/9] aspeed: add a common
 Kconfig file for Aspeed boards.
From: Joel Stanley <joel@jms.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Thu, 30 Jun 2016 16:47:04 +0930
In-Reply-To: <1467216591-8616-8-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
 <1467216591-8616-8-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2016 07:17:11 -0000

On Wed, 2016-06-29 at 18:09 +0200, Cédric Le Goater wrote:
> We can use to it to include common config options.
> 

Good cleanup.

> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>


> ---
>  arch/arm/Kconfig     | 4 +---
>  board/aspeed/Kconfig | 3 +++
>  2 files changed, 4 insertions(+), 3 deletions(-)
>  create mode 100644 board/aspeed/Kconfig
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index ee176be22979..bfbeb4842380 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -894,9 +894,7 @@ source "board/vscom/baltos/Kconfig"
>  source "board/woodburn/Kconfig"
>  source "board/work-microwave/work_92105/Kconfig"
>  source "board/zipitz2/Kconfig"
> -source "board/aspeed/ast-g5/Kconfig"
> -source "board/aspeed/ast-g4/Kconfig"
> -source "board/aspeed/witherspoon-bmc/Kconfig"
> +source "board/aspeed/Kconfig"
>  
>  source "arch/arm/Kconfig.debug"
>  
> diff --git a/board/aspeed/Kconfig b/board/aspeed/Kconfig
> new file mode 100644
> index 000000000000..a92b9bc0c934
> --- /dev/null
> +++ b/board/aspeed/Kconfig
> @@ -0,0 +1,3 @@
> +source "board/aspeed/ast-g5/Kconfig"
> +source "board/aspeed/ast-g4/Kconfig"
> +source "board/aspeed/witherspoon-bmc/Kconfig"
