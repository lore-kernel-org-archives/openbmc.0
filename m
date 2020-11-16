Return-Path: <SRS0=DP8Q=EW=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83C8C5519F
	for <openbmc@archiver.kernel.org>; Mon, 16 Nov 2020 13:58:48 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E4F522280
	for <openbmc@archiver.kernel.org>; Mon, 16 Nov 2020 13:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E4F522280
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZVzV0VmCzDqN0
	for <openbmc@archiver.kernel.org>; Tue, 17 Nov 2020 00:58:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZVvX2CxlzDq9p
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 00:55:19 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: openbmc question
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1175c081-2bac-4700-aee4-a253be48c537.moyan.yyb@alibaba-inc.com>
Date: Mon, 16 Nov 2020 08:55:16 -0500
Message-Id: <61D0DA08-FF7F-4654-BD99-A106C434A6CE@fuzziesquirrel.com>
References: <1175c081-2bac-4700-aee4-a253be48c537.moyan.yyb@alibaba-inc.com>
To: =?utf-8?B?IuadqOWLh+WFtSjmnKvlsqkpIg==?= <moyan.yyb@alibaba-inc.com>
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
Cc: =?utf-8?B?IuW4uOeQsyjnibnnnb8pIg==?= <terui.cl@alibaba-inc.com>,
 openbmc <openbmc@lists.ozlabs.org>,
 =?utf-8?B?IuadjuW/l+WFtSjovrnojZIpIg==?= <zhibing.lzb@alibaba-inc.com>,
 =?utf-8?B?Iuadjue+vyjkuYnlpKkpIg==?= <yitian.ly@alibaba-inc.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

at 4:03 AM, =E6=9D=A8=E5=8B=87=E5=85=B5(=E6=9C=AB=E5=B2=A9) <moyan.yyb@al=
ibaba-inc.com> wrote:

> Hi Brad,
>     while i find that you can help to create a new meta-layer by scanni=
ng the history mails :https://lore.kernel.org/openbmc, and I would  like =
to create a new meta-layer. can you help me?
>
>     Meta name    :    meta-alibaba
>     Maintainers    :    moyan.yyb@alibaba-inc.com
>                                 zhibing.lzb@alibaba-inc.com
> Best grads.

Hi Moyan, sorry - I did this on Friday and then forgot to send out a repl=
y =20
email.  It looks like you found it already, but for anyone else watching =
- =20
meta-alibaba has been created.

thx - brad
