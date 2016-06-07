Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNyWD1JYSzDq5m
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 13:59:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=tD5o6DgI; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com C99152793D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1465271970;
 bh=4z4+uNHCtbtnDx0k+ep5avUQ6Ucv5927ijGQSagzUBM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=tD5o6DgIXfiP40ybQJl3CORfuOxRfiz70gpCwKyvGh/OTAN6xz6CAp3ANgxuORyCA
 f72RwYwUuMjMZaU8JgMEOCVoaYpJhQbdw1+Wf9GcqtktYWhNSsE+O/b1NYXg8+Sm89
 Q5NMWFP87QjTaA1R7yxrdtjLyBAlb51jdgOD3wk8=
Message-ID: <1465271968.30053.20.camel@fuzziesquirrel.com>
Subject: Re: [PATCH openbmc] meta-phosphor: Move to openbmc-20160606-1
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Date: Mon, 06 Jun 2016 23:59:28 -0400
In-Reply-To: <20160606211107.22163-2-openbmc-patches@stwcx.xyz>
References: <20160606211107.22163-1-openbmc-patches@stwcx.xyz>
 <20160606211107.22163-2-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 07 Jun 2016 03:59:36 -0000

Reviewed-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

On Mon, 2016-06-06 at 16:11 -0500, OpenBMC Patches wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
>  - Stable release 4.4.12
>  - Jeremy's i2c completion fix
>  - Ken's power button debounce code for Barreleye
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> index 47e3698..825a555 100644
> --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> @@ -10,7 +10,7 @@ SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
>  LINUX_VERSION ?= "4.4"
>  LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
>  
> -SRCREV="openbmc-20160521-1"
> +SRCREV="openbmc-20160606-1"
>  
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>  
