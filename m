Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xYvfc02ZFzDql8
 for <openbmc@lists.ozlabs.org>; Sat, 19 Aug 2017 06:23:19 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7IKJMUs020169
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 16:23:17 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ce3x7hex9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 16:23:17 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 18 Aug 2017 16:23:16 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 18 Aug 2017 16:23:13 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7IKNCc325821378; Fri, 18 Aug 2017 20:23:12 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA8F6AE04E;
 Fri, 18 Aug 2017 16:23:32 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.3.230])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 57B92AE03B;
 Fri, 18 Aug 2017 16:23:30 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v3 1/2] hwmon: (ucd9000) Add gpio chip
 interface and clear logged faults
To: Joel Stanley <joel@jms.id.au>
References: <20170818013526.35678-1-cbostic@linux.vnet.ibm.com>
 <20170818013526.35678-2-cbostic@linux.vnet.ibm.com>
 <CACPK8XfHF0h0_SJy8Tcd_Z6=eew4JoNH-dvQE6Ddm2XSnLvwpw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Fri, 18 Aug 2017 15:23:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfHF0h0_SJy8Tcd_Z6=eew4JoNH-dvQE6Ddm2XSnLvwpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17081820-0048-0000-0000-000001D5B6BA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007568; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000223; SDB=6.00904251; UDB=6.00453063; IPR=6.00684463; 
 BA=6.00005539; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016759; XFM=3.00000015;
 UTC=2017-08-18 20:23:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081820-0049-0000-0000-000042471766
Message-Id: <6cf5b959-83c2-8bca-d985-a79b544aae57@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-18_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708180325
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
X-List-Received-Date: Fri, 18 Aug 2017 20:23:20 -0000



On 8/17/17 9:48 PM, Joel Stanley wrote:
> Hi Chris,
>
> On Fri, Aug 18, 2017 at 11:05 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>
>> +static DEVICE_ATTR(clear_logged_faults, 0200, NULL,
>> +               ucd9000_clear_logged_faults);
>> +
>> +static struct attribute *ucd9000_attributes[] = {
>> +       &dev_attr_clear_logged_faults.attr,
>> +       NULL
>> +};
> Given this introduces new userspace ABI that will need to be support,
> we will want to run this past upstream as soon as possible.
>
> I suggest you post the next revision of these patches to the hwmon list.

Hi Joel,

Sure, will do that.

Thanks,
Chris
>
> Cheers,
>
> Joel
>
