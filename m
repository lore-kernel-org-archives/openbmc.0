Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40gyf00ZvqzF2Mq
 for <openbmc@lists.ozlabs.org>; Wed,  9 May 2018 23:59:35 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w49DxDsb102692
 for <openbmc@lists.ozlabs.org>; Wed, 9 May 2018 09:59:32 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2hv0c1xa7y-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 09 May 2018 09:59:27 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 9 May 2018 09:59:23 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 9 May 2018 09:59:21 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w49DxL7u36307044; Wed, 9 May 2018 13:59:21 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B102AAC03A;
 Wed,  9 May 2018 10:00:52 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.85.187.136])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 6FD35AC040;
 Wed,  9 May 2018 10:00:52 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.13] fsi: scom: Remove PIB reset during probe
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1525819412-21308-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 9 May 2018 08:59:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1525819412-21308-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18050913-0008-0000-0000-00000304F2BA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008997; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000259; SDB=6.01029792; UDB=6.00526236; IPR=6.00808927; 
 MB=3.00021011; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-09 13:59:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050913-0009-0000-0000-000039301823
Message-Id: <7fc4cedd-0ca3-5f17-f666-6b7ce4c58489@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-09_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805090132
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
X-List-Received-Date: Wed, 09 May 2018 13:59:36 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 5/8/18 5:43 PM, Eddie James wrote:
> The PIB reset causes problems for the running P9 chip. The reset
> shouldn't be performed by this driver.
>
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>   drivers/fsi/fsi-scom.c | 8 --------
>   1 file changed, 8 deletions(-)
>
> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
> index e13353a..c8eb5e5 100644
> --- a/drivers/fsi/fsi-scom.c
> +++ b/drivers/fsi/fsi-scom.c
> @@ -26,15 +26,11 @@
>
>   #define FSI_ENGID_SCOM		0x5
>
> -#define SCOM_FSI2PIB_DELAY	50
> -
>   /* SCOM engine register set */
>   #define SCOM_DATA0_REG		0x00
>   #define SCOM_DATA1_REG		0x04
>   #define SCOM_CMD_REG		0x08
> -#define SCOM_RESET_REG		0x1C
>
> -#define SCOM_RESET_CMD		0x80000000
>   #define SCOM_WRITE_CMD		0x80000000
>
>   struct scom_device {
> @@ -180,7 +176,6 @@ static loff_t scom_llseek(struct file *file, loff_t offset, int whence)
>
>   static int scom_probe(struct device *dev)
>   {
> -	uint32_t data;
>   	struct fsi_device *fsi_dev = to_fsi_dev(dev);
>   	struct scom_device *scom;
>
> @@ -197,9 +192,6 @@ static int scom_probe(struct device *dev)
>   	scom->mdev.parent = dev;
>   	list_add(&scom->link, &scom_devices);
>
> -	data = cpu_to_be32(SCOM_RESET_CMD);
> -	fsi_device_write(fsi_dev, SCOM_RESET_REG, &data, sizeof(uint32_t));
> -
>   	return misc_register(&scom->mdev);
>   }
>
