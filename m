Return-Path: <SRS0=8onI=EX=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2E0C388F9
	for <openbmc@archiver.kernel.org>; Tue, 17 Nov 2020 00:21:59 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E697B2074B
	for <openbmc@archiver.kernel.org>; Tue, 17 Nov 2020 00:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E697B2074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZmpX4HD8zDqQJ
	for <openbmc@archiver.kernel.org>; Tue, 17 Nov 2020 11:21:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZmmr0BxnzDqNv
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 11:20:25 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 16 Nov 2020 19:20:18 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Hancock Chang <HancockC@supermicro.com.tw>
Subject: Re: Need to create Supermicro's repo for OpenBMC Contribution
Message-ID: <20201117002018.6aeprjl5cy2otryk@thinkpad.fuzziesquirrel.com>
References: <56e966abb56a491fafe047d03b8453a3@TW-EX2013-MBX2.supermicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <56e966abb56a491fafe047d03b8453a3@TW-EX2013-MBX2.supermicro.com>
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
Cc: Ryan Sie <RyanS@supermicro.com.tw>, Kevin Liu <Kevin_Liu@supermicro.com.tw>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 krtaylor <kurt.r.taylor@gmail.com>, Michelle Liu <MichelleLiu@supermicro.com>,
 Ryan Zhou <RyanZ@supermicro.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, Nov 13, 2020 at 01:14:40AM +0000, Hancock Chang wrote:
>Hello Kurt,
>
>As previous communication in below, Supermicro has completed the CLA and been accepted, our BMC dev team is preparing to have some contribution to OpenBMC, so would like to ask for help to create "meta-supermicro repository as openbmc subtree" then could start to follow the process to do some contribution
>
>We have 2 BMC senior staff would be as repo owner, name and email address as below assume this will be needed for creating the meta-ampere repository.
>
>     Ryan Sie, RyanS@supermicro.com.tw
>     Ryan Zhou, RyanZ@supermicro.com

meta-supermicro created.

-brad
