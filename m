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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43k68Z59txzDqSy
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 09:45:50 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0LMhrfm050531
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 17:45:47 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2q5mjdne00-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 17:45:47 -0500
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.vnet.ibm.com>;
 Mon, 21 Jan 2019 22:45:47 -0000
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 21 Jan 2019 22:45:43 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0LMjgLt16973888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Jan 2019 22:45:42 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B77ACAC05E;
 Mon, 21 Jan 2019 22:45:42 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3405AC05B;
 Mon, 21 Jan 2019 22:45:41 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jan 2019 22:45:41 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Jan 2019 16:51:31 -0600
From: Joseph Reynolds <jrey@linux.vnet.ibm.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, ed.tanous@intel.com, Matt
 Spinler <spinler@us.ibm.com>,
 William Kennington <wak@google.com>, dkodihal@linux.vnet.ibm.com,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 openbmc <openbmc-bounces+jrey=linux.vnet.ibm.com@lists.ozlabs.org>
Subject: Re: Thud branches required in certain repos?
In-Reply-To: <CALLMt=rmk2=ranWssd=TEOZy=sH=RWzKjkSbAEn=V9tY7Ozk+Q@mail.gmail.com>
References: <CALLMt=rmk2=ranWssd=TEOZy=sH=RWzKjkSbAEn=V9tY7Ozk+Q@mail.gmail.com>
X-Sender: jrey@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19012122-0068-0000-0000-0000038644CC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010450; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000275; SDB=6.01149861; UDB=6.00599177; IPR=6.00930185; 
 MB=3.00025228; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-21 22:45:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012122-0069-0000-0000-00004737D2F8
Message-Id: <e52fca8da7ba89a7a07407c1b28c60f9@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-21_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901210178
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
X-List-Received-Date: Mon, 21 Jan 2019 22:45:51 -0000

On 2019-01-21 11:23, Andrew Geissler wrote:
> Recently we created a Thud branch (i.e. 2.6). Currently we've just 
> branched
> the openbmc/meta-* and openbmc/openbmc layers.
> 
> Pre repository CI (i.e. 
> https://openpower.xyz/job/openbmc-repository-ci/) had
> its scripts updated to support the new branch. Basically if a change 
> comes in
> from a branch, it will attempt to find and use that same branch from 
> all of
> the dependent repositories. If it can't find the branch, then it will 
> just
> use master from that build.
> 
> Dependent repositories are repositories that most repositories depend 
> on and
> are always built as a part of the per repository CI process:
> 
>   phosphor-objmgr
>   sdbusplus
>   sdeventplus
>   gpioplus
>   phosphor-logging
>   phosphor-dbus-interfaces
>   openpower-dbus-interfaces
> 
> In general, just using master from these dependent repositories will 
> work. We
> only run into issues if some sort of API or data type change occurs in 
> master
> that is not compatible with the branch.
> 
> To avoid weird errors in the future though, I'd like for the 
> maintainers of the
> above repos to create the corresponding branch in each of the above 
> repos
> whenever a new branch is created for the openbmc project.
> 
> Adding a branch is easy, just go to your project in gerrit and use the
> "Create Branch" option. Be sure to put the "Initial Revision" commit at 
> whatever
> we were at when the Thud branch occurred and call it "thud".
> 
> Other ideas or thoughts?

Let's walk through a scenario.  Suppose we need to fix a bad problem in 
the OpenBMC 2.6 release in the sdbusplus repo.

The way I understand it, a pre-requisite step would be to fix the 
problem in the master branch of sdbusplus and then bump the master 
branch of openbmc to use the new version of sdbusplus.

The next step (given the proposal above) is to commit the fix to the 
head of (repo=sdbusplus, branch=thud) and then create a new commit in 
(repo=openbmc, branch=thud) which bumps the new version of sdbusplus.  
When this is done, someone who checks out (repo=openbmc, branch=thud) 
will pick up the fixes in (repo=sdbusplus, branch=thud).  Correct?

I can foresee a problem if the (repo=openbmc, branch=thud) update points 
to a sdbusplus version that is past the 2.6 version but not in 
branch=thud.  For example, if it pointed to the branch=master version of 
the fix.  That would pick up not only the sdbusplus fix, but also all 
development work that happened after the 2.6 release.  Is that the 
"weird" error you refer to?

To prevent this problem: when making bumps in (repo=openbmc, 
branch=thud), reviewers must ensure both (a) the fix was correctly 
copied (or cherry picked) from branch=master into branch=thud, but also 
that the version bump (in repo=openbmc, branch=thud) points to the 
branch=thud version (srcrev) and NOT to the branch=master version.

Anything else?

- Joseph

> Andrew
