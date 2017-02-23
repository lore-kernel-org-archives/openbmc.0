Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTc8V1ltDzDq8M
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 01:30:18 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1NESegF015400
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 09:30:15 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28syh4e0g4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 09:30:15 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 23 Feb 2017 07:30:12 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 23 Feb 2017 07:30:10 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 6CCD919D803F;
 Thu, 23 Feb 2017 07:29:21 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1NEU9oO13435182; Thu, 23 Feb 2017 07:30:09 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74EBE78047;
 Thu, 23 Feb 2017 07:30:09 -0700 (MST)
Received: from Christophers-MacBook-Pro.local (unknown [9.81.207.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 2DC377805C;
 Thu, 23 Feb 2017 07:30:06 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: i2c: Fixup probe to allow
 multiple engines
To: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.vnet.ibm.com>
References: <1487808141-28293-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XdKWo=NCavc035_npqDk3YmiTy8JMxBu7uA8dzHS9y=7g@mail.gmail.com>
Cc: "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 23 Feb 2017 08:30:04 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdKWo=NCavc035_npqDk3YmiTy8JMxBu7uA8dzHS9y=7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022314-0004-0000-0000-000011AB78AA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006669; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00826003; UDB=6.00404504; IPR=6.00603453; 
 BA=6.00005168; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014411; XFM=3.00000011;
 UTC=2017-02-23 14:30:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022314-0005-0000-0000-00007D50F327
Message-Id: <b0e617db-3ef4-ab0d-c5ef-892e88fdd392@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-23_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702230137
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
X-List-Received-Date: Thu, 23 Feb 2017 14:30:18 -0000

Looks good.


Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 2/22/17 10:06 PM, Joel Stanley wrote:
> On Thu, Feb 23, 2017 at 10:32 AM, Eddie James
> <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Getting duplicate sysfs when probe a second I2C engine off second proc.
>> So use ida API to get unique bus numbers. Also change sysfs interface:
>> /dev/i2cfsi00 -> /dev/i2cfsi1.00
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Acked-by: Joel Stanley <joel@jms.id.au>
>
> Will merge once Chris has taken a look.
>
> Cheers,
>
> Joel
>
>> ---
>>   drivers/fsi/i2c/iic-fsi.c  | 21 ++++++++++++++++-----
>>   drivers/fsi/i2c/iic-int.h  |  4 +++-
>>   drivers/fsi/i2c/iic-mstr.c |  3 ++-
>>   3 files changed, 21 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
>> index 6ae411f..1f85e91 100644
>> --- a/drivers/fsi/i2c/iic-fsi.c
>> +++ b/drivers/fsi/i2c/iic-fsi.c
>> @@ -19,6 +19,7 @@
>>   /*
>>    * This file contains the architecture independent IIC FSI code.
>>    */
>> +#include <linux/idr.h>
>>   #include <linux/init.h>
>>   #include <linux/module.h>
>>   #include <linux/kernel.h>
>> @@ -36,7 +37,10 @@
>>   struct class* iic_fsi_class = 0;
>>   dev_t iic_devnum_start = 0;
>>
>> -static const char iic_fsi_version[] = "3.1";
>> +static const char iic_fsi_version[] = "3.2";
>> +
>> +static DEFINE_IDA(iic_ida);
>> +static DEFINE_IDA(iic_port_ida);
>>
>>   int iic_fsi_probe(struct device *dev);
>>   int iic_fsi_remove(struct device *dev);
>> @@ -185,7 +189,7 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
>>          int bus_num = 0;
>>          unsigned long flags;
>>          iic_bus_t* new_bus = 0;
>> -       int minor = 0;
>> +       int minor;
>>          char name[64];
>>          int rc = 0;
>>
>> @@ -202,6 +206,7 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
>>                  if(!(ports_left & 0x1))
>>                          continue;
>>
>> +               minor = ida_simple_get(&iic_port_ida, 0, INT_MAX, GFP_KERNEL);
>>
>>                  if( minor < 0 ) {
>>                          IFLDe(1, "bb_get_minor %d", minor);
>> @@ -209,7 +214,7 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
>>                          goto exit;
>>                  }
>>
>> -               sprintf(name, "i2cfsi%02d", bus_num);
>> +               sprintf(name, "i2cfsi%d.%02d", eng->idx, bus_num);
>>
>>                  /* results in hotplug event for each master bus */
>>                  new_bus = iic_create_bus(iic_fsi_class, eng,
>> @@ -219,6 +224,7 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
>>                  {
>>                          IFLDe(1, "iic_create_bus failed on eng %d", eng->id);
>>                          rc = -ENODEV;
>> +                       ida_simple_remove(&iic_port_ida, minor);
>>                          goto exit;
>>                  }
>>
>> @@ -235,6 +241,7 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
>>                           */
>>                          rc = -ENODEV;
>>                          iic_delete_bus(iic_fsi_class, new_bus);
>> +                       ida_simple_remove(&iic_port_ida, minor);
>>                          spin_unlock_irqrestore(&eng->lock, flags);
>>                          goto exit;
>>                  }
>> @@ -245,8 +252,6 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
>>                          eng->enabled |= 0x1ULL << bus_num;
>>                  }
>>                  spin_unlock_irqrestore(&eng->lock, flags);
>> -
>> -               minor++;
>>          }
>>
>>   exit:
>> @@ -282,6 +287,7 @@ int iic_del_ports(iic_eng_t* eng, uint64_t ports)
>>                          /* found a match, remove it */
>>                          *p_abusp = abusp->next;
>>                          eng->enabled &= ~(0x1ULL << abusp->port);
>> +                       ida_simple_remove(&iic_port_ida, abusp->idx);
>>                          iic_delete_bus(iic_fsi_class, abusp);
>>                  }
>>                  else
>> @@ -326,6 +332,7 @@ int iic_fsi_probe(struct device *dev)
>>          iic_init_eng(eng);
>>          set_bit(IIC_ENG_BLOCK, &eng->flags); //block until resumed
>>          eng->id = 0x00F5112C;
>> +       eng->idx = ida_simple_get(&iic_ida, 1, INT_MAX, GFP_KERNEL);
>>          IFLDi(1, "PROBE    eng[%08x]\n", eng->id);
>>          eng->ra = &fsi_reg_access;
>>          IFLDd(1, "vaddr=%#08lx\n", eng->base);
>> @@ -367,6 +374,9 @@ error:
>>                  iic_del_ports(eng, new_ports);
>>                  if(eng)
>>                  {
>> +                       if (eng->idx > 0)
>> +                               ida_simple_remove(&iic_ida, eng->idx);
>> +
>>                          kfree(eng);
>>                  }
>>          }
>> @@ -409,6 +419,7 @@ int iic_fsi_remove(struct device* dev)
>>          /* Clean up device files immediately, don't wait for ref count */
>>          iic_del_ports(eng, IIC_FSI_PORTS);
>>          /* cleans up engine and bus structures if ref count is zero */
>> +       ida_simple_remove(&iic_ida, eng->idx);
>>          kfree(eng);
>>
>>   error:
>> diff --git a/drivers/fsi/i2c/iic-int.h b/drivers/fsi/i2c/iic-int.h
>> index 65b336f..26ea7eb 100644
>> --- a/drivers/fsi/i2c/iic-int.h
>> +++ b/drivers/fsi/i2c/iic-int.h
>> @@ -253,12 +253,14 @@ struct iic_eng
>>       unsigned long trace_sz;            //number of trace entries
>>       atomic_t xfr_num;                  //index to current trace entry
>>       uint64_t enabled;
>> +    int idx;                           // ida number
>>   };
>>
>>   struct iic_bus
>>   {
>>       unsigned char port;                        //the port number of this bus
>>       unsigned long bus_id;              //Unique ID for this bus
>> +    int idx;                           // ida number
>>       struct cdev cdev;
>>       struct device* class_dev;
>>       dev_t devnum;
>> @@ -312,7 +314,7 @@ int iic_eng_ops_is_vaild(struct iic_eng_ops *ops);
>>   iic_bus_t*  iic_create_bus(struct class* classp, iic_eng_t* eng,
>>                                             dev_t devnum, char* name,
>>                                             unsigned char port,
>> -                                          unsigned long bus_id);
>> +                                          int bus_id);
>>   void iic_delete_bus(struct class* classp, iic_bus_t* bus);
>>   void iic_register_bus(iic_bus_t * bus, unsigned long type);
>>   void iic_unregister_bus(iic_bus_t * bus, unsigned long type);
>> diff --git a/drivers/fsi/i2c/iic-mstr.c b/drivers/fsi/i2c/iic-mstr.c
>> index a12cf7fc..f968c20 100644
>> --- a/drivers/fsi/i2c/iic-mstr.c
>> +++ b/drivers/fsi/i2c/iic-mstr.c
>> @@ -2114,7 +2114,7 @@ void iic_ffdc_q_unlocked(int scope, void* data)
>>   #define IIC_BUS_MAX_FFDC 4
>>   iic_bus_t*  iic_create_bus(struct class* classp, iic_eng_t* eng,
>>                             dev_t devnum, char* name, unsigned char port,
>> -                          unsigned long bus_id)
>> +                          int bus_id)
>>   {
>>          int rc = 0;
>>          iic_bus_t* bus = 0;
>> @@ -2133,6 +2133,7 @@ iic_bus_t*  iic_create_bus(struct class* classp, iic_eng_t* eng,
>>          memset(bus, 0, sizeof(iic_bus_t));
>>          bus->port = port;
>>          bus->bus_id = bus_id;
>> +       bus->idx = bus_id;
>>          bus->eng = eng;
>>          bus->devnum = devnum;
>>          bus->i2c_hz = 400000;
>> --
>> 1.8.3.1
>>
