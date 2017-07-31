Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLrXz2V5JzDrnD
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 06:25:07 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6VKOEoX070847
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:25:05 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c2a2v49mn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:25:05 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 16:25:03 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 16:25:01 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6VKP1ji24707226; Mon, 31 Jul 2017 20:25:01 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2057728048;
 Mon, 31 Jul 2017 16:24:55 -0400 (EDT)
Received: from [9.10.223.138] (unknown [9.10.223.138])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id D03A42803A;
 Mon, 31 Jul 2017 16:24:54 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v3 4/4] ARM: dts: aspeed: Witherspoon WDT1
 external signal is push-pull
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20170727101647.26960-1-andrew@aj.id.au>
 <20170727101647.26960-5-andrew@aj.id.au>
Cc: msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Mon, 31 Jul 2017 15:25:01 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170727101647.26960-5-andrew@aj.id.au>
Content-Type: multipart/alternative;
 boundary="------------552DBC6DD38A9E9A14C1A0B9"
X-TM-AS-GCONF: 00
x-cbid: 17073120-0048-0000-0000-000001CC8C08
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007460; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895671; UDB=6.00447987; IPR=6.00675859; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016469; XFM=3.00000015;
 UTC=2017-07-31 20:25:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17073120-0049-0000-0000-00004213975C
Message-Id: <1777614c-7b97-f08c-2e33-d65cf7d06c89@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-31_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707310341
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
X-List-Received-Date: Mon, 31 Jul 2017 20:25:07 -0000

This is a multi-part message in MIME format.
--------------552DBC6DD38A9E9A14C1A0B9
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: Matt Spinler mspinler@linux.vnet.ibm.com


On 7/27/2017 5:16 AM, Andrew Jeffery wrote:
> Fix the drive and polarity of WDTRST1 with respect to the latch design
> which assert the FAULT pin on the MAX31785 across a BMC reset. This
> ensures the fan outputs are ramped to 100% PWM duty.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index c28222c17d03..6a7ab9648984 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -488,6 +488,8 @@
>   &wdt1 {
>   	aspeed,reset-type = "none";
>   	aspeed,external-signal;
> +	aspeed,ext-push-pull;
> +	aspeed,ext-active-high;
>
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pinctrl_wdtrst1_default>;


--------------552DBC6DD38A9E9A14C1A0B9
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><font face="sans-serif" size="2">Tested-by: Matt Spinler  
        <a class="moz-txt-link-abbreviated" href="mailto:mspinler@linux.vnet.ibm.com">mspinler@linux.vnet.ibm.com</a></font></p>
    <br>
    <div class="moz-cite-prefix">On 7/27/2017 5:16 AM, Andrew Jeffery
      wrote:<br>
    </div>
    <blockquote cite="mid:20170727101647.26960-5-andrew@aj.id.au"
      type="cite">
      <pre wrap="">Fix the drive and polarity of WDTRST1 with respect to the latch design
which assert the FAULT pin on the MAX31785 across a BMC reset. This
ensures the fan outputs are ramped to 100% PWM duty.

Signed-off-by: Andrew Jeffery <a class="moz-txt-link-rfc2396E" href="mailto:andrew@aj.id.au">&lt;andrew@aj.id.au&gt;</a>
Cc: Matt Spinler <a class="moz-txt-link-rfc2396E" href="mailto:mspinler@linux.vnet.ibm.com">&lt;mspinler@linux.vnet.ibm.com&gt;</a>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index c28222c17d03..6a7ab9648984 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -488,6 +488,8 @@
 &amp;wdt1 {
 	aspeed,reset-type = "none";
 	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;

 	pinctrl-names = "default";
 	pinctrl-0 = &lt;&amp;pinctrl_wdtrst1_default&gt;;
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------552DBC6DD38A9E9A14C1A0B9--
