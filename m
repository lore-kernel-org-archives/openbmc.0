Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytmtp6nnDzDxCH
 for <openbmc@lists.ozlabs.org>; Sat,  9 Dec 2017 09:17:36 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vB8MEMlg059724
 for <openbmc@lists.ozlabs.org>; Fri, 8 Dec 2017 17:17:33 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2er3bf05s7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 08 Dec 2017 17:17:32 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 8 Dec 2017 15:17:32 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 8 Dec 2017 15:17:30 -0700
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vB8MHTAR6291872; Fri, 8 Dec 2017 15:17:29 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA02CC603E;
 Fri,  8 Dec 2017 15:17:29 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.80.204.122])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 302E2C6043;
 Fri,  8 Dec 2017 15:17:29 -0700 (MST)
Subject: Re: [PATCH linux dev-4.10] hwmon (occ): Fix integer overflow in
 multiplication
To: Joel Stanley <joel@jms.id.au>
Cc: "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1512587959-27264-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xd2Pcb8Z_2PP-B+aALLS9Z1Pc5tvX=2+1qZUbCeVyRUag@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 8 Dec 2017 16:17:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd2Pcb8Z_2PP-B+aALLS9Z1Pc5tvX=2+1qZUbCeVyRUag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17120822-0004-0000-0000-00001359F44C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008174; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00957399; UDB=6.00484053; IPR=6.00737430; 
 BA=6.00005731; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018432; XFM=3.00000015;
 UTC=2017-12-08 22:17:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17120822-0005-0000-0000-000085317E11
Message-Id: <0d01c184-8ae0-6cbb-b222-d6c22c15ea55@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-08_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1711220000 definitions=main-1712080300
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
X-List-Received-Date: Fri, 08 Dec 2017 22:17:39 -0000



On 12/08/2017 12:16 AM, Joel Stanley wrote:
> On Thu, Dec 7, 2017 at 5:49 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> --- a/drivers/hwmon/occ/common.c
>> +++ b/drivers/hwmon/occ/common.c
>> @@ -468,7 +468,7 @@ static ssize_t occ_show_power_1(struct device *dev,
>>                                  struct device_attribute *attr, char *buf)
>>   {
>>          int rc;
>> -       u32 val = 0;
>> +       u64 val = 0;
>>          struct power_sensor_1 *power;
>>          struct occ *occ = dev_get_drvdata(dev);
>>          struct occ_sensors *sensors = &occ->sensors;
>> @@ -491,11 +491,11 @@ static ssize_t occ_show_power_1(struct device *dev,
>>                  val = get_unaligned_be32(&power->accumulator);
>>                  break;
>>          case 3:
>> -               val = get_unaligned_be16(&power->value) * 1000000;
>> +               val = (u64)get_unaligned_be16(&power->value) * 1000000ULL;
> I don't think these casts are required, are they?

I'm not at all sure. I didn't think adding ULL was required here, but 
apparently it is. I don't really trust GCC...

>
