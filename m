Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LgFd6nY3zF379;
 Fri, 28 Sep 2018 02:27:33 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2018 09:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,311,1534834800"; d="scan'208";a="95437347"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.151])
 ([10.7.153.151])
 by orsmga002.jf.intel.com with ESMTP; 27 Sep 2018 09:27:30 -0700
Subject: Re: [PATCH v8 01/12] dt-bindings: Add a document of PECI subsystem
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Juergen Gross <jgross@suse.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
 <20180918215124.14003-2-jae.hyun.yoo@linux.intel.com>
 <20180927151055.GA11054@bogus>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <28aa0b24-8531-21e0-343c-78654937d7ff@linux.intel.com>
Date: Thu, 27 Sep 2018 09:27:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180927151055.GA11054@bogus>
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
X-List-Received-Date: Thu, 27 Sep 2018 16:27:34 -0000

On 9/27/2018 8:10 AM, Rob Herring wrote:
> On Tue, 18 Sep 2018 14:51:13 -0700, Jae Hyun Yoo wrote:
>> This commit adds a document of generic PECI bus, adapter and client
>> driver.
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Andrew Jeffery <andrew@aj.id.au>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
>> Reviewed-by: James Feist <james.feist@linux.intel.com>
>> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
>> ---
>>   .../devicetree/bindings/peci/peci.txt         | 43 +++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/peci/peci.txt
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Thanks for the review, Rob!
