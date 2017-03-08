Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vdcLG4pZ8zDqZC
 for <openbmc@lists.ozlabs.org>; Thu,  9 Mar 2017 02:06:30 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v28F4BBN114403
 for <openbmc@lists.ozlabs.org>; Wed, 8 Mar 2017 10:06:27 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 292j7v6jah-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Mar 2017 10:06:27 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 8 Mar 2017 10:06:26 -0500
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 8 Mar 2017 10:06:24 -0500
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v28F6NBf10748294; Wed, 8 Mar 2017 08:06:23 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 253FD136055;
 Wed,  8 Mar 2017 08:06:23 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id D958313604F;
 Wed,  8 Mar 2017 08:06:22 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7 v2] drivers/fsi: Remove hub devices during
 master unregister
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170307164610.78174-1-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 8 Mar 2017 09:06:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170307164610.78174-1-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17030815-0040-0000-0000-000002CFF147
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006745; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00831736; UDB=6.00408102; IPR=6.00609329; 
 BA=6.00005201; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014561; XFM=3.00000013;
 UTC=2017-03-08 15:06:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030815-0041-0000-0000-000006C4041E
Message-Id: <4ba9b3fb-c047-4593-9337-b2da112a90dd@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-08_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703080122
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
X-List-Received-Date: Wed, 08 Mar 2017 15:06:31 -0000

On 03/07/2017 10:46 AM, Christopher Bostic wrote:

> All hub devices must be removed when the primary FSI master
> is being unregistered.  This ensures that the system is in
> a clean state when another scan is attempted.  Failure to do so
> will result in duplicate /sys device name errors.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v2: Fix missing return in non void function warning
> ---
>   drivers/fsi/fsi-core.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index bd57b41..bbdf6b8 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -84,6 +84,7 @@ struct fsi_master_hub {
>   #define to_fsi_master_hub(d) container_of(d, struct fsi_master_hub, master)
>   #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
>
> +static void fsi_master_unscan(struct fsi_master *master);
>   static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
>   		void *val, size_t size);
>   static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
> @@ -441,6 +442,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>   			hub->dev.release = hub_master_release;
>   			hub->master.dev = &hub->dev;
>   			hub->master.dev->parent = &slave->dev;
> +			dev_set_drvdata(&hub->dev, hub);
>   			rc = device_add(&hub->dev);
>   			if (rc)
>   				return rc;
> @@ -739,6 +741,20 @@ static int fsi_master_scan(struct fsi_master *master)
>   	return 0;
>   }
>
> +static int fsi_unregister_hubs(struct device *dev, void *data)
> +{
> +	struct fsi_master_hub *hub =
> +				(struct fsi_master_hub *)dev_get_drvdata(dev);
> +
> +	if (!hub)
> +		return 0;
> +
> +	device_del(dev);
> +	fsi_master_unscan(&hub->master);
> +
> +	return 0;
> +}
> +
>   static void fsi_master_unscan(struct fsi_master *master)
>   {
>   	struct fsi_slave *slave, *slave_tmp;
> @@ -756,6 +772,8 @@ static void fsi_master_unscan(struct fsi_master *master)
>   			device_del(&fsi_dev->dev);
>   			put_device(&fsi_dev->dev);
>   		}
> +		/* Remove any hub masters */
> +		device_for_each_child(&slave->dev, NULL, fsi_unregister_hubs);
>   		device_unregister(&slave->dev);
>   	}
>   	master->slave_list = false;

Looks good.

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>
