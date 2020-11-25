Return-Path: <SRS0=kwd7=E7=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600EBC56202
	for <openbmc@archiver.kernel.org>; Wed, 25 Nov 2020 15:48:34 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DF8D205CB
	for <openbmc@archiver.kernel.org>; Wed, 25 Nov 2020 15:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DF8D205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch4zw6Rx2zDqws
	for <openbmc@archiver.kernel.org>; Thu, 26 Nov 2020 02:48:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch4w94z1rzDqq8
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2020 02:45:13 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <cfc09cf0a0132458e02c016beb71dd24d38d4a47.camel@fuzziesquirrel.com>
Subject: Re: NVIDIA's OpenBMC CCLA
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Deepak Kodihalli <dkodihalli@nvidia.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "manager@lfprojects.org"
 <manager@lfprojects.org>,  "kurt.r.taylor@gmail.com"
 <kurt.r.taylor@gmail.com>
Date: Wed, 25 Nov 2020 10:45:09 -0500
In-Reply-To: <CH2PR12MB4069EC695F9AD2B008457503A5FA0@CH2PR12MB4069.namprd12.prod.outlook.com>
References: <CH2PR12MB4069EC695F9AD2B008457503A5FA0@CH2PR12MB4069.namprd12.prod.outlook.com>
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
Cc: Ramesh Munaga <rmunaga@nvidia.com>, Mahendra H N <mhn@nvidia.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 2020-11-25 at 09:53 +0000, Deepak Kodihalli wrote:
> Hi,
> 
> Please find attached the signed CCLA from NVIDIA for approval. We look
> forward to working with the OpenBMC community!
> 
> Thanks,
> Deepak Kodihalli

Hi Deepak

Welcome - your CCLA has been accepted.

thx - brad
