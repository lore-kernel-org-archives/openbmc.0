Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400lmr2FqZzDr8B
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 17:48:27 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2D6hsP6087743
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 02:48:25 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gp2xdbxbp-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 02:48:24 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 13 Mar 2018 00:48:23 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 13 Mar 2018 00:48:21 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2D6mLnO11534686; Mon, 12 Mar 2018 23:48:21 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40CEE6A03B;
 Tue, 13 Mar 2018 00:48:21 -0600 (MDT)
Received: from birb.localdomain (unknown [9.185.142.116])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id C79E36A03D;
 Tue, 13 Mar 2018 00:48:20 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 4B0504EC62A; Tue, 13 Mar 2018 17:48:19 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Rob Lippert <rlippert@google.com>
Cc: "Tanous\, Ed" <ed.tanous@intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Venture <venture@google.com>,
 "Mohit Gupta \(QDT\)" <guptam@qti.qualcomm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Exposing POST codes
In-Reply-To: <CAFRv3ww59TrnRBWAKZu4LEc5V2iaSW03MEZQgQw6Yrymqt9Meg@mail.gmail.com>
References: <CAO=notzv-4wn7J+uAzPYw1uWzTiN5jOGqHNEDUAzAGS+j5wivQ@mail.gmail.com>
 <DEC5C953-385A-4118-AEC5-D2BFDEA29469@fuzziesquirrel.com>
 <7E9441B1E5EFFD4681F54958E82169932F669996@ORSMSX114.amr.corp.intel.com>
 <87efkyf1xw.fsf@linux.vnet.ibm.com>
 <CAFRv3ww59TrnRBWAKZu4LEc5V2iaSW03MEZQgQw6Yrymqt9Meg@mail.gmail.com>
Date: Tue, 13 Mar 2018 17:48:19 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18031306-0024-0000-0000-000018123D94
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008664; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01002317; UDB=6.00510000; IPR=6.00781648; 
 MB=3.00020003; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-13 06:48:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031306-0025-0000-0000-00004F14757B
Message-Id: <87y3iwo4i4.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-13_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803130084
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
X-List-Received-Date: Tue, 13 Mar 2018 06:48:28 -0000

Rob Lippert <rlippert@google.com> writes:
> I implemented port 80h POST codes for POWER9 hostboot a while back:
> https://github.com/open-power/hostboot/blob/c93bef31ae6ce781f9e0a11bb9224b6728ff120f/src/usr/initservice/istepdispatcher/istepdispatcher.C#L2312
>
> On Zaius machines we are using that support with Patrick's snoop daemon and
> a separate daemon that receives the code via dbus and outputs it over the
> front 7seg debug display.
> It has proven useful for getting early error/debug reports from technicians
> at scale e.g. "5 machines stopped at code 35h, 2 at 72h" provides a quick
> overview of what the problems are for me to debug further (since I have the
> decoder ring, and the istep names would be useless to them anyways).

Neat!

Anything we should add to skiboot or petitboot environment for this? Or
do we not fail in IPL enough to warrant it?

-- 
Stewart Smith
OPAL Architect, IBM.
