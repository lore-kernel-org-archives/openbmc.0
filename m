Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wcZPK5sGbzDq5x
 for <openbmc@lists.ozlabs.org>; Tue, 30 May 2017 23:35:49 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4UDZYTu114099
 for <openbmc@lists.ozlabs.org>; Tue, 30 May 2017 09:35:42 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2as7mrdwxa-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 30 May 2017 09:35:41 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 30 May 2017 09:35:41 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 30 May 2017 09:35:39 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4UDZdM945744262; Tue, 30 May 2017 13:35:39 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E67D12403D;
 Tue, 30 May 2017 09:33:13 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 22296124049;
 Tue, 30 May 2017 09:33:13 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v4] arm: dts: aspeed: Add missing clock
 sources for barreleye
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
References: <1495815002-1808-1-git-send-email-eajames@linux.vnet.ibm.com>
 <6f8cb5f9-1b95-4caf-8257-163a36208045@kaod.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 30 May 2017 08:35:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <6f8cb5f9-1b95-4caf-8257-163a36208045@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17053013-0008-0000-0000-0000022DE416
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007145; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00867732; UDB=6.00431157; IPR=6.00647612; 
 BA=6.00005386; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015645; XFM=3.00000015;
 UTC=2017-05-30 13:35:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17053013-0009-0000-0000-00003576511B
Message-Id: <14524f62-a369-b8bb-e71c-5c495772afb5@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-30_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705300255
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 May 2017 13:35:50 -0000


On 05/29/2017 05:56 AM, Cédric Le Goater wrote:
> Hello Edward,
>
> On 05/26/2017 06:10 PM, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Reorganize flash controllers into the ast2400 config and edit all the
>> ast2400 machine configs.  Barreleye wasn't booting with the new
>> aspeed-smc driver.
> There are a couple of "m25p,fast-read" properties missing below.
> Is that on purpose ?

Yes, I copied the properties (or lack thereof) exactly from the existing 
flash entries for each individual system. I'm not sure if it was the 
original intention to not have those properties...

Thanks,
Eddie

