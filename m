Return-Path: <SRS0=y4mM=EP=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C8CC2D0A3
	for <openbmc@archiver.kernel.org>; Mon,  9 Nov 2020 18:05:41 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E526E20665
	for <openbmc@archiver.kernel.org>; Mon,  9 Nov 2020 18:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E526E20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVJnZ0J4ZzDqMv
	for <openbmc@archiver.kernel.org>; Tue, 10 Nov 2020 05:05:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVJlz0rS8zDqMv
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2020 05:04:12 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <0647d5b3912534e4cb81d7e4953a26799851e857.camel@fuzziesquirrel.com>
Subject: Re: I just want to join the openbmc developer community
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: =?UTF-8?Q?=E6=9D=A8=E5=8B=87=E5=85=B5=28=E6=9C=AB=E5=B2=A9=29?=
 <moyan.yyb@alibaba-inc.com>, openbmc <openbmc@lists.ozlabs.org>
Date: Mon, 09 Nov 2020 13:04:06 -0500
In-Reply-To: <8da567c0-b5a4-47c0-90d6-d2de96ae99e5.moyan.yyb@alibaba-inc.com>
References: <8da567c0-b5a4-47c0-90d6-d2de96ae99e5.moyan.yyb@alibaba-inc.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?=E5=B8=B8=E7=90=B3=28=E7=89=B9=E7=9D=BF=29?=
 <terui.cl@alibaba-inc.com>,
 =?UTF-8?Q?=E6=9D=8E=E7=BE=BF=28=E4=B9=89=E5=A4=A9=29?=
 <yitian.ly@alibaba-inc.com>,
 =?UTF-8?Q?=E6=9D=8E=E5=BF=97=E5=85=B5=28=E8=BE=B9=E8=8D=92=29?=
 <zhibing.lzb@alibaba-inc.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, 2020-10-23 at 15:34 +0800, =E6=9D=A8=E5=8B=87=E5=85=B5(=E6=9C=AB=E5=
=B2=A9) wrote:
> Hi=EF=BC=8C
>     my name is moyan,who is  workinig for alibaba company. =20

Hi Moyan and Alibaba.  Happy to see you on the mailing list.

> My compay just want to join the openbmc developer community

That's great news.  Welcome!

> , and i have subscribed to openbmc by accessing the website of  "
> https://lists.ozlabs.org/listinfo/openbmc". So, what should i do next?

I would start by reading the contributing guidelines:
https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md

Specifically you'll need to fill out a CLA - additional information can
be found here:
https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-ch=
anges-via-gerrit-server-to-openbmc

After reading, feel free to ask questions here on the mailing list if
anything is unclear.

Thanks!  -brad
