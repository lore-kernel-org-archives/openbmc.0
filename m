Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yRP335GvJzDr4C
 for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2017 08:03:43 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9VL3Iqg037077
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 17:03:40 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dxxnjxfch-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 17:03:40 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 31 Oct 2017 17:03:39 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 31 Oct 2017 17:03:36 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9VL3ZD948496864; Tue, 31 Oct 2017 21:03:36 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A778D112034;
 Tue, 31 Oct 2017 17:03:04 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.218])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 4A5CD112040;
 Tue, 31 Oct 2017 17:03:04 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10] drivers (fsi): occ: Change errno for
 releasing client during transfer
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1509471272-30457-1-git-send-email-eajames@linux.vnet.ibm.com>
Cc: andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Tue, 31 Oct 2017 16:03:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1509471272-30457-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17103121-0056-0000-0000-000003E257E1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007988; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00939269; UDB=6.00473530; IPR=6.00719530; 
 BA=6.00005666; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017812; XFM=3.00000015;
 UTC=2017-10-31 21:03:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17103121-0057-0000-0000-000008196995
Message-Id: <123500ff-7aed-ae22-e284-32b62923e8e0@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-31_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710310257
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
X-List-Received-Date: Tue, 31 Oct 2017 21:03:44 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 10/31/17 12:34 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Clients were receiving the ECANCELED errno when the client is removed
> during a transfer. Use ENODEV instead, as ECANCELED is for AIO ops.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>   drivers/fsi/occ.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 1fe1a54..adc64f3 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -240,9 +240,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>   		spin_lock_irq(&client->lock);
>
>   		if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
> -			if (test_bit(XFR_CANCELED, &xfr->flags))
> -				rc = -ECANCELED;
> -			else if (occ->cancel)
> +			if (occ->cancel || test_bit(XFR_CANCELED, &xfr->flags))
>   				rc = -ENODEV;
>   			else
>   				rc = -EINTR;
