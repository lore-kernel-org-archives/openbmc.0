Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC3C606A31A
	for <openbmc@archiver.kernel.org>; Fri, 30 Oct 2026 20:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=doEtbsmg
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jGX9M73kvz30WQ;
	Sat, 31 Oct 2026 07:03:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793390631;
	cv=none; b=PlPNiP366q+HU1xHH8HRrfDa02ijyH/4LNGn9Jmvqx8nmY9OAXFsmNWeisd7aXmglRn6ZyN9IbdYtZ3ixZMsF6n/G4BnVuSeCheQV0R3PLKRZU57/HrKMthdhQEr0lqZpNsOhbo/7uJPyL4gq3kueToqSnN5rGLaMYJ6pywZe05sAO7VzKXKNMfcN8qpTZWWXu93e/ljxe7cvZ004G5Y75davjn7/RAN+AK0wCEtUF5B2S6Jydfb4W20sRZcKypxLdoZrMedYkqR4PjbUWtUUcII2x7dcqfN6+Bcb84v/udjmHGAYz7/S+N4t6Qot4lDzz6KZ0+IRMYp9iCPmPuCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793390631; c=relaxed/relaxed;
	bh=DWzHdFiapqL57vQ9QQf4q1XeBGnNvtXOlbL7A4/rAco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxQ3Jot6KKjwxdS26ZaGpWvzNbCMMsqUU6lBxLxy+p3n6QuOBmCTrALr8WuZ7zHjZGBVO76QuDWHdnqBfpf9RPzvvfiT8JdcaVx5kBAYDaOPlIgv4wB8xQTN8Csj/NxvZQG2B47B2xwwNOgQEAePTyqna6Px9ot8CRtUVd9TRzPGOpvLg77BvfULdrMp49qoQZcV6LDK7CcxQM2+Q6vSY6RkP8TM/kw50s/sCnwyXymtwkpdXDVm/1rJM3R5KNrVIj3H4/AEsqFD6o5KVR8MkLBy4uY4PB1y/5mH9Xh9EcqsWAkhxvZ5rWXThTIFQ5BrPcwg0oVoQi1kZMZV5Ctpcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=doEtbsmg; dkim-atps=neutral; spf=softfail (client-ip=35.89.44.35; helo=omta36.uswest2.a.cloudfilter.net; envelope-from=linux@roeck-us.net; receiver=lists.ozlabs.org) smtp.mailfrom=roeck-us.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=doEtbsmg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=roeck-us.net (client-ip=35.89.44.35; helo=omta36.uswest2.a.cloudfilter.net; envelope-from=linux@roeck-us.net; receiver=lists.ozlabs.org)
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jGX9L67NDz30Vv
	for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2026 07:03:50 +1100 (AEDT)
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id MnKax2heWusRSMsiNxZNRF; Fri, 30 Oct 2026 19:56:40 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MsiNxwUp2NSXiMsiNxUHVv; Fri, 30 Oct 2026 19:56:39 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae4f677
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=Bq6zwJu1AAAA:8
 a=QyXUC8HyAAAA:8 a=_jlGtV7tAAAA:8 a=TmeHqywlB-wf64vNx90A:9 a=CjuIK1q_8ugA:10
 a=KQ6X2bKhxX7Fj2iT9C4S:22 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DWzHdFiapqL57vQ9QQf4q1XeBGnNvtXOlbL7A4/rAco=; b=doEtbsmgS12KszkRR7TRgjgMvi
	e4hdP6WzcIw88nPHe3j+q+T2q9jbGdVy49soWf5ZMcQBLYeAT5zxBVYrrkCy4gpiTjddJjznuW+0G
	duvX7QwtYGic1g1Fs4KtKw0NAhOSocKFKuTvXCUCqtcyLi00VHe4vk/IhMJi9TWOuq3HsTgZdGp0M
	VmxYb2gRLA0sq6SXAL58CMmbYYM+90xRnn5gweKBgnMasv4Y/tt6xu+UXpaSCAV5glZQtogaMpV/0
	0M9GGNoufgNpv4k5sS3J1ALa9w06bWHRE2WMiKID5fn3HXhEV/WB7jAGZZ5ZzkssRWQtuylPjv9E8
	LLmTy/lQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38324 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMsiM-00000003xwz-2LGQ;
	Sat, 31 Oct 2026 01:26:38 +0530