>
> Thanks,
>
> C.
>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 44 ++++++++-------------
>>   arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 37 ++++++------------
>>   arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  | 47 +++++++---------------
>>   arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 54 +++++++++-----------------
>>   arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts   | 38 ++++++------------
>>   arch/arm/boot/dts/aspeed-g4.dtsi               | 34 ++++++++++++++++
>>   6 files changed, 106 insertions(+), 148 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>> index be1f2d1..6c4221c 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>> @@ -31,34 +31,6 @@
>>   		};
>>   	};
>>   
>> -	ahb {
>> -		bmc_pnor: fmc@1e620000 {
>> -			reg = < 0x1e620000 0x94
>> -				0x20000000 0x02000000 >;
>> -			#address-cells = <1>;
>> -			#size-cells = <0>;
>> -			compatible = "aspeed,ast2400-fmc";
>> -			flash@0 {
>> -				reg = < 0 >;
>> -				compatible = "jedec,spi-nor" ;
>> -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> -			};
>> -		};
>> -
>> -		host_pnor: spi@1e630000 {
>> -			reg = < 0x1e630000 0x18
>> -				0x30000000 0x02000000 >;
>> -			#address-cells = <1>;
>> -			#size-cells = <0>;
>> -			compatible = "aspeed,ast2400-spi";
>> -			flash@0 {
>> -				reg = < 0 >;
>> -				compatible = "jedec,spi-nor" ;
>> -				label = "pnor";
>> -			};
>> -		};
>> -	};
>> -
>>   	leds {
>>   		compatible = "gpio-leds";
>>   
>> @@ -76,6 +48,22 @@
>>   	};
>>   };
>>   
>> +&bmc_pnor {
>> +	status = "okay";
> no m25p,fast-read; ?
>
>> +	flash@0 {
>> +		status = "okay";
>> +#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +	};
>> +};
>> +
>> +&host_pnor {
>> +	status = "okay";
>
> no m25p,fast-read; ?
>
>> +	flash@0 {
>> +		status = "okay";
>> +		label = "pnor";
>> +	};
>> +};
>> +
>>   &pinctrl {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
>> index fe63621..dffe1cd 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
>> @@ -50,34 +50,21 @@
>>   			gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
>>   		};
>>   	};
>> +};
>>   
>> -	ahb {
>> -		fmc@1e620000 {
>> -			reg = < 0x1e620000 0x94
>> -				0x20000000 0x02000000 >;
>> -			#address-cells = <1>;
>> -			#size-cells = <0>;
>> -			compatible = "aspeed,ast2400-fmc";
>> -
>> -			flash@0 {
>> -				reg = < 0 >;
>> -				compatible = "jedec,spi-nor" ;
>> +&bmc_pnor {
>> +	status = "okay";
>
> no m25p,fast-read; ?
>
>> +	flash@0 {
>> +		status = "okay";
>>   #include "aspeed-bmc-opp-flash-layout.dtsi"
>> -			};
>> -		};
>> +	};
>> +};
>>   
>> -		spi@1e630000 {
>> -			reg = < 0x1e630000 0x18
>> -				0x30000000 0x02000000 >;
>> -			#address-cells = <1>;
>> -			#size-cells = <0>;
>> -			compatible = "aspeed,ast2400-spi";
>> -			flash@0 {
>> -				reg = < 0 >;
>> -				compatible = "jedec,spi-nor" ;
>> -				label = "pnor";
>> -			};
>> -		};
>> +&host_pnor {
>> +	status = "okay";
>
> no m25p,fast-read; ?
>
>> +	flash@0 {
>> +		status = "okay";
>> +		label = "pnor";
>>   	};
>>   };
>>   
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
>> index 121612a..c6c5e14 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
>> @@ -30,42 +30,23 @@
>>   			reg = <0x5f000000 0x01000000>; /* 16MB */
>>   		};
>>   	};
>> +};
>>   
>> -	ahb {
>> -
>> -		bmc_pnor: fmc@1e620000 {
>> -			reg = < 0x1e620000 0x94
>> -				0x20000000 0x02000000 >;
>> -			#address-cells = <1>;
>> -			#size-cells = <0>;
>> -			compatible = "aspeed,ast2400-fmc";
>> -			aspeed,fmc-has-dma;
>> -			interrupts = <19>;
>> -			clocks = <&clk_ahb>;
>> -			clock-names = "ahb";
>> -			flash@0 {
>> -				reg = < 0 >;
>> -				compatible = "jedec,spi-nor" ;
>> -				m25p,fast-read;
>> +&bmc_pnor {
>> +	status = "okay";
>> +	flash@0 {
>> +		status = "okay";
>> +		m25p,fast-read;
>>   #include "aspeed-bmc-opp-flash-layout.dtsi"
>> -			};
>> -		};
>> +	};
>> +};
>>   
>> -		host_pnor: spi@1e630000 {
>> -			reg = < 0x1e630000 0x18
>> -				0x30000000 0x02000000 >;
>> -			#address-cells = <1>;
>> -			#size-cells = <0>;
>> -			compatible = "aspeed,ast2400-spi";
>> -			clocks = <&clk_ahb>;
>> -			clock-names = "ahb";
>> -			flash {
>> -				reg = < 0 >;
>> -				compatible = "jedec,spi-nor" ;
>> -				label = "pnor";
>> -				m25p,fast-read;
>> -			};
>> -		};
>> +&host_pnor {
>> +	status = "okay";
>> +	flash@0 {
>> +		status = "okay";
>> +		label = "pnor";
>> +		m25p,fast-read;
>>   	};
>>   };
>>   
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> index b4faa1d..f343aa4 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> @@ -47,42 +47,6 @@
>>                   };
>>           };
>>   
>> -	ahb {
>> -		bmc_pnor: fmc@1e620000 {
>> -			reg = < 0x1e620000 0x94
>> -				0x20000000 0x02000000 >;
>> -			#address-cells = <1>;
>> -			#size-cells = <0>;
>> -			compatible = "aspeed,ast2400-fmc";
>> -			aspeed,fmc-has-dma;
>> -			interrupts = <19>;
>> -			clocks = <&clk_ahb>;
>> -			clock-names = "ahb";
>> -			flash@0 {
>> -				reg = < 0 >;
>> -				compatible = "jedec,spi-nor" ;
>> -				m25p,fast-read;
>> -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> -			};
>> -		};
>> -
>> -		host_pnor: spi@1e630000 {
>> -			reg = < 0x1e630000 0x18
>> -				0x30000000 0x02000000 >;
>> -			#address-cells = <1>;
>> -			#size-cells = <0>;
>> -			compatible = "aspeed,ast2400-spi";
>> -			clocks = <&clk_ahb>;
>> -			clock-names = "ahb";
>> -			flash {
>> -				reg = < 0 >;
>> -				compatible = "jedec,spi-nor" ;
>> -				label = "pnor";
>> -				m25p,fast-read;
>> -			};
>> -		};
>> -	};
>> -
>>   	gpio-fsi {
>>   		compatible = "fsi-master-gpio", "fsi-master";
>>   
>> @@ -94,6 +58,24 @@
>>   	};
>>   };
>>   
>> +&bmc_pnor {
>> +	status = "okay";
>> +	flash@0 {
>> +		status = "okay";
>> +		m25p,fast-read;
>> +#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +	};
>> +};
>> +
>> +&host_pnor {
>> +	status = "okay";
>> +	flash@0 {
>> +		status = "okay";
>> +		label = "pnor";
>> +		m25p,fast-read;
>> +	};
>> +};
>> +
>>   &pinctrl {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> index 7132460..e55685d 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> @@ -30,35 +30,21 @@
>>   			reg = <0x47800000 0x00800000>; /* 8MB */
>>   		};
>>   	};
>> +};
>>   
>> -	ahb {
>> -		bmc_pnor: fmc@1e620000 {
>> -			reg = < 0x1e620000 0x94
>> -				0x20000000 0x02000000 >;
>> -			#address-cells = <1>;
>> -			#size-cells = <0>;
>> -			compatible = "aspeed,ast2400-fmc";
>> -			aspeed,fmc-has-dma;
>> -			interrupts = <19>;
>> -			flash@0 {
>> -				reg = < 0 >;
>> -				compatible = "jedec,spi-nor" ;
>> +&bmc_pnor {
>> +	status = "okay";
>
> no m25p,fast-read; ?
>
>> +	flash@0 {
>> +		status = "okay";
>>   #include "aspeed-bmc-opp-flash-layout.dtsi"
>> -			};
>> -		};
>> +	};
>> +};
>>   
>> -		host_pnor: spi@1e630000 {
>> -			reg = < 0x1e630000 0x18
>> -				0x30000000 0x01000000 >;
>> -			#address-cells = <1>;
>> -			#size-cells = <0>;
>> -			compatible = "aspeed,ast2400-smc";
>> -			flash {
>> -				reg = < 0 >;
>> -				compatible = "jedec,spi-nor" ;
>> -				label = "pnor";
>> -			};
>> -		};
>> +&host_pnor {
>> +	status = "okay";
>
> no m25p,fast-read; ?
>
>
>> +	flash@0 {
>> +		status = "okay";
>> +		label = "pnor";
>>   	};
>>   };
>>   
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
>> index d8827d5..9fb7889 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -44,6 +44,40 @@
>>   		#size-cells = <1>;
>>   		ranges;
>>   
>> +		bmc_pnor: fmc@1e620000 {
>> +			reg = < 0x1e620000 0x94
>> +				0x20000000 0x02000000 >;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			compatible = "aspeed,ast2400-fmc";
>> +			status = "disabled";
>> +			aspeed,fmc-has-dma;
>> +			interrupts = <19>;
>> +			clocks = <&clk_ahb>;
>> +			clock-names = "ahb";
>> +			flash@0 {
>> +				reg = < 0 >;
>> +				compatible = "jedec,spi-nor" ;
>> +				status = "disabled";
>> +			};
>> +		};
>> +
>> +		host_pnor: spi@1e630000 {
>> +			reg = < 0x1e630000 0x18
>> +				0x30000000 0x02000000 >;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			compatible = "aspeed,ast2400-spi";
>> +			status = "disabled";
>> +			clocks = <&clk_ahb>;
>> +			clock-names = "ahb";
>> +			flash@0 {
>> +				reg = < 0 >;
>> +				compatible = "jedec,spi-nor" ;
>> +				status = "disabled";
>> +			};
>> +		};
>> +
>>   		vic: interrupt-controller@1e6c0080 {
>>   			compatible = "aspeed,ast2400-vic";
>>   			interrupt-controller;
>>
