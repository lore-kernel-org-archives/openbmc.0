Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3Syn56QJzDr4v
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 05:50:41 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v66Jn7IG028907
 for <openbmc@lists.ozlabs.org>; Thu, 6 Jul 2017 15:50:38 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bhtjmapmq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 15:50:38 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 6 Jul 2017 13:50:37 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 6 Jul 2017 13:50:36 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v66Joaq45177758; Thu, 6 Jul 2017 12:50:36 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D27B6A03F;
 Thu,  6 Jul 2017 13:50:36 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 1A8256A03C;
 Thu,  6 Jul 2017 13:50:36 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 4/4] ARM: dts: cfam: Fix hub node
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20170706143503.21888-1-joel@jms.id.au>
 <20170706143503.21888-5-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 6 Jul 2017 14:50:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170706143503.21888-5-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17070619-0012-0000-0000-0000149CA32F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007331; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00883807; UDB=6.00440941; IPR=6.00663995; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016117; XFM=3.00000015;
 UTC=2017-07-06 19:50:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070619-0013-0000-0000-00004E798503
Message-Id: <9a7f606b-1877-7936-5e6f-dbca9bb59d05@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-06_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707060339
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
X-List-Received-Date: Thu, 06 Jul 2017 19:50:42 -0000



On 07/06/2017 09:35 AM, Joel Stanley wrote:
> The hub node was not being probed as it had malformed address-cells and
> size-cells nodes.
>
> This fixes probing of i2c devices on the first (non-hub) P9 socket.

I can't replicate the problem you were having with the original or my 
modified device tree. All FSI devices
are probing fine for me. I don't think we should merge this.

Thanks,
Eddie

>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/arm/boot/dts/ibm-power9-cfam.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> index 669ed6804f74..16802933558e 100644
> --- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> +++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> @@ -1,8 +1,8 @@
>   &fsi {
>   	cfam@0,0 {
>   		reg = <0 0>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> +		#address-cells = <2>;
> +		#size-cells = <0>;
>
>   		i2c@1800 {
>   			compatible = "ibm,fsi-i2c-master";
