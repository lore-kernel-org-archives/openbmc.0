Return-Path: <openbmc+bounces-2740-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8CDCA5FF1
	for <openbmc@archiver.kernel.org>; Wed,  7 Oct 2026 13:00:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j0Csk6Hz5z30Ng;
	Thu, 08 Oct 2026 00:00:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791378042;
	cv=none; b=iNsTPSjOjtKq1lYFOCjvTx66h/AbbRwCJ+NgNhS03eRDoccKIRFis9MAn6NSdLf3a8vN3NsWHehs++QQAfFuDNj1dDemX5DygF4OmogYqClgpXbfM6JARHMaqwIPGh31a7x0Dtjwr/Wxs48/lP1047BPZgCZUn6UXevVB9ckGURb1bzO4khi/CX6uy53mYjLlf/EamR3VlxeyE+IvCAlTuO3HFmg8alOUfXsifnrie3VVWAD3f77NWbR/mdI/+eVKGNFzP3Du0thxWEIcMwAB9YEyapgxD29sdNh9ByVRKEA88CgWZtNw9PNwK/4x+bXECkkskH4GAs2U7C6WZnb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791378042; c=relaxed/relaxed;
	bh=REdeZoUp6qd+23qVkDw6ILyyxhEdQ14eZDfu7ch2t68=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=PGSH3bOflbH9TfEIIRBXgOXwrAuimOTIcPelmedUH8CjSMshEvOegznEup6Bqsevv7zMZ+YSutwvq3CRCzYrxWWvvC1bmhQusSzjmVDWCjiwn0lwYnO792ga5KUvYg6pVLk/4NY/DMe5n0PmfJcbYNwdMBz20YTn4YkI2izp9JO2qZWyOn5Mze07CKuyYkz73HSHml1PLNpA+nBLYrmdLAa+++OGBDpff2Da+icuA85e+a93IxrOufRrjNVd5g9QipJTAIqvJswg3r9tMq6V0R/g0EjvT8sKK40GjGgl88bXZ7zM80VoL24BZKsMbb1AgCowmWEy/NpE+rmxeiGr7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=Cwqvhcst; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=Cwqvhcst;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j0Csh44gSz2xwP
	for <openbmc@lists.ozlabs.org>; Thu, 08 Oct 2026 00:00:39 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48c02782159so1189105f8f.0
        for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2026 06:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1791378031; x=1791982831; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:cc:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=REdeZoUp6qd+23qVkDw6ILyyxhEdQ14eZDfu7ch2t68=;
        b=CwqvhcstTuBQKMTdRz11Q+nWhJuAEKR+NEnetGFCUOCWFA3U1RKcteg4ONBvT5K92p
         Ogmexn7saXF7L7nB0sHyEFrzg1fczgcrIZoFrPrIjTVU4mt3K3cMkU3t6y6oVRgEpVmq
         wPFAYjij9UiEDuXRbvnAkeUgUTtm0vY3VBO9wsTv7pqhv+ZcOTISF6lcVwae9NP8Be5W
         nBvPw5fg65V3qUAzjZwZLQ7ImMR/CeMl76mef6bhZCo09L4p/bBETgJXIwGSIYbX2o7t
         AaOPU9PWiusS0R+wMZYPkEFwUqILngYhBM+6V3Q+WjqOmDfRadZMx//KMnOUnBNrpGIz
         M1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791378031; x=1791982831;
        h=content-transfer-encoding:content-type:cc:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REdeZoUp6qd+23qVkDw6ILyyxhEdQ14eZDfu7ch2t68=;
        b=HsfQQScxwnffLCeWdXzEDOt1MMrwjmEiHtqvAOMNyfVwDL79eDzw3RypkpfIiSspqH
         71Hdxx1uCbZ/w8J4KYDJCtldYk96JFFIzqy+59hhw2PnLnO/nnFtn5VH4PD0rN343jtF
         FYvPK2uFpbSpCrfVDxtabb2kMn1DuFnYBPtd+gN+/9ktYvnFZKObRNfR+5NUxmrYpd1n
         M7vte4vde85Jeuyn6IbVhUxyeOMF/SF9i5P3rzMAGRW90MNVkvIW63SR/PT+oSISuqYX
         RFwBfz5TEvgm62BCm35MbXYfA1f+/CvGGjDq8jwBeeUQRCKIiQQa/SU1qV4HKnKneJ0K
         3E8g==
