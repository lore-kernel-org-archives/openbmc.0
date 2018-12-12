Return-Path: <jrey@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43FXNL3l8SzDqSC
 for <openbmc@lists.ozlabs.org>; Thu, 13 Dec 2018 10:00:50 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wBCMwaDb072426
 for <openbmc@lists.ozlabs.org>; Wed, 12 Dec 2018 18:00:47 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2pbamj2nv5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 12 Dec 2018 18:00:47 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.vnet.ibm.com>;
 Wed, 12 Dec 2018 23:00:46 -0000
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 12 Dec 2018 23:00:44 -0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wBCN0hlB23986210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 12 Dec 2018 23:00:43 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD7C1C605A;
 Wed, 12 Dec 2018 23:00:43 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90E5AC605B;
 Wed, 12 Dec 2018 23:00:43 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 Dec 2018 23:00:43 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 12 Dec 2018 17:04:53 -0600
From: Joseph Reynolds <jrey@linux.vnet.ibm.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Upstream Reference System(s)
In-Reply-To: <CALLMt=qWJemCvKW-5VBgPTbjfwb2WTw-YitFJYicRTz5oXNNAA@mail.gmail.com>
References: <CALLMt=qWJemCvKW-5VBgPTbjfwb2WTw-YitFJYicRTz5oXNNAA@mail.gmail.com>
X-Sender: jrey@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18121223-0012-0000-0000-000016E8FF6A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010216; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01130887; UDB=6.00587676; IPR=6.00911021; 
 MB=3.00024673; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-12 23:00:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18121223-0013-0000-0000-0000556F12D9
Message-Id: <0e10adc079ccd07e36d7a57f9d0b5ccd@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-12_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812120192
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
X-List-Received-Date: Wed, 12 Dec 2018 23:00:51 -0000

On 2018-12-10 13:05, Andrew Geissler wrote:
> Greetings,
> 
> One thing that has come up a few times, and was touched on in last 
> weeks
> Infrastructure workgroup (and todays community meeting), was what is 
> our
> community reference system(s)? i.e. What do we as a community test 
> against
> and guarantee works when we do a tag or release?
> 
> If you look at something like https://openpower.xyz/job/openbmc-build/ 
> you
> will see a variety of systems. Romulus is put through QEMU CI and 
> another,
> Witherspoon, is put through HW CI currently. This list has been mostly 
> created
> by IBM, and so it brings up the question of what's our future plan 
> here.
> 
> First, what's the criteria for adding a system to officially being 
> supported by
> the upstream community?
> - Covers as much OpenBMC function as possible?
> - Is on hardware that anyone can easily (and cheaply) get their hands 
> on?
> - Has consistent upstream support and a person or company to support HW 
> CI?


At today's Infrastructure Workgroup I mentioned four levels of machine 
support, where each level builds on the previous level, providing a path 
to get more support for your machine.  Here are my ideas, provided for 
discussion:

1. Source code - The machine has a repo in the openbmc organization.  
DETAILS: The machine has an github.com/openbmc/meta-MACHINE repository 
with a BitBake layer configuration which defines the meta-phosphor layer 
and can build the obmc-phosphor-image.  Expectations are that the code 
builds and is maintained, e.g., maintainers respond to a call for 
maintenance.

2. CI Builds - The openbmc-phosphor-image is built for the machine as 
part of Jenkins CI testing, and maintainers address failures in their 
layer.  DETAILS: Build failures will result in a -1 Gerrit code review 
score, which may prevent merging.  Because the image costs CPU cycles to 
build (one build per Gerrit patch set), is there an expectation that the 
team behind the machine provides a similar amount of value to the 
project?  Examples: donate the use of servers to the project, or have 
significant contributions to common functions, for example, 
meta-phosphor.

3. CI Tested - The machine is booted and tested as part of the Jenkins 
CI testing, and maintainers address failures in their layer.  DETAILS: 
Testcase failures will result in a -1 Gerrit code review score, which 
may prevent merging.  The expectation is the sponsoring organization 
will donate the use of physical hardware which they may host behind 
their company firewall.

4. Reference platform - The machine is an OpenBMC reference platform.  
DETAILS: I assume the TSC would maintain the list of reference platforms 
based on community input.  I see one criterion (CI Tested) and several 
factors in the TSC's decision:
  - The machine has active development (git commits) and good support (CI 
failures are addressed).
  - The machine can be obtained, e.g., purchased.
  - The machine has a simulator, e.g., QEMU.
  - The machine is different than existing reference platforms.

What value is being a reference platform beyond being tested by CI?  
Marketing?

- Joseph

> The witherspoon and romulus systems definitely are well supported by 
> IBM in
> the upstream community but they are not all that cheap. There was a 
> rasberry
> pi port out there that would be cheap and easy to get access to but not 
> cover
> as much OpenBMC function. There's something like
> https://www.raptorcs.com/content/TLSDS3/intro.html which is a bit more
> accessible but I don't believe the code has been upstreamed.
> 
> One point made in last weeks Infrastructure workgroup is we should 
> shoot
> for a minimum amount of hardware that covers as much function as 
> possible.
> So a matrix of some sort that covers our major functional areas. In 
> general,
> having a system on the upstream support list is like getting your code
> upstreamed,
> once in, you have a guarantee that all future code will support it, so 
> maybe
> this is more of a community reward to get your system on the list?
> 
> Just throwing ideas out there, input and ideas appreciated.
> 
> Andrew
> 
> References:
> https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup
