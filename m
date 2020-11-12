Return-Path: <SRS0=mMtm=ES=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE47C2D0A3
	for <openbmc@archiver.kernel.org>; Thu, 12 Nov 2020 13:26:29 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4433E207BB
	for <openbmc@archiver.kernel.org>; Thu, 12 Nov 2020 13:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4433E207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CX2S06V4DzDqKM
	for <openbmc@archiver.kernel.org>; Fri, 13 Nov 2020 00:26:24 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CX2Mn61BjzDqwp
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 00:22:45 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: I just want to join the openbmc developer community
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <cc0cc576-62d0-4c63-93d2-11d585b557a6.moyan.yyb@alibaba-inc.com>
Date: Thu, 12 Nov 2020 08:22:42 -0500
Message-Id: <F137C3AA-8FA4-4404-831F-C8BDA5B1465F@fuzziesquirrel.com>
References: <8da567c0-b5a4-47c0-90d6-d2de96ae99e5.moyan.yyb@alibaba-inc.com>
 <0647d5b3912534e4cb81d7e4953a26799851e857.camel@fuzziesquirrel.com>
 <cc0cc576-62d0-4c63-93d2-11d585b557a6.moyan.yyb@alibaba-inc.com>
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
 =?utf-8?B?Iuadjue+vyjkuYnlpKkpIg==?= <yitian.ly@alibaba-inc.com>,
 =?utf-8?B?IuadjuW/l+WFtSjovrnojZIpIg==?= <zhibing.lzb@alibaba-inc.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

at 8:26 PM, =E6=9D=A8=E5=8B=87=E5=85=B5(=E6=9C=AB=E5=B2=A9) <moyan.yyb@al=
ibaba-inc.com> wrote:

> Hi Brad=EF=BC=8C
>     The thing you said i hvae finished,and i have send the file of CCLA=
 to krtaylor . Then  i want to create a directory named "meta-alibaba" wh=
ich under the openbmc, but i can't know how to create it, can you help me=
?

Oops - yeah I missed that you submitted a CCLA.  Sorry about that.

meta-alibaba created.  Thanks!  Once you have merged a couple patches int=
o =20
meta-alibaba I=E2=80=99ll add it as a subtree to openbmc.

-brad
