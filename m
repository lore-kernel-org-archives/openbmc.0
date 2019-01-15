Return-Path: <msbarth@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=msbarth@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fD800nzSzDqZN
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 02:01:51 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x0FEwjuI125162
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 10:01:49 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q1e0ckr1t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 10:01:47 -0500
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.ibm.com>;
 Tue, 15 Jan 2019 15:01:45 -0000
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 15 Jan 2019 15:01:43 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0FF1goV23396382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Jan 2019 15:01:42 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84166AC059;
 Tue, 15 Jan 2019 15:01:42 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D230AC05B;
 Tue, 15 Jan 2019 15:01:42 +0000 (GMT)
Received: from [9.10.99.133] (unknown [9.10.99.133])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jan 2019 15:01:42 +0000 (GMT)
Subject: Re: phosphor-hwmon funcitonal interface
To: Patrick Venture <venture@google.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAO=notzYAiR1nZ08=N-oi2g--XgjZ576wRomDDLYEdhLnw2pnQ@mail.gmail.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Date: Tue, 15 Jan 2019 09:01:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAO=notzYAiR1nZ08=N-oi2g--XgjZ576wRomDDLYEdhLnw2pnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19011515-2213-0000-0000-0000033DB210
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010411; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000274; SDB=6.01146860; UDB=6.00597356; IPR=6.00927152; 
 MB=3.00025137; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-15 15:01:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19011515-2214-0000-0000-00005CFB1D0F
Message-Id: <4dc41dd1-d8cf-df00-1de7-eb47e01ecbc7@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-15_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901150125
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
X-List-Received-Date: Tue, 15 Jan 2019 15:01:52 -0000



On 1/14/19 2:31 PM, Patrick Venture wrote:
> Right now, if a sensor has an explicit hwmon fault interface, then we
> have the notion of a status:
> 
> https://github.com/openbmc/phosphor-hwmon/blob/master/sensor.cpp#L205
> 
> However, I propose that if there isn't a fault file, we still add the
> interface, and set to functional=true.  This would allow us to change
> it to false in the following condition:
> 
Would this be optional so this interface/property doesnt show on sensors 
that dont want it?
> https://github.com/openbmc/phosphor-hwmon/blob/master/hwmonio.cpp#L127
> 
> So basically, instead of returning -rc on failure (optionally), it
> could optionally set functional to false, and phosphor-host-ipmid
> would need to know to check this additional interface.
> 
I'm ok with this. Where and how would this optionally be configured for 
a device and its sensors?

> Thoughts?  (IIRC< I've mentioned this idea before, but now i'm setting
> up some cycles to hammer it out, as I continue to implement unit-tests
> in phosphor-hwmon)
> 
> Patrick
> 
