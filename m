Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6fLr2tppzDqsg
 for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2017 02:04:20 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v94EsoHN084274
 for <openbmc@lists.ozlabs.org>; Wed, 4 Oct 2017 11:04:17 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dcwet93u8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 04 Oct 2017 11:04:17 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 4 Oct 2017 09:04:16 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 4 Oct 2017 09:04:13 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v94F4DrZ65405002; Wed, 4 Oct 2017 08:04:13 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FFC6136040;
 Wed,  4 Oct 2017 09:04:13 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 08048136044;
 Wed,  4 Oct 2017 09:04:12 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10] Revert "drivers/hwmon/occ: Add temperature
 fault attribute and VRM temp alarm"
To: Joel Stanley <joel@jms.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1507058068-9406-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XfGubVuKRL=nTwbPbn5KMHtUvTULPZXvy=jYWPU_hbdDw@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 4 Oct 2017 10:04:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfGubVuKRL=nTwbPbn5KMHtUvTULPZXvy=jYWPU_hbdDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17100415-0016-0000-0000-0000079BC109
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007842; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000233; SDB=6.00926405; UDB=6.00466023; IPR=6.00706617; 
 BA=6.00005620; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017390; XFM=3.00000015;
 UTC=2017-10-04 15:04:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100415-0017-0000-0000-00003BB96223
Message-Id: <614fb026-d8fa-da2e-584a-c9766319ecea@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-04_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710040210
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
X-List-Received-Date: Wed, 04 Oct 2017 15:04:21 -0000



On 10/03/2017 11:38 PM, Joel Stanley wrote:
> On Wed, Oct 4, 2017 at 4:44 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> This reverts commit e55423ee10a5057338d24383c00e813436a126ea.
>>
>> Apologies for pushing this up so early... Userspace applications aren't
>> ready for this change. The hwmon polling application cannot accept EGAIN
>> yet, and we can't be returning apparent errors if the sensor is
>> temporarily unavailable.
> Can you go into some more detail here please.
>
> It looks like these changes are within the hwmon ABI, so userspace
> that supports hwmon devices shouldn't break.

Sure. With this change, the driver returns -EAGAIN when reading 
temperature sensors that show 0 temperature. Temperature 0 is how the 
OCC indicates that the sensor is not available at the moment. So, we 
should retry in a bit. But the hwmon application currently sees any 
negative errno as an error, and will not retry on -EAGAIN. So now we get 
errors when we don't want them (for now), basically.

Thanks,
Eddie

>
> Cheers,
>
> Joel
>
>> Signed-off-by: Eddie James <eajames@us.ibm.com>
>> ---
>>   drivers/hwmon/occ/common.c | 38 +++-----------------------------------
>>   1 file changed, 3 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
>> index 8ffb556..34002fb 100644
>> --- a/drivers/hwmon/occ/common.c
>> +++ b/drivers/hwmon/occ/common.c
>> @@ -19,10 +19,6 @@
>>   #define OCC_EXT_STAT_MEM_THROTTLE      0x20
>>   #define OCC_EXT_STAT_QUICK_DROP                0x10
>>
>> -#define OCC_TEMP_SENSOR_FAULT          0xFF
>> -
>> -#define OCC_FRU_TYPE_VRM               3
>> -
>>   atomic_t occ_num_occs = ATOMIC_INIT(0);
>>
>>   struct temp_sensor_1 {
>> @@ -381,23 +377,11 @@ static ssize_t occ_show_temp_2(struct device *dev,
>>                  val = get_unaligned_be32(&temp->sensor_id);
>>                  break;
>>          case 1:
>> -               val = temp->value;
>> -               if (val == OCC_TEMP_SENSOR_FAULT)
>> -                       return -EREMOTEIO;
>> -
>> -               if (temp->fru_type != OCC_FRU_TYPE_VRM) {
>> -                       if (val == 0)
>> -                               return -EAGAIN;
>> -
>> -                       val *= 1000;
>> -               }
>> +               val = temp->value * 1000;
>>                  break;
>>          case 2:
>>                  val = temp->fru_type;
>>                  break;
>> -       case 3:
>> -               val = temp->value == OCC_TEMP_SENSOR_FAULT;
>> -               break;
>>          }
>>
>>          return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
>> @@ -796,7 +780,6 @@ static ssize_t occ_show_extended(struct device *dev,
>>   int occ_setup_sensor_attrs(struct occ *occ)
>>   {
>>          unsigned int i, s;
>> -       struct temp_sensor_2 *temp;
>>          struct device *dev = occ->bus_dev;
>>          struct occ_sensors *sensors = &occ->sensors;
>>          struct occ_attribute *attr;
>> @@ -816,7 +799,7 @@ int occ_setup_sensor_attrs(struct occ *occ)
>>                  occ->num_attrs += (sensors->temp.num_sensors * 2);
>>                  break;
>>          case 2:
>> -               occ->num_attrs += (sensors->temp.num_sensors * 4);
>> +               occ->num_attrs += (sensors->temp.num_sensors * 3);
>>                  show_temp = occ_show_temp_2;
>>                  break;
>>          default:
>> @@ -888,22 +871,13 @@ int occ_setup_sensor_attrs(struct occ *occ)
>>
>>          for (i = 0; i < sensors->temp.num_sensors; ++i) {
>>                  s = i + 1;
>> -               temp = ((struct temp_sensor_2 *)sensors->temp.data) + i;
>>
>>                  snprintf(attr->name, sizeof(attr->name), "temp%d_label", s);
>>                  attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
>>                                               0, i);
>>                  attr++;
>>
>> -               if (sensors->temp.version > 1 &&
>> -                   temp->fru_type == OCC_FRU_TYPE_VRM) {
>> -                       snprintf(attr->name, sizeof(attr->name), "temp%d_alarm",
>> -                                s);
>> -               } else {
>> -                       snprintf(attr->name, sizeof(attr->name), "temp%d_input",
>> -                                s);
>> -               }
>> -
>> +               snprintf(attr->name, sizeof(attr->name), "temp%d_input", s);
>>                  attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
>>                                               1, i);
>>                  attr++;
>> @@ -914,12 +888,6 @@ int occ_setup_sensor_attrs(struct occ *occ)
>>                          attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>>                                                       show_temp, NULL, 2, i);
>>                          attr++;
>> -
>> -                       snprintf(attr->name, sizeof(attr->name), "temp%d_fault",
>> -                                s);
>> -                       attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>> -                                                    show_temp, NULL, 3, i);
>> -                       attr++;
>>                  }
>>          }
>>
>> --
>> 1.8.3.1
>>
