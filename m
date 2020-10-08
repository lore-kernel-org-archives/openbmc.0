Return-Path: <SRS0=YW43=DP=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161B4C433E7
	for <openbmc@archiver.kernel.org>; Thu,  8 Oct 2020 16:42:32 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CEF221D7D
	for <openbmc@archiver.kernel.org>; Thu,  8 Oct 2020 16:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CEF221D7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6cSN5HjVzDqX0
	for <openbmc@archiver.kernel.org>; Fri,  9 Oct 2020 03:42:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6cPz75C0zDqWm
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 03:40:20 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <8ee485fcff511f7a9867a4484f55155c38ea8ec9.camel@fuzziesquirrel.com>
Subject: Re: Heading out
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: James Feist <james.feist@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Thu, 08 Oct 2020 12:40:15 -0400
In-Reply-To: <9ca9dd09-b381-d0e9-bd63-9a23496c97e1@linux.intel.com>
References: <9ca9dd09-b381-d0e9-bd63-9a23496c97e1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2020-10-07 at 11:21 -0700, James Feist wrote:

> It's been great working with you all. 

Likewise James!  Good luck out there.  Thank you for everything you've
done for OpenBMC.

-brad
