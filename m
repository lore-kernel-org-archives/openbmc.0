Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMpsC2qBwzDqBn
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 15:11:59 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1E49xvI123951
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 23:11:57 -0500
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28kjhysf59-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 23:11:57 -0500
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 13 Feb 2017 21:11:56 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 13 Feb 2017 21:11:53 -0700
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id A19041FF001F;
 Mon, 13 Feb 2017 21:11:30 -0700 (MST)
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1E4Bqjh15794636; Tue, 14 Feb 2017 04:11:52 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C41FAE052;
 Mon, 13 Feb 2017 23:11:51 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.85.155.32])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 03292AE054;
 Mon, 13 Feb 2017 23:11:50 -0500 (EST)
Subject: Re: [PATCH linux dev-4.7 1/2] drivers: fsi: delete device on unscan
To: Joel Stanley <joel@jms.id.au>
References: <1487016480-17700-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1487016480-17700-2-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xfx_uhrXkUgOAh7R=j+Tux5vBGvJ47XYZTLxJskar3Xug@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 13 Feb 2017 22:11:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xfx_uhrXkUgOAh7R=j+Tux5vBGvJ47XYZTLxJskar3Xug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021404-0024-0000-0000-000015ECE415
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006612; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00821632; UDB=6.00401866; IPR=6.00599085; 
 BA=6.00005133; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014273; XFM=3.00000011;
 UTC=2017-02-14 04:11:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021404-0025-0000-0000-000048C12523
Message-Id: <d7155853-8eff-d6f0-add3-bd8a468789e6@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-14_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702140043
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
X-List-Received-Date: Tue, 14 Feb 2017 04:11:59 -0000



On 02/13/2017 06:18 PM, Joel Stanley wrote:
> On Tue, Feb 14, 2017 at 6:37 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> need to delete device so that client driver "remove" is called.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/fsi/fsi-core.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>> index 1e9c5a2..e8a3618 100644
>> --- a/drivers/fsi/fsi-core.c
>> +++ b/drivers/fsi/fsi-core.c
>> @@ -512,6 +512,7 @@ static void fsi_master_unscan(struct fsi_master *master)
>>                  list_for_each_entry_safe(fsi_dev, fsi_dev_tmp,
>>                                          &slave->my_engines, link) {
>>                          list_del(&fsi_dev->link);
>> +                       device_del(&fsi_dev->dev);
>>                          put_device(&fsi_dev->dev);
> put_device calls kobject_put, but device_del has already called
> kobject_del. Are you sure this is what you want to do here?

Hmm, I was just doing what device_unregister() does. We manually call 
device_add() for these devices, so I understand from the documentation 
that device_del() should be called, but I think device_unregister would 
work as well. I can confirm this works and doesn't throw any warnings 
after repeated fsi scans.

>
>
>>                  }
>>                  device_unregister(&slave->dev);
>> --
>> 1.8.3.1
>>
