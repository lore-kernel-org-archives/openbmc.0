Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
 [209.85.192.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQ66T6HtGzDqST
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 10:45:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=F27vCGZO; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=fnyOeN/j; 
 dkim-atps=neutral
Received: by mail-qg0-f65.google.com with SMTP id t106so1848535qgt.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jun 2016 17:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=yaML49DxKOL0iOkYDh3pAkwxSGAkXSqFkBJmvJ1+erk=;
 b=F27vCGZOOSvSFtlG1wPndg9B11iEAzOjpSwOAPlAgRhxhLlvCxoNPW14cr/O1RdoSj
 QLBh/iKwi2fCgJb4rSkXErAkujYoILVJazu1QrlQd+wngjRjqN1LRZpfJePxBREq1EXy
 RYCoGupSAaoDlttQT7exttbw2eAK2AkCtFAwyJTtlq2bKfKzT+9xSI3BIdz3j4pAjjoc
 Dff4U9aXy8DGrrZleNyYpUeZxU7qf8sqbsaiGvTcZqq5WAoCU0Wvl3tCFK4BAfSx9pcP
 mv3z3BbTsaDpTgc7COaOCORbyJpZZ08G+MFH8Xq3iPLt/BXCmdiWuwpGaLDnOduwUea0
 6HkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=yaML49DxKOL0iOkYDh3pAkwxSGAkXSqFkBJmvJ1+erk=;
 b=fnyOeN/jMOKPCCtq6u3T5lhD4SpDFf29bwllOmJX50L7UeGKYtCL4AMr4CfHeHFQZf
 W0eJRxu8AW2B8y6Nej4T2jgKLDm34J0rDVMEYejRf1gCDEKnPdbkglsIfFaDQV2UTi3I
 fuq96HO9oESOEwMtIYUz4EshBxQszYtEmU+X8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=yaML49DxKOL0iOkYDh3pAkwxSGAkXSqFkBJmvJ1+erk=;
 b=jn1EI2CggIxWRA1e+g8z+aSgPjQnRAzyPOWqNO+A6SUh7eZxTEiS8pztyGVB171wcv
 wmFdjHLLBP66W/o55gv6FI0NWnmbf/CGIr8O7u44b1NftybZGw4NjadlY9VJC8Kp34Kk
 ajR9PPieEisvnOYjozwahb8ZkGXOxZh9vP7tiTwSf13SBjH2/cvosdvStCQ06mG2ihf7
 0E83ZTWtl0X2qXntgG9V4rUAYDqxG7TAVLVLvckoundDDnwG91VHelKcKYKqmYH8ls6e
 gFocSNQNK+gAXtYfHurawKcrURJ3JxQsj8oarDJ6Z5oxp3O/JiQ4sKfxVivj6TQlOLjN
 pkZg==
X-Gm-Message-State: ALyK8tJ2DU6cWNTnnfIOYjV+Z38zLFwPyk26K2HAk3xKfFCpXpZ/d8blNdkBZew8+LUVaS/FiCcVOncPKGderQ==
X-Received: by 10.140.228.134 with SMTP id y128mr7532304qhb.81.1465433075699; 
 Wed, 08 Jun 2016 17:44:35 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Wed, 8 Jun 2016 17:44:16 -0700 (PDT)
In-Reply-To: <20160609002032.984-3-openbmc-patches@stwcx.xyz>
References: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
 <20160609002032.984-3-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Jun 2016 19:44:16 -0500
X-Google-Sender-Auth: UaIzeG8c88PrL132vC8Wp0xEiUs
Message-ID: <CACPK8XdDBR6xnKAuPBmTn19d1Ar9x2864FTNMM05hhNF+MTVig@mail.gmail.com>
Subject: Re: [PATCH openbmc v2 02/11] Add recipes-bsp to recipes.txt
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 09 Jun 2016 00:45:38 -0000

On Wed, Jun 8, 2016 at 7:20 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> This was missed when the u-boot recipe was added.
>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  meta-phosphor/common/recipes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-phosphor/common/recipes.txt b/meta-phosphor/common/recipes.txt
> index ccd19b2..1a8adc7 100644
> --- a/meta-phosphor/common/recipes.txt
> +++ b/meta-phosphor/common/recipes.txt
> @@ -1,3 +1,4 @@
> +recipes-bsp          - Anything with links to specific hardware or hardware configuration information
>  recipes-connectivity - Libraries and applications related to communication with other devices
>  recipes-core         - What's needed to build a basic working Linux image including commonly used dependencies
>  recipes-devtools     - Tools primarily used by the build system (but can also be used on targets)
> --
> 2.8.3
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
