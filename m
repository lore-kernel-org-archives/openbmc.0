Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMdLy1S4xzDqBQ
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 08:03:38 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1DL3Wh1131082
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 16:03:36 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28ke4urpbb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 16:03:36 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 13 Feb 2017 16:03:34 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 13 Feb 2017 16:03:34 -0500
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 4DB096E803C
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 16:03:05 -0500 (EST)
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1DL3VgX14287154; Mon, 13 Feb 2017 21:03:33 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5FE011204B;
 Mon, 13 Feb 2017 16:03:32 -0500 (EST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 993DD112047;
 Mon, 13 Feb 2017 16:03:32 -0500 (EST)
Subject: Re: [PATCH linux dev-4.7 2/2] drivers: fsi: scom: Add remove function
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1487016480-17700-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1487016480-17700-3-git-send-email-eajames@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Mon, 13 Feb 2017 15:03:32 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487016480-17700-3-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021321-0056-0000-0000-000002C03248
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006611; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00821489; UDB=6.00401781; IPR=6.00598942; 
 BA=6.00005133; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014270; XFM=3.00000011;
 UTC=2017-02-13 21:03:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021321-0057-0000-0000-000006F53232
Message-Id: <e7baa527-7bb1-17fc-f8df-df6e7deb10e1@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-13_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702130200
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
X-List-Received-Date: Mon, 13 Feb 2017 21:03:38 -0000

Acked by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 2/13/17 2:08 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> driver wasn't cleaning up miscdevice
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>   drivers/fsi/fsi-scom.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
> index 22d280a..a439a5e 100644
> --- a/drivers/fsi/fsi-scom.c
> +++ b/drivers/fsi/fsi-scom.c
> @@ -199,6 +199,21 @@ static int scom_probe(struct device *dev)
>   	return misc_register(&scom->mdev);
>   }
>
> +static int scom_remove(struct device *dev)
> +{
> +	struct scom_device *scom, *scom_tmp;
> +	struct fsi_device *fsi_dev = to_fsi_dev(dev);
> +	
> +	list_for_each_entry_safe(scom, scom_tmp, &scom_devices, link) {
> +		if (scom->fsi_dev == fsi_dev) {
> +			list_del(&scom->link);
> +			misc_deregister(&scom->mdev);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static struct fsi_device_id scom_ids[] = {
>   	{
>   		.engine_type = FSI_ENGID_SCOM,
> @@ -213,6 +228,7 @@ static struct fsi_driver scom_drv = {
>   		.name = "scom",
>   		.bus = &fsi_bus_type,
>   		.probe = scom_probe,
> +		.remove = scom_remove,
>   	}
>   };
>
