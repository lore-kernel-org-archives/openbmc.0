Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41C5Ww0PbSzF0kx
 for <openbmc@lists.ozlabs.org>; Sat, 23 Jun 2018 03:43:23 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jun 2018 10:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,258,1526367600"; d="scan'208";a="59425774"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO [10.249.173.233])
 ([10.249.173.233])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jun 2018 10:43:17 -0700
Subject: Re: [PATCH ] ipmi: kcs_bmc: fix IRQ exception if the channel is not
 open
To: minyard@acm.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
Cc: luis.a.silva@dell.com, avi.fishman@nuvoton.com, openbmc@lists.ozlabs.org
References: <1529636218-280096-1-git-send-email-haiyue.wang@linux.intel.com>
 <ea0a4cd3-2973-7ac8-c4a1-26379d9066cc@acm.org>
 <980bbe06-afa6-67b0-a3d3-c5fd921dcfbd@linux.intel.com>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <3950b9ff-79d6-b0f8-91fb-1a13b34c24d2@linux.intel.com>
Date: Sat, 23 Jun 2018 01:43:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <980bbe06-afa6-67b0-a3d3-c5fd921dcfbd@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Mon, 25 Jun 2018 09:18:43 +1000
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
X-List-Received-Date: Fri, 22 Jun 2018 17:43:24 -0000



On 2018-06-23 01:23, Wang, Haiyue wrote:
>> Maybe it's best to have the interrupt disabled unless the device is 
>> open.
>> You have to handle the interrupt disable race on a close, but with the
>> sync functions that shouldn't be too hard.
>>
> In fact, in BMC chip design, the LPC controller has many devices, such as
> Port 80 snoop, BT, KCS etc, they shares the same interrupt. :) 
BTW, for AST2500, if the BMC and PCH run under eSPI (like LPC) mode, and 
if we
disable the KCS devices, then reboot the BMC, it will cause the system 
hang, and
the KCS channel can't be used anymore. So we need always enable these 
used KCS
devices (keep the KCS enable register setting) for working well under 
eSPI mode.
