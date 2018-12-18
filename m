Return-Path: <stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43JdhC5GpDzDqgB
 for <openbmc@lists.ozlabs.org>; Tue, 18 Dec 2018 11:10:19 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wBI03f7M111228
 for <openbmc@lists.ozlabs.org>; Mon, 17 Dec 2018 19:10:17 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2pejgxgb3r-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Dec 2018 19:10:17 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Tue, 18 Dec 2018 00:10:16 -0000
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Dec 2018 00:10:12 -0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wBI0ABvG14549052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Dec 2018 00:10:11 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 101CCAE063;
 Tue, 18 Dec 2018 00:10:11 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DC34AE060;
 Tue, 18 Dec 2018 00:10:10 +0000 (GMT)
Received: from birb.localdomain (unknown [9.185.142.108])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 18 Dec 2018 00:10:10 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id DC80E4EC636; Tue, 18 Dec 2018 11:10:08 +1100 (AEDT)
From: Stewart Smith <stewart@linux.ibm.com>
To: "Tanous\, Ed" <ed.tanous@intel.com>
Cc: Emily Shaffer <emilyshaffer@google.com>,
 Supreeth Venkatesh <supreeth.venkatesh@arm.com>,
 Dong Wei <Dong.Wei@arm.com>, "Naidoo\, Nilan" <nilan.naidoo@intel.com>,
 David Thompson <dthompson@mellanox.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Initial MCTP design proposal
In-Reply-To: <AE14EF95-D354-48C6-AB76-95ADF6568951@intel.com>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <94639b69-3f3c-a606-ae68-f7e1461097e9@linux.vnet.ibm.com>
 <f8fe02f703ab7c11bf5871605364821688266667.camel@arm.com>
 <CAJoAoZkPO+dU9VpzCm3C0y1aEFUS_MXBQsTaD_t=gNZN0JHg6A@mail.gmail.com>
 <87efaoj244.fsf@linux.vnet.ibm.com>
 <AE14EF95-D354-48C6-AB76-95ADF6568951@intel.com>
Date: Tue, 18 Dec 2018 11:10:08 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 18121800-0060-0000-0000-000002E59C5D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010241; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000271; SDB=6.01133263; UDB=6.00589121; IPR=6.00913431; 
 MB=3.00024725; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-18 00:10:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18121800-0061-0000-0000-00004793733A
Message-Id: <874lbby9sv.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-17_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812170208
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
X-List-Received-Date: Tue, 18 Dec 2018 00:10:20 -0000

"Tanous, Ed" <ed.tanous@intel.com> writes:
>> On Dec 10, 2018, at 5:15 PM, Stewart Smith <stewart@linux.ibm.com> wrote:
>>=20
>> If we were going to bring a not-C language into firmware, I'd prefer we
>> look at something modern like Rust, that's designed to not have
>> programmers marching around with guns pointed at their feet.
>> (I have C++ opinions, most of which can be summarised by NAK :)
>
> Rust seems like an interesting language, but when I last evaluated it for=
 BMC use while looking at the redfish implementation, it suffered from a fe=
w killer problems that would prevent its use on a current-generation BMC
>
> 1. The binaries are really big.  Just an application with the basics
> (DBus, sockets, io loop) ends up at several megabytes last time I
> attempted it.  Most of our c++ equivalents consume less than half
> that.  I know rust as a community has worked on the size issue, and is
> making progress, but given the size constraints that we=E2=80=99re under,=
 I
> don=E2=80=99t think 2MB minimum applications are worth the space they tak=
e.
> For reference, the project is working to make it possible to build an
> image without python to save ~3MB from the final image.

Interesting. This is different than for host firmware as we'd be
building nostdlib and providing our own base language support environment.

> 2. Rust is relatively new.  Finding =E2=80=9Cseasoned=E2=80=9D rust devel=
opers,
> especially ones that have that in combination with embedded skills is
> difficult.  I don=E2=80=99t believe we have anyone active on the project =
today
> that has built rust applications at the scale the OpenBMC project is
> at these days.  At this point there are a few commercial products that
> use rust, so at least someone has ripped of that band aid, but I don=E2=
=80=99t
> know if any high reliability, embedded products that have taken the
> plunge yet.  If we want to be the first, we should evaluate what
> that=E2=80=99s going to cost for the project.

I'd agree, and that's certainly a concern I share. Firefox is probably
the biggest Rust user out there and one that's been integrating Rust
code into a long living large C++ codebase.

> 3. The supposed safety in rust is only guaranteed if you never call
> into a c library or native code.  While there=E2=80=99s pure rust based
> equivalents for a lot of the things we use, most of our code is
> stitching together calls between libraries, and northbound interfaces.
> There might be one or two examples of where we could use rust without
> any c libraries, but I=E2=80=99m going to guess there=E2=80=99s only that=
 .  Given
> that, are we better off having a given application written in one
> language or two?

For our host firmware, all packages have at least two languages:
assembler, C or C++. Even small amounts of Rust are going to increase
safety of a bunch of these critical components.

> In short, I=E2=80=99m interested to see how the rust ecosystem progresses=
, and
> I wait with baited breath for something to emerge that=E2=80=99s better t=
han
> C/C++, but today, I don=E2=80=99t think rust applications in OpenBMC would
> have my support.

I think the arguments for/against Rust usage in OpenBMC are pretty
different to those for host firmware - I'm hoping to spend some time
better getting a PoC up for our firmware stack at some point in the
future though.


--=20
Stewart Smith
OPAL Architect, IBM.
