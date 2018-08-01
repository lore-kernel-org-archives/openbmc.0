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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gLsC3F6BzF10S
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 15:07:27 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7153kMJ055067
 for <openbmc@lists.ozlabs.org>; Wed, 1 Aug 2018 01:07:24 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kk1c0sgnx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Aug 2018 01:07:24 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Tue, 31 Jul 2018 23:07:23 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 31 Jul 2018 23:07:21 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7157Lw38716662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 31 Jul 2018 22:07:21 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEBA6136051;
 Tue, 31 Jul 2018 23:07:20 -0600 (MDT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6EFF13604F;
 Tue, 31 Jul 2018 23:07:20 -0600 (MDT)
Received: from birb.localdomain (unknown [9.185.142.68])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 31 Jul 2018 23:07:20 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id DD5184EC629; Wed,  1 Aug 2018 15:07:17 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Jeremy Kerr <jk@ozlabs.org>, Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Virtual Media
In-Reply-To: <01caa0f0-5aaa-2fe1-a03c-a27d4b765cca@ozlabs.org>
References: <69abb9a05c7d01b71cd4a69f3e7c548e@linux.vnet.ibm.com>
 <eb74222a-737f-92cb-66a3-8d023b5962dc@ozlabs.org>
 <20180731180257.GJ105329@mauery>
 <e1b784dc-3434-cfda-a07b-3a065458fef0@ozlabs.org>
 <87wotag1yi.fsf@linux.vnet.ibm.com>
 <01caa0f0-5aaa-2fe1-a03c-a27d4b765cca@ozlabs.org>
Date: Wed, 01 Aug 2018 15:07:17 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18080105-0016-0000-0000-00000910A1B0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009465; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01068702; UDB=6.00549429; IPR=6.00846968; 
 MB=3.00022432; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-01 05:07:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18080105-0017-0000-0000-00003FD56409
Message-Id: <87r2jifzei.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-01_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1808010054
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2018 05:07:28 -0000

Jeremy Kerr <jk@ozlabs.org> writes:
> Hi Stewart,
>
>>> Yes, I'd agree there. As above, I'm not sure how much this would be
>>> used. The one use-case I can imagine is a small writeable filesystem for
>>> saving debug logs (in our case, from petitboot). However, we also have
>>> actual host network available at that point...
>> 
>> zmodem over the terminal right to the browser!
>
> The browser still can't write to the local filesystem :P

But you can download the file and save it, which would solve the debug
log problem.

-- 
Stewart Smith
OPAL Architect, IBM.
