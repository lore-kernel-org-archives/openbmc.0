Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPXVQ46SZzDq8X
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 10:31:42 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1GNIqux055993
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 18:31:39 -0500
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28nfhu77ea-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 18:31:39 -0500
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 16 Feb 2017 16:31:38 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 16 Feb 2017 16:31:35 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 8C86919D8042;
 Thu, 16 Feb 2017 16:30:47 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1GNVY2P16711938; Thu, 16 Feb 2017 16:31:34 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC9C06A03F;
 Thu, 16 Feb 2017 16:31:34 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 8688C6A03C;
 Thu, 16 Feb 2017 16:31:34 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7 3/5] drivers/fsi: Define hub master read
 write
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170216220434.79474-1-cbostic@linux.vnet.ibm.com>
 <20170216220434.79474-4-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 16 Feb 2017 17:31:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170216220434.79474-4-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021623-0024-0000-0000-000015F1D4E8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006629; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00822979; UDB=6.00402674; IPR=6.00600425; 
 BA=6.00005146; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014313; XFM=3.00000011;
 UTC=2017-02-16 23:31:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021623-0025-0000-0000-000048D5F408
Message-Id: <650d2334-8120-1fa2-2d02-a90321873a88@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-16_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702160218
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
X-List-Received-Date: Thu, 16 Feb 2017 23:31:43 -0000

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>


On 02/16/2017 04:04 PM, Christopher Bostic wrote:
> Define the master read, write, link enable, and break methods.
> Register the hub master with the core.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>   drivers/fsi/fsi-master-hub.c | 30 ++++++++++++++++++++++++++----
>   1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
> index e8c0726..ea6db17 100644
> --- a/drivers/fsi/fsi-master-hub.c
> +++ b/drivers/fsi/fsi-master-hub.c
> @@ -34,23 +34,38 @@
>   int hub_master_read(struct fsi_master *master, int linkno, uint8_t slave,
>   			uint32_t addr, void *val, size_t size)
>   {
> -	return 0;
> +	addr += (linkno * FSI_MASTER_HUB_LINK_SIZE);
> +	return fsi_device_read(master->link, addr, val, size);
>   }
>
>   int hub_master_write(struct fsi_master *master, int linkno, uint8_t slave,
>   			uint32_t addr, const void *val, size_t size)
>   {
> -	return 0;
> +	addr += (linkno * FSI_MASTER_HUB_LINK_SIZE);
> +	return fsi_device_write(master->link, addr, val, size);
>   }
>
>   int hub_master_break(struct fsi_master *master, int linkno)
>   {
> -	return 0;
> +	uint32_t command;
> +	uint32_t break_offset = 0x4; /* hw workaround */
> +
> +	command = FSI_BREAK;
> +	return fsi_device_write(master->link, break_offset, &command,
> +				sizeof(command));
>   }
>
>   int hub_master_link_enable(struct fsi_master *master, int link)
>   {
> -	return 0;
> +	uint32_t menp = L_MSB_MASK(link);
> +	int rc;
> +
> +	rc = fsi_device_write(master->engine, FSI_MSENP0, &menp,
> +				sizeof(menp));
> +	/* Wait for hw to finish enable */
> +	mdelay(10);
> +
> +	return rc;
>   }
>
>   static int hub_master_probe(struct device *dev)
> @@ -178,6 +193,13 @@ static int hub_master_probe(struct device *dev)
>   			master->link = fsi_dev;
>   		}
>   		master->n_links++;
> +
> +		/* Each hub links is listed twice in CFAM config space */
> +		if (master->n_links == (FSI_MASTER_HUB_MAX_LINKS * 2)) {
> +			/* Only need hub link 1 for now */
> +			master->n_links = 2;
> +			return fsi_master_register(master);
> +		}
>   	}
>
>   	return 0;
