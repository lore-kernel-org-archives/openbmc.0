Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404hKx3XPdzF1kC
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 03:27:16 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2JGPXK4012070
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 12:27:14 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2gtern65hg-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 12:27:13 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 19 Mar 2018 12:27:13 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 19 Mar 2018 12:27:10 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2JGRAVo50462808; Mon, 19 Mar 2018 16:27:10 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F02412403F;
 Mon, 19 Mar 2018 13:29:20 -0400 (EDT)
Received: from birb.localdomain (unknown [9.85.174.149])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id CBF6A124035;
 Mon, 19 Mar 2018 13:29:19 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 90C814EC62A; Mon, 19 Mar 2018 09:27:07 -0700 (PDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Emily Shaffer <emilyshaffer@google.com>,
 Tom Joseph <tomjose@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Bradley W Bishop <bradleyb@us.ibm.com>
Subject: Re: IPMI SOL performance
In-Reply-To: <CAJoAoZnqH=C6Nd-XLtZE=4+AcfFQg53B0GYeTWM_03KJCQEo1w@mail.gmail.com>
References: <f34018a7-be64-9a2b-befd-632747234fd0@linux.vnet.ibm.com>
 <eb3ad4a5-d261-adaa-1782-b7cf77fc7267@linux.vnet.ibm.com>
 <CAJoAoZnqH=C6Nd-XLtZE=4+AcfFQg53B0GYeTWM_03KJCQEo1w@mail.gmail.com>
Date: Mon, 19 Mar 2018 09:27:07 -0700
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18031916-0024-0000-0000-00000338F6CE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008703; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01005384; UDB=6.00511826; IPR=6.00784667; 
 MB=3.00020127; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-19 16:27:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031916-0025-0000-0000-00004760A987
Message-Id: <87y3iokp44.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-19_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803190184
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2018 16:27:18 -0000

Emily Shaffer <emilyshaffer@google.com> writes:
>> Is it a possibility to just increase the petitboot timeout? Do you have an
> idea of how much we are missing it by?

Worst case (may be different currently due to improvements in ipmi
stack) was about 10-15 minutes.

We have different issues on the SSH console though, we can end up
dropping chunks of console output under load (BMC CPU load or high
console usage).

I think Jeremy can relive the trauma of heading into the TTY layer, but
I wonder if the solution here has something to do with having a
end-to-end flow control story.

-- 
Stewart Smith
OPAL Architect, IBM.
