Return-Path: <SRS0=PhQT=C7=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C6BC4363D
	for <openbmc@archiver.kernel.org>; Tue, 22 Sep 2020 14:21:59 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 359F920C09
	for <openbmc@archiver.kernel.org>; Tue, 22 Sep 2020 14:21:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=yadro.com header.i=@yadro.com header.b="I6T83fM0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 359F920C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yadro.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwk5b259rzDqWt
	for <openbmc@archiver.kernel.org>; Wed, 23 Sep 2020 00:21:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=I6T83fM0; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwk2h5fd3zDqRb
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 00:19:24 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 31ECD578F5;
 Tue, 22 Sep 2020 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:user-agent:date:date:mime-version
 :content-type:content-type:organization:references:in-reply-to
 :from:from:subject:subject:message-id:received:received
 :received; s=mta-01; t=1600784357; x=1602598758; bh=i/cGuyCr12R6
 KsW96aXNCSEm8ncA4JfpNhv28PcL224=; b=I6T83fM0c+0YX2fGDRxxxMmyF7X1
 A+kxzmmSK67HSK1VN3MR4SbhaWbVe+pJTX+0pRL7TsX8FkZu/vLDpf7IebGgGHel
 vTJOhH4HPHY+9gaZSpPV2sN8vi0hjTtavqJcMqmpFTA1C8kqWnevEjQbOhbhxHob
 NewxvKGtU8fjmbM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5AvKkI5jeY-r; Tue, 22 Sep 2020 17:19:17 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 83932578D1;
 Tue, 22 Sep 2020 17:19:17 +0300 (MSK)
Received: from localhost.localdomain (10.199.1.186) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 22 Sep 2020 17:19:17 +0300
Message-ID: <fce248ffb745156353ec36abbb3b57ac52844f2e.camel@yadro.com>
Subject: Re: Design proposal for dual BMC flash with "golden image"
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Lei Yu <yulei.sh@bytedance.com>
In-Reply-To: <CAGm54UEwmNNvx-aCud2S46Aa+A051PDK4KuYUvL=Doqd=nnU9Q@mail.gmail.com>
References: <CAGm54UETBZ-EAR-2tha+qHTH7h3H_1vZUe2Tp5kOTzY0isKLtw@mail.gmail.com>
 <636cd7a2-8b60-2868-104f-70378bf30a08@yadro.com>
 <CAGm54UFJYnk=dcaWd7rsyUoBHqMkwgSLi5oYAjsMCmkugE+HaA@mail.gmail.com>
 <9ae6b1f98e354503aab6ed1af5452e8cffba7d7f.camel@yadro.com>
 <CAGm54UHG611qtbKObUkFOYjaSkSd+tMabJ=kOwo9TkauyejyRg@mail.gmail.com>
 <27aecca09a3f74d12974bfafde830ded5d69a7e0.camel@yadro.com>
 <CAGm54UFFzkTTKCXCCpFunp8i23Eu8n25gXWcjx5RWm9ioWwrdg@mail.gmail.com>
 <0bf34c28a4640d9155c3143775dfd0f7b0ee8101.camel@yadro.com>
 <CAGm54UEwmNNvx-aCud2S46Aa+A051PDK4KuYUvL=Doqd=nnU9Q@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date: Tue, 22 Sep 2020 17:19:46 +0300
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.1.186]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Alexander Amelkin <a.amelkin@yadro.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 2020-09-16 at 20:13 +0800, Lei Yu wrote:
> On Wed, Sep 16, 2020 at 8:02 PM Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
> > > The plan is:
> > > 1. When the primary flash is broken and u-boot could not be started,
> > > aspeed will switch to the golden side automatically.
> > > 2. When the primary flash's u-boot is OK, but the kernel/rofs fails a
> > > couple of times, the u-boot could detect this and switch to the golden
> > > side by setting the related registers. See example in
> > > https://github.com/openbmc/openbmc/blob/master/meta-phosphor/aspeed-layer/recipes-bsp/u-boot/files/0005-config-ast-common-Fall-back-to-secondary-flash-on-fa.patch
> > 
> > That's the standard procedure, I'm saying that you may need the access to
> > the
> > golden side at any time for different purposes(support engineers,
> > manufacturing
> > department, some problems in field) and how you can achieve that? With u-
> > boot
> > env set or manual watchdog trigger?
> 
> In that case, we could manually trigger watchdog by:
> 1. Enable devmem by appending mem.devmem in bootargs in u-boot, and reboot
> 2. Now devmem could be used, manually trigger wdt2
> 
> Be noted that such case should be rare in the field.
> In the lab, we could enable devmem by default and just use it.

I'm trying to say that if it would be done by low level application, would it be
much better without additional reboots? Just app execution like:
 <app> --to-golden-side

It will remove all these steps with devmem hacks. 

Thanks.

