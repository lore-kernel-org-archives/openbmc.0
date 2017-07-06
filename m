Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3TNp6C9yzDr4v
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 06:09:46 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v66K9Dps072414
 for <openbmc@lists.ozlabs.org>; Thu, 6 Jul 2017 16:09:44 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bhqu8tkc5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 16:09:44 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 6 Jul 2017 14:09:43 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 6 Jul 2017 14:09:40 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v66K9XTi4260168; Thu, 6 Jul 2017 13:09:40 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 661C56A03C;
 Thu,  6 Jul 2017 14:09:40 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 1AC896A041;
 Thu,  6 Jul 2017 14:09:40 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 0/4] i2c fsi fixes
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20170706143503.21888-1-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 6 Jul 2017 15:09:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170706143503.21888-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17070620-0012-0000-0000-0000149CABFD
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007331; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00883813; UDB=6.00440944; IPR=6.00664001; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016117; XFM=3.00000015;
 UTC=2017-07-06 20:09:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070620-0013-0000-0000-00004E79964E
Message-Id: <29fcf47c-442a-69b5-0667-80168979a0dc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-06_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707060344
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
X-List-Received-Date: Thu, 06 Jul 2017 20:09:47 -0000



On 07/06/2017 09:34 AM, Joel Stanley wrote:
> Hi Eddie,
>
> These are some work in progress cleanups that I have created for the fsi i2c
> driver.
>
> Patch 4 causes the kernel to crash when scanning for devices. To reproduce,
> boot the system and do 'obmcutil poweron'. According to the device tree
> bindings, his change is correct:
>
>   https://github.com/openbmc/linux/blob/dev-4.10/Documentation/devicetree/bindings/fsi/fsi.txt#L56
>
>   > Since the master nodes describe the top-level of the FSI topology, they also
>   > need to declare the FSI-standard addressing scheme. This requires two cells for
>   > addresses (link index and slave ID), and no size:
>   >
>   >  #address-cells = <2>;
>   >  #size-cells = <0>;
>
> The code suggests the same:
>
>   https://github.com/openbmc/linux/blob/dev-4.10/drivers/fsi/fsi-core.c#L628
>
>   > na = of_n_addr_cells(np);
>   > ns = of_n_size_cells(np);
>   >
>   > /* Ensure we have the correct format for addresses and sizes in
>   >  * reg properties
>   >  */
>   > if (na != 2 || ns != 0)
>   >	return false;
>
> If you don't apply that fix, we do get one of the chips probing correctly (I
> assume the hub, as it has the correct format).

Ah, I see the confusion now. The cfam@0,0 node is a slave node. The base 
master node (gpio-fsi) is defined in the machine-specific dts files, and 
has the correct format of 2 address-cells and 0 size-cells.

fsi: gpio-fsi {
         compatible = "fsi-master-gpio", "fsi-master";
         #address-cells = <2>;
         #size-cells = <0>;

The cfam@0,0 should stick with 1 address and 1 size cell for it's 
children, as it's describing the slave.

The hub master is already correct, as you mentioned, and correctly has a 
slave cfam node with 1 address and 1 size cell.

>
> Another issue is patch 2, which removes the statically allocated port numbers,
> where you added 100 or 200 the port number. To retain the old behaviour, I
> suggest you send a patch that adds aliases instead:
>
>   aliases {
> 	 i2c100 = &cfam0_i2c1;
> 	 i2c101 = &cfam0_i2c2;
>   }

Yep, this appears to work. Though it starts at 101 even though i aliased 
i2c100. Strange.

>
> That's a workaround though. We should get the people using these interfaces to
> discover them properly, instead of assuming they exist at a magic offset. sysfs
> is a good way to do this.
>
>   /sys/devices/platform/gpio-fsi/fsi0/slave@00:00/00:00:00:03/i2c-19/

Agreed, but using this there is still no guarantee about which i2c port 
you're actually on unless you read the "name" property.

# cat /sys/bus/fsi/drivers/fsi_i2c_master/00\:00\:00\:03/i2c-14/name
fsi_i2c0

^ indicating port 0.

Anyway, the three I2C patches look good, and we can add aliasing.

Thanks!
Eddie

>
> Joel Stanley (4):
>    i2c: fsi: Remove ida counter
>    i2c: fsi: Dynamically allocate port numbers
>    i2c: fsi: Remove idx counter
>    ARM: dts: cfam: Fix hub node
>
>   arch/arm/boot/dts/ibm-power9-cfam.dtsi |  4 ++--
>   drivers/i2c/busses/i2c-fsi.c           | 28 ++++------------------------
>   2 files changed, 6 insertions(+), 26 deletions(-)
>
