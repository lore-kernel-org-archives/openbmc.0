Return-Path: <benh@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNMK65ksvzDrLf
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 17:35:06 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v737Z3hW044555
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 03:35:03 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c3r5ameak-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Aug 2017 03:35:03 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Thu, 3 Aug 2017 17:34:07 +1000
Received: from d23relay06.au.ibm.com (202.81.31.225)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 17:34:05 +1000
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v737Y4hw18153640
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 17:34:04 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v737Y4xo012725
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 17:34:04 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v737Y4I0012720; Thu, 3 Aug 2017 17:34:04 +1000
Received: from pasglop (unknown [9.192.176.176])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D8827A0098;
 Thu,  3 Aug 2017 17:34:03 +1000 (AEST)
Subject: Re: REST API docs
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Thu, 03 Aug 2017 17:34:02 +1000
In-Reply-To: <20170803061356.GI14987@asimov>
References: <87y3r3ooyv.fsf@linux.vnet.ibm.com>
 <20170801212832.GC14987@asimov> <87bmnymoz2.fsf@linux.vnet.ibm.com>
 <20170802130148.GF14987@asimov> <1501719587.2664.15.camel@au1.ibm.com>
 <20170803061356.GI14987@asimov>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.4 (3.24.4-1.fc26) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17080307-0008-0000-0000-000001527343
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080307-0009-0000-0000-000009841382
Message-Id: <1501745642.2664.37.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030116
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
X-List-Received-Date: Thu, 03 Aug 2017 07:35:07 -0000

On Thu, 2017-08-03 at 01:13 -0500, Patrick Williams wrote:
> > You cannot change an API in a backward compatible way and keep the doc
> > documenting the old/wrong way in the repo. That's just plain wrong.
> > 
> > Ben.
> > 
> 
> Fair enough.  I honestly though calling this entire code stream 1.99.x
> was sufficient "hear be dragons" to prevent people from coding to things
> unless they speak up.  

Haha, yeah well ... I think you should at least delete the docs or move
them to a "deprecated" directory or something when you break what they
document.

It's understandable that you may not have the bandwidth to update all
the docs right away (though in OPAL at least we tend to push for
requiring docs in the commit with with the feature change these days),
but it would help to make it clear that those docs aren't to be
trusted.

> We've been actively engaging the teams that we
> knew were affected by all of our API changes, and we were not aware of
> this one.  The teams we keep informed outside of the direct development
> community are: openbmc test-automation team, xCAT, and the GUI
> development team.

Engaging with team is great but you can't always know everybody who's
looking at or playing with your stuff.

> I will make sure we go through the docs repository soon and clearly point
> out everything that is deprecated in the 1.99.x code stream as such.

Yup, or at least move the whole thing to a "deprecated-needs-update"
directory until you had a chance to do the filtering. Maybe a toplevel
"WARNING" file with a one-liner about the domain change.

Cheers,
Ben.
