Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41FGNr0rjMzF1H5
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 16:29:46 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jun 2018 23:29:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,273,1526367600"; d="scan'208";a="70031015"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO [10.67.68.36])
 ([10.67.68.36])
 by orsmga002.jf.intel.com with ESMTP; 25 Jun 2018 23:29:42 -0700
Subject: Re: [PATCH v2] ipmi: kcs_bmc: fix IRQ exception if the channel is not
 open
To: minyard@acm.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
Cc: luis.a.silva@dell.com, avi.fishman@nuvoton.com, openbmc@lists.ozlabs.org
References: <1529761873-323254-1-git-send-email-haiyue.wang@linux.intel.com>
 <3d5b2b55-381b-562a-9c02-52a8bdfc1a0d@acm.org>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <86f77082-c77c-c86a-b884-cb699973bede@linux.intel.com>
Date: Tue, 26 Jun 2018 14:29:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <3d5b2b55-381b-562a-9c02-52a8bdfc1a0d@acm.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Fri, 29 Jun 2018 09:28:40 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jun 2018 06:29:49 -0000



On 2018-06-26 03:34, Corey Minyard wrote:
>> return 0 to low level IRQ handler to indicate that the IRQ is handled.
>
> I've looked at this some more, and I think it's ok, especially with 
> the better description.
>
> I'm going to submit this for the current release after it sits in next 
> for a bit.
>
Got it, thanks, Corey.

BR,
Haiyue
> Thanks,
>
> -corey
>
>> Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
>> ---
>> v1 -> v2:
>>    - Change the commit message to be more understandable.
>> --- 
