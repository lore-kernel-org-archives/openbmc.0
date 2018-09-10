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
 by lists.ozlabs.org (Postfix) with ESMTPS id 427zJT2n5XzF35t
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 16:52:57 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8A6mu33059836
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 02:52:54 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2mdedgaxag-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 02:52:54 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Mon, 10 Sep 2018 00:52:53 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 10 Sep 2018 00:52:51 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w8A6qoVb43516034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 9 Sep 2018 23:52:50 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AECFA7805F;
 Mon, 10 Sep 2018 00:52:50 -0600 (MDT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7653B7805E;
 Mon, 10 Sep 2018 00:52:50 -0600 (MDT)
Received: from birb.localdomain (unknown [9.185.142.23])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 10 Sep 2018 00:52:50 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id C3DE74EC914; Mon, 10 Sep 2018 16:52:46 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Ed Tanous <ed.tanous@intel.com>, openbmc@lists.ozlabs.org
Subject: Re: SOL Logging
In-Reply-To: <3d11886a-a3c7-37a0-f836-1f1eb64b1a46@intel.com>
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
 <8ec90e03-10ed-a052-7a0b-328d7c6cde64@yadro.com>
 <CABzWfrmvR=qHQBgi8m6m5Zp0wGDc2--AcY1ZTTp+WfiC8cFFKg@mail.gmail.com>
 <CAJoAoZnqL2yy3aYWqvL-FRxLtpcjuyAhFOER5ZSd=WAA9LmJfg@mail.gmail.com>
 <3d11886a-a3c7-37a0-f836-1f1eb64b1a46@intel.com>
Date: Mon, 10 Sep 2018 16:52:46 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18091006-0004-0000-0000-000014870A34
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009694; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01086157; UDB=6.00560759; IPR=6.00866168; 
 MB=3.00023206; MTD=3.00000008; XFM=3.00000015; UTC=2018-09-10 06:52:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18091006-0005-0000-0000-000088C23214
Message-Id: <87r2i1u9mp.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-10_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=893 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1809100075
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
X-List-Received-Date: Mon, 10 Sep 2018 06:52:57 -0000

Ed Tanous <ed.tanous@intel.com> writes:
> On 09/04/2018 05:07 PM, Emily Shaffer wrote:
>> I wonder if there's a different and more useful way we can provide the 
>> console scrollback. Thinking about this, it's not just a GUI issue, 
>> right - we deliver our console over TCP to a client elsewhere and would 
>> have the same dedupe issues if we needed to start providing backlog.  
>
> Correct, this isn't _just_ a webui issue.  It happens on all the 
> available interfaces (SSH, HTML5, and obmc-console-client)
>
>> Speaking with almost no experience implementing server-side sockets, is 
>> it possible for us to keep that ring buffer in the console socket as well?
>
> obmc-console already keeps a ring-buffer style log of all the previous 
> characters.  The easiest to implement answer, which is probably good 
> enough for most cases, would be to simply make obmc-console barf up the 
> saved console log ring buffer when any new client connects.  This will 
> have problems if your control characters have run off the end of the 
> buffer, and the console would appear to quickly replay your last X 
> characters worth of interactions, which isn't desired.
>
> I could also imagine a case where this isn't the desired behavior if 
> you're using automation to interact with SSH/SOL, so it might need to be 
> selectable by the client or have some kind of reasonable workaround.

Yeah, if we got some random amount of previous console text over IPMI
SoL or SSH host console, I can imagine that all my CI scripts would
pretty spectacularly blow up.

For the Web UI though, I can see that keeping something like a tmux
session would be good though.
-- 
Stewart Smith
OPAL Architect, IBM.
