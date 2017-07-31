Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLrXc6nqKzDrfp
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 06:24:48 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6VKOGpJ005478
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:24:47 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c27csvcq1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:24:46 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 16:24:44 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 16:24:31 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6VKOVx225886924; Mon, 31 Jul 2017 20:24:31 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E07902803A;
 Mon, 31 Jul 2017 16:24:24 -0400 (EDT)
Received: from [9.10.223.138] (unknown [9.10.223.138])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 993622803F;
 Mon, 31 Jul 2017 16:24:24 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v3 2/4] dt-bindings: watchdog: aspeed:
 External reset signal properties
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20170727101647.26960-1-andrew@aj.id.au>
 <20170727101647.26960-3-andrew@aj.id.au>
Cc: msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Mon, 31 Jul 2017 15:24:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170727101647.26960-3-andrew@aj.id.au>
Content-Type: multipart/alternative;
 boundary="------------44A364E095E0F1A4019A5D55"
X-TM-AS-GCONF: 00
x-cbid: 17073120-2213-0000-0000-000002028907
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007461; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895672; UDB=6.00447986; IPR=6.00675859; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016469; XFM=3.00000015;
 UTC=2017-07-31 20:24:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17073120-2214-0000-0000-0000571091E1
Message-Id: <2d7f1027-3fa6-08a0-0d5e-7fbcd66a445e@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 31 Jul 2017 20:24:49 -0000

This is a multi-part message in MIME format.
--------------44A364E095E0F1A4019A5D55
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: Matt Spinler mspinler@linux.vnet.ibm.com


On 7/27/2017 5:16 AM, Andrew Jeffery wrote:
> For the AST2500 and compatible watchdog controllers the external reset
> signal can be configured for push-pull or open-drain drive types, and in
> the case of open-drain driving, active low or high.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index f526b003b2e0..7aa885f620ef 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -36,10 +36,18 @@ Optional properties:
>    - aspeed,interrupt:	If property is present then interrupt CPU.
>   			If not specified then don't interrupt CPU.
>
> + - aspeed,alt-boot:    If property is present then boot from alternate block.
>    - aspeed,external-signal: If property is present then signal is sent to
>   			external reset counter (only WDT1 and WDT2). If not
>   			specified no external signal is sent.
> - - aspeed,alt-boot:    If property is present then boot from alternate block.
> + - aspeed,ext-pulse-duration: External signal pulse duration in microseconds
> +
> +Optional properties for AST2500-compatible watchdogs:
> + - aspeed,ext-push-pull: If aspeed,external-signal is present, set the pin's
> +			 drive type to push-pull. The default is open-drain.
> + - aspeed,ext-active-high: If aspeed,external-signal is present and and the pin
> +			   is configured as push-pull, then set the pulse
> +			   polarity to active-high. The default is active-low.
>
>   Example:
>


--------------44A364E095E0F1A4019A5D55
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
    <blockquote cite="mid:20170727101647.26960-3-andrew@aj.id.au"
      type="cite">
      <pre wrap="">For the AST2500 and compatible watchdog controllers the external reset
signal can be configured for push-pull or open-drain drive types, and in
the case of open-drain driving, active low or high.

Signed-off-by: Andrew Jeffery <a class="moz-txt-link-rfc2396E" href="mailto:andrew@aj.id.au">&lt;andrew@aj.id.au&gt;</a>
---
 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index f526b003b2e0..7aa885f620ef 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -36,10 +36,18 @@ Optional properties:
  - aspeed,interrupt:	If property is present then interrupt CPU.
 			If not specified then don't interrupt CPU.

+ - aspeed,alt-boot:    If property is present then boot from alternate block.
  - aspeed,external-signal: If property is present then signal is sent to
 			external reset counter (only WDT1 and WDT2). If not
 			specified no external signal is sent.
- - aspeed,alt-boot:    If property is present then boot from alternate block.
+ - aspeed,ext-pulse-duration: External signal pulse duration in microseconds
+
+Optional properties for AST2500-compatible watchdogs:
+ - aspeed,ext-push-pull: If aspeed,external-signal is present, set the pin's
+			 drive type to push-pull. The default is open-drain.
+ - aspeed,ext-active-high: If aspeed,external-signal is present and and the pin
+			   is configured as push-pull, then set the pulse
+			   polarity to active-high. The default is active-low.

 Example:

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------44A364E095E0F1A4019A5D55--
