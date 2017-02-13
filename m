Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMdHp27WHzDqBQ
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 08:00:54 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1DKwp2J020051
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 16:00:51 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28kjhvkt8e-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 16:00:51 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 13 Feb 2017 14:00:50 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 13 Feb 2017 14:00:47 -0700
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 37BE13E4003F
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 14:00:47 -0700 (MST)
Received: from b01ledav03.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1DL0EXr54591598; Mon, 13 Feb 2017 21:00:46 GMT
Received: from b01ledav03.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4421EB205E;
 Mon, 13 Feb 2017 16:00:46 -0500 (EST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b01ledav03.gho.pok.ibm.com (Postfix) with ESMTP id E18DCB204E;
 Mon, 13 Feb 2017 16:00:45 -0500 (EST)
Subject: Re: [PATCH linux dev-4.7 1/2] drivers: fsi: delete device on unscan
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1487016480-17700-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1487016480-17700-2-git-send-email-eajames@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Mon, 13 Feb 2017 15:00:45 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487016480-17700-2-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021321-0008-0000-0000-00000735203E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006611; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00821488; UDB=6.00401780; IPR=6.00598942; 
 BA=6.00005133; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014270; XFM=3.00000011;
 UTC=2017-02-13 21:00:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021321-0009-0000-0000-00003FDD7484
Message-Id: <070de110-e2d4-6ac6-25a7-653d80342d2e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-13_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702130199
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
X-List-Received-Date: Mon, 13 Feb 2017 21:00:54 -0000

Acked by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 2/13/17 2:07 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> need to delete device so that client driver "remove" is called.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>   drivers/fsi/fsi-core.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 1e9c5a2..e8a3618 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -512,6 +512,7 @@ static void fsi_master_unscan(struct fsi_master *master)
>   		list_for_each_entry_safe(fsi_dev, fsi_dev_tmp,
>   					&slave->my_engines, link) {
>   			list_del(&fsi_dev->link);
> +			device_del(&fsi_dev->dev);
>   			put_device(&fsi_dev->dev);
>   		}
>   		device_unregister(&slave->dev);
