Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43FwkN1txYzDqQJ
 for <openbmc@lists.ozlabs.org>; Fri, 14 Dec 2018 01:17:47 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wBDEE6ju031770
 for <openbmc@lists.ozlabs.org>; Thu, 13 Dec 2018 09:17:45 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2pbq3v6522-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 13 Dec 2018 09:17:45 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Thu, 13 Dec 2018 14:17:44 -0000
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 13 Dec 2018 14:17:41 -0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wBDEHeXQ15728658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 13 Dec 2018 14:17:40 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A38A28058;
 Thu, 13 Dec 2018 14:17:40 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D106B28064;
 Thu, 13 Dec 2018 14:17:38 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 13 Dec 2018 14:17:38 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 13 Dec 2018 08:21:49 -0600
From: Adriana Kobylak <anoo@linux.ibm.com>
To: medadyoung@gmail.com, joel@jms.id.au, jk@ozlabs.org
Cc: jbacik@fb.com, axboe@kernel.dk, linux-block@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 nbd@other.debian.org, openbmc
 <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Subject: Re: [PATCH] nbd:clear NBD_BOUND flag when NBD connection is closed
In-Reply-To: <1544509023-18923-1-git-send-email-medadyoung@gmail.com>
References: <1544509023-18923-1-git-send-email-medadyoung@gmail.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18121314-0060-0000-0000-000002E36DA7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010219; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000271; SDB=6.01131193; UDB=6.00587859; IPR=6.00911325; 
 MB=3.00024681; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-13 14:17:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18121314-0061-0000-0000-000047863A82
Message-Id: <a1da3fff285fe13d04522f1a6e72bdc1@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-13_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812130124
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2018 14:17:48 -0000

On 2018-12-11 00:17, medadyoung@gmail.com wrote:
> From: Medad <medadyoung@gmail.com>
> 
>     If we do NOT clear NBD_BOUND flag when NBD connection is closed,
>     then the original NBD device could not be used again.
> 
> Signed-off-by: Medad <medadyoung@gmail.com>

Tested on Witherspoon (OpenPOWER P9 with AST2500) and verified with
this patch that the NBD device could be disconnected/reconnected.

Tested by: Adriana Kobylak <anoo@linux.ibm.com>

> ---
>  drivers/block/nbd.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 64278f4..5c88490 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -277,10 +277,14 @@ static void sock_shutdown(struct nbd_device *nbd)
>  	struct nbd_config *config = nbd->config;
>  	int i;
> 
> -	if (config->num_connections == 0)
> +	if (config->num_connections == 0) {
> +		clear_bit(NBD_BOUND, &config->runtime_flags);
>  		return;
> -	if (test_and_set_bit(NBD_DISCONNECTED, &config->runtime_flags))
> +	}
> +	if (test_and_set_bit(NBD_DISCONNECTED, &config->runtime_flags)) {
> +		clear_bit(NBD_BOUND, &config->runtime_flags);
>  		return;
> +	}
> 
>  	for (i = 0; i < config->num_connections; i++) {
>  		struct nbd_sock *nsock = config->socks[i];
> @@ -944,7 +948,7 @@ static int nbd_reconnect_socket(struct nbd_device
> *nbd, unsigned long arg)
>  		sockfd_put(old);
> 
>  		clear_bit(NBD_DISCONNECTED, &config->runtime_flags);
> -
> +		clear_bit(NBD_BOUND, &config->runtime_flags);
>  		/* We take the tx_mutex in an error path in the recv_work, so we
>  		 * need to queue_work outside of the tx_mutex.
>  		 */
> @@ -1020,6 +1024,7 @@ static int nbd_disconnect(struct nbd_device *nbd)
>  	dev_info(disk_to_dev(nbd->disk), "NBD_DISCONNECT\n");
>  	set_bit(NBD_DISCONNECT_REQUESTED, &config->runtime_flags);
>  	send_disconnects(nbd);
> +	clear_bit(NBD_BOUND, &config->runtime_flags);
>  	return 0;
>  }
