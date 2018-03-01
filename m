Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zsnd775hRzF1jC
 for <openbmc@lists.ozlabs.org>; Fri,  2 Mar 2018 09:47:39 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w21MhwtY034059
 for <openbmc@lists.ozlabs.org>; Thu, 1 Mar 2018 17:47:37 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gerh4cs8t-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 01 Mar 2018 17:47:37 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 1 Mar 2018 15:47:36 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 1 Mar 2018 15:47:35 -0700
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w21MlZ2t12059134; Thu, 1 Mar 2018 15:47:35 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E811BE03A;
 Thu,  1 Mar 2018 15:47:35 -0700 (MST)
Received: from [9.85.161.189] (unknown [9.85.161.189])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 8E124BE038;
 Thu,  1 Mar 2018 15:47:34 -0700 (MST)
Subject: Re: [PATCH linux dev-4.13 1/2] Revert "drivers/hwmon/occ: Add
 temperature fault attribute and VRM temp alarm"
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, Joel Stanley <joel@jms.id.au>
References: <1519944259-27898-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1519944259-27898-3-git-send-email-eajames@linux.vnet.ibm.com>
Date: Thu, 1 Mar 2018 16:47:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519944259-27898-3-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18030122-0004-0000-0000-000013BE19CE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008609; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00996986; UDB=6.00506902; IPR=6.00776304; 
 MB=3.00019807; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-01 22:47:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18030122-0005-0000-0000-0000864C3874
Message-Id: <ef4df5aa-c085-711f-28b7-5e31b8d27efe@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-01_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803010276
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
X-List-Received-Date: Thu, 01 Mar 2018 22:47:40 -0000

Sorry, ignore this one. I renamed this patch to hwmon (occ): Remove 
temperature fault attribute and VRM temp alarm and forgot to delete this 
one.


On 03/01/2018 04:44 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This reverts commit e55423ee10a5057338d24383c00e813436a126ea.
>
> Apologies for pushing this up so early... Userspace applications aren't
> ready for this change. The hwmon polling application cannot accept EGAIN
> yet, and we can't be returning apparent errors if the sensor is
> temporarily unavailable.
>
> Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>> userspace retries for a configurable period on eio, etimedout,
>> ebadmsg, eagain, and exnio.  It also exits cleanly on enoent.
>>
>> If any of these errnos don’t go away after the configured number of retry
>> attempts, an error is logged.  Any other errnos and an error is logged
>> immediately. If this list needs improvement I’d love to hear about it.
>>
>> ebadmsg and enxio are observed when i2c devices are unplugged with transfers
>> in various stages of flight.  They occur just before the driver is unbound
>> after the presence gpio toggle on these devices is noticed and processed
>> (killing the hwmon userspace daemon cleanly).
>>
>> eio, etimedout seem to be bus type errors that appear somewhat infrequently,
>> but occur nevertheless.
>>
>> we all know what eagain means...
>>
>> It isn’t so much that the hwmon userspace doesn’t support this change,
>> its just the resulting behavior difference at the other end of the
>> hwmon abi <-> dbus api translation is not optimal, right now.
>>
>> 1 - Without this change, the hwmon userspace reads a value of 0 out of
>> the sysfs attribute and happily reports that as the temp at the DBus level.
>>
>> With this change, the hwmon userspace would read the attribute, get an
>> error and retry for a bit.  After a number of retries, the error is
>> logged and the sensor is marked faulted at a dbus level.
>>
>> The issue is the consumer of the sensor at the dbus level.  Today, the
>> dbus consumer happens to translate the sensor value of zero into the
>> desired behavior.  If we submit this change the sensor will be put
>> into faulted state and the consuming application doesn’t have support
>> for that yet.
>>
>> We have open issues to enhance the application to support faulted sensors,
>> its just not implemented yet.
> OpenBMC-Staging-Count: 1
> Signed-off-by: Eddie James <eajames@us.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/hwmon/occ/common.c | 33 +++------------------------------
>   1 file changed, 3 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 7c97a4c..a5c4df0 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -304,24 +304,11 @@ static ssize_t occ_show_temp_2(struct device *dev,
>   		val = get_unaligned_be32(&temp->sensor_id);
>   		break;
>   	case 1:
> -		val = temp->value;
> -		if (val == OCC_TEMP_SENSOR_FAULT)
> -			return -EREMOTEIO;
> -
> -		if (temp->fru_type != OCC_FRU_TYPE_VRM) {
> -			/* sensor not ready */
> -			if (val == 0)
> -				return -EAGAIN;
> -
> -			val *= 1000;	/* millidegrees */
> -		}
> +		val = temp->value * 1000;
>   		break;
>   	case 2:
>   		val = temp->fru_type;
>   		break;
> -	case 3:
> -		val = temp->value == OCC_TEMP_SENSOR_FAULT;
> -		break;
>   	default:
>   		return -EINVAL;
>   	}
> @@ -790,7 +777,7 @@ static int occ_setup_sensor_attrs(struct occ *occ)
>   		num_attrs += (sensors->temp.num_sensors * 2);
>   		break;
>   	case 2:
> -		num_attrs += (sensors->temp.num_sensors * 4);
> +		num_attrs += (sensors->temp.num_sensors * 3);
>   		show_temp = occ_show_temp_2;
>   		break;
>   	default:
> @@ -863,22 +850,13 @@ static int occ_setup_sensor_attrs(struct occ *occ)
>
>   	for (i = 0; i < sensors->temp.num_sensors; ++i) {
>   		s = i + 1;
> -		temp = ((struct temp_sensor_2 *)sensors->temp.data) + i;
>
>   		snprintf(attr->name, sizeof(attr->name), "temp%d_label", s);
>   		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
>   					     0, i);
>   		attr++;
>
> -		if (sensors->temp.version > 1 &&
> -		    temp->fru_type == OCC_FRU_TYPE_VRM) {
> -			snprintf(attr->name, sizeof(attr->name),
> -				 "temp%d_alarm", s);
> -		} else {
> -			snprintf(attr->name, sizeof(attr->name),
> -				 "temp%d_input", s);
> -		}
> -
> +		snprintf(attr->name, sizeof(attr->name), "temp%d_input", s);
>   		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
>   					     1, i);
>   		attr++;
> @@ -890,11 +868,6 @@ static int occ_setup_sensor_attrs(struct occ *occ)
>   						     show_temp, NULL, 2, i);
>   			attr++;
>
> -			snprintf(attr->name, sizeof(attr->name),
> -				 "temp%d_fault", s);
> -			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
> -						     show_temp, NULL, 3, i);
> -			attr++;
>   		}
>   	}
>
