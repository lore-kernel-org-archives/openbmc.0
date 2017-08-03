Return-Path: <benh@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xN9g05ld8zDr2n
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 10:19:56 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v730JJaa125710
 for <openbmc@lists.ozlabs.org>; Wed, 2 Aug 2017 20:19:54 -0400
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c3qmw3and-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 20:19:54 -0400
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Thu, 3 Aug 2017 10:19:52 +1000
Received: from d23relay08.au.ibm.com (202.81.31.227)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 10:19:50 +1000
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v730Jo1p28442628
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 10:19:50 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v730JfIw002269
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 10:19:41 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v730Jf7m002266; Thu, 3 Aug 2017 10:19:41 +1000
Received: from pasglop (unknown [9.192.176.176])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 72364A01E5;
 Thu,  3 Aug 2017 10:19:49 +1000 (AEST)
Subject: Re: REST API docs
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Patrick Williams <patrick@stwcx.xyz>, Stewart Smith
 <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 03 Aug 2017 10:19:47 +1000
In-Reply-To: <20170802130148.GF14987@asimov>
References: <87y3r3ooyv.fsf@linux.vnet.ibm.com>
 <20170801212832.GC14987@asimov> <87bmnymoz2.fsf@linux.vnet.ibm.com>
 <20170802130148.GF14987@asimov>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.4 (3.24.4-1.fc26) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17080300-0016-0000-0000-0000025F676E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080300-0017-0000-0000-000006E0E5B0
Message-Id: <1501719587.2664.15.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-02_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030003
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Aug 2017 00:19:57 -0000

On Wed, 2017-08-02 at 08:01 -0500, Patrick Williams wrote:
> 
> Generally speaking, docs are for stable releases, aren't they? 

Certainly not !

You cannot change an API in a backward compatible way and keep the doc
documenting the old/wrong way in the repo. That's just plain wrong.

Ben.
