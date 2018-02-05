Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zZshR6TZGzF0s0
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 02:58:47 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w15Fvjjx115190
 for <openbmc@lists.ozlabs.org>; Mon, 5 Feb 2018 10:58:45 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fxrppw9kf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 05 Feb 2018 10:58:44 -0500
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 5 Feb 2018 10:58:43 -0500
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 5 Feb 2018 10:58:42 -0500
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w15FwfB057212946; Mon, 5 Feb 2018 15:58:41 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F2AEAE04B;
 Mon,  5 Feb 2018 11:00:00 -0500 (EST)
Received: from Christophers-MacBook-Pro.local (unknown [9.81.199.187])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id EFA16AE034;
 Mon,  5 Feb 2018 10:59:58 -0500 (EST)
Subject: Re: [PATCH linux dev-4.10] drivers: fsi: sbefifo: don't delete
 canceled xfrs in write
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1517613287-23508-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Mon, 5 Feb 2018 09:58:38 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1517613287-23508-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18020515-0052-0000-0000-000002B05902
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008477; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00985339; UDB=6.00499954; IPR=6.00764711; 
 BA=6.00005811; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019379; XFM=3.00000015;
 UTC=2018-02-05 15:58:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18020515-0053-0000-0000-0000537BA546
Message-Id: <5b46b073-8a63-0232-0c1a-7149bc03ce0a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-05_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802050201
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Feb 2018 15:58:48 -0000

Reviewed-by: Christopher Bostic <clbostic@linux.vnet.ibm.com>


On 2/2/18 5:14 PM, Eddie James wrote:
> The write function was deleting canceled transfers before they had a
> change to run and complete. This results in not acking the EOT and not
Eddie,

Small nitpick 'change' should be 'chance'.   Not sure its worth a 
re-spin unless there are other changes required.

Thanks
-Chris
> reading the rest of the data left in the FIFO for the canceled transfer.
> This is the cause of the EBADMSG errors found in the OCC driver, as the
> next op reads the data left over.
>
> Fix it by just checking the first entry of the list instead of
> iterating and canceling.
>
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>
> Joel, I based this on top of the "Fixup SBEFIFO and OCC locking" series. Let me
> know if I need to put this first and rebase that series... thanks.
>
>   drivers/fsi/fsi-sbefifo.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 4d024ed..7a6c4e1 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -713,8 +713,10 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
>   	n = sbefifo_buf_nbwriteable(&client->wbuf);
>
>   	spin_lock_irqsave(&sbefifo->list_lock, flags);
> -	xfr = sbefifo_next_xfr(sbefifo);	/* next xfr to be executed */
>
> +	/* next xfr to be executed */
> +	xfr = list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xfr,
> +				       xfrs);
>   	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
>   		spin_unlock_irqrestore(&sbefifo->list_lock, flags);
>   		ret = -EAGAIN;