X-Gm-Message-State: AFuF++mblXhGVULMYZ+yl09DOAy1ZK3uOdDtK6/yUEUW3kWUau839AcG
	1DQABcDkvs4gvsTDK8ugWfXoGdpOeZW9jeO+D06nWlOhQJStgql6jj8U/QXqk/SUogwmCVwzStl
	+Gobp
X-Gm-Gg: AYBFou17PDSU+sKa6GKdBvmr8DOji+Wx7gbDJ/26zT2q8T51EHBvhchUFZ5J6BNTW1w
	Uij7+FLDJJqKXWAY3NZ/ZI3Q2SsenxL0/DPGV0XdoPhn06n1BI7D+WJ5wkBbzPIQbsD90bzg70h
	oyZbzwzUEBB6GQbfKEH3cY6OXLwfZNTGQRESZVQVb4xS2kSvkeTpqSPe14iAbT1YT0PWLMxVA0D
	6NY6j7K+feiSgqT1L/ntkkcOvLDugCkVrj4Z32DusuEQcK2h0GXuw6N6nr82O26UFi0sdKFkq5U
	+Nhs+7ZkiWBDu3+S0ILwkyZGKJs3h9DZeJC6xw7dQjoQcXGWzIhAWHldMe2qKBoK+SIqPe6PrQz
	wXSQrwST32cnEzxTwc06kzEqDEoAgdFmlUOxidy7dG3bFrR37flINsLRlRDRwYNopg09M/BQWxO
	HAvdtfdlb1XCRITrRbUx74jfBizhqLHtpa6/g6qVpCWgfSGXdLd5lFikm/IautoICb7EDPIrRbc
	uq6c49KjiqpRNiryRtO8h1xmOW6FiUIeG6OHQ5PCkrpOE/jrw==
X-Received: by 2002:a05:600c:3b2a:b0:49f:cc2a:f73a with SMTP id 5b1f17b1804b1-4a1806502a2mr36686035e9.25.1791378030941;
        Wed, 07 Oct 2026 06:00:30 -0700 (PDT)
Received: from ?IPV6:2a01:599:841:5e78:b8de:a24e:36aa:aa5? ([2a01:599:841:5e78:b8de:a24e:36aa:aa5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f486b6fsm51346605e9.1.2026.10.07.06.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 06:00:30 -0700 (PDT)
Message-ID: <416544b8-d2ae-4c8b-a7e5-7dd9de7aef86@9elements.com>
Date: Wed, 7 Oct 2026 15:00:28 +0200
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: Tan Siewert <tan.siewert@9elements.com>
Subject: openbmc/u-boot v2026.10-openbmc branch is now available
Cc: vince_chang@aspeedtech.com, Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

With U-Boot v2026.10 released, I've now pushed a new branch called 
"v2026.10-openbmc" to openbmc/u-boot. This branch will be used for *new* 
SoCs like the ASPEED AST2700 or the HPE GXP.
The AST2400, 2500 and 2600 will still be maintained on 
"v2019.04-aspeed-openbmc", and device tree submissions as well as driver 
fixes are still being accepted there.

If you want to submit a patch for, e.g., the AST2700 (or platforms that
use an AST2700), then please send it upstream first, similar to our 
kernel development process [0].

For backports of applied or still-pending patches, please include the 
branch name in your subject prefix.

Further information on which branch you have to use can be found at [1].

Cheers,
Tan

[0] 
https://github.com/openbmc/docs/blob/93b1e07c59cd8bc11e7afaaba4172b21a0a5b552/kernel-development.md?plain=1#L27
[1] 
https://github.com/openbmc/docs/blob/93b1e07c59cd8bc11e7afaaba4172b21a0a5b552/kernel-development.md?plain=1#L80

