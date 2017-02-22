Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vT2wl4LwlzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 03:33:11 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1MGSl23035724
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 11:33:09 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28ruy0vjtr-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 11:33:09 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 22 Feb 2017 11:33:06 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 22 Feb 2017 11:33:03 -0500
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id CEB4D6E803C;
 Wed, 22 Feb 2017 11:32:33 -0500 (EST)
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1MGWxTo55509148; Wed, 22 Feb 2017 16:33:02 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E11532803F;
 Wed, 22 Feb 2017 11:33:01 -0500 (EST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 9C2DE28046;
 Wed, 22 Feb 2017 11:33:01 -0500 (EST)
Subject: Re: [PATCH linux dev-4.7 v2 3/7] drivers/fsi: Define hub master
 callbacks
To: Jeremy Kerr <jk@ozlabs.org>, joel@jms.id.au
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
 <20170221215032.79282-4-cbostic@linux.vnet.ibm.com>
 <dc340299-0b3c-f262-153d-a9ee5787b786@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 22 Feb 2017 10:33:03 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <dc340299-0b3c-f262-153d-a9ee5787b786@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022216-0044-0000-0000-0000029FD992
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006663; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825565; UDB=6.00404240; IPR=6.00603020; 
 BA=6.00005166; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014395; XFM=3.00000011;
 UTC=2017-02-22 16:33:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022216-0045-0000-0000-000006CCDE5B
Message-Id: <f891d19b-21f9-321f-595a-dd38ccf6e5c4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-22_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702220154
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
X-List-Received-Date: Wed, 22 Feb 2017 16:33:12 -0000



On 2/21/17 7:06 PM, Jeremy Kerr wrote:
> Hi Chris,
>
>> Define hub master read, write, link enable, and break ops.
> Now that we have things more contained, you may want to add the complete
> hub functionality in one patch.
Hi Jeremy,

OK will add all in one patch.

> However:
>
>> @@ -571,6 +598,7 @@ static int fsi_slave_init(struct fsi_master *master,
>>   	slave->id = slave_id;
>>   	slave->dev.parent = master->dev;
>>   	slave->dev.release = fsi_slave_release;
>> +	slave->link = link;
>>   
>>   	dev_set_name(&slave->dev, "slave@%02x:%02x", link, slave_id);
>>   	rc = device_register(&slave->dev);
> This looks like a generally-useful fix, for more than just the hub code.

This was uncovered in hub link testing.  Will treat it as a separate
patch from hub  and error handling.

Thanks


> Otherwise, looks good.
>
> Cheers,
>
>
> Jeremy
>
