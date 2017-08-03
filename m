Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNZ7C3JypzDqJM
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 01:42:14 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v73FfoV0013585
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 11:42:12 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c45a6nu4c-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Aug 2017 11:42:11 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Thu, 3 Aug 2017 11:42:11 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 11:42:10 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v73Fg9cJ26280036; Thu, 3 Aug 2017 15:42:09 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EDCEAE04E;
 Thu,  3 Aug 2017 11:42:24 -0400 (EDT)
Received: from [9.10.99.182] (unknown [9.10.99.182])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id D3317AE043;
 Thu,  3 Aug 2017 11:42:23 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v3 4/5] Documentation: ABI: Add IBM power
 supply sysfs documentation
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org,
 cbostic@linux.vnet.ibm.com
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501705534-27606-5-git-send-email-eajames@linux.vnet.ibm.com>
Cc: joel@jms.id.au, bjwyman@gmail.com, "Edward A. James" <eajames@us.ibm.com>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Thu, 3 Aug 2017 10:42:13 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1501705534-27606-5-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17080315-0036-0000-0000-000002533ADD
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007477; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00897017; UDB=6.00448794; IPR=6.00677200; 
 BA=6.00005509; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016516; XFM=3.00000015;
 UTC=2017-08-03 15:42:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080315-0037-0000-0000-0000415115A6
Message-Id: <bbd91224-bece-095b-440a-beb24236455a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-03_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030241
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
X-List-Received-Date: Thu, 03 Aug 2017 15:42:16 -0000



On 8/2/2017 3:25 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>   Documentation/ABI/testing/sysfs-driver-ibmps | 49 ++++++++++++++++++++++++++++
>   1 file changed, 49 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-ibmps
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-ibmps b/Documentation/ABI/testing/sysfs-driver-ibmps
> new file mode 100644
> index 0000000..1645685
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-ibmps
> @@ -0,0 +1,49 @@
> +What:		/sys/bus/i2c/devices/<dev>/clear_faults
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Clears pmbus faults for this power supply.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_word
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_WORD register.

Hey Chris,  I think you did some research and found that upstream 
wouldn't allow capturing full registers like this?  Was that the case?  
Or does it not matter as long as it isn't in hwmon?

> +
> +What:		/sys/bus/i2c/devices/<dev>/status_vout
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_VOUT register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_iout
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_IOUT register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_input
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_INPUT register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_temp
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_TEMPERATURE register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_cml
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_CML register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_other
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_OTHER register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_mfr
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_MFR_SPECIFIC register.
> +
> +What:		/sys/bus/i2c/devices/<dev>/status_fan
> +KernelVersion:	4.13
> +Contact:	eajames@us.ibm.com
> +Description:	Displays the STATUS_FAN register.
