Return-Path: <benh@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xN9lW6FcrzDr2g
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 10:23:51 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v730KbWB072268
 for <openbmc@lists.ozlabs.org>; Wed, 2 Aug 2017 20:23:49 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c3q1m4y0w-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 20:23:49 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Thu, 3 Aug 2017 10:23:47 +1000
Received: from d23relay09.au.ibm.com (202.81.31.228)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 10:23:45 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v730MT4q28835986
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 10:22:29 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v730MKLO001314
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 10:22:20 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v730MK9c001311; Thu, 3 Aug 2017 10:22:20 +1000
Received: from pasglop (unknown [9.192.176.176])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D1615A01E5;
 Thu,  3 Aug 2017 10:22:28 +1000 (AEST)
Subject: Re: REST API docs
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Patrick Williams <patrick@stwcx.xyz>, Stewart Smith
 <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 03 Aug 2017 10:22:26 +1000
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
x-cbid: 17080300-0040-0000-0000-0000034C5CDC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080300-0041-0000-0000-00000CC8F4C1
Message-Id: <1501719746.2664.16.camel@au1.ibm.com>
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
X-List-Received-Date: Thu, 03 Aug 2017 00:23:52 -0000

On Wed, 2017-08-02 at 08:01 -0500, Patrick Williams wrote:
> he documentation should be updated.  As I said, I've been
> pointing out new interfaces being available (with an implementation) in
> tag messages.  There are on the order of 500 commits going in every
> month.  It really isn't possible for me to know which ones someone on
> the mailing list might be interested in.
> 
> As we've said since the beginning of the 2.0 stream, all work is being
> tracked on github.  You can see every feature being worked on and see
> exactly when it closes due to the code being merged.  I get that Linux
> has amazing announcements and wikis for each release, like
> kernelnewbies, but those aren't done by Linus himself and I certainly
> don't have the bandwidth do it.

Nobody has the bandwidth.

What you are saying is "if you use the project, you have to read and
track every commit message for breadcrumbs of documentation because we
aren't goin to keep the docs up to date".

This is just wrong and impossible for your users.

Ben.
