Return-Path: <jrey@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 441z666P3DzDqTT
 for <openbmc@lists.ozlabs.org>; Sun, 17 Feb 2019 05:23:42 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1GINUHv040383
 for <openbmc@lists.ozlabs.org>; Sat, 16 Feb 2019 13:23:39 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qpfg2xr5h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 16 Feb 2019 13:23:39 -0500
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Sat, 16 Feb 2019 18:23:38 -0000
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 16 Feb 2019 18:23:35 -0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1GINYqb25231432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 16 Feb 2019 18:23:34 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5B9128064;
 Sat, 16 Feb 2019 18:23:34 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C94B28059;
 Sat, 16 Feb 2019 18:23:34 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 16 Feb 2019 18:23:34 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 16 Feb 2019 12:30:29 -0600
From: Joseph Reynolds <jrey@linux.ibm.com>
To: krtaylor <kurt.r.taylor@gmail.com>
Cc: openbmc@lists.ozlabs.org, openbmc
 <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Subject: Re: 2.6 Release announcement - doc versioning
In-Reply-To: <06f35a3e-2d73-f973-8a45-fd38282fd1ed@gmail.com>
References: <06f35a3e-2d73-f973-8a45-fd38282fd1ed@gmail.com>
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19021618-2213-0000-0000-00000353138B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010609; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000280; SDB=6.01161991; UDB=6.00606598; IPR=6.00942555; 
 MB=3.00025616; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-16 18:23:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021618-2214-0000-0000-00005D60A729
Message-Id: <1b0f40f7d9a1729eca21d4c655476895@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-16_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902160137
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
X-List-Received-Date: Sat, 16 Feb 2019 18:23:43 -0000

On 2019-02-15 12:44, krtaylor wrote:
> I have not been successful (yet) in trying to get access to our
> openbmc.org website for adding things like announcements. So, I
> created a quick release announcement on my personal blog to spread the
> great news about all the hard work that went into this release!

Thanks Kurt.  It looks great!

I got a question from someone who was looking for docs for the 2.6.0 
release and for the earlier v2.3 release.  They went to the 
[REST-cheatsheet][] and found guidance which had already been updated 
for the planned 2.7 release.  So they were confused and frustrated 
because this interface had an incompatible change (to its authentication 
method).  I pointed them into the document history.

Going forward, what is the plan for documentation versioning?  We should 
have a way for someone to get the documentation for a specific release 
level, for example, to get the docs that apply to the 2.6.0 release.  
This will become more important as we add new features and make 
incompatible changes to existing interfaces.  Should the openbmc/docs 
repository have the same branching or tagging as the other openbmc 
repos?  Then someone can just checkout that version.

- Joseph

[REST-cheatsheet]: 
https://github.com/openbmc/docs/blob/master/REST-cheatsheet.md

...snip...
> Kurt Taylor (krtaylor)
