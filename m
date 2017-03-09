Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vfByS36NyzDqXh
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 01:06:24 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v29E664C140953
 for <openbmc@lists.ozlabs.org>; Thu, 9 Mar 2017 09:06:21 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 292msebrd7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 09 Mar 2017 09:06:08 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 9 Mar 2017 09:04:49 -0500
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 9 Mar 2017 09:04:46 -0500
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v29E4kEl11076018; Thu, 9 Mar 2017 07:04:46 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF674BE03B;
 Thu,  9 Mar 2017 07:04:45 -0700 (MST)
Received: from Christophers-MacBook-Pro.local (unknown [9.81.214.151])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id C9327BE042;
 Thu,  9 Mar 2017 07:04:44 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7 v2] drivers/fsi: Remove hub devices during
 master unregister
To: Joel Stanley <joel@jms.id.au>
References: <20170307164610.78174-1-cbostic@linux.vnet.ibm.com>
 <CACPK8XfX24uzvxgjdNYyiKD+8BWdJW9=7Owd8yVtQO3VxXm54w@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 9 Mar 2017 08:04:42 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfX24uzvxgjdNYyiKD+8BWdJW9=7Owd8yVtQO3VxXm54w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17030914-0048-0000-0000-00000117D58C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006751; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00832194; UDB=6.00408378; IPR=6.00609783; 
 BA=6.00005202; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014575; XFM=3.00000013;
 UTC=2017-03-09 14:04:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030914-0049-0000-0000-00003F8336F4
Message-Id: <7ae27192-2d45-fe7f-5c1a-dc8bd03ac903@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-09_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703090106
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
X-List-Received-Date: Thu, 09 Mar 2017 14:06:25 -0000



On 3/9/17 4:54 AM, Joel Stanley wrote:
> On Wed, Mar 8, 2017 at 3:16 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>> All hub devices must be removed when the primary FSI master
>> is being unregistered.  This ensures that the system is in
>> a clean state when another scan is attempted.  Failure to do so
>> will result in duplicate /sys device name errors.
>>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>> v2: Fix missing return in non void function warning
>> ---
>>   drivers/fsi/fsi-core.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>> index bd57b41..bbdf6b8 100644
>> --- a/drivers/fsi/fsi-core.c
>> +++ b/drivers/fsi/fsi-core.c
>> @@ -84,6 +84,7 @@ struct fsi_master_hub {
>>   #define to_fsi_master_hub(d) container_of(d, struct fsi_master_hub, master)
>>   #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
>>
>> +static void fsi_master_unscan(struct fsi_master *master);
>>   static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
>>                  void *val, size_t size);
>>   static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
>> @@ -441,6 +442,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>>                          hub->dev.release = hub_master_release;
>>                          hub->master.dev = &hub->dev;
>>                          hub->master.dev->parent = &slave->dev;
>> +                       dev_set_drvdata(&hub->dev, hub);
>>                          rc = device_add(&hub->dev);
>>                          if (rc)
>>                                  return rc;
>> @@ -739,6 +741,20 @@ static int fsi_master_scan(struct fsi_master *master)
>>          return 0;
>>   }
>>
>> +static int fsi_unregister_hubs(struct device *dev, void *data)
>> +{
>> +       struct fsi_master_hub *hub =
>> +                               (struct fsi_master_hub *)dev_get_drvdata(dev);
> dev_get_drvdata returns a void *, so there is no need to cast.
>
> I fixed this up when applying.
>
>> +       if (!hub)
>> +               return 0;
> Is this expected? Should it return an error?
Hi Joel,

Yes it would be expected in cases where the child dev being processed is 
not a hub.  Only hub master has its driver data set. In effect !hub 
means this child is not a hub master.

Thanks
-Chris
>> +
>> +       device_del(dev);
>> +       fsi_master_unscan(&hub->master);
>> +
>> +       return 0;
>> +}
>> +
>>   static void fsi_master_unscan(struct fsi_master *master)
>>   {
>>          struct fsi_slave *slave, *slave_tmp;
>> @@ -756,6 +772,8 @@ static void fsi_master_unscan(struct fsi_master *master)
>>                          device_del(&fsi_dev->dev);
>>                          put_device(&fsi_dev->dev);
>>                  }
>> +               /* Remove any hub masters */
>> +               device_for_each_child(&slave->dev, NULL, fsi_unregister_hubs);
>>                  device_unregister(&slave->dev);
>>          }
>>          master->slave_list = false;
>> --
>> 1.8.2.2
>>
