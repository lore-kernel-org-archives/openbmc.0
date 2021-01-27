Return-Path: <SRS0=cMHj=G6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63ABEC433E0
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 12:05:41 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E593E20784
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 12:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E593E20784
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yadro.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQj3j3QLWzDqd1
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 23:05:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=JTNJkwK5; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQhxN0glnzDqSN
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 23:00:00 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DB04F41273
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 11:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1611748794; x=1613563195; bh=pDh
 FGsED/SGmu8QzOXh1tZWzr/mkLYeHWpPxmFRGIoE=; b=JTNJkwK5tk0WiniFle0
 iC6bm9+5LMQmWlrPBiyOzOKWZMMYF7/5+DkXmu4PT/dXFPeANoTYdvYymDHzu4j/
 SxJbK3gRW5z/fVx1QYtzWnGZLNxuDsXYSTB10BFj2UMGvi0CdV6XA70nMPCFZCne
 L6LfePdMwvjycS9+s3m0tNSk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXfoBEkdVnE4 for <openbmc@lists.ozlabs.org>;
 Wed, 27 Jan 2021 14:59:54 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CBCC141256
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 14:59:54 +0300 (MSK)
Received: from [10.199.0.224] (10.199.0.224) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 27
 Jan 2021 14:59:54 +0300
Subject: Re: Gerrit owners plugin coming
To: <openbmc@lists.ozlabs.org>
References: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
 <CACWQX8236dghCCdnDAdnij0Di_GF7DsmAO_xEtWmk6ckKDocYg@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <e18c023a-ccb3-6591-1092-cd488cd331e9@yadro.com>
Date: Wed, 27 Jan 2021 14:59:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CACWQX8236dghCCdnDAdnij0Di_GF7DsmAO_xEtWmk6ckKDocYg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.199.0.224]
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

26.01.2021 00:26, Ed Tanous пишет:
> On Wed, Jan 20, 2021 at 11:23 AM Ed Tanous <ed@tanous.net> wrote:
>> Over the last few weeks, we've been slowly getting the gerrit owners
>> plugin deployed and tested, and got the OWNERS files merged into their
>> respective meta layers.
> These changes are live.  Any commits to the individual meta layers can
> now be submitted directly to openbmc/openbmc now.  If there's anything
> broken about the new workflow, or anything unexpected happens in your
> workflow, please let me know on discord and we'll try to get it
> resolved.

Does this mean that meta-<vendor> directories are not subtrees anymore 
and respective repositories are now obsolete and can (will?) be dropped?

Thanks.

Alexander.

