Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zy0bJ0hq1zF1tD
 for <openbmc@lists.ozlabs.org>; Fri,  9 Mar 2018 06:15:39 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w28Ixh6Z088740
 for <openbmc@lists.ozlabs.org>; Thu, 8 Mar 2018 14:15:35 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gk9984x1c-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 08 Mar 2018 14:15:34 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Thu, 8 Mar 2018 12:15:33 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 8 Mar 2018 12:15:31 -0700
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w28JFVV211534692; Thu, 8 Mar 2018 12:15:31 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F5ABBE03E;
 Thu,  8 Mar 2018 12:15:31 -0700 (MST)
Received: from [9.10.99.29] (unknown [9.10.99.29])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id E0143BE03B;
 Thu,  8 Mar 2018 12:15:30 -0700 (MST)
Subject: Re: [PATCH linux dev-4.13 1/2] hwmon (occ): Remove temperature fault
 attribute and VRM temp alarm
To: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, spinler@linux.vnet.ibm.com
References: <1519944259-27898-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1519944259-27898-2-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XcKZvvU27n575J+GQ=kAm3PONYqWCZwESEaxq5Ne0KP0Q@mail.gmail.com>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Thu, 8 Mar 2018 13:15:58 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcKZvvU27n575J+GQ=kAm3PONYqWCZwESEaxq5Ne0KP0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18030819-0012-0000-0000-000015DE00E1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008636; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01000167; UDB=6.00508714; IPR=6.00779497; 
 MB=3.00019920; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-08 19:15:33
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18030819-0013-0000-0000-000051CB6004
Message-Id: <71fbea13-49db-3a3e-40de-ab30b34c38ab@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-08_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803080213
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
X-List-Received-Date: Thu, 08 Mar 2018 19:15:40 -0000



On 3/1/2018 6:39 PM, Joel Stanley wrote:
> On Fri, Mar 2, 2018 at 9:14 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> This removes the EAGAIN return for "sensor not ready" and the temperature
>> fault and vrm temp alarms attributes.
>>
>> Apologies for pushing this up so early... Userspace applications aren't
>> ready for this change. The hwmon polling application cannot accept EGAIN
>> yet, and we can't be returning apparent errors if the sensor is
>> temporarily unavailable.
> 
> Okay. Brad's email is from October 5th, 2017. That's 148 days ago.
> 
> Any ETA on when the userspace plans to get some love?
> 

We have 4 issues in the backlog to address the OCC GPU sensors returning
either a 0 or 0xFF:
https://github.com/openbmc/openbmc/issues/2327
https://github.com/openbmc/openbmc/issues/2329
https://github.com/openbmc/openbmc/issues/2222
https://github.com/openbmc/openbmc/issues/2223

As fan control is already doing the right thing when it reads the values
as they are now, we deprioritized the work quite a bit so it still
isn't scheduled and may not be until later systems.


> Cheers,
> 
> Joel
> 
> 
>>
>> Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>>> userspace retries for a configurable period on eio, etimedout,
>>> ebadmsg, eagain, and exnio.  It also exits cleanly on enoent.
>>>
>>> If any of these errnos don’t go away after the configured number of retry
>>> attempts, an error is logged.  Any other errnos and an error is logged
>>> immediately. If this list needs improvement I’d love to hear about it.
>>>
>>> ebadmsg and enxio are observed when i2c devices are unplugged with transfers
>>> in various stages of flight.  They occur just before the driver is unbound
>>> after the presence gpio toggle on these devices is noticed and processed
>>> (killing the hwmon userspace daemon cleanly).
>>>
>>> eio, etimedout seem to be bus type errors that appear somewhat infrequently,
>>> but occur nevertheless.
>>>
>>> we all know what eagain means...
>>>
>>> It isn’t so much that the hwmon userspace doesn’t support this change,
>>> its just the resulting behavior difference at the other end of the
>>> hwmon abi <-> dbus api translation is not optimal, right now.
>>>
>>> 1 - Without this change, the hwmon userspace reads a value of 0 out of
>>> the sysfs attribute and happily reports that as the temp at the DBus level.
>>>
>>> With this change, the hwmon userspace would read the attribute, get an
>>> error and retry for a bit.  After a number of retries, the error is
>>> logged and the sensor is marked faulted at a dbus level.
>>>
>>> The issue is the consumer of the sensor at the dbus level.  Today, the
>>> dbus consumer happens to translate the sensor value of zero into the
>>> desired behavior.  If we submit this change the sensor will be put
>>> into faulted state and the consuming application doesn’t have support
>>> for that yet.
>>>
>>> We have open issues to enhance the application to support faulted sensors,
>>> its just not implemented yet.
>>
>> OpenBMC-Staging-Count: 1
>> Signed-off-by: Eddie James <eajames@us.ibm.com>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>   drivers/hwmon/occ/common.c | 33 +++------------------------------
>>   1 file changed, 3 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
>> index 7c97a4c..a5c4df0 100644
>> --- a/drivers/hwmon/occ/common.c
>> +++ b/drivers/hwmon/occ/common.c
>> @@ -304,24 +304,11 @@ static ssize_t occ_show_temp_2(struct device *dev,
>>                  val = get_unaligned_be32(&temp->sensor_id);
>>                  break;
>>          case 1:
>> -               val = temp->value;
>> -               if (val == OCC_TEMP_SENSOR_FAULT)
>> -                       return -EREMOTEIO;
>> -
>> -               if (temp->fru_type != OCC_FRU_TYPE_VRM) {
>> -                       /* sensor not ready */
>> -                       if (val == 0)
>> -                               return -EAGAIN;
>> -
>> -                       val *= 1000;    /* millidegrees */
>> -               }
>> +               val = temp->value * 1000;
>>                  break;
>>          case 2:
>>                  val = temp->fru_type;
>>                  break;
>> -       case 3:
>> -               val = temp->value == OCC_TEMP_SENSOR_FAULT;
>> -               break;
>>          default:
>>                  return -EINVAL;
>>          }
>> @@ -790,7 +777,7 @@ static int occ_setup_sensor_attrs(struct occ *occ)
>>                  num_attrs += (sensors->temp.num_sensors * 2);
>>                  break;
>>          case 2:
>> -               num_attrs += (sensors->temp.num_sensors * 4);
>> +               num_attrs += (sensors->temp.num_sensors * 3);
>>                  show_temp = occ_show_temp_2;
>>                  break;
>>          default:
>> @@ -863,22 +850,13 @@ static int occ_setup_sensor_attrs(struct occ *occ)
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
>> -                       snprintf(attr->name, sizeof(attr->name),
>> -                                "temp%d_alarm", s);
>> -               } else {
>> -                       snprintf(attr->name, sizeof(attr->name),
>> -                                "temp%d_input", s);
>> -               }
>> -
>> +               snprintf(attr->name, sizeof(attr->name), "temp%d_input", s);
>>                  attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
>>                                               1, i);
>>                  attr++;
>> @@ -890,11 +868,6 @@ static int occ_setup_sensor_attrs(struct occ *occ)
>>                                                       show_temp, NULL, 2, i);
>>                          attr++;
>>
>> -                       snprintf(attr->name, sizeof(attr->name),
>> -                                "temp%d_fault", s);
>> -                       attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
>> -                                                    show_temp, NULL, 3, i);
>> -                       attr++;
>>                  }
>>          }
>>
>> --
>> 1.8.3.1
>>
> 
