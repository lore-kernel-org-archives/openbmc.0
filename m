Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNfhf0fldzDqJ0
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 05:08:01 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v73J6BhG015009
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 15:07:59 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c483md37d-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Aug 2017 15:07:59 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 3 Aug 2017 15:07:58 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 15:07:55 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v73J7rsq23330862; Thu, 3 Aug 2017 19:07:54 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 822CC11204B;
 Thu,  3 Aug 2017 15:07:47 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.5.232])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 8BD86112034;
 Thu,  3 Aug 2017 15:07:44 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v7] ARM: dts: aspeed: witherspoon: Add
 gpio-keys-polled for fan presence
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1501786248-5447-1-git-send-email-eajames@linux.vnet.ibm.com>
Cc: clg@kaod.org, joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 3 Aug 2017 14:07:49 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1501786248-5447-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17080319-0040-0000-0000-0000038A4393
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007478; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00897086; UDB=6.00448834; IPR=6.00677269; 
 BA=6.00005509; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016519; XFM=3.00000015;
 UTC=2017-08-03 19:07:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080319-0041-0000-0000-0000077E6F0F
Message-Id: <6772c268-6b16-8fc9-1748-1ba7bcc0b357@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-03_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030292
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
X-List-Received-Date: Thu, 03 Aug 2017 19:08:02 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 8/3/17 1:50 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Add gpio-keys-polled node for pca955x fan presence lines. Change the binding
> of the pca9552 to remove the leds and instead define all the provided gpio pins
> there. Add back the leds in a 'gpio-leds' compatible entry.
>
> Polling period of 1 second to be determined to be the max acceptable
> value based on discussions with Brad Bishop and Matt Spinler. Tested
> with gpiomon program - verified.
>
> Patch based on Cedric's example - thanks! Tested on witherspoon.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 152 ++++++++++++++++++-----
>   1 file changed, 124 insertions(+), 28 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index c0f992e..9ab8e46 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -56,6 +56,77 @@
>   		};
>   	};
>
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		poll-interval = <1000>;
> +
> +		fan0-presence {
> +			label = "fan0-presence";
> +			gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
> +			linux,code = <4>;
> +		};
> +
> +		fan1-presence {
> +			label = "fan1-presence";
> +			gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
> +			linux,code = <5>;
> +		};
> +
> +		fan2-presence {
> +			label = "fan2-presence";
> +			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <6>;
> +		};
> +
> +		fan3-presence {
> +			label = "fan3-presence";
> +			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
> +			linux,code = <7>;
> +		};
> +	};
> +
> +	pca_leds {
> +		compatible = "gpio-leds";
> +
> +		fan0 {
> +			label = "fan0";
> +			default-state = "keep";
> +			gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
> +		};
> +		fan1 {
> +			label = "fan1";
> +			default-state = "keep";
> +			gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
> +		};
> +		fan2 {
> +			label = "fan2";
> +			default-state = "keep";
> +			gpios = <&pca0 2 GPIO_ACTIVE_LOW>;
> +		};
> +		fan3 {
> +			label = "fan3";
> +			default-state = "keep";
> +			gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
> +		};
> +		front_fault {
> +			label = "front-fault";
> +			default-state = "keep";
> +			gpios = <&pca0 13 GPIO_ACTIVE_LOW>;
> +		};
> +		front_power {
> +			label = "front-power";
> +			default-state = "keep";
> +			gpios = <&pca0 14 GPIO_ACTIVE_LOW>;
> +		};
> +		front_id {
> +			label = "front-id";
> +			default-state = "keep";
> +			gpios = <&pca0 15 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
>   	leds {
>   		compatible = "gpio-leds";
>
> @@ -278,47 +349,72 @@
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>
> -		fan0: led@0 {
> -			label = "fan0";
> -			default-state = "keep";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio@0 {
>   			reg = <0>;
> -			type = <PCA955X_TYPE_LED>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
> -		fan1: led@1 {
> -			label = "fan1";
> -			default-state = "keep";
> +		gpio@1 {
>   			reg = <1>;
> -			type = <PCA955X_TYPE_LED>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
> -		fan2: led@2 {
> -			label = "fan2";
> -			default-state = "keep";
> +		gpio@2 {
>   			reg = <2>;
> -			type = <PCA955X_TYPE_LED>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
> -		fan3: led@3 {
> -			label = "fan3";
> -			default-state = "keep";
> +		gpio@3 {
>   			reg = <3>;
> -			type = <PCA955X_TYPE_LED>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
> -		front_fault: led@13 {
> -			label = "front-fault";
> -			default-state = "keep";
> +		gpio@4 {
> +			reg = <4>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@5 {
> +			reg = <5>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@6 {
> +			reg = <6>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@7 {
> +			reg = <7>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@8 {
> +			reg = <8>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@9 {
> +			reg = <9>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@10 {
> +			reg = <10>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@11 {
> +			reg = <11>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@12 {
> +			reg = <12>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@13 {
>   			reg = <13>;
> -			type = <PCA955X_TYPE_LED>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
> -		front_power: led@14 {
> -			label = "front-power";
> -			default-state = "keep";
> +		gpio@14 {
>   			reg = <14>;
> -			type = <PCA955X_TYPE_LED>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
> -		front_id: led@15 {
> -			label = "front-id";
> -			default-state = "keep";
> +		gpio@15 {
>   			reg = <15>;
> -			type = <PCA955X_TYPE_LED>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   	};
>   };
