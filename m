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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VzBv4wylzF3Hg
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 23:53:39 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2018 06:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,370,1526367600"; d="scan'208";a="55943572"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.70.98])
 ([10.252.70.98])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jul 2018 06:53:19 -0700
Subject: Re: Sdbusplus-based Shared Library
To: vishwa <vishwa@linux.vnet.ibm.com>, Patrick Venture <venture@google.com>, 
 Ratan K Gupta <ratagupt@in.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAO=notwXV+EaWJqV61qkZaDSA3mxMhpXbq3iWUqRp2Qg52wMGA@mail.gmail.com>
 <0fd55229-6efd-7d7c-d0a2-bec8dbd79133@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <1ce26d35-39cc-f3d8-a590-8154eb4c33a0@linux.intel.com>
Date: Wed, 18 Jul 2018 19:23:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <0fd55229-6efd-7d7c-d0a2-bec8dbd79133@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2018 13:53:45 -0000

I second Patrick here. We definitely need miscellaneous utility library. 
As he mentioned we can start small or even create few libraries with 
different purpose each (say timer, sdbusplus utils shared library etc.)

Related to customization, we need to make sure libraries are generic in 
nature, and expose correct hooks. Even if specific hack is needed, then 
it has to be extended as sub-module and patched by direct linking for 
the needed module instead of updating the libraries directly. ??

Regards,

Richard


On 7/18/2018 5:04 PM, vishwa wrote:
> lity library for timers / watchdog was something that I initially 
> proposed during the early days and the argument back was that when we 
> have such a thing, then we need to keep augmenting the library to suit 
> needs of the consumers and we loose flexibility and end up putting hacks.
