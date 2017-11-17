Return-Path: <james.feist@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydlTX3x8yzDrSR
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 04:29:03 +1100 (AEDT)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Nov 2017 09:29:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,410,1505804400"; 
   d="scan'208";a="3432899"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.84]) ([10.54.51.84])
 by orsmga003.jf.intel.com with ESMTP; 17 Nov 2017 09:29:01 -0800
Subject: Re: [PATCH linux dev-4.10 1/1] Rename aspeed-bmc-opp-flash-layout.dtsi
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <595016cc-32ac-c0fb-43fb-ecfc5cd45989@linux.intel.com>
 <CACPK8XdCXhaZ3gsX3V5PMu1OHD1AtbZHe+C-a4+qrSxZiufang@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <e72e3ba8-2948-e9c1-39c2-e7c674e9115b@linux.intel.com>
Date: Fri, 17 Nov 2017 09:29:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdCXhaZ3gsX3V5PMu1OHD1AtbZHe+C-a4+qrSxZiufang@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Nov 2017 17:29:05 -0000

On 11/14/2017 04:39 PM, Joel Stanley wrote:
> On Wed, Nov 15, 2017 at 6:04 AM, James Feist
> <james.feist@linux.intel.com> wrote:
>> Rename aspeed-bmc-opp-flash-layout.dtsi to openbmc-flash-layout.dtsi
>> as this file is not open power specific.
> 
> Looks good to me! I'll give others a chance to comment before merging.
> 
>>
>> Signed-off-by: Feist, James <james.feist@linux.intel.com>
> 
> Hrm, why does it put your name like that? Can you correct your gitconfig?

Will do, let me know if you require a new patch. Will fix for future 
patch-sets.

