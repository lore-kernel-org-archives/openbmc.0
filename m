Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4281F606A31A
	for <openbmc@archiver.kernel.org>; Fri, 30 Oct 2026 20:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=irb78aLA
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jGX8z0ZCxz30Vv;
	Sat, 31 Oct 2026 07:03:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793390610;
	cv=none; b=I4LiIMUFBThSjC65GYVuZdxyHQUJQZ92ootWAo1qq2AcIV2gvv/X2I2z44sZlZ/h6dYT2wsZkjmwl+yknSWdjarFE0/E5o9am8FrnH+OH1toKq1dIoTTEu7ivJxxW8PLuKEZxckyGBiIErK2aAQQYJVquUO7vLcQZXIMRG4d3jJJF9hE69n6KEXxYDyfTGWO+axfoe1T/6N7u8Mua31Lsrwgj4dKvx48+GQJvCLzUNZb4BYupFon6eKm/jUJGelPO6SM2ffHSK3k9psV5mZdORycSXnLjP4omH7XxZUTttTe+EEgSTjdvg2SxiwYx5DZUuGc5zDHpiy0kEhnsYzL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793390610; c=relaxed/relaxed;
	bh=8kVz0XILX5RIwQ6HYtuHl7gWfjeYLa70o0sQEUAqlEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhA5qnIvGWppTsTFD5NHX8Y7nt2OvD5iMsWvmSokqrBLp6NN8Gtq7VrB+umlJYj3Djsgpwck0RFsFWhBlz8KkKCf5elmRLvvdYLQKkmT9YLUj1DzjlDwxbSYDlMHFcnmkSDkWT7iq4+XokZb4Ym1W5E0LHcEckYzZLwUGDWFKPN7amO6d42PeTDjlvBtMLnq0IsQ7/rF4YgziRViQFGq75FEV0t7tDMDivz7w8eOHGRo2z3kfrRBFCPDuaWyIhRVnNXIM1wms6a5z4GBgX2EzcfUz7O+ydBcC9ZSnZWfcJ/j1gyPjm1TdGNGLndmn1miclczSr5luWbKfJVwVJc4XQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=irb78aLA; dkim-atps=neutral; spf=softfail (client-ip=35.89.44.33; helo=omta34.uswest2.a.cloudfilter.net; envelope-from=linux@roeck-us.net; receiver=lists.ozlabs.org) smtp.mailfrom=roeck-us.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=irb78aLA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=roeck-us.net (client-ip=35.89.44.33; helo=omta34.uswest2.a.cloudfilter.net; envelope-from=linux@roeck-us.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 339 seconds by postgrey-1.37 at boromir; Sat, 31 Oct 2026 07:03:27 AEDT
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jGX8v5Z2Mz30VV
	for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2026 07:03:27 +1100 (AEDT)
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id MlnCx4pYqaC0UMshxxDRpO; Fri, 30 Oct 2026 19:56:13 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MshwxSiaBLr2uMshxxWfLp; Fri, 30 Oct 2026 19:56:13 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae4f65d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=Bq6zwJu1AAAA:8
 a=QyXUC8HyAAAA:8 a=_jlGtV7tAAAA:8 a=FQuEuSn5fJWHmgwBhRsA:9 a=CjuIK1q_8ugA:10
 a=KQ6X2bKhxX7Fj2iT9C4S:22 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8kVz0XILX5RIwQ6HYtuHl7gWfjeYLa70o0sQEUAqlEc=; b=irb78aLAgTGRW1joDBbOI1pJ4l
	CiMU4xia3rmyGJcuc44medSaPBlvl8MLgbpRpkIc6y5/y+S3hPgTtgsAmZ0yYNTpL9TspgU9F4aIu
	ZHVJvVuhkcaLcfaXwblDAmtGwlI52rLnPK5T/sThWTVvW2p5622vsP52jowuilovBtmwFdf28s0pB
	L/DzIFxK5dKwXgvRUY3Yj5OxFru/Lw4563WYCJlG9ALTvp4SwNhcKcwHOVWhbkip25xmOGDlBIkBB
	iAVISuWrDoc7eXIqQwdE+Xjv2zlOwF/+/Ud3T/lAjynlS8b8ikbiIMYpCgLmQNCGEYiypG91gJDm1
	xBgaS43w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55592 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMshw-00000003xjp-10yC;
	Sat, 31 Oct 2026 01:26:12 +0530
Date: Fri, 30 Oct 2026 12:56:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Message-ID: <34cac8b5-ddb9-4b76-a60a-8f6ffb0fd9ac@roeck-us.net>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
 <20261019114502.55307-6-changhuang.liang@starfivetech.com>
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
In-Reply-To: <20261019114502.55307-6-changhuang.liang@starfivetech.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMshw-00000003xjp-10yC
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:55592
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 90
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCuxP/6lTmS5LBi4nIvi6A6yE2Zb51Lmd05JZTr6VxSuoErgGikxjQDoDrCiaJYfBZx1Gw60iumqo0a1GTrjlahhN2tcNSyhHdT6zl83T2kaWNMGJvJw
 cxPniwISsqDzcQdwIiDEVdfq00v7556Fre92e34jYKtvNwM1nWxEP+jGNt5MmLu+ucbwWHXwkpE/tbyIakTXziKwnJDrpxHURheZLflMpSD/BYyQ0oMSiBtw
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 04:45:01AM -0700, Changhuang Liang wrote:
> Add Granite Rapids (GNR) CPU support to the PECI cputemp driver.
> 
> For Granite Rapids, the resolved cores mask must be collected from each
> compute core. This implementation is relatively complex. Since we do not
> use the resolved cores information for these CPUs, we can explicitly
> state in the driver that the core mask is not supported for this model.
> 
> Define new cpu_info structure for GNR with minimum PECI revision 0x42 and
> the thermal margin conversion function dts_ten_dot_six_to_millidegree().
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/hwmon/peci/cputemp.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
> index 457089c561b4..69c4a07b99f7 100644
> --- a/drivers/hwmon/peci/cputemp.c
> +++ b/drivers/hwmon/peci/cputemp.c
> @@ -339,6 +339,18 @@ static int init_core_mask(struct peci_cputemp *priv)
>  	u32 data;
>  	int ret;
>  
> +	/*
> +	 * For Granite Rapids, the resolved cores mask is relatively complex to implement.
> +	 * Since we do not use the resolved cores information for this CPU, the driver
> +	 * explicitly does not support the core mask for this model.
> +	 */
> +	if (!reg) {
> +		dev_dbg(priv->dev,
> +			"resolved cores scan is not supported on vendor-family-model 0x%x\n",
> +			peci_dev->info.x86_vfm);
> +		return -EOPNOTSUPP;
> +	}
> +
>  	/* Get the RESOLVED_CORES register value */
>  	switch (peci_dev->info.x86_vfm) {
>  	case INTEL_ICELAKE_X:
> @@ -543,6 +555,11 @@ static const struct cpu_info cpu_emr = {
>  	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
>  };
>  
> +static const struct cpu_info cpu_gnr = {
> +	.min_peci_revision = 0x42,
> +	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
> +};
> +
>  static const struct auxiliary_device_id peci_cputemp_ids[] = {
>  	{
>  		.name = "peci_cpu.cputemp.hsx",
> @@ -576,6 +593,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
>  		.name = "peci_cpu.cputemp.emr",
>  		.driver_data = (kernel_ulong_t)&cpu_emr,
>  	},
> +	{
> +		.name = "peci_cpu.cputemp.gnr",
> +		.driver_data = (kernel_ulong_t)&cpu_gnr,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);

