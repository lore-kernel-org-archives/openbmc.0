Return-Path: <SRS0=lo3E=C6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F7FC43466
	for <openbmc@archiver.kernel.org>; Mon, 21 Sep 2020 14:39:50 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F6532220C
	for <openbmc@archiver.kernel.org>; Mon, 21 Sep 2020 14:39:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=yadro.com header.i=@yadro.com header.b="l5UKMlin"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F6532220C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yadro.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw6Xg0D77zDqdn
	for <openbmc@archiver.kernel.org>; Tue, 22 Sep 2020 00:39:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=l5UKMlin; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw6Pg051PzDqcK
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 00:33:38 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DA2EC542C0;
 Mon, 21 Sep 2020 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1600698811;
 x=1602513212; bh=sl/bbaN7gHoVOwpV8ZFfaklqmYRCUi5N4CCaJ2lSczs=; b=
 l5UKMlin+Xe1+yMzNf0QpzA9M6CEkJadBprJa0kp8LhfdGtfP9YtTAHwN44AlFky
 NCvoD+z8UK2dxEAOY/HbIE450vYJaEhg1sJSKoAyvt17We7nsHnNVWJyb9cfqe9j
 tLgDUcoU+rgGQAS2PfK3Gjf6RgdBe11iDzK5n3bELhM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HOARuhoMZUp7; Mon, 21 Sep 2020 17:33:31 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 98A9C53F9D;
 Mon, 21 Sep 2020 17:33:31 +0300 (MSK)
Received: from localhost (172.17.14.122) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 21
 Sep 2020 17:33:31 +0300
Date: Mon, 21 Sep 2020 17:33:31 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: Headsup: Alternative to the filesystem overlay
Message-ID: <20200921143331.GA20273@bbwork.lan>
References: <CADVsX88ZPmZh+txe1Zis4YfJnXQ4_n-40r6p5Y1hy5_KegUeaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CADVsX88ZPmZh+txe1Zis4YfJnXQ4_n-40r6p5Y1hy5_KegUeaQ@mail.gmail.com>
X-Originating-IP: [172.17.14.122]
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
Cc: Anton Kachalov <rnouse@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, Sep 21, 2020 at 11:52:54AM +0200, Anton Kachalov wrote:
> There was a topic year ago:
> 
> https://lists.ozlabs.org/pipermail/openbmc/2019-August/017611.html
> 
> Is anyone currently working in this direction? Any thoughts on possible
> approaches?

As I can see there is no any actions in this direction.

I solved the problem with a difference of the user groups set during firmware
upgrade by installing a systemd service which starts on the first BMC boot after
upgrade and merges groups from RWFS and new ROFS.

This recipe is stored in our internal repo only, but I can share it if it is
interesting to someone.

The problems with other files is not met yet.

> 
> We're going to revisit this and discuss possible solutions.
> 
> One point to mention is: introduce an image feature flag that would enable
> rootfs overlay, i.e. for development purposes.

We still use a static flash layout on our hardware which already uses overlayfs.
It works fine for us.

--
Regards,
Alexander
