Return-Path: <SRS0=bmDf=OM=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA124C433F5
	for <openbmc@archiver.kernel.org>; Wed, 22 Sep 2021 15:51:07 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257706115A
	for <openbmc@archiver.kernel.org>; Wed, 22 Sep 2021 15:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 257706115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF2p12Ny7z2ynF
	for <openbmc@archiver.kernel.org>; Thu, 23 Sep 2021 01:51:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=KG9p0a2/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com;
 envelope-from=quic_ggregory@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=KG9p0a2/; dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF2nF5FdKz2yJM
 for <openbmc@lists.ozlabs.org>; Thu, 23 Sep 2021 01:50:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1632325826; x=1663861826;
 h=to:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=fV5J8bAgb1u4D/0ObrZwRhdSxogqbSNt24y6viQWTyE=;
 b=KG9p0a2/vSPwxg++hmOL9Ga5EZoH07W+K1RV17y5flVw2sRARPPtOnSn
 RS+0hPoH68SLlm3PZU7ajYOIe2Pp0WtlhWStvCOQR9Sh78UKoIX2IWJpq
 ZDrM1UzXf4VpHmZtB8/r7aRpA5FEwZTe5ApTM+Oi6j/bCGhqq4wG/TTCb E=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 22 Sep 2021 08:49:21 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 08:49:22 -0700
Received: from [10.111.133.116] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Wed, 22 Sep 2021
 08:49:20 -0700
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Graeme Gregory <quic_ggregory@quicinc.com>
Subject: AST2600 EVB eth0 (MAC1) Issue
Message-ID: <8f36a6e9-eccf-5d9b-2c29-3546ded6ba5d@quicinc.com>
Date: Wed, 22 Sep 2021 16:49:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi,

I know A0 versions of the AST2600 had an issue where eth0 was not 
working, but the errata indicates this is fixed in later revisions.

I am seeing an issue on the EVB board though where eth0 (MAC1) is not 
functional. The other three ports all function as expected.

On my DHCP host machine I can see DHCP requests from the AST2600, and 
replies are sent. Looking at /proc/interrupts it looks very much like no 
IRQs are ever generated for incoming packets.

Thanks

Graeme


