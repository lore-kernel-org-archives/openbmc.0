Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y5gwt6t42zDqhh
 for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2017 12:11:58 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v931BUsF099820
 for <openbmc@lists.ozlabs.org>; Mon, 2 Oct 2017 21:11:56 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dbweypuhe-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 02 Oct 2017 21:11:56 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 2 Oct 2017 19:11:55 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 2 Oct 2017 19:11:54 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v931BrVo1573212; Mon, 2 Oct 2017 18:11:53 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9928CC603C;
 Mon,  2 Oct 2017 19:11:53 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.7.106])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 589FCC6043;
 Mon,  2 Oct 2017 19:11:51 -0600 (MDT)
Subject: Re: [PATCH] fsi/master: Clarify master lifetimes & fix use-after-free
 in hub master
To: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
References: <1506990743-1455-1-git-send-email-jk@ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Mon, 2 Oct 2017 20:11:49 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1506990743-1455-1-git-send-email-jk@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17100301-0028-0000-0000-00000871D174
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007832; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000233; SDB=6.00925661; UDB=6.00465568; IPR=6.00705860; 
 BA=6.00005616; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017371; XFM=3.00000015;
 UTC=2017-10-03 01:11:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100301-0029-0000-0000-000037C93270
Message-Id: <63c856a0-028e-4559-d85b-5fee21bbe426@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-03_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710030016
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Oct 2017 01:11:59 -0000

Tested-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 10/2/17 7:32 PM, Jeremy Kerr wrote:
> Once we call fsi_master_unregister, the core will put_device,
> potentially freeing the hub master. This change adds a comment
> explaining the lifetime of an allocated fsi_master.
>
> We then add a reference from the driver to the hub master, so it stays
> around until we've finished ->remove().
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>   drivers/fsi/fsi-master-hub.c | 19 ++++++++++++++++---
>   drivers/fsi/fsi-master.h     | 15 +++++++++++++++
>   2 files changed, 31 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
> index 5e4cd31..614d5f5 100644
> --- a/drivers/fsi/fsi-master-hub.c
> +++ b/drivers/fsi/fsi-master-hub.c
> @@ -288,10 +288,19 @@ static int hub_master_probe(struct device *dev)
>   	hub_master_init(hub);
>
>   	rc = fsi_master_register(&hub->master);
> -	if (!rc)
> -		return 0;
> +	if (rc)
> +		goto err_release;
> +
> +	/* At this point, fsi_master_register performs the device_initialize(),
> +	 * and holds the sole reference on master.dev. This means the device
> +	 * will be freed (via ->release) during any subsequent call to
> +	 * fsi_master_unregister.  We add our own reference to it here, so we
> +	 * can perform cleanup (in _remove()) without it being freed before
> +	 * we're ready.
> +	 */
> +	get_device(&hub->master.dev);
> +	return 0;
>
> -	kfree(hub);
>   err_release:
>   	fsi_slave_release_range(fsi_dev->slave, FSI_HUB_LINK_OFFSET,
>   			FSI_HUB_LINK_SIZE * links);
> @@ -306,6 +315,10 @@ static int hub_master_remove(struct device *dev)
>   	fsi_slave_release_range(hub->upstream->slave, hub->addr, hub->size);
>   	of_node_put(hub->master.dev.of_node);
>
> +	/* master.dev will likely be ->release()ed after this, which free()s
> +	 * the hub */
> +	put_device(&hub->master.dev);
> +
>   	return 0;
>   }
>
> diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
> index 546257d..1530ab2 100644
> --- a/drivers/fsi/fsi-master.h
> +++ b/drivers/fsi/fsi-master.h
> @@ -37,6 +37,21 @@ struct fsi_master {
>
>   #define dev_to_fsi_master(d) container_of(d, struct fsi_master, dev)
>
> +/**
> + * fsi_master registration & lifetime: the fsi_master_register() and
> + * fsi_master_unregister() functions will take ownership of the master, and
> + * ->dev in particular. The registration path performs a get_device(), which
> + * takes the first reference on the device. Similarly, the unregistration path
> + * performs a put_device(), which may well drop the last reference.
> + *
> + * This means that master implementations *may* need to hold their own
> + * reference (via get_device()) on master->dev. In particular, if the device's
> + * ->release callback frees the fsi_master, then fsi_master_unregister will
> + * invoke this free if no other reference is held.
> + *
> + * The same applies for the error path of fsi_master_register; if the call
> + * fails, dev->release will have been invoked.
> + */
>   extern int fsi_master_register(struct fsi_master *master);
>   extern void fsi_master_unregister(struct fsi_master *master);
>
