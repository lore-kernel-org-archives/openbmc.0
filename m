Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 027D31A04B8
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 16:48:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=TvrJIAuv; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id e127so4124952pfe.3
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 21:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=z8uZSiDqRCj2TZ7oKhiTzDMcvRe7oFmgeLisDD1BK6E=;
 b=TvrJIAuvBzp4gjb7Om9WKBOo6EEKJr8AZUJmktelCxlGJztdYI8E8e7L3U/C+LCcpC
 Qm50vwFEh6MLBxW6iG7W++nMvraLXolJmoKXpShNSPChyGDzvBmaFUpFJlRADW4Htn7B
 NO3NK7kSvF7o1/wH1Z1d68LfEnvod0F64pp9Ux3oEVl/qxH3GTIwb2VVDFhtoK4O42UF
 H/SSjBe+jd2WRmBhlNCDKw/zOvfVvrhsRmUxy9jk9K3CSlg8Po8iqEjMsjyFIcDd8PY2
 EoDYRBiZspMtdz6GbsTqaI/nYcAVU+W0pwIMvF9Vn95BF6rDgAyMNupsZn/GmZDS7oTM
 vYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=z8uZSiDqRCj2TZ7oKhiTzDMcvRe7oFmgeLisDD1BK6E=;
 b=QVVYoi/qJ6QG26KwphbQQ/HxyM4SIOQoK27SQIICi2GSlCEfmGV9H1UkY9phQJ0bjh
 tkZWMq1fowM5NVT1aB9rRVnuKCHhoL7Q/8JYG1EDDV/HtHh8sUR4HZesXPLqeCFZuLIp
 FM8tvUmHxy0k4JFMtHJ2HJ/8GSCxVtRUz2vO0kxe2XomRnWYFQiLU2mz1igxD5Retr1y
 fqUt17xBFNN6N7tf7U1Bo8PQ65mKr0pCVVqCI6jIahWVkLlxMvfCbA3YH3obZu+34QVh
 zY613CWqbU2LffWHVxpLg5Eq0yOJw0/eheZxwp90MiLu7QO5Fm+6ghEdZp3uwQPKTSDa
 5DGw==
X-Gm-Message-State: AG10YOT0N9C0nznIKQbc/dWDMCAFNgDeJZe2bZg5bRJJ9fQp/8VylcMNSL2PYegDlWgO6A==
X-Received: by 10.98.70.139 with SMTP id o11mr68978241pfi.123.1456465685029;
 Thu, 25 Feb 2016 21:48:05 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id sm8sm16060887pac.43.2016.02.25.21.48.03
 (version=TLSv1/SSLv3 cipher=OTHER);
 Thu, 25 Feb 2016 21:48:04 -0800 (PST)
Date: Fri, 26 Feb 2016 16:47:57 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Ratan Gupta <ratagupt@in.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid] Fixing the Duplicate registration
 for NetFn [0x6], Cmd:[0xFF]
Message-ID: <20160226164757.0d9ec071@camb691>
In-Reply-To: <1456407636-586-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456407636-586-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456407636-586-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
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
X-List-Received-Date: Fri, 26 Feb 2016 05:48:08 -0000

On Thu, 25 Feb 2016 07:40:36 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Ratan Gupta <ratagupt@in.ibm.com>
> 

Hi Ratan,

Any reason you're not removing ipmi_global_wildcard_handler() as well. I assume
it's now unused...

Thanks,

Cyril

> ---
>  globalhandler.C | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/globalhandler.C b/globalhandler.C
> index e68ea79..25ae26a 100644
> --- a/globalhandler.C
> +++ b/globalhandler.C
> @@ -164,8 +164,5 @@ void register_netfn_global_functions()
>      printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WARM_RESET);
>      ipmi_register_callback(NETFUN_APP, IPMI_CMD_WARM_RESET, NULL, ipmi_global_warm_reset);
>  
> -    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WILDCARD);
> -    ipmi_register_callback(NETFUN_APP, IPMI_CMD_WILDCARD, NULL, ipmi_global_wildcard_handler);
> -
> -	return;
> +    return;
>  }
