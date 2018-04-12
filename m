Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40M45r1WVXzF1SM
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 12:06:39 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2018 19:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,439,1517904000"; d="scan'208";a="36570689"
Received: from ifreitas-mobl.amr.corp.intel.com (HELO [10.254.104.117])
 ([10.254.104.117])
 by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2018 19:06:35 -0700
Subject: Re: [PATCH v3 01/10] Documentations: dt-bindings: Add documents of
 generic PECI bus, adapter and client drivers
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>
Cc: Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fengguang Wu <fengguang.wu@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Haiyue Wang
 <haiyue.wang@linux.intel.com>, James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Julia Cartwright <juliac@eso.teric.us>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Milton Miller II <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>,
 Randy Dunlap <rdunlap@infradead.org>,
 Stef van Os <stef.van.os@prodrive-technologies.com>,
 Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 linux-hwmon@vger.kernel.org, Linux ARM
 <linux-arm-kernel@lists.infradead.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-2-jae.hyun.yoo@linux.intel.com>
 <CACPK8XfwVTKfOQSteY8-Dy2=YiC6qjd1qZ2f8n1hTv8w06DWRg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f76cf759-3e40-c611-5b82-776b10c97f28@linux.intel.com>
Date: Wed, 11 Apr 2018 19:06:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfwVTKfOQSteY8-Dy2=YiC6qjd1qZ2f8n1hTv8w06DWRg@mail.gmail.com>
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
X-List-Received-Date: Thu, 12 Apr 2018 02:06:41 -0000

Hi Joel,

On 4/11/2018 4:52 AM, Joel Stanley wrote:
> Hi Jae,
> 
> On 11 April 2018 at 04:02, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>> This commit adds documents of generic PECI bus, adapter and client drivers.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
>> Reviewed-by: James Feist <james.feist@linux.intel.com>
>> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
>> Cc: Alan Cox <alan@linux.intel.com>
>> Cc: Andrew Jeffery <andrew@aj.id.au>
>> Cc: Andrew Lunn <andrew@lunn.ch>
>> Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Fengguang Wu <fengguang.wu@intel.com>
>> Cc: Greg KH <gregkh@linuxfoundation.org>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
>> Cc: Jean Delvare <jdelvare@suse.com>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Cc: Julia Cartwright <juliac@eso.teric.us>
>> Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>> Cc: Milton Miller II <miltonm@us.ibm.com>
>> Cc: Pavel Machek <pavel@ucw.cz>
>> Cc: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Stef van Os <stef.van.os@prodrive-technologies.com>
>> Cc: Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>
> 
> That's a hefty cc list. I can't see Rob Herring though, and he's
> usually the person who you need to convince to get your bindings
> accepted.
> 
> I recommend using ./scripts/get_maintainers.pl to build your CC list,
> and then add others you think are relevant.
> 
> I'm not sure what the guidelines are for generic bindings, so I'll
> defer to Rob for this patch.
> 
> Cheers,
> 
> Joel
> 

Thanks a lot for letting me know that. I'll do as you suggested.

-Jae

>> ---
>>   .../devicetree/bindings/peci/peci-adapter.txt      | 23 ++++++++++++++++++++
>>   .../devicetree/bindings/peci/peci-bus.txt          | 15 +++++++++++++
>>   .../devicetree/bindings/peci/peci-client.txt       | 25 ++++++++++++++++++++++
>>   3 files changed, 63 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/peci/peci-adapter.txt
>>   create mode 100644 Documentation/devicetree/bindings/peci/peci-bus.txt
>>   create mode 100644 Documentation/devicetree/bindings/peci/peci-client.txt
>>
>> diff --git a/Documentation/devicetree/bindings/peci/peci-adapter.txt b/Documentation/devicetree/bindings/peci/peci-adapter.txt
>> new file mode 100644
>> index 000000000000..9221374f6b11
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/peci/peci-adapter.txt
>> @@ -0,0 +1,23 @@
>> +Generic device tree configuration for PECI adapters.
>> +
>> +Required properties:
>> +- compatible     : Should contain hardware specific definition strings that can
>> +                  match an adapter driver implementation.
>> +- reg            : Should contain PECI controller registers location and length.
>> +- #address-cells : Should be <1>.
>> +- #size-cells    : Should be <0>.
>> +
>> +Example:
>> +       peci: peci@10000000 {
>> +               compatible = "simple-bus";
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +               ranges = <0x0 0x10000000 0x1000>;
>> +
>> +               peci0: peci-bus@0 {
>> +                       compatible = "soc,soc-peci";
>> +                       reg = <0x0 0x1000>;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +               };
>> +       };
>> diff --git a/Documentation/devicetree/bindings/peci/peci-bus.txt b/Documentation/devicetree/bindings/peci/peci-bus.txt
>> new file mode 100644
>> index 000000000000..90bcc791ccb0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/peci/peci-bus.txt
>> @@ -0,0 +1,15 @@
>> +Generic device tree configuration for PECI buses.
>> +
>> +Required properties:
>> +- compatible     : Should be "simple-bus".
>> +- #address-cells : Should be <1>.
>> +- #size-cells    : Should be <1>.
>> +- ranges         : Should contain PECI controller registers ranges.
>> +
>> +Example:
>> +       peci: peci@10000000 {
>> +               compatible = "simple-bus";
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +               ranges = <0x0 0x10000000 0x1000>;
>> +       };
>> diff --git a/Documentation/devicetree/bindings/peci/peci-client.txt b/Documentation/devicetree/bindings/peci/peci-client.txt
>> new file mode 100644
>> index 000000000000..8e2bfd8532f6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/peci/peci-client.txt
>> @@ -0,0 +1,25 @@
>> +Generic device tree configuration for PECI clients.
>> +
>> +Required properties:
>> +- compatible : Should contain target device specific definition strings that can
>> +              match a client driver implementation.
>> +- reg        : Should contain address of a client CPU. Address range of CPU
>> +              clients is starting from 0x30 based on PECI specification.
>> +              <0x30> .. <0x37> (depends on the PECI_OFFSET_MAX definition)
>> +
>> +Example:
>> +       peci-bus@0 {
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               < more properties >
>> +
>> +               function@cpu0 {
>> +                       compatible = "device,function";
>> +                       reg = <0x30>;
>> +               };
>> +
>> +               function@cpu1 {
>> +                       compatible = "device,function";
>> +                       reg = <0x31>;
>> +               };
>> +       };
>> --
>> 2.16.2
>>
