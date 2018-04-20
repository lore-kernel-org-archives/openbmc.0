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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40S6sR0PD1zF259
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 17:28:26 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3K7PYve088151
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 03:28:24 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2hf8028ydd-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 03:28:24 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Fri, 20 Apr 2018 01:28:23 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 20 Apr 2018 01:28:21 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3K7SK305439912; Fri, 20 Apr 2018 00:28:20 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81A67C6042;
 Fri, 20 Apr 2018 01:28:20 -0600 (MDT)
Received: from birb.localdomain (unknown [9.102.50.46])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with SMTP id D5538C603C;
 Fri, 20 Apr 2018 01:28:19 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 2D8524EC649; Fri, 20 Apr 2018 17:28:18 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Fwd: Migration to new gerrit server is coming
In-Reply-To: <CALLMt=qZkG1e2dnJm9EfVpjotq-myc5RAY2OHVxoxLNdHiYoCQ@mail.gmail.com>
References: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
 <CALLMt=omgN_yj6GjEaKRwWaKp4wKR++6cx3+NHixNi7YMHBm6g@mail.gmail.com>
 <CALLMt=qZkG1e2dnJm9EfVpjotq-myc5RAY2OHVxoxLNdHiYoCQ@mail.gmail.com>
Date: Fri, 20 Apr 2018 17:28:18 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18042007-0016-0000-0000-0000089189A1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008887; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01020547; UDB=6.00520737; IPR=6.00799784; 
 MB=3.00020678; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-20 07:28:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18042007-0017-0000-0000-00003E559F94
Message-Id: <87in8mfib1.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-20_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804200075
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
X-List-Received-Date: Fri, 20 Apr 2018 07:28:27 -0000

Andrew Geissler <geissonator@gmail.com> writes:
> All righty, migration complete.  I did a variety of tests and things
> look ok to me.  Let me know if you run into anything.
>
> You'll probably get a "WARNING: POSSIBLE DNS SPOOFING DETECTED!"
> message but that's because we moved the IP :)  So just run the
> provided command to delete the key and get a new one.

It looks as though mail is now being rewritten by some SMTP server in
the way, I'm getting things like this:

> Jenkins has posted comments on this change. (
> https://u7284519.ct.sendgrid.net/wf/click?upn=N3bMtLYoQvnDsGxa5TuMrF8I5vlKaubPrsMlut73dkiMe82YTw9KXaZCckvzT-2FCe_kmqSwegD0GEk3FSxKpQbnEqNaV14xOGAsyeeoKUjpYz4XOpLVYolUFBsX3kdZzInsioR4TGTr6qhQI81lP2rA9eMn4gNcLclCczCmXX1k7PhcrEZX1R2kTzcr-2BLFR7cn-2BUe8LnTznhxeWjnKpdgXnzH6L4NdvgjjmZrAl0Kr3osAIZJEiVHJf2cFlABQGZC4JS8wisPDTEIlQxGh5UYhjjIYg7VNIPRYT6hMnCNmJIY-3D
> )

It could quite legitimately be IBM being stupid with email (again), but
could this be because of the migration?

-- 
Stewart Smith
OPAL Architect, IBM.
