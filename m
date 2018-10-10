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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Vk1m71vkzF10j
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 06:00:12 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9AIwmbw034555
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 15:00:10 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2n1p9b28tn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 15:00:10 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Wed, 10 Oct 2018 13:00:09 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Oct 2018 13:00:07 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w9AJ06PK29360334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 10 Oct 2018 12:00:06 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32B917805C;
 Wed, 10 Oct 2018 13:00:06 -0600 (MDT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 096C778064;
 Wed, 10 Oct 2018 13:00:05 -0600 (MDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 10 Oct 2018 13:00:05 -0600 (MDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 10 Oct 2018 14:01:35 -0500
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Recipe Renames, etc
In-Reply-To: <CAO=notzG9PMZTry+WHP1SJoxA2O=5GFGjGmCpMr3CiTWHgmD5g@mail.gmail.com>
References: <CAO=notyKtrecZeAypPcjY7qi6rBqj_cPwPosFRds=wYpeHW8wA@mail.gmail.com>
 <9dc677b3c95c2bc7e7c5a11a97df49a7@linux.vnet.ibm.com>
 <CAO=notx9Sncg2w68Z=OTsMAWJtoyENc2KUZJfz-8vDCGhJ7afA@mail.gmail.com>
 <CAO=notwU5z2bb2C51s=8PEEuwgqUjNa3bctNH12P=GVmMaHkRw@mail.gmail.com>
 <CAO=notzG9PMZTry+WHP1SJoxA2O=5GFGjGmCpMr3CiTWHgmD5g@mail.gmail.com>
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18101019-0004-0000-0000-0000149BD4F1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009855; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000268; SDB=6.01100741; UDB=6.00569535; IPR=6.00880790; 
 MB=3.00023699; MTD=3.00000008; XFM=3.00000015; UTC=2018-10-10 19:00:08
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18101019-0005-0000-0000-0000891C41F4
Message-Id: <ede9c4021b68a264677f4e7b84ae21fb@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-10_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=969 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810100177
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
X-List-Received-Date: Wed, 10 Oct 2018 19:00:13 -0000

On 2018-10-10 13:50, Patrick Venture wrote:
> On Wed, Oct 10, 2018 at 11:46 AM Patrick Venture <venture@google.com> 
> wrote:
>> 
>> On Wed, Oct 10, 2018 at 11:45 AM Patrick Venture <venture@google.com> 
>> wrote:
>> >
>> > On Wed, Oct 10, 2018 at 11:38 AM Matt Spinler
>> > <mspinler@linux.vnet.ibm.com> wrote:
>> > >
>> > > On 2018-10-02 10:28, Patrick Venture wrote:
>> > > > I've sent a bunch of recipe renames, but I'm still updating each with
>> > > > an individual tested footer.  I will try marking them all as WIP now
>> > > >
>> > > > Patrick
>> > >
>> > >
>> > > Hi Patrick,
>> > >
>> > > I think you broke master with these.  For example, the phosphor-rest
>> > > recipe - it has a default url-config.json, and then a layer specific file gets
>> > > applied from the meta-ibm layer, like:
>> > >
>> > > meta-ibm/recipes-phosphor/interfaces/phosphor-rest/url_config.json
>> > >
>> > > However, from the log.do_unpack from the phosphor-rest build, it doesn't
>> > > look there, it now only looks in phosphor-rest%.  So any override directory without
>> > > a % isn't being found.
>> >
>> > Interesting that the CI didn't catch the break since witherspoon is
>> > one of the systems built via it.  But I'll take a look.

Yea, our current automated test bucket can't catch this.  (shows there
is still room for improvement)


>> 
>> Although I have had configuration files disappear when the wildcard is
>> missing from the directory, the recipe normally complains about being
>> unable to find the file.  For a file override, if there's already that
>> file - presumably then it wouldn't complain.

The latter is what's happening here.

> 
> I've fired off a witherspoon build locally from openbmc HEAD, and will
> report back.  Very few of the recipes were updated in this fashion so
> I'm not terribly worried about a general breakage.

Thanks for looking.  I'm not sure if there's an easy way to find these 
cases.

> 
>> 
>> >
>> > >
>> > > I haven't looked to see what all is broken yet and in how many layers,
>> > > at least our phosphor-rest and phosphor-gevent, which is why the web UI stopped
>> > > working on witherspoon.  Not sure if any other systems are also having problems.
>> > >
>> > >
