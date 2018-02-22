Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znQqc6pVDzF0lQ
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 07:26:36 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1MKNt5O080540
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:26:34 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ga13w10c2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:26:33 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 22 Feb 2018 13:26:33 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 22 Feb 2018 13:26:30 -0700
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1MKQUHx12911084; Thu, 22 Feb 2018 13:26:30 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29F23C603E;
 Thu, 22 Feb 2018 13:26:30 -0700 (MST)
Received: from [9.80.205.44] (unknown [9.80.205.44])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id EF74DC603C;
 Thu, 22 Feb 2018 13:26:28 -0700 (MST)
Subject: Re: [PATCH linux dev-4.13 02/16] hwmon (p9_sbe): Initialise device
 spin lock
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
References: <20180220041844.13228-1-andrew@aj.id.au>
 <20180220041844.13228-3-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 22 Feb 2018 14:26:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220041844.13228-3-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18022220-0012-0000-0000-000015CA7FEA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008578; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00993585; UDB=6.00504882; IPR=6.00772925; 
 MB=3.00019692; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-22 20:26:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022220-0013-0000-0000-000051995227
Message-Id: <74aee8f5-265e-bf2a-e47e-f8870e0969a5@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-22_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802220256
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
X-List-Received-Date: Thu, 22 Feb 2018 20:26:37 -0000



On 02/19/2018 10:18 PM, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

> ---
>   drivers/hwmon/occ/p9_sbe.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index 7dbe4d5bcd61..cda29f47f8ff 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -116,6 +116,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>   	if (!p9_sbe_occ)
>   		return -ENOMEM;
>
> +	spin_lock_init(&p9_sbe_occ->lock);
>   	p9_sbe_occ->sbe = pdev->dev.parent;
>   	occ = &p9_sbe_occ->occ;
>   	occ->bus_dev = &pdev->dev;
