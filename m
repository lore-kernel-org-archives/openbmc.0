Return-Path: <SRS0=pCii=JL=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2648C433B4
	for <openbmc@archiver.kernel.org>; Wed, 14 Apr 2021 21:13:08 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4805661166
	for <openbmc@archiver.kernel.org>; Wed, 14 Apr 2021 21:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4805661166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLFYt3Xfxz3bqp
	for <openbmc@archiver.kernel.org>; Thu, 15 Apr 2021 07:13:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLFYX4r26z304C
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 07:12:48 +1000 (AEST)
IronPort-SDR: IfPIWM1m2oQ6odYSgbemFPQlcTp7cYSqNePGC5VL6J1oN4Ni0vDCFyyp+x4y0SACajgrMJhdaY
 P/S7IaiM+RXg==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="191551148"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="191551148"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 14:12:45 -0700
IronPort-SDR: NaVu2nE/SJjo2bWl+MunX+TMRVj3tU0YHIExpT7lt34zuG7ZOeODagc3QTdXaYU1k45zRw/YCh
 Ho9Hp3izxsMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="421464733"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 14 Apr 2021 14:12:45 -0700
Received: from [10.252.132.130] (jmbills-MOBL.amr.corp.intel.com
 [10.252.132.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0B7325808AE
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 14:12:45 -0700 (PDT)
Subject: Re: Time for C++20.
To: openbmc@lists.ozlabs.org
References: <YHdMjAsKKA+BKW8X@heinlein>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <69ba3eb8-fab3-c0a3-2530-67ebe0de4526@linux.intel.com>
Date: Wed, 14 Apr 2021 14:12:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YHdMjAsKKA+BKW8X@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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



On 4/14/2021 1:11 PM, Patrick Williams wrote:
> Hello.
> 
> Per [1], as a project we've generally committed to using the latest C++
> standard.  C++20 was released in early Sept. 2020 and already had pretty
> decent compiler support at the time it was released.  We're currently
> using GCC10 and according to [2] it has support for nearly every C++20
> feature I could see us regularly wanting to use(*).  It seems like it
> is a reasonable time for us to move on to it.
> 
> * - Except I recall seeing some mention of std::source_location being
>      useful to fix some of the issues with phosphor-logging, but that
>      won't be available until GCC11.
> 
> In general the C++ standard is backwards compatible.  This shouldn't
> have any impact if you are writing C++17-only code.  What it allows us
> to do is to start using features out of C++20 like the spaceship
> operator and ranges.
> 
> I've put up some commits to start this process.  So far the only hiccup
> I've ran into is that you need Meson 0.57.0 or higher in order for it to
> recognize the 'cpp_std=c++20' option.  I am adding code to our unit-test
> framework to ensure you have this specified in your `meson.build` if you
> are requesting C++20.
> 
>      - https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/42252
>          * Adds some checking to ensure you've specified a meson_version
>            in your meson.build that can handle C++20.
> 
>      - https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/42255
>          * Update C++ style doc from C++17 to C++20.
> 
>      - https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/42256
>          * Update sdbusplus to use C++20.
> 
> Please let me know if you have any concerns with this upgrade; I'll be
> surprised if this not a fairly low-contention move.
+1

I just discovered starts_with() will be available for std::string which 
I want to use.  I turned it on locally and didn't have any issues.

coroutines are also an interesting possibility for some of our async calls.

> 
> 1. https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.md#code-should-be-written-with-modern-practices
> 2. https://en.cppreference.com/w/cpp/20
> 
