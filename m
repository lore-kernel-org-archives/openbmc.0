Return-Path: <SRS0=k5r5=GK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9372CC433DB
	for <openbmc@archiver.kernel.org>; Thu,  7 Jan 2021 18:26:46 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8172D23428
	for <openbmc@archiver.kernel.org>; Thu,  7 Jan 2021 18:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8172D23428
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBZSg2x1BzDqDM
	for <openbmc@archiver.kernel.org>; Fri,  8 Jan 2021 05:26:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBZR86c4czDqRm
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jan 2021 05:25:23 +1100 (AEDT)
Received: from [192.168.0.6] (ip5f5aed01.dynamic.kabel-deutschland.de
 [95.90.237.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 06CEB20647DA0;
 Thu,  7 Jan 2021 19:25:17 +0100 (CET)
Subject: Re: Upstreaming downstream Google BMC repositories
To: Benjamin Fair <benjaminfair@google.com>
References: <CALGRKGM0A9DHYuHrKrCLS8U0+YnbMCgVHWEXjbMW7Juhq+r=Zg@mail.gmail.com>
 <2e3f9acc-cc58-6f71-2e42-e046109dd5ec@molgen.mpg.de>
 <CADKL2t5ajasf9NzFbTwtT0=W7ZO2jcfD5V+tk5VVSrkZTuLNmw@mail.gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <711a5031-c774-4b03-6a6e-1f14d8699789@molgen.mpg.de>
Date: Thu, 7 Jan 2021 19:25:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CADKL2t5ajasf9NzFbTwtT0=W7ZO2jcfD5V+tk5VVSrkZTuLNmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Brandon Kim <brandonkim@google.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>


Dear Benjamin,


Am 07.01.21 um 18:33 schrieb Benjamin Fair:

> On Thu, 7 Jan 2021 at 00:09, Paul Menzel <pmenzel@molgen.mpg.de> wrote:

>> Am 07.01.21 um 02:49 schrieb Brandon Kim:
>>
>>> We're exploring ways of upstreaming some of the downstream repositories
>>> from Google to openbmc/* .
>>>
>>> Half, if not most of the downstream repositories are C++ daemons that are
>>> specific to Google so we didn't want to create a bunch of new
>>> openbmc/<repo> that no one would use.
>>>
>>> An idea that Ed gave me was having something like openbmc/google-misc
>>> repository for all these repositories and if there are any that seem useful
>>> to others, we can break it out into a different, separate repository in
>>> openbmc/* layer.
>>>
>>> Please let me know if this seems like a good idea and I'm open to other
>>> suggestions!
>>
>> Thank you very much for putting in the effort to make these repositories
>> public.
>>
>> Using the openbmc/google-misc approach, how would the git history
>> (commit log) be handled?
>>
>> Personally, I would prefer having small repositories as git makes that
>> very easy to handle. Also it might save you time, as you do not have to
>> think about what to do with the git history, and do not have to merge it.
> 
> We would most likely squash the history together, in case there's
> something confidential or private in the earlier commits.

Understood. If that could be avoided, and only the confidential stuff 
removed, that would be great, as the git history gives a lot of insight 
into design decisions.

> Many small repos would be easy to handle for us, but OpenBMC may not
> want to have lots of small Google-specific repos in their org as this
> may make it more cumbersome for others to find the relevant repos that
> they're interested in.

Understood. On the other, with small repositories, they can only use the 
parts they need.

> There's also overhead for the project maintainers to create the
> relevant groups and permissions for each new repo.
Please note, that Without knowing the contents of the repositories and 
the size, this is all just my opinion. If the OpenBMC “admins“ can 
easily create several repositories, I’d prefer that route. If it’s too 
much work for them, their preference should be chosen.


Kind regards,

Paul
