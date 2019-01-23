Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kpLK4pySzDqLJ
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 12:56:40 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2019 17:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,509,1539673200"; d="scan'208";a="129926193"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 22 Jan 2019 17:56:37 -0800
Received: from [10.239.196.18] (yongli3-mobl.ccr.corp.intel.com
 [10.239.196.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D3998580487;
 Tue, 22 Jan 2019 17:56:36 -0800 (PST)
Subject: Re: configuring lpc register from user space
To: Vijay Khemka <vijaykhemka@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <898F383C-6AB8-4AF0-91F4-680CA01C2D50@fb.com>
Cc: cheng.c.yang@intel.com, osk@google.com
From: "Li, Yong B" <yong.b.li@linux.intel.com>
Message-ID: <3aa23d34-2d9b-7500-1fb0-a211377ecc4d@linux.intel.com>
Date: Wed, 23 Jan 2019 09:56:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <898F383C-6AB8-4AF0-91F4-680CA01C2D50@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
X-List-Received-Date: Wed, 23 Jan 2019 01:56:42 -0000

Hi Vijay,

For the UART routeing, there is a kernel device driver, it will export 
several entities in sysfs, you can adjust the routing.

https://patchwork.ozlabs.org/patch/969238/

Thanks,
Yong
On 1/23/2019 8:02 AM, Vijay Khemka wrote:
>
> Team,
>
> I know /dev/mem is not supported in production, I need to configure 
> some lpc register to route uart output, so please suggest what is the 
> best ways to do the same. Is there any application or driver interface 
> available which can be used to set some lpc register like 0x1E78909C.
>
> Regards
>
> -Vijay
>
