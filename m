Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Z83y6bFtzDqBs
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 01:44:29 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x33EYbIV045516
 for <openbmc@lists.ozlabs.org>; Wed, 3 Apr 2019 10:44:27 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rmx8fa8yg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 Apr 2019 10:44:26 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 3 Apr 2019 15:44:25 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Apr 2019 15:44:24 +0100
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x33EiNF031064138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Apr 2019 14:44:23 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 222C96A04F;
 Wed,  3 Apr 2019 14:44:23 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B88416A04D;
 Wed,  3 Apr 2019 14:44:22 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  3 Apr 2019 14:44:22 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 v4 0/7] Enable video engine
To: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
References: <1554172950-2072-1-git-send-email-eajames@linux.ibm.com>
 <CACPK8Xfn6-_zKpY9ga38Pwv74kKQ-Wi7FkXs03nUV4m=0p9r7g@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 3 Apr 2019 09:44:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xfn6-_zKpY9ga38Pwv74kKQ-Wi7FkXs03nUV4m=0p9r7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19040314-0016-0000-0000-0000099BEAB0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010867; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01183766; UDB=6.00619769; IPR=6.00964518; 
 MB=3.00026278; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-03 14:44:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040314-0017-0000-0000-000042AEBB8F
Message-Id: <a4ae9e4e-6432-727e-e2b7-3c519b5bd648@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-03_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904030099
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
X-List-Received-Date: Wed, 03 Apr 2019 14:44:31 -0000


On 4/3/19 1:34 AM, Joel Stanley wrote:
> On Tue, 2 Apr 2019 at 02:42, Eddie James <eajames@linux.ibm.com> wrote:
>> This series adds the necessary clocks for the video engine to the Aspeed clock
>> driver. It also adds the video engine node to the AST2500 dts and enables that
>> node in the witherspoon and romulus dts. It also removes the use of the reset
>> line in the video engine driver.
> I've booted your patches on my system. How do you test this feature?


You need a stack of userspace additions including libvncserver and 
obmc-ikvm:

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/19501

https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/13536

As well as patches for the web UI which I'm not familiar with. Jae do 
you have those?


For my testing I've been patching obmc-ikvm so I can connect with raw 
VNC to port 0 of the BMC IP; here's the stack I've been using:

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/20081

Thanks,

Eddie

>
> Cheers,
>
> Joel
>
