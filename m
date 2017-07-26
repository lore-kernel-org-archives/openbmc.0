Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHjRV2lSPzDqmr
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 03:54:30 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6QHsCP3070051
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 13:54:28 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bxw9m01b2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 13:54:27 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Wed, 26 Jul 2017 11:54:26 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 26 Jul 2017 11:54:23 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6QHsNQk17563812; Wed, 26 Jul 2017 10:54:23 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69DA3136046;
 Wed, 26 Jul 2017 11:54:23 -0600 (MDT)
Received: from [9.10.223.138] (unknown [9.10.223.138])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 1022D13603A;
 Wed, 26 Jul 2017 11:54:23 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 v2 4/4] ARM: dts: aspeed: Witherspoon WDT1
 external signal is push-pull
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20170726160831.17867-1-andrew@aj.id.au>
 <20170726160831.17867-5-andrew@aj.id.au>
Cc: msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Wed, 26 Jul 2017 12:54:37 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170726160831.17867-5-andrew@aj.id.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17072617-0028-0000-0000-00000817BE60
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007430; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00893255; UDB=6.00446551; IPR=6.00673420; 
 BA=6.00005492; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016390; XFM=3.00000015;
 UTC=2017-07-26 17:54:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072617-0029-0000-0000-000036DBDA68
Message-Id: <6b056c44-6fc8-95ff-48c9-62911ff4fbd2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-26_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707260259
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
X-List-Received-Date: Wed, 26 Jul 2017 17:54:31 -0000



On 7/26/2017 11:08 AM, Andrew Jeffery wrote:
> Correctly drive the latch asserting the FAULT pin on the MAX31785 when
> the watchdog bites. This ensures the fan outputs are ramped to 100% PWM
> duty.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index c28222c17d03..df36b87ba105 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -488,6 +488,7 @@
>   &wdt1 {
>   	aspeed,reset-type = "none";
>   	aspeed,external-signal;
> +	aspeed,ext-push-pull;

We need active-high for sure.  It still works without push-pull, but not 
sure if that is totally electronically ideal or not as the HW designer 
requested for this to be push-pull.

>
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pinctrl_wdtrst1_default>;