Date: Fri, 30 Oct 2026 12:56:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
Message-ID: <215a0b5a-9fda-4bce-bff5-b9e4bb5c3928@roeck-us.net>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
 <20261019114502.55307-7-changhuang.liang@starfivetech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019114502.55307-7-changhuang.liang@starfivetech.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMsiM-00000003xwz-2LGQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:38324
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 100
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFY9+73TJUFhOWc2rq/gQAp6C+26QOBNaRb7pFalmSYu6ZsmlLJFTDNI5keCT0uiVZCbM64SKmzkBJb0Z9IeyNla8WQ/HpYLuMvPd9mrsj+HxHJodbDY
 w0IbYpmjBMSRoMRuZKd9zPKHlnubLWMeZs4sQT8NqNsMiL0cUCPIhbvyzmXEiW+wLoIzqx+WTjPL0W74w6z1NrhA1jvC5rElbY9w1fVdnfvKORw+rqpMdBZT
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 04:45:02AM -0700, Changhuang Liang wrote:
> Add support for Granite Rapids (GNR) platform in PECI DIMM temperature
> monitoring driver.
> 
> The GNR platform has different DIMM topology from previous generations,
> with 12 channel ranks (CHAN_RANK_MAX_ON_GNR) and 2 DIMM indexes per
> channel. Define these new constants and update CHAN_RANK_MAX to use
> the GNR value since it represents the maximum across all supported
> platforms.
> 
> Since the current peci core does not support domains, accessing GNR's
> DIMM_TEMP_MAX and DIMM_TEMP_CRIT via PECI commands will be rejected
> and return completion code 0x90 (invalid request). To handle this, the
> read_thresholds callback is not defined for GNR, and the visibility
> logic is updated to skip exposing the max and crit temperature
> attributes.
> 
> The minimum PECI revision required for GNR is 0x42.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/hwmon/peci/dimmtemp.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
> index bd3e8715dfec..791a8e866081 100644
> --- a/drivers/hwmon/peci/dimmtemp.c
> +++ b/drivers/hwmon/peci/dimmtemp.c
> @@ -34,8 +34,10 @@
>  #define DIMM_IDX_MAX_ON_SPR	2
>  #define CHAN_RANK_MAX_ON_EMR	8
>  #define DIMM_IDX_MAX_ON_EMR	2
> +#define CHAN_RANK_MAX_ON_GNR	12
> +#define DIMM_IDX_MAX_ON_GNR	2
>  
> -#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_HSX
> +#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_GNR
>  #define DIMM_IDX_MAX		DIMM_IDX_MAX_ON_HSX
>  #define DIMM_NUMS_MAX		(CHAN_RANK_MAX * DIMM_IDX_MAX)
>  
> @@ -198,10 +200,18 @@ static umode_t dimmtemp_is_visible(const void *data, enum hwmon_sensor_types typ
>  {
>  	const struct peci_dimmtemp *priv = data;
>  
> -	if (test_bit(channel, priv->dimm_mask))
> -		return 0444;
> +	if (!test_bit(channel, priv->dimm_mask))
> +		return 0;
>  
> -	return 0;
> +	/*
> +	 * Some platforms do not provide the DIMM temperature thresholds over
> +	 * PECI - do not expose the corresponding attributes there.
> +	 */
> +	if ((attr == hwmon_temp_max || attr == hwmon_temp_crit) &&
> +	    !priv->gen_info->read_thresholds)
> +		return 0;
> +
> +	return 0444;
>  }
>  
>  static const struct hwmon_ops peci_dimmtemp_ops = {
> @@ -626,6 +636,17 @@ static const struct dimm_info dimm_emr = {
>  	.read_thresholds = &read_thresholds_emr,
>  };
>  
> +static const struct dimm_info dimm_gnr = {
> +	.chan_rank_max	= CHAN_RANK_MAX_ON_GNR,
> +	.dimm_idx_max	= DIMM_IDX_MAX_ON_GNR,
> +	.min_peci_revision = 0x42,
> +	/*
> +	 * Reading DIMM_TEMP_MAX/DIMM_TEMP_CRIT over PECI is answered with
> +	 * completion code 0x90 (invalid request) on Granite Rapids, so the
> +	 * threshold attributes are not exposed on this platform.
> +	 */
> +};
> +
>  static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
>  	{
>  		.name = "peci_cpu.dimmtemp.hsx",
> @@ -659,6 +680,10 @@ static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
>  		.name = "peci_cpu.dimmtemp.emr",
>  		.driver_data = (kernel_ulong_t)&dimm_emr,
>  	},
> +	{
> +		.name = "peci_cpu.dimmtemp.gnr",
> +		.driver_data = (kernel_ulong_t)&dimm_gnr,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(auxiliary, peci_dimmtemp_ids);

