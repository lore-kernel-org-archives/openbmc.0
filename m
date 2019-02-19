Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 443rXR6m4szDqJ3
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 06:34:31 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2019 11:34:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,388,1544515200"; d="scan'208";a="127681393"
Received: from unknown (HELO [10.7.153.148]) ([10.7.153.148])
 by orsmga003.jf.intel.com with ESMTP; 19 Feb 2019 11:34:28 -0800
Subject: Re: obmc-ikvm host OS console mode issue
To: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>
References: <tencent_381DA9DC452799622EA1E4E4@qq.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <58bd46dc-9e6a-39fe-20a5-6f6bd65109c8@linux.intel.com>
Date: Tue, 19 Feb 2019 11:34:28 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <tencent_381DA9DC452799622EA1E4E4@qq.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
X-List-Received-Date: Tue, 19 Feb 2019 19:34:32 -0000

Hi xiuzhi,

I don't think the commit causes the issue. Check aspeed-video driver
module in kernel that what happens on video mode change events.

Cheers,
Jae

On 2/19/2019 12:26 AM, xiuzhi wrote:
> Hi Jae,
>     I updated the obmc-ikvm commit 7dfac9ff2d1569aedf83175fb0427562c2188e63
>   It caused one issue:
> The ikvm only works on linux OS GUI mode,
> When I switch to os console mode, the ikvm can't get the host screen.
> Please check you commit.
> 
> Best,
> xiuzhi
