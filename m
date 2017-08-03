Return-Path: <benh@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNMG40d7gzDr57
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 17:32:27 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v737VM38137333
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 03:32:26 -0400
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c3wyad2mu-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Aug 2017 03:32:25 -0400
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Thu, 3 Aug 2017 17:32:23 +1000
Received: from d23relay09.au.ibm.com (202.81.31.228)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 17:32:22 +1000
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v737WD2m22872212
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 17:32:21 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v737Vn5I026291
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 17:31:49 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v737VnpI025833; Thu, 3 Aug 2017 17:31:49 +1000
Received: from pasglop (unknown [9.192.176.176])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7CF7CA0098;
 Thu,  3 Aug 2017 17:31:24 +1000 (AEST)
Subject: Re: REST API docs
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Thu, 03 Aug 2017 17:31:23 +1000
In-Reply-To: <20170803060844.GH14987@asimov>
References: <87y3r3ooyv.fsf@linux.vnet.ibm.com>
 <20170801212832.GC14987@asimov> <87bmnymoz2.fsf@linux.vnet.ibm.com>
 <20170802130148.GF14987@asimov> <1501719746.2664.16.camel@au1.ibm.com>
 <20170803060844.GH14987@asimov>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.4 (3.24.4-1.fc26) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17080307-1617-0000-0000-000001F9AE95
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080307-1618-0000-0000-00004843B7E5
Message-Id: <1501745483.2664.35.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030115
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
X-List-Received-Date: Thu, 03 Aug 2017 07:32:28 -0000

On Thu, 2017-08-03 at 01:08 -0500, Patrick Williams wrote:
> 
> Do you have any guidelines to help me out here on what is significant
> enough to write a better "announcement" of and how detailed it needs to
> be?  I'm obviously failing and I don't have any clear advise other than
> "this is a particular instance when we wanted to know more details."
> 
> What Stewart does for skiboot is great and I respect the effort he puts
> into these:
> 
>    * https://lists.ozlabs.org/pipermail/skiboot/2017-July/008067.html
> 
> What he does here, to the best of my reading, is to write a paragraph
> for nearly each commit sequence he merges.  Again, this is great.  I do
> not have the availability to do this.  If someone would like to help
> out, I'm all for it.

What might work better is to maintain some kind of wiki with the
highlights, or at least the stuff that can have a significant usability
impact, so people get used to go there.

For example, everybody's hitting obcmutil poweroff vs. chassisoff,
so that would be a good candidate to have up the top there.

> I will warn that we have on the order of 150 commits per 2 week sprint
> spread across about two dozen repositories.  This would be a pretty
> significant undertaking for anyone.

Ben.
