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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42KP7g2vy8zDr8p
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 00:47:55 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8PEiKGS142637
 for <openbmc@lists.ozlabs.org>; Tue, 25 Sep 2018 10:47:53 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2mqmtcfmsu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 25 Sep 2018 10:47:52 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Tue, 25 Sep 2018 08:47:52 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Sep 2018 08:47:49 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w8PElmK645482206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 25 Sep 2018 07:47:48 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4AA8C6055;
 Tue, 25 Sep 2018 08:47:48 -0600 (MDT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84AC0C6057;
 Tue, 25 Sep 2018 08:47:48 -0600 (MDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 Sep 2018 08:47:48 -0600 (MDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 25 Sep 2018 09:48:40 -0500
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous, Ed"
 <ed.tanous@intel.com>
Subject: Re: c++ phosphor-objmgr
In-Reply-To: <CAO=notyQzzzq_dyNQZuSJagBn56Z4gjaz6JmOKvAGo_J_f--YA@mail.gmail.com>
References: <CAO=notyQzzzq_dyNQZuSJagBn56Z4gjaz6JmOKvAGo_J_f--YA@mail.gmail.com>
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18092514-0016-0000-0000-000009347ACE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009769; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000267; SDB=6.01093472; UDB=6.00565164; IPR=6.00873510; 
 MB=3.00023498; MTD=3.00000008; XFM=3.00000015; UTC=2018-09-25 14:47:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18092514-0017-0000-0000-0000407A6DF0
Message-Id: <79ca417dc0a70233baf3036f0414e837@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-25_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1809250148
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
X-List-Received-Date: Tue, 25 Sep 2018 14:47:59 -0000

On 2018-09-25 09:30, Patrick Venture wrote:
> I see a lot of open patches
> https://gerrit.openbmc-project.xyz/q/project:openbmc%252Fphosphor-objmgr,
> and I was curious, are they things I should dig into for reviewing,
> what is the general status of the c++ mapper?
> 
> Patrick


I'm making a push to get Ed's implementation working and into the tree 
to completely
replace the python mapper.  It's working now, with the exception of on 
our
system it has some performance problems and fails horribly with timeouts 
between 10 to
40% of the time, which I haven't gotten to the bottom of yet, though I 
plan to soon.

The switchover should be transparent to its users, except for 1 change 
in behavior:
It will now throw exceptions on the methods where both a path and an 
interface are
passed in, and the path exists but the interface does not, where before 
it would just
return an empty results list.  I would consider this to be a bug fix.

By all means, review anything you want.
