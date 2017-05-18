Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wTNbg6wJ9zDqcN
 for <openbmc@lists.ozlabs.org>; Fri, 19 May 2017 06:49:51 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4IKnhVb045917
 for <openbmc@lists.ozlabs.org>; Thu, 18 May 2017 16:49:45 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ahhx42qq4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 18 May 2017 16:49:44 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 18 May 2017 14:49:41 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 18 May 2017 14:49:38 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4IKnc5m11076012; Thu, 18 May 2017 13:49:38 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E46BBE03A;
 Thu, 18 May 2017 14:49:38 -0600 (MDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.5.45])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 02E5BBE038;
 Thu, 18 May 2017 14:49:36 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10] arm: dts: aspeed: Add IR35221 instances to
 dev tree
To: joel@jms.id.au
References: <20170518193742.56927-1-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 18 May 2017 15:49:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170518193742.56927-1-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17051820-0012-0000-0000-0000144471D0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007081; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00862336; UDB=6.00427815; IPR=6.00642022; 
 BA=6.00005358; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015503; XFM=3.00000015;
 UTC=2017-05-18 20:49:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17051820-0013-0000-0000-00004DB93572
Message-Id: <f34e522e-5a01-6b7a-bf79-b218987fffcb@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-18_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705180142
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
X-List-Received-Date: Thu, 18 May 2017 20:49:52 -0000



On 5/18/17 2:37 PM, Christopher Bostic wrote:
> Add IR35221 to i2c4 and i2c5 buses.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>   .../devicetree/bindings/i2c/trivial-devices.txt      |  1 +
>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts     | 20 ++++++++++++++++++++
>   2 files changed, 21 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> index cdd7b48..d504271 100644
> --- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> +++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> @@ -53,6 +53,7 @@ fsl,sgtl5000		SGTL5000: Ultra Low-Power Audio Codec
>   gmt,g751		G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
>   infineon,slb9635tt	Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz)
>   infineon,slb9645tt	Infineon SLB9645 I2C TPM (new protocol, max 400khz)
> +infineon,ir35221	Infineon IR35221 Digital DC-DC Multiphase Converter
>   isil,isl29028		Intersil ISL29028 Ambient Light and Proximity Sensor
>   maxim,ds1050		5 Bit Programmable, Pulse-Width Modulator
>   maxim,max1237		Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index f20aaf4..64a6bb9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -213,6 +213,16 @@
>   		compatible = "ti,tmp423";
>   		reg = <0x4c>;
>   	};
> +
> +	ir35221@e0 {
> +		compatible = "infineon,ir35221";
> +		reg = <0xe0>;
Address formatting needs to be updated for 7 bit right aligned. Will fix 
in v2.

-Chris.
> +	};
> +
> +	ir35221@e2 {
> +		compatible = "infineon,ir35221";
> +		reg = <0xe2>;
> +	};
>   };
>
>
> @@ -227,6 +237,16 @@
>   		compatible = "ti,tmp423";
>   		reg = <0x4c>;
>   	};
> +
> +	ir35221@e0 {
> +		compatible = "infineon,ir35221";
> +		reg = <0xe0>;
> +	};
> +
> +	ir35221@e2 {
> +		compatible = "infineon,ir35221";
> +		reg = <0xe2>;
> +	};
>   };
>
>   &i2c6 {
