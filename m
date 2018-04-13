Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40N3664hM8zF1lY
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 02:25:18 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Apr 2018 09:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,446,1517904000"; d="scan'208";a="220216714"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO [10.255.31.195])
 ([10.255.31.195])
 by fmsmga006.fm.intel.com with ESMTP; 13 Apr 2018 09:25:11 -0700
Subject: Re: [PATCH ipmi/kcs_bmc v1] ipmi: add an NPCM7xx KCS BMC driver
To: minyard@acm.org, openipmi-developer@lists.sourceforge.net,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: joel@jms.id.au, avifishman70@gmail.com
References: <1521723015-19142-1-git-send-email-haiyue.wang@linux.intel.com>
 <4a878c46-9451-8ee6-c067-955a0bd651d0@acm.org>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <9fffe8eb-5e9b-db84-be9e-fa415d52a88b@linux.intel.com>
Date: Sat, 14 Apr 2018 00:25:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <4a878c46-9451-8ee6-c067-955a0bd651d0@acm.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Fri, 13 Apr 2018 16:25:19 -0000

Thanks, Corey.

BR,

Haiyue


On 2018-04-13 23:56, Corey Minyard wrote:
> On 03/22/2018 07:50 AM, Haiyue Wang wrote:
>> This driver exposes the Keyboard Controller Style (KCS) interface on
>> Novoton NPCM7xx SoCs as a character device. Such SOCs are commonly used
>> as a BaseBoard Management Controller (BMC) on a server board, and KCS
>> interface is commonly used to perform the in-band IPMI communication
>> between the server and its BMC.
>
> Sorry, I missed this.  It is queued for the next kernel release.
>
> Thanks,
>
> -corey 
