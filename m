Return-Path: <stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44KQck5R39zDqKv
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 08:55:18 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2DLrS9u092503
 for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2019 17:55:15 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r7738r9ca-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2019 17:55:15 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Wed, 13 Mar 2019 21:55:14 -0000
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 13 Mar 2019 21:55:10 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2DLt9kg25100398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Mar 2019 21:55:09 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 629C7AC06C;
 Wed, 13 Mar 2019 21:55:09 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B809AC062;
 Wed, 13 Mar 2019 21:55:08 +0000 (GMT)
Received: from birb.localdomain (unknown [9.81.208.163])
 by b01ledav006.gho.pok.ibm.com (Postfix) with SMTP;
 Wed, 13 Mar 2019 21:55:08 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id B58804EC639; Thu, 14 Mar 2019 08:55:06 +1100 (AEDT)
From: Stewart Smith <stewart@linux.ibm.com>
To: Lei YU <mine260309@gmail.com>, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: "openbmc\@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Static code analysis tool for openbmc
In-Reply-To: <CAARXrt=knVzKw8HeiRi=XzZy322Sw12sevrWdgnuK82YHm1kiQ@mail.gmail.com>
References: <de550e08-2338-9438-6021-b2b6ef130bdd@linux.vnet.ibm.com>
 <CAARXrt=knVzKw8HeiRi=XzZy322Sw12sevrWdgnuK82YHm1kiQ@mail.gmail.com>
Date: Thu, 14 Mar 2019 08:55:06 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19031321-0068-0000-0000-000003A5282F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010752; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01173943; UDB=6.00613826; IPR=6.00954607; 
 MB=3.00025967; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-13 21:55:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19031321-0069-0000-0000-000047CF494A
Message-Id: <87lg1i4eyt.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-13_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903130149
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
X-List-Received-Date: Wed, 13 Mar 2019 21:55:19 -0000

Lei YU <mine260309@gmail.com> writes:
> On Wed, Mar 13, 2019 at 6:15 PM Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:
>> Is there any plan to use any static code analysis tool in openbmc? I
>
> In Jenkins job, we have cppcheck to do checks on the code.
>
>> find one of the tool which is good and used in multiple opensource
>> projects is "coverity".
>
> I would prefer clang static analyzer, but other tools like coverity is also
> welcome.
> And if possible, there is much stronger analyzer PVS-Studio Analyzer (need
> license though). I read [PVS-Studio's blog][1] and that tool is really really
> good.
>
> But I think the main question is, what to do with issues found by the static
> analyzer? We need to define some rule to fix or ignore the issues.

In my experience with host firmware on OpenPOWER, each tool gets a
different set of things that it catches. Even the humble sparse catches
things that other tools do not (notably endian screw-ups).

A big advantage of Coverity is the tooling around it, the web site where
you can mark things permanently as a false positive, assign things to
people, etc. For other tools that you just run in a jenkins job, it's
way too easy to not see things grow, or just have a large list of false
positives you get used to ignoring.

-- 
Stewart Smith
OPAL Architect, IBM.
