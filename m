Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS0454kRjzDqD2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 10:20:53 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1KNIWjA137614
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 18:20:51 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28r2sjh7y0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 18:20:51 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 20 Feb 2017 16:20:50 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 20 Feb 2017 16:20:49 -0700
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 591B61FF001F;
 Mon, 20 Feb 2017 16:20:26 -0700 (MST)
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1KNKm0a29294790; Mon, 20 Feb 2017 23:20:48 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0DA32803E;
 Mon, 20 Feb 2017 18:20:47 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id A7F6C2803D;
 Mon, 20 Feb 2017 18:20:47 -0500 (EST)
Subject: Re: [PATCH linux dev-4.7 2/3] ARM: dts: aspeed: romulus: Add
 fsi-master GPIO bindings
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
References: <1487057409-19872-1-git-send-email-mine260309@gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 20 Feb 2017 17:20:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1487057409-19872-1-git-send-email-mine260309@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022023-0016-0000-0000-0000063A06B3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006653; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00824742; UDB=6.00403755; IPR=6.00602197; 
 BA=6.00005158; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014364; XFM=3.00000011;
 UTC=2017-02-20 23:20:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022023-0017-0000-0000-00003791D775
Message-Id: <4154cce0-0565-0dc7-a4c9-b8877285c011@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-20_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702200215
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
X-List-Received-Date: Mon, 20 Feb 2017 23:20:54 -0000

Looks good.

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>


On 02/14/2017 01:30 AM, Lei YU wrote:
> Define the pins used on Romulus by the FSI GPIO master.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index f47eb63..bc13ad9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -1,7 +1,7 @@
>   /dts-v1/;
>
>   #include "aspeed-g5.dtsi"
> -#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
>
>   / {
>   	model = "Romulus BMC";
> @@ -31,6 +31,17 @@
>   		};
>   	};
>
> +	fsi-master {
> +		compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
> +
> +		status = "disabled";
> +
> +		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> +		data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
> +		mux-gpios = <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
> +		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
> +		trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
> +	};
>   };
>
>   &fmc {
