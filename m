Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7616072299
	for <openbmc@archiver.kernel.org>; Mon,  2 Nov 2026 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=cCMN/SxS
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jJFQV23xjz3bpG;
	Tue, 03 Nov 2026 02:06:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793631970;
	cv=none; b=lJbdfPbXadV54FMMc7QDYoPNI87UdfCqsKKP0BaMT/25BnY4lpJ7Fih/aEeXs4ER9BQnZihrrgOLk4vjAov19NUS0mSiBiZNhiqArIcfWhhs/L4XL4Rvb2r5k5M1fidB9KK3hT+YKE2xpCy4fWzcDHlyJdp4vdfbggMMDO+2RIxTQjFrcvVlJ3asodhrtfaJwj+4vEKZ/ktAvQIPXfgAXWCy4Ifdge+mE5+gxsKTHkWuBbxTFID7ziUPK6dbiUjUzv2v2xBBhQU9Ls7ZeBKKhJ+fnBrMKBWP6CxizGktoY74GVPCHybRlAe0fQ0jDwrjj7SAf2/Prkzp29ZjZPRv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793631970; c=relaxed/relaxed;
	bh=v/EFnPHaPvgzAcdCipbZrXu35F80MQk6sO8AjpoOnik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zqr4F3eSO6GPKfBWKqW0Ct1eVNr/fAbOGnGYd+esmhl2d2pnn8EySbIW4Sr3WrgejMOog55hEbWnoCW1T1ZDP1D0ViPPxTujiFZ8GLlQQOs++/RiJBTHMnOsrUH7hCA30gEoo0OLynqLijnBI5iPQf1MzJEFeGh2Mk4WMoziWLCzXa2iQA827pNubK0Zx9TLzNjeAcbqSIWxsVRLbIOBxZprgCWRhVx126ENJyeybp1yqjQkiSVdaH+adKOz27e8F7aNP9R1mukq2N5W9r9Qa11xbc2Ug65wkEu635JoGH6lK8RdfuqAIbEbz4KxLat/YGBwb4DjKPJThRhlYP2Yrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=cCMN/SxS; dkim-atps=neutral; spf=softfail (client-ip=35.89.44.37; helo=omta38.uswest2.a.cloudfilter.net; envelope-from=linux@roeck-us.net; receiver=lists.ozlabs.org) smtp.mailfrom=roeck-us.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=cCMN/SxS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=roeck-us.net (client-ip=35.89.44.37; helo=omta38.uswest2.a.cloudfilter.net; envelope-from=linux@roeck-us.net; receiver=lists.ozlabs.org)
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jJFQT1y9nz3bnv
	for <openbmc@lists.ozlabs.org>; Tue, 03 Nov 2026 02:06:09 +1100 (AEDT)
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id NpAYxMH6zv0ndNtaRx7lBu; Mon, 02 Nov 2026 15:04:39 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NtaPxTR1lkE4RNtaQxxf40; Mon, 02 Nov 2026 15:04:38 +0000
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=6ae8a686
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=Bq6zwJu1AAAA:8
 a=QyXUC8HyAAAA:8 a=4TTe3KnR3ll1BDOd3XsA:9 a=CjuIK1q_8ugA:10
 a=KQ6X2bKhxX7Fj2iT9C4S:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=v/EFnPHaPvgzAcdCipbZrXu35F80MQk6sO8AjpoOnik=; b=cCMN/SxSENgXHDe8PRaAlYC6+t
	0APyhf//lb8VK7INlVcDcbNunKqjoBmZw9POU7N2ZEJOfZzs0n/fL3/2VnyRtyxuXn6ho5r76MULT
	9z/2B4Pl0OzgKIPBzOvVoxntj43237ma5fBsSW0bvJzcSdhSeYqbL+2iIwXO8fbQWXaWj1YquYKWm
	fkG8T7VgyUTa4IIVxgLyOBsCQSMusx+s3tId3FMmESQBA5ltKLENnNnEvcAqrFfOWU3/aYxVrmgwM
	Huv6l9Q8xpFhV3dascxv7cZLKn+eD/T1TqnW4QePVz53gCJVJrJVnWTWB3mFX3cTlNfGSU57RPQAk
	C49z5Jtw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58654 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNtaP-00000003ql9-1v2S;
	Mon, 02 Nov 2026 20:34:37 +0530
Date: Mon, 2 Nov 2026 07:04:36 -0800
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
Message-ID: <8848aee0-9bdd-49c3-8b51-03eeab488bfa@roeck-us.net>
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
X-Exim-ID: 1xNtaP-00000003ql9-1v2S
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:58654
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 15
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAUcJ6SLN9DpS9ws4P/OziMhDwcH+uIpaEHeeCdV4QOmAcMZG+fKU7sowzPA/o8mdbPx9aTE/2nUiPcGqqFyyjMjrEkP81kqX6mdxv10JZx83bqj9CXO
 e0kH88BgVZL+5DImeaAyvkEs6P+OOEeG8gdl11MlFIoKsxFDnSLgZMMEbxdOGvgxMLNqiiPoGbk26DiIB4BXdF+a6IFBk+YyMDOrL7R9nzwxg7FU4NKDad+P
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
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

Applied.

Thanks,
Guenter

