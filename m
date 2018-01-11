Return-Path: <benh@au1.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=benh@au1.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHKWS0Y0wzF0Yf
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 19:57:07 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0B8thh1014388
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 03:57:05 -0500
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fe1gtqutp-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 03:57:05 -0500
Received: from localhost
 by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Thu, 11 Jan 2018 08:57:02 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 11 Jan 2018 08:56:56 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0B8uukB44105872; Thu, 11 Jan 2018 08:56:56 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60F4111C04A;
 Thu, 11 Jan 2018 08:50:46 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E02611C04C;
 Thu, 11 Jan 2018 08:50:46 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Jan 2018 08:50:46 +0000 (GMT)
Received: from pasglop (unknown [9.192.178.161])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 503DCA01C7;
 Thu, 11 Jan 2018 19:56:53 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.10 0/6] Add support PECI and PECI hwmon drivers
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Greg KH <gregkh@linuxfoundation.org>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, jdelvare@suse.com,
 linux@roeck-us.net, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@intel.com>
Date: Thu, 11 Jan 2018 19:56:51 +1100
In-Reply-To: <20180111073038.GA3600@kroah.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180110101755.GA5822@kroah.com>
 <006c4a95-9299-bd17-6dec-52578e8461ae@linux.intel.com>
 <20180110191703.GA20248@kroah.com>
 <8997e43c-683e-418d-4e2b-1fe3fefe254e@linux.intel.com>
 <20180110202740.GA27703@kroah.com>
 <e81095ff-d491-9977-25e6-7ba6d28d5e72@linux.intel.com>
 <20180111073038.GA3600@kroah.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.3 (3.26.3-1.fc27) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18011108-0012-0000-0000-000005A277F2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18011108-0013-0000-0000-0000191DDA83
Message-Id: <1515661011.31850.27.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-11_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801110125
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jan 2018 08:57:08 -0000

On Thu, 2018-01-11 at 08:30 +0100, Greg KH wrote:
> 4.13?  Why that kernel?  It too is obsolete and insecure and
> unsupported.

Haha, it's n-1. come on :-)


> What keeps you all from just always tracking the latest tree from Linus?
> What is in your tree that is not upstream that requires you to have a
> kernel tree at all?

There are a couple of ARM based SoC families for which we are in the
process of rewriting all the driver in upstreamable form. This takes
time.

To respond to your other email about the USB CDC, it's mine, I haven't
resubmited it yet because it had a dependency on some the aspeed clk
driver to function properly (so is unusable without it) and it took 2
kernel versions to get that clk stuff upstream for a number of reasons.

So it's all getting upstream and eventually there will be (we hope) no
"OpenBMC" kernel, it's just a way for us to get functional code with
non-upstream-quality (read: vendor) drivers until we are one rewriting
& upstreaming them all.

> And if you do have out-of-tree code, why not use a process that makes it
> trivial to update the base kernel version so that you can keep up to
> date very easily?  (hint, just using 'git' is not a good way to do
> this...)

Joel and I both find git perfectly fine for that. I've not touched
quilt in eons and frankly don't regret it ;-)

That said, Jae should definitely submit a driver against upstream, not
against some random OpenBMC tree.

Jae, for example when I submitted the original USB stuff back then, I
did it from a local upstream based branch (with just a few hacks to
work around the lack of the clk stuff).

I will rebase it in the next few days to upstream merged with Stephen's
clk tree to get the finally merged clk stuff, verify it works, and
submit patches against upstream.

There should be no mention of dev-4.10 or 4.13 on lkml or other
upstream submission lists. Development work should happen upstream
*first* and eventually be backported to our older kernels while they
exist (hopefully I prefer if we are more aggressive at forward porting
the crappy drivers so we can keep our tree more up to date but that's a
different discussion).

Cheers,
Ben.

> thanks,
> 
> greg k-h
