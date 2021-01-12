Return-Path: <SRS0=2jgY=GP=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3292C433DB
	for <openbmc@archiver.kernel.org>; Tue, 12 Jan 2021 07:10:20 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0375B22AAF
	for <openbmc@archiver.kernel.org>; Tue, 12 Jan 2021 07:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0375B22AAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yadro.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFMCr5qGQzDqyJ
	for <openbmc@archiver.kernel.org>; Tue, 12 Jan 2021 18:10:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=iilh3zBI; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFMB65FR6zDqXf
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 18:08:46 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id E1523412FD
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 07:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1610435320; x=1612249721; bh=dePUJBkNXPcefgePTmauxgK3U
 WV9ZnW0CS0ZsFINdC8=; b=iilh3zBIs88vb5sBAiyUw6OvWpxLo/DG1pyNNUwGo
 y3n0rcsgTtMzvEcW8MsircWq6jeYpNpD+kiwyzLUTEoAvr+r35/VntVZHvllw9f+
 /4C/quLH0Eaa1FC3zMpBCc3mBMfQr2aYoVrdEPznS2ffltrwYXfghkyxORbvHHdH
 BE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GVnaU4JTkF4L for <openbmc@lists.ozlabs.org>;
 Tue, 12 Jan 2021 10:08:40 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D19FF41279
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 10:08:40 +0300 (MSK)
Received: from [10.199.0.194] (10.199.0.194) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 12
 Jan 2021 10:08:40 +0300
Message-ID: <f44e378cef750f1bfa21a353a138ff8d635c5d7d.camel@yadro.com>
Subject: Re: OpenBMC add sensor in IPMI interface
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Tue, 12 Jan 2021 10:08:39 +0300
In-Reply-To: <afd4b2588f6247a9bb29164f87b5b3f4@TWN-EXCHMB-13.phoenix.com>
References: <afd4b2588f6247a9bb29164f87b5b3f4@TWN-EXCHMB-13.phoenix.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.194]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

This is highly depend on which packets do you use to manage sensors and
IPMI.
E.g. for EntityManager + dbus-sensors + intel-ipmi-oem you likely need
to ensure dbus-sensors know how to work with ISL68137 and enable it EM
configuration.


On Tue, 2021-01-05 at 14:05 +0000, Stanley Liu wrote:
> Greeting,
> Could you share any document or specification for add a sensor and
> can show up from ipmitool, please?
> I tried to add serval sensors with ISL68137 but fail.
>  
> --
> Stanley Liu
> BMC Technical Manager
> +886.(2)77455671
>  
> 
>  
> www.phoenix.com
>  
-- 
Best regards,
Andrei Kartashev


