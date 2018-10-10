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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VPDR1KvTzDrWW
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 17:23:18 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9A6Enj6048383
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 02:23:16 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2n17jr0u27-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 02:23:16 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Wed, 10 Oct 2018 00:23:15 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Oct 2018 00:23:13 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w9A6NC2b27000922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Oct 2018 23:23:12 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B86AD6A047;
 Wed, 10 Oct 2018 00:23:12 -0600 (MDT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1761C6A051;
 Wed, 10 Oct 2018 00:23:12 -0600 (MDT)
Received: from birb.localdomain (unknown [9.81.205.182])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with SMTP;
 Wed, 10 Oct 2018 00:23:11 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id B50374EC627; Wed, 10 Oct 2018 17:23:07 +1100 (AEDT)
From: Stewart Smith <stewart@linux.ibm.com>
To: Emily Shaffer <emilyshaffer@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Community Code of Conduct
In-Reply-To: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
References: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
Date: Wed, 10 Oct 2018 17:23:07 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18101006-0036-0000-0000-00000A47C4F1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009852; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000268; SDB=6.01100489; UDB=6.00569383; IPR=6.00880537; 
 MB=3.00023689; MTD=3.00000008; XFM=3.00000015; UTC=2018-10-10 06:23:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18101006-0037-0000-0000-0000493B9188
Message-Id: <87va6ab9ro.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-10_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=883 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810100063
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
X-List-Received-Date: Wed, 10 Oct 2018 06:23:19 -0000

Emily Shaffer <emilyshaffer@google.com> writes:
> Hi all,
>
> As I briefly mentioned at the end of Brad's presentation today, I'd like to
> propose adding and enforcing a code of conduct for us to follow.
>
> For now, I am planning to grab a copy of the Linux CoC and put it up for
> review in /docs. If anybody has a different CoC source to suggest, I'd be
> happy to discuss.
>
> Brad asked me whether I had seen an issue so far and I had not, so please
> don't take this email as some kind of retaliation - it's not. I think we've
> got a great, positive community and as we grow I'd like to preserve that
> culture, and the code of conduct is a great way to do so.

Now's the time to do it. Taking an existing one is likely a really good
idea as no doubt corporations are about to start looking at these along
with contributor agreements and licensing before engaging in a project.

-- 
Stewart Smith
OPAL Architect, IBM.
