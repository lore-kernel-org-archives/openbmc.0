Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRn7X2lxgzDqC0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 02:08:08 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1KF3dnU055785
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 10:08:05 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28qyr10ee7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 10:08:05 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 20 Feb 2017 08:08:03 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 20 Feb 2017 08:08:02 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id CF2B31FF0023;
 Mon, 20 Feb 2017 08:07:38 -0700 (MST)
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1KF81Il15663488; Mon, 20 Feb 2017 08:08:01 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42C9813604E;
 Mon, 20 Feb 2017 08:08:01 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id D8EE6136048;
 Mon, 20 Feb 2017 08:08:00 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: scom: Add reset functionality
 and sysfs interface
To: Joel Stanley <joel@jms.id.au>
References: <1487367671-26077-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XfGCTpk5S22kwOFE1cOLgFbg4Wkx3p5bCA8A3Vb1MFGbg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 20 Feb 2017 09:08:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfGCTpk5S22kwOFE1cOLgFbg4Wkx3p5bCA8A3Vb1MFGbg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022015-0004-0000-0000-000011A2DBE9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006651; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00824578; UDB=6.00403656; IPR=6.00602034; 
 BA=6.00005157; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014360; XFM=3.00000011;
 UTC=2017-02-20 15:08:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022015-0005-0000-0000-00007D384C44
Message-Id: <e07df5e1-96a5-49d9-5eb2-d4c74e237962@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-20_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702200148
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
X-List-Received-Date: Mon, 20 Feb 2017 15:08:08 -0000



On 02/19/2017 11:42 PM, Joel Stanley wrote:
> On Sat, Feb 18, 2017 at 8:11 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> full reset only
> The commit message needs some work. Use full sentences, explain why
> the patch is required.

Ok.

>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/fsi/fsi-scom.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 50 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
>> index ff8267b..c73bd91 100644
>> --- a/drivers/fsi/fsi-scom.c
>> +++ b/drivers/fsi/fsi-scom.c
>> @@ -32,7 +32,10 @@
>>   #define SCOM_DATA0_REG         0x00
>>   #define SCOM_DATA1_REG         0x04
>>   #define SCOM_CMD_REG           0x08
>> +#define SCOM_FSI2PIB_RESET_REG 0x18
>>   #define SCOM_RESET_REG         0x1C
>> +#define SCOM_COMP_MASK_REG     0x30
>> +#define SCOM_TRUE_MASK_REG     0x34
>>
>>   #define SCOM_RESET_CMD         0x80000000
>>   #define SCOM_WRITE_CMD         0x80000000
>> @@ -156,7 +159,7 @@ static ssize_t scom_write(struct file *filep, const char __user *buf,
>>          if (rc)
>>                  dev_dbg(dev, "put_scom failed with:%d\n", rc);
>>
>> -       return rc;
>> +       return rc ? rc : len;
> This looks like an unrelated fix.

Yes, I guess a separate patch is in order.

>
>>   }
>>
>>   static loff_t scom_llseek(struct file *file, loff_t offset, int whence)
>> @@ -181,6 +184,48 @@ static const struct file_operations scom_fops = {
>>          .write  = scom_write,
>>   };
>>
>> +static int scom_reset_fsi2pib(struct fsi_device *fsi_dev)
>> +{
>> +       int rc;
>> +       u32 dummy = 0xFFFFFFFF;
>> +
>> +       rc = fsi_device_write(fsi_dev, SCOM_FSI2PIB_RESET_REG, &dummy,
>> +                             sizeof(u32));
>> +       if (rc)
>> +               dev_dbg(&fsi_dev->dev,
>> +                       "failed to write fsi2pib reset register rc:%d\n", rc);
> Is this expected behaviour? If not, use dev_err.
The rest of the driver uses dev_dbg even in error situations, so I tried 
to follow suit here.
>
>> +
>> +       return rc;
>> +}
>> +
>> +static int scom_full_reset(struct fsi_device *fsi_dev)
>> +{
>> +       int rc = 0;
>> +       u32 dummy = 0xFFFFFFFF;
>> +
>> +       rc = fsi_device_write(fsi_dev, SCOM_RESET_REG, &dummy, sizeof(u32));
> sizeof(dummy)
>
>> +       if (rc) {
>> +               dev_dbg(&fsi_dev->dev,
>> +                       "failed to write scom reset register rc:%d\n", rc);
>> +               return rc;
>> +       }
>> +
>> +       return scom_reset_fsi2pib(fsi_dev);
>> +}
>> +
>> +static ssize_t store_reset_register(struct device *dev,
>> +                                   struct device_attribute *attr,
>> +                                   const char *buf, size_t count)
>> +{
>> +       int rc;
>> +       struct fsi_device *fsi_dev = to_fsi_dev(dev);
>> +
>> +       rc = scom_full_reset(fsi_dev);
>> +
>> +       return rc ? rc : count;
>> +}
>> +DEVICE_ATTR(reset, 0200, NULL, store_reset_register);
>> +
>>   static int scom_probe(struct device *dev)
>>   {
>>          struct fsi_device *fsi_dev = to_fsi_dev(dev);
>> @@ -200,6 +245,8 @@ static int scom_probe(struct device *dev)
>>          scom->mdev.parent = dev;
>>          list_add(&scom->link, &scom_devices);
>>
>> +       device_create_file(dev, &dev_attr_reset);
>> +
> What is the expected behaviour if two different userspace programs
> have the reset and chardev open?

Probably a bus error or some sort of scom error if you write reset while 
you have a getscom/putscom operation going. Could add some locking?

Thanks,
Eddie

>
>>          return misc_register(&scom->mdev);
>>   }
>>
>> @@ -207,6 +254,8 @@ static int scom_remove(struct device *dev)
>>   {
>>          struct scom_device *scom, *scom_tmp;
>>          struct fsi_device *fsi_dev = to_fsi_dev(dev);
>> +
>> +       device_remove_file(dev, &dev_attr_reset);
>>
>>          list_for_each_entry_safe(scom, scom_tmp, &scom_devices, link) {
>>                  if (scom->fsi_dev == fsi_dev) {
>> --
>> 1.8.3.1
>>
