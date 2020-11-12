Return-Path: <SRS0=mMtm=ES=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BC8C2D0A3
	for <openbmc@archiver.kernel.org>; Thu, 12 Nov 2020 13:23:47 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43FCA22201
	for <openbmc@archiver.kernel.org>; Thu, 12 Nov 2020 13:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43FCA22201
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CX2Nt2My4zDr0l
	for <openbmc@archiver.kernel.org>; Fri, 13 Nov 2020 00:23:42 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CX2Kc5kY4zDqvp
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 00:20:50 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: New meta-ampere request
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <fbcb9c2f-553c-6ebe-d2d1-69dd072a25ad@os.amperecomputing.com>
Date: Thu, 12 Nov 2020 08:20:43 -0500
Content-Transfer-Encoding: 7bit
Message-Id: <F47638BE-9654-4837-9FE3-1AB188CDB04C@fuzziesquirrel.com>
References: <fbcb9c2f-553c-6ebe-d2d1-69dd072a25ad@os.amperecomputing.com>
To: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

at 1:58 AM, Thang Q. Nguyen <thang@os.amperecomputing.com> wrote:

> Hi Brad,
>
> I am from Ampere Computing. We are using the OpenBMC to develop our BMC  
> for our reference platform (with Ampere CPU and Aspeed AST2500).
>
> We need you to help create a new meta-ampere repository for us to start  
> pushing our codes for review.
>
> Below is the information to create new meta-ampere layer:
>
> Maintainers:
>
>     thang@os.amperecomputing.com
>
>     tung@os.amperecomputing.com
>
> Let me know if I miss anything.
>
>
> Best Regards,
>
> Thang Q. Nguyen

Hi Thang - meta-ampere created!

thx - brad
