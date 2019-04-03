Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZB4v0jtMzDqKT
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 03:15:26 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 09:15:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,305,1549958400"; d="scan'208";a="139689684"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga003.jf.intel.com with ESMTP; 03 Apr 2019 09:15:22 -0700
Subject: Re: [PATCH dev-5.0 v4 0/7] Enable video engine
To: Eddie James <eajames@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Eddie James <eajames@linux.ibm.com>, Ed Tanous <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1554172950-2072-1-git-send-email-eajames@linux.ibm.com>
 <CACPK8Xfn6-_zKpY9ga38Pwv74kKQ-Wi7FkXs03nUV4m=0p9r7g@mail.gmail.com>
 <a4ae9e4e-6432-727e-e2b7-3c519b5bd648@linux.vnet.ibm.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <10a19a42-fc2e-7dc7-103e-34d4c7391faf@linux.intel.com>
Date: Wed, 3 Apr 2019 09:15:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <a4ae9e4e-6432-727e-e2b7-3c519b5bd648@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Wed, 03 Apr 2019 16:15:28 -0000

On 4/3/2019 7:44 AM, Eddie James wrote:
> 
> On 4/3/19 1:34 AM, Joel Stanley wrote:
>> On Tue, 2 Apr 2019 at 02:42, Eddie James <eajames@linux.ibm.com> wrote:
>>> This series adds the necessary clocks for the video engine to the 
>>> Aspeed clock
>>> driver. It also adds the video engine node to the AST2500 dts and 
>>> enables that
>>> node in the witherspoon and romulus dts. It also removes the use of 
>>> the reset
>>> line in the video engine driver.
>> I've booted your patches on my system. How do you test this feature?
> 
> 
> You need a stack of userspace additions including libvncserver and 
> obmc-ikvm:
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/19501
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/13536
> 
> As well as patches for the web UI which I'm not familiar with. Jae do 
> you have those?

You should cherry pick this patch:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/10268

You might need to resolve merge conflicts of tab indices in the patch.

Ed, Do you have any plan to rebase the patch?


> For my testing I've been patching obmc-ikvm so I can connect with raw 
> VNC to port 0 of the BMC IP; here's the stack I've been using:
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/20081
> 
> Thanks,
> 
> Eddie
> 
>>
>> Cheers,
>>
>> Joel
>>
> 
