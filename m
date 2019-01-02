Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43VKMY4hFMzDqHh
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jan 2019 05:29:29 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jan 2019 10:29:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,431,1539673200"; d="scan'208";a="263911103"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga004.jf.intel.com with ESMTP; 02 Jan 2019 10:29:26 -0800
Subject: Re: [PATCH v9 07/12] dt-bindings: mfd: Add a document for PECI client
 MFD
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>,
 David Kershner <david.kershner@unisys.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20181218210417.30140-1-jae.hyun.yoo@linux.intel.com>
 <20181218210417.30140-8-jae.hyun.yoo@linux.intel.com>
 <20181221144754.GS13248@dell>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <fa605dae-977f-452a-cd86-2c0db9237892@linux.intel.com>
Date: Wed, 2 Jan 2019 10:29:26 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <20181221144754.GS13248@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 03 Jan 2019 15:36:07 +1100
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
X-List-Received-Date: Wed, 02 Jan 2019 18:29:30 -0000

Hi Lee,

On 12/21/2018 6:47 AM, Lee Jones wrote:
> On Tue, 18 Dec 2018, Jae Hyun Yoo wrote:
> 
>> This commit adds a dt-bindings document for PECI client MFD.
>>
>> +* Intel PECI client bindings

<snip>

>> +PECI (Platform Environment Control Interface) is a one-wire bus interface that
>> +provides a communication channel from PECI clients in Intel processors and
>> +chipset components to external monitoring or control devices. PECI is designed
>> +to support the following sideband functions:
>> +
>> +- Processor and DRAM thermal management
>> +- Platform Manageability
>> +- Processor Interface Tuning and Diagnostics
>> +- Failure Analysis
>> +
>> +Required properties:
>> +- compatible : Should be "intel,peci-client".
>> +- reg        : Should contain address of a client CPU. According to the PECI
>> +	       specification, client addresses start from 0x30.
>> +
>> +Example:
>> +	peci-bus@0 {
>> +		compatible = "vendor,soc-peci";
>> +		reg = <0x0 0x1000>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		peci-client@30 {
>> +			compatible = "intel,peci-client";
>> +			reg = <0x30>;
>> +		};
>> +
>> +		peci-client@31 {
>> +			compatible = "intel,peci-client";
>> +			reg = <0x31>;
>> +		};
> 
> The PECI Client driver (masquerading as an MFD driver in this set)
> doesn't actually do anything special.  Instead of detailing it here,
> register the child devices directly instead.
> 

Main purpose of the PECI client driver is providing 'reg' value to its
child devices. If I add the child nodes directly, compiler will make
warnings while building dtb because the child nodes are using the same
unit address.

Thanks,
Jae
