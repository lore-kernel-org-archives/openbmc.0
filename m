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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Z5Cx3NBCzDqZk
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 08:35:53 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x08LTGKR091069
 for <openbmc@lists.ozlabs.org>; Tue, 8 Jan 2019 16:35:51 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2pvy4tdrr5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 Jan 2019 16:35:51 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.ibm.com>;
 Tue, 8 Jan 2019 21:35:50 -0000
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 8 Jan 2019 21:35:48 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x08LZkJL9437184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Jan 2019 21:35:47 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C81AAC062;
 Tue,  8 Jan 2019 21:35:46 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B528AC05F;
 Tue,  8 Jan 2019 21:35:46 +0000 (GMT)
Received: from [9.10.99.133] (unknown [9.10.99.133])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Jan 2019 21:35:46 +0000 (GMT)
Subject: Re: Fan speed control
To: vijaykhemka@fb.com, sdasari@fb.com, liuxiwei@inspur.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
References: <4E117ED9-B492-4197-A66F-45949E3D7178@fb.com>
 <CAHkHK09SisQ0s765c1DOV7Pe8NMOKw-UM+xe8dYdt5BWA-O9vQ@mail.gmail.com>
 <FB6A886A-9650-407B-9DCD-AD3F9FE9F130@fb.com>
 <CAHkHK0-yV-msA1EHFg-NXwaHWnV3V=xBhZpTRpf_F=EU8_oT=A@mail.gmail.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Date: Tue, 8 Jan 2019 15:35:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAHkHK0-yV-msA1EHFg-NXwaHWnV3V=xBhZpTRpf_F=EU8_oT=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19010821-0040-0000-0000-000004AE952F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010369; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000274; SDB=6.01143672; UDB=6.00593882; IPR=6.00923930; 
 MB=3.00025041; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-08 21:35:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19010821-0041-0000-0000-000008B998A9
Message-Id: <f06d98ed-fed2-e631-d0b1-c840b40e3beb@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-08_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901080164
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
X-List-Received-Date: Tue, 08 Jan 2019 21:35:58 -0000



On 12/21/18 1:17 AM, George Liu(刘锡伟) wrote:
> apologize for the late reply, we are planning to write a document for
> the fan configuration.
> 
> 
> On Wed, Dec 19, 2018 at 1:59 AM Sai Dasari <sdasari@fb.com> wrote:
>>
>>
>>
>> ﻿On 12/17/18, 9:47 PM, "openbmc on behalf of George Liu(刘锡伟)" <openbmc-bounces+sdasari=fb.com@lists.ozlabs.org on behalf of liuxiwei@inspur.com> wrote:
>>
>>      Hi Vijay
>>
>>      I am also learning about the fan configuration part of openbmc
>>      There is a draft https://github.com/lxwinspur/openbmc-doc.
>>      I hope it can be useful for you
>> Thanks Geroge! This is great info and hope you can upstream these docs for ease of finding and greatly benefit other community members.
> 
>>      Regards
>>
>>      -George
>>
>>      On Tue, Dec 18, 2018 at 7:55 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>>      >
>>      > Team,
>>      >
>>      > I am looking for “fan speed control” feature to enable for Tiogapass. I understand that there are many approaches for this. Please point me to all implementation and any details about each approach, may be some pros and cons.
>>      >
>>      >
>>      >
>>      > Regards
>>      >
>>      > -Vijay
>>
>>
> 

As James pointed out, there are 3 fan control applications where 2 are 
currently maintained repos.

obmc-control-fan_git.bb & obmc-phosphor-fand.bb
To my knowledge, these were the fan management reference implementations 
that are no longer maintained and/or supported.

https://github.com/openbmc/phosphor-pid-control
(This is a configurable PID based fan control application)

https://github.com/openbmc/phosphor-fan-presence
(This contains configurable fan presence, fan monitoring, and RPM/PWM 
fan control applications)

The doc draft that George referenced relates to the 
phosphor-fan-presence repo.

Matt
