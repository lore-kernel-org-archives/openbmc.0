Return-Path: <mspinler@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44g5yK6SkJzDqLZ
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 02:26:49 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3BGN2Iw090962
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 12:26:46 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rt841bumh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 12:26:46 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.ibm.com>;
 Thu, 11 Apr 2019 17:26:45 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 11 Apr 2019 17:26:43 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3BGQgDX29032554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Apr 2019 16:26:43 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9131BE054;
 Thu, 11 Apr 2019 16:26:42 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98C6FBE05B;
 Thu, 11 Apr 2019 16:26:42 +0000 (GMT)
Received: from [9.10.99.36] (unknown [9.10.99.36])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 11 Apr 2019 16:26:42 +0000 (GMT)
Subject: Re: using phosphor-dbus-monitor
To: Wim Vervoorn <wvervoorn@eltan.com>, Lei YU <mine260309@gmail.com>
Cc: Matthew Barth <msbarth@linux.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <8daf9ac9deee4bc0808a55733681d67e@Eltsrv03.Eltan.local>
 <CAARXrtkjzG80mWxR=rjYX7WeMBz4JMVz-HB1aZcjbQzE4O3zng@mail.gmail.com>
 <39cdf20b2c8e4b528109b88bb16d3274@Eltsrv03.Eltan.local>
From: Matt Spinler <mspinler@linux.ibm.com>
Date: Thu, 11 Apr 2019 11:26:44 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <39cdf20b2c8e4b528109b88bb16d3274@Eltsrv03.Eltan.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19041116-0036-0000-0000-00000AA77276
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010909; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01187605; UDB=6.00622089; IPR=6.00968368; 
 MB=3.00026395; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-11 16:26:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041116-0037-0000-0000-00004B59E9B1
Message-Id: <051affae-335d-37f6-35c4-544caecdd1c8@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-11_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904110109
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
X-List-Received-Date: Thu, 11 Apr 2019 16:26:50 -0000


On 4/11/2019 8:05 AM, Wim Vervoorn wrote:
> I just found filed an issue because phosphor-dbus-monitor doesn't support "double" values this is required to make it work when dbus-sensors is used.
>
> I also made 2 pull requests to resolve this.


That's great!.

Note that OpenBMC doesn't use pull requests - we do our reviews all on 
gerrit.

https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md has the details.


>
> Best regards,
>
> Wim Vervoorn
>
> -----Original Message-----
> From: Lei YU [mailto:mine260309@gmail.com]
> Sent: Thursday, April 11, 2019 2:38 PM
> To: Wim Vervoorn <wvervoorn@eltan.com>
> Cc: Matthew Barth <msbarth@linux.ibm.com>; Matt Spinler <mspinler@linux.ibm.com>; openbmc@lists.ozlabs.org
> Subject: Re: using phosphor-dbus-monitor
>
>> I just found the reason why this wasn’t working. I overlooked a typo in the interface : Sensors instead of Sensor.
> This is the sign of what needs to be improved. Either make it report error at compile time, or at least have a tool to verify the yaml.
>
>
