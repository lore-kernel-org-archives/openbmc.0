Return-Path: <msbarth@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=msbarth@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fDHP6tcWzDqGh
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 02:08:17 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x0FF7w0X073093
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 10:08:15 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2q1h7h28tb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 10:08:14 -0500
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.ibm.com>;
 Tue, 15 Jan 2019 15:08:14 -0000
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 15 Jan 2019 15:08:12 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0FF8Bdq9764916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Jan 2019 15:08:11 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E3D9AC05E;
 Tue, 15 Jan 2019 15:08:11 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11EDFAC065;
 Tue, 15 Jan 2019 15:08:10 +0000 (GMT)
Received: from [9.10.99.133] (unknown [9.10.99.133])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jan 2019 15:08:10 +0000 (GMT)
Subject: Re: phosphor-hwmon funcitonal interface
To: Lei YU <mine260309@gmail.com>, Patrick Venture <venture@google.com>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAO=notzYAiR1nZ08=N-oi2g--XgjZ576wRomDDLYEdhLnw2pnQ@mail.gmail.com>
 <CAARXrtkYwRP63pU3o+Bn_r_NZ9K2fAQr3O-3UPZqRY7KYaL6cg@mail.gmail.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Date: Tue, 15 Jan 2019 09:08:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtkYwRP63pU3o+Bn_r_NZ9K2fAQr3O-3UPZqRY7KYaL6cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19011515-2213-0000-0000-0000033DB2DA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010411; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000274; SDB=6.01146862; UDB=6.00597357; IPR=6.00927154; 
 MB=3.00025137; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-15 15:08:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19011515-2214-0000-0000-00005CFB2229
Message-Id: <b4672b3d-92a0-b327-7717-76925519d2f0@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-15_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=830 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901150126
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2019 15:08:18 -0000


On 1/14/19 9:33 PM, Lei YU wrote:
>> Thoughts?  (IIRC< I've mentioned this idea before, but now i'm setting
>> up some cycles to hammer it out, as I continue to implement unit-tests
>> in phosphor-hwmon)
> 
> I second this proposal.
> 
> Be noted that this "functional" property on sensor is not the same one on
> inventory, and from my understanding, this functional property is not being
> used by other services (yet), it's just used to check if hwmon should read the
> value for the sensor or not.
> 
Actually, phosphor-fan-presence/control is using the functional property 
that's currently being created where the 'fault' file exists in sysfs 
for the OCCs.
> So we could re-use this property to indicate if a sensor is functional or not,
> especially useful for fans that will get reading error when it's turned off,
> e.g. the fans using Aspeed fan/pwm driver.
> 
This case seems to not follow whether a fan is functional or not when 
its turned off. The fan is still functional, just not powered.
> @Matt What's your idea?
> 
