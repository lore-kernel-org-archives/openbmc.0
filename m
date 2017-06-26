Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxB0V6qf8zDr1h
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 00:15:22 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5QEFFXu103481
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 10:15:20 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bb2kqbyck-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 10:15:18 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Mon, 26 Jun 2017 08:14:59 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 26 Jun 2017 08:14:57 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5QEEuwZ1311206; Mon, 26 Jun 2017 07:14:56 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9960EBE03B;
 Mon, 26 Jun 2017 08:14:56 -0600 (MDT)
Received: from [9.10.222.148] (unknown [9.10.222.148])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 670EFBE039;
 Mon, 26 Jun 2017 08:14:56 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10] Add fan card PCA9552 to Witherspoon
 devicetree
To: Brandon Wyman <bjwyman@gmail.com>
References: <1498262178-27820-1-git-send-email-bjwyman@gmail.com>
Cc: openbmc@lists.ozlabs.org
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Mon, 26 Jun 2017 09:15:18 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1498262178-27820-1-git-send-email-bjwyman@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17062614-0016-0000-0000-0000070B5C60
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007280; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00878975; UDB=6.00438032; IPR=6.00659128; 
 BA=6.00005441; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015953; XFM=3.00000015;
 UTC=2017-06-26 14:14:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062614-0017-0000-0000-00003A4B61DA
Message-Id: <abbf4242-d44d-246c-c7b9-b1497fd4b160@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-26_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706260238
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
X-List-Received-Date: Mon, 26 Jun 2017 14:15:23 -0000

A few comments on naming below.  The names here have to match up with 
the MRW XML so code can find them, and we already took a shot at naming 
them in the XML.

On 6/23/2017 6:56 PM, Brandon Wyman wrote:
> The Witherspoon OpenBMC system has a PCA9552 chip on the fan card that
> is used for fan fault and identify LED control. Adding this chip and the
> LED lines to the device tree.
>
> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 47 ++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 31315d0..e5e3b37 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -203,6 +203,53 @@
>   		compatible = "infineon,dps310";
>   		reg = <0x76>;
>   	};
> +
> +	pca0: pca9552@60 {
> +		compatible = "nxp,pca9552";
> +		reg = <0x60>;
> +		fan0: led@0 {
> +			label = "fan0:yellow";
These are all fan fault LEDs.  The MRW just calls them fan0, fan1, etc.  
I suppose fan0-fault would be OK here too and we could update the MRW.
> +			default-state = "keep";
> +			reg = <0>;
> +			type = <PCA955X_TYPE_LED>;
> +		};
> +		fan1: led@1 {
> +			label = "fan1:yellow";
> +			default-state = "keep";
> +			reg = <1>;
> +			type = <PCA955X_TYPE_LED>;
> +		};
> +		fan2: led@2 {
> +			label = "fan2:yellow";
> +			default-state = "keep";
> +			reg = <2>;
> +			type = <PCA955X_TYPE_LED>;
> +		};
> +		fan3: led@3 {
> +			label = "fan3:yellow";
> +			default-state = "keep";
> +			reg = <3>;
> +			type = <PCA955X_TYPE_LED>;
> +		};
> +		led@13 {
> +			label = "yellow";
The fault LED in the back of the system is already called rear-fault, so 
this should probably be front-fault.
> +			default-state = "keep";
> +			reg = <13>;
> +			type = <PCA955X_TYPE_LED>;
> +		};
> +		led@14 {
> +			label = "green";
front-power
> +			default-state = "keep";
> +			reg = <14>;
> +			type = <PCA955X_TYPE_LED>;
> +		};
> +		led@15 {
> +			label = "blue";
front-id
> +			default-state = "keep";
> +			reg = <15>;
> +			type = <PCA955X_TYPE_LED>;
> +		};
> +	};
>   };
>
>   &i2c4 {
