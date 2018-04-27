Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Xb3L6CTqzF24D
 for <openbmc@lists.ozlabs.org>; Fri, 27 Apr 2018 23:52:27 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3RDnKRY045529
 for <openbmc@lists.ozlabs.org>; Fri, 27 Apr 2018 09:52:24 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2hm3qvm5x6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 27 Apr 2018 09:52:24 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Fri, 27 Apr 2018 07:52:23 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 27 Apr 2018 07:52:21 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3RDqKMs8978820; Fri, 27 Apr 2018 06:52:20 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D843D6E03F;
 Fri, 27 Apr 2018 07:52:20 -0600 (MDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id B48176E045;
 Fri, 27 Apr 2018 07:52:20 -0600 (MDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 27 Apr 2018 08:54:54 -0500
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
Cc: "Edward A . James" <eajames@us.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-4.13 v2] fsi: occ: Use PutOCCSRAM in circular
 mode for OCC attention
In-Reply-To: <20180427045540.4439-1-andrew@aj.id.au>
References: <20180427045540.4439-1-andrew@aj.id.au>
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18042713-0008-0000-0000-000009AC957A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008932; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01024034; UDB=6.00522819; IPR=6.00803264; 
 MB=3.00020805; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-27 13:52:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18042713-0009-0000-0000-000046FEFB75
Message-Id: <add613ee-1651-e736-6724-f176ea33b7d2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-27_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804270133
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Apr 2018 13:52:31 -0000


On 4/26/2018 11:55 PM, Andrew Jeffery wrote:
> We can't do SCOMs from the BMC when the host is booted in secure mode,
> and without triggering the attention of the OCC our commands won't be
> processed. Further, the SCOM operation fails, which causes the OCC
> driver's probe to fail, which leads the BMC to think that the OCC has
> failed.
> 
> We have an alternative to the SCOM though: We can trigger the OCC by
> using PutOCCSRAM's circular buffer mode to write to the necessary 
> address.

The address is ignored for the circular buffer

> 
> The PutOCCSRAM operation returns the written data length in the 
> response
> payload before the 0xCODE word, so the condition testing the success of
> the operation is rearranged.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> 
> v2:
> * Minor typo and documentation cleanups
> 
>   drivers/fsi/fsi-occ.c | 22 +++++++++-------------
>   1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index 45ae13cd7a3d..037df79be83a 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -575,19 +575,16 @@ static int occ_putsram(struct device *sbefifo, 
> u32 address, u8 *data,
>   static int occ_trigger_attn(struct device *sbefifo)
>   {
>   	int rc;
> -	__be32 buf[6];
> +	__be32 buf[7];
>   	struct sbefifo_client *client;
> 
> -	/*
> -	 * Magic sequence to do SBE putscom command. SBE will write 8 bytes 
> to
> -	 * specified SCOM address.
> -	 */
> -	buf[0] = cpu_to_be32(0x6);
> -	buf[1] = cpu_to_be32(0xa202);
> -	buf[2] = 0;
> -	buf[3] = cpu_to_be32(0x6D035);
> -	buf[4] = cpu_to_be32(0x20010000);	/* trigger occ attention */
> -	buf[5] = 0;
> +	buf[0] = cpu_to_be32(0x5 + 0x2);        /* Chip-op length in words */
> +	buf[1] = cpu_to_be32(0xa404);           /* PutOCCSRAM */
> +	buf[2] = cpu_to_be32(0x3);              /* Mode: Circular */
> +	buf[3] = cpu_to_be32(0x6D035);          /* Address */

The address is ignored, so should probably make this be zero so it 
doesn't mislead

> +	buf[4] = cpu_to_be32(0x8);              /* Data length in bytes */
> +	buf[5] = cpu_to_be32(0x20010000);       /* Trigger OCC attention */
> +	buf[6] = 0;
> 
>   	client = sbefifo_drv_open(sbefifo, 0);
>   	if (!client)
> @@ -602,8 +599,7 @@ static int occ_trigger_attn(struct device *sbefifo)
>   		goto done;
> 
>   	/* check for good response */
> -	if ((be32_to_cpu(buf[0]) != 0xC0DEA202) ||
> -	    (be32_to_cpu(buf[1]) & 0x0FFFFFFF))
> +	if ((be32_to_cpu(buf[0]) != 8) || (be32_to_cpu(buf[1]) != 
> 0xC0DEA404))
>   		rc = -EBADMSG;
> 
>   done:
