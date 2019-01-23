Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lG840GFDzDqFB
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 06:49:23 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2019 11:49:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,513,1539673200"; d="scan'208";a="314227670"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.122.130.105])
 ([10.122.130.105])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jan 2019 11:49:20 -0800
Subject: Re: dbus sensors workaround for ADC
From: James Feist <james.feist@linux.intel.com>
To: Vijay Khemka <vijaykhemka@fb.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Ed Tanous <ed.tanous@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Amithash Prasad <amithash@fb.com>
References: <CC84A2B4-B1BD-417E-998F-F0178FED2569@fb.com>
 <d8c8d572-ad00-09dc-ef57-d18caee97875@linux.intel.com>
Message-ID: <1d14ecbf-0d60-4fc9-63b5-773856db2cfb@linux.intel.com>
Date: Wed, 23 Jan 2019 13:49:19 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <d8c8d572-ad00-09dc-ef57-d18caee97875@linux.intel.com>
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
X-List-Received-Date: Wed, 23 Jan 2019 19:49:24 -0000

On 1/23/2019 1:33 PM, James Feist wrote:
> On 1/23/2019 1:23 PM, Vijay Khemka wrote:

> add a github issue 

Added https://github.com/openbmc/dbus-sensors/issues/1
