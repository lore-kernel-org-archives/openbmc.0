Return-Path: <richard.marian.thomaiyar@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YqD71J7rzDqSW
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 22:05:10 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2019 03:05:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,453,1539673200"; d="scan'208";a="115086914"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.68.190])
 ([10.252.68.190])
 by fmsmga008.fm.intel.com with ESMTP; 08 Jan 2019 03:05:06 -0800
Subject: Re: intel-ipmi-oem_git.bb compiler error
To: openbmc@lists.ozlabs.org
References: <bcd8a8d63a0141929785d792135a4a2f@TWMBX02.aspeed.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <cbf22a18-a320-3a90-d382-0deb72956c99@linux.intel.com>
Date: Tue, 8 Jan 2019 16:35:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <bcd8a8d63a0141929785d792135a4a2f@TWMBX02.aspeed.com>
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
X-List-Received-Date: Tue, 08 Jan 2019 11:05:12 -0000

Pushed a fix for the same. You can apply it in your openbmc/meta-intel, 
this should fix your problem.

https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-intel/+/17150/

regards

Richard

On 1/8/2019 2:48 PM, Ryan Chen wrote:
> Hello OpenBMC,
>
> 	When I build meta-s2600wf, it get following compiler error, does there have some patch for fix it?
>
> 	ERROR: intel-ipmi-oem-0.1+gitAUTOINC+52341e8543-r0 do_compile: Function failed: do_compile (log file is located at /home/ryan/work/project/ast/openbmc/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+52341e8543-r0/temp/log.do_compile.15094)
> ERROR: Logfile of failure stored in: /home/ryan/work/project/ast/openbmc/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+52341e8543-r0/temp/log.do_compile.15094
>
> Ryan
