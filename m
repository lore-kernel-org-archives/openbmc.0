Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmq4X5KBLzF0v9
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 07:35:40 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2018 12:35:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,375,1515484800"; d="scan'208";a="205995936"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.254.109.12])
 ([10.254.109.12])
 by fmsmga006.fm.intel.com with ESMTP; 21 Feb 2018 12:35:36 -0800
Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a
 document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
To: Andrew Lunn <andrew@lunn.ch>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
 gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net,
 benh@kernel.crashing.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
 <20180221171349.GG29204@lunn.ch>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <4afd2fec-b015-72d4-300e-3dd7696f6ff0@linux.intel.com>
Date: Wed, 21 Feb 2018 12:35:35 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180221171349.GG29204@lunn.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 21 Feb 2018 20:35:41 -0000

On 2/21/2018 9:13 AM, Andrew Lunn wrote:
> On Wed, Feb 21, 2018 at 08:16:00AM -0800, Jae Hyun Yoo wrote:
>> This commit adds a dt-bindings document of PECI adapter driver for Aspeed
>> AST24xx/25xx SoCs.
> 
> Hi Jae
> 
> It would be good to separate this into two. One binding document for a
> generic adaptor, with a generic PECI bus, and generic client
> devices. List all the properties you expect at the generic level.
> 
> Then have an aspeed specific binding for those properties which are
> specific to the Aspeed adaptor.
> 

That makes sense. I'll add generic PECI bus/adapter/client and Aspeed 
specific documents as separated.

> 	 Andrew
>   
> 

Thanks again for sharing your time to review it. I really appreciate it.

BR,
Jae