> 
>> ---
>>   arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  2 +-
>>   arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts      |  2 +-
>>   arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts     |  2 +-
>>   arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts     |  2 +-
>>   arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi | 26
>> ----------------------
>>   arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts      |  2 +-
>>   arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts       |  2 +-
>>   arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  2 +-
>>   arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |  2 +-
>>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  2 +-
>>   arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |  2 +-
>>   arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts       |  2 +-
>>   arch/arm/boot/dts/openbmc-flash-layout.dtsi        | 26
>> ++++++++++++++++++++++
>>   13 files changed, 37 insertions(+), 37 deletions(-)
>>   delete mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
>>   create mode 100644 arch/arm/boot/dts/openbmc-flash-layout.dtsi
>>
>> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> index 3543989..d75b2e8 100644
>> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> @@ -21,7 +21,7 @@
>>          flash@0 {
>>                  status = "okay";
>>                  m25p,fast-read;
>> -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +#include "openbmc-flash-layout.dtsi"
>>          };
>>   };
>>   diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> index d1dc2ef..2d0bc10 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> @@ -24,7 +24,7 @@
>>          flash@0 {
>>                  status = "okay";
>>                  m25p,fast-read;
>> -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +#include "openbmc-flash-layout.dtsi"
>>          };
>>   };
>>   diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>> b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>> index 6e70ca5..0b7a238 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>> @@ -61,7 +61,7 @@
>>          flash@0 {
>>                  status = "okay";
>>                  m25p,fast-read;
>> -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +#include "openbmc-flash-layout.dtsi"
>>          };
>>   };
>>   diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
>> b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
>> index 93ad3ea..e8e61f7 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
>> @@ -50,7 +50,7 @@
>>          flash@0 {
>>                  status = "okay";
>>                  m25p,fast-read;
>> -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +#include "openbmc-flash-layout.dtsi"
>>          };
>>   };
>>   diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
>> b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
>> deleted file mode 100644
>> index 4bcfd1b..0000000
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -               label = "bmc";
>> -               partitions {
>> -                               #address-cells = < 1 >;
>> -                               #size-cells = < 1 >;
>> -                               compatible = "fixed-partitions";
>> -                               u-boot@0 {
>> -                                       reg = < 0 0x60000 >;
>> -                                       label = "u-boot";
>> -                               };
>> -                               u-boot-env@60000 {
>> -                                       reg = < 0x60000 0x20000 >;
>> -                                       label = "u-boot-env";
>> -                               };
>> -                               kernel@80000 {
>> -                                       reg = < 0x80000 0x440000 >;
>> -                                       label = "kernel";
>> -                               };
>> -                               rofs@0c0000 {
>> -                                       reg = < 0x4c0000 0x1740000 >;
>> -                                       label = "rofs";
>> -                               };
>> -                               rwfs@1c00000 {
>> -                                       reg = < 0x1c00000 0x400000 >;
>> -                                       label = "rwfs";
>> -                               };
>> -               };
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
>> b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
>> index 95552c8..5e30912 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
>> @@ -34,7 +34,7 @@
>>          flash@0 {
>>                  status = "okay";
>>                  m25p,fast-read;
>> -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +#include "openbmc-flash-layout.dtsi"
>>          };
>>   };
>>   diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>> b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>> index 833ef17..58f7884 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>> @@ -96,7 +96,7 @@
>>          flash@0 {
>>                  status = "okay";
>>                  m25p,fast-read;
>> -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +#include "openbmc-flash-layout.dtsi"
>>          };
>>   };
>>   diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> index ab3fee6..b41c29a 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> @@ -65,7 +65,7 @@
>>          flash@0 {
>>                  status = "okay";
>>                  m25p,fast-read;
>> -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +#include "openbmc-flash-layout.dtsi"
>>          };
>>   };
>>   diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> index 060eb0c..329532a 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -114,7 +114,7 @@
>>          flash@0 {
>>                  status = "okay";
>>                  m25p,fast-read;
>> -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +#include "openbmc-flash-layout.dtsi"
>>          };
>>   };
>>   diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index 68058ec..7017984 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -176,7 +176,7 @@
>>                  status = "okay";
>>                  m25p,fast-read;
>>   -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +#include "openbmc-flash-layout.dtsi"
>>          };
>>          flash@1 {
>>                  status = "okay";
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> index 5410f58..5f6a11a 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> @@ -140,7 +140,7 @@
>>          flash@0 {
>>                  status = "okay";
>>                  m25p,fast-read;
>> -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +#include "openbmc-flash-layout.dtsi"
>>          };
>>   };
>>   diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> index 7ed3a77..eafd6f9 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> @@ -107,7 +107,7 @@
>>          flash@0 {
>>                  status = "okay";
>>                  m25p,fast-read;
>> -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +#include "openbmc-flash-layout.dtsi"
>>          };
>>   };
>>   diff --git a/arch/arm/boot/dts/openbmc-flash-layout.dtsi
>> b/arch/arm/boot/dts/openbmc-flash-layout.dtsi
>> new file mode 100644
>> index 0000000..4bcfd1b
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/openbmc-flash-layout.dtsi
>> @@ -0,0 +1,26 @@
>> +               label = "bmc";
>> +               partitions {
>> +                               #address-cells = < 1 >;
>> +                               #size-cells = < 1 >;
>> +                               compatible = "fixed-partitions";
>> +                               u-boot@0 {
>> +                                       reg = < 0 0x60000 >;
>> +                                       label = "u-boot";
>> +                               };
>> +                               u-boot-env@60000 {
>> +                                       reg = < 0x60000 0x20000 >;
>> +                                       label = "u-boot-env";
>> +                               };
>> +                               kernel@80000 {
>> +                                       reg = < 0x80000 0x440000 >;
>> +                                       label = "kernel";
>> +                               };
>> +                               rofs@0c0000 {
>> +                                       reg = < 0x4c0000 0x1740000 >;
>> +                                       label = "rofs";
>> +                               };
>> +                               rwfs@1c00000 {
>> +                                       reg = < 0x1c00000 0x400000 >;
>> +                                       label = "rwfs";
>> +                               };
>> +               };
>> --
>> 2.7.4
>>
>>
