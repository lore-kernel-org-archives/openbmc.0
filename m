Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xR0Q256kZzDqnm
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 00:33:30 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v77EUT5O125510
 for <openbmc@lists.ozlabs.org>; Mon, 7 Aug 2017 10:33:28 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c6s5xu08c-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 10:33:28 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 7 Aug 2017 10:33:27 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 7 Aug 2017 10:33:24 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v77EXO3A56885300; Mon, 7 Aug 2017 14:33:24 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BAAAAE03C;
 Mon,  7 Aug 2017 10:33:40 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 1F974AE034;
 Mon,  7 Aug 2017 10:33:40 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: palmetto: Use new
 occ-hwmon driver
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
References: <1502097540-10201-1-git-send-email-mine260309@gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 7 Aug 2017 09:33:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1502097540-10201-1-git-send-email-mine260309@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17080714-0040-0000-0000-0000038BE1ED
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007501; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00898884; UDB=6.00449866; IPR=6.00679090; 
 BA=6.00005515; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016574; XFM=3.00000015;
 UTC=2017-08-07 14:33:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080714-0041-0000-0000-000007800E34
Message-Id: <7078c05a-dfa7-f6ae-62e5-70e2c9d019b5@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-07_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708070242
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
X-List-Received-Date: Mon, 07 Aug 2017 14:33:31 -0000



On 08/07/2017 04:19 AM, Lei YU wrote:
> P8 OCC hwmon driver is updated.
> Use the new driver and compatible name for Palmetto.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>

Thanks Lei!

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

> ---
>   arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index 4690e53..ee3a1c0 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -136,8 +136,8 @@
>   &i2c3 {
>   	status = "okay";
>
> -	occ@50 {
> -		compatible = "ibm,occ-i2c";
> +	occ-hwmon@50 {
> +		compatible = "ibm,p8-occ-hwmon";
>   		reg = <0x50>;
>   	};
>   };
