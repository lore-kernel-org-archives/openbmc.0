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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42QMx36KJXzDqCq;
 Thu,  4 Oct 2018 03:11:03 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2018 10:11:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,336,1534834800"; d="scan'208";a="238212232"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga004.jf.intel.com with ESMTP; 03 Oct 2018 10:10:24 -0700
Subject: Re: [PATCH i2c-next v4 2/3] i2c: aspeed: Add 'timeout' DT property
 reading code
To: Joel Stanley <joel@jms.id.au>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20181001202748.8030-1-jae.hyun.yoo@linux.intel.com>
 <20181001202748.8030-3-jae.hyun.yoo@linux.intel.com>
 <CACPK8XeuFm_GYFhe-KimOHV7y7PBdFjhMGG+QAmfNrfOcb488A@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <9951c217-70c1-81cf-a43d-baf6bb02beb9@linux.intel.com>
Date: Wed, 3 Oct 2018 10:10:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XeuFm_GYFhe-KimOHV7y7PBdFjhMGG+QAmfNrfOcb488A@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Oct 2018 17:11:04 -0000

Hi Joel,

On 10/3/2018 12:49 AM, Joel Stanley wrote:
> Hello Jae,
> 
> On Mon, 1 Oct 2018 at 22:28, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>> @@ -918,6 +919,11 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>>                  bus->bus_frequency = 100000;
>>          }
>>
>> +       ret = of_property_read_u32(pdev->dev.of_node, "timeout",
>> +                                  &timeout_ms);
>> +       if (ret)
>> +               timeout_ms = 0; /* then adap.timeout will be set by i2c-core */
> 
> Is it possible to implement the parsing of this property in the i2c
> core instead?
> 

Yes, that's possible but I'm not sure that could be acceptable or not.
Let me try.

Thanks,
Jae
