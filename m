Return-Path: <stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40HLZq6RRhzF1r1
 for <openbmc@lists.ozlabs.org>; Fri,  6 Apr 2018 10:45:23 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w360iMJC014028
 for <openbmc@lists.ozlabs.org>; Thu, 5 Apr 2018 20:45:21 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2h5wchab90-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Apr 2018 20:45:20 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Thu, 5 Apr 2018 18:45:19 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Apr 2018 18:45:16 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w360jGBl11927968; Thu, 5 Apr 2018 17:45:16 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B35F7804D;
 Thu,  5 Apr 2018 18:45:16 -0600 (MDT)
Received: from birb.localdomain (unknown [9.185.142.88])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id B2CCB78051;
 Thu,  5 Apr 2018 18:45:15 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 0DD074EC648; Fri,  6 Apr 2018 10:45:11 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, tomjose@linux.vnet.ibm.com,
 vernon.mauery@linux.intel.com, emilyshaffer@google.com, a.amelkin@yadro.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Mapping IPMI boot device selector to D-Bbus properties
In-Reply-To: <e1297b05-25f0-3d74-1d03-92c26df4810a@linux.vnet.ibm.com>
References: <e1297b05-25f0-3d74-1d03-92c26df4810a@linux.vnet.ibm.com>
Date: Fri, 06 Apr 2018 10:45:11 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18040600-0004-0000-0000-000013E8E779
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008811; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000256; SDB=6.01013699; UDB=6.00516731; IPR=6.00792959; 
 MB=3.00020440; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-06 00:45:18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18040600-0005-0000-0000-000086C3405F
Message-Id: <87zi2hmaco.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-04-05_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804060006
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
X-List-Received-Date: Fri, 06 Apr 2018 00:45:24 -0000

Deepak Kodihalli <dkodihal@linux.vnet.ibm.com> writes:
> We recently discovered an issue in the way the IPMI boot device selector 
> (represented by a nibble in the boot flags) is mapped to the D-Bus
> model.

for anyone playing at home, this was caught by op-test:

git clone https://github.com/open-power/op-test-framework.git
cd op-test-framework
./op-test <insert auth details here> --run testcases.OpTestInbandIPMI.SkirootFullInbandIPMI.test_chassis_bootdev

and this test does pass on other BMC IPMI implementations (such as AMI).

Although the exact failure was only really an accident of the test
rather than on purpose.

A happy accident at least as it means we found a bug :)

> In the IPMI spec the boot device selector has options for both "boot 
> source" (default/disk/crdom/network) and "boot mode" 
> (default/bios/safe/diag). Since this isn't a bit-filed, you can't 
> override for eg both the source and mode at the same time. It's probably 
> debatable to say whether such a possibility is desirable or not (for eg 
> I may want to set the boot source as network by default, but want to 
> boot to safe mode the next boot , and revert back to network for 
> subsequent boots without having to set the device again).
>
> There are different D-Bus interfaces depicting the boot mode [1] and 
> boot source [2] though. So when the IPMI boot device is changed, the 
> ipmid code sets a relevant boot mode or source property. It's possible 
> that both can get set when someone for eg sets the device to cdrom and 
> then to bios. The issue is how should ipmid respond to a get boot 
> options command - there's no way for ipmid to aggregate information from 
> both D-Bus properties as in the IPMI spec only one of them can be 
> represented. Today ipmid always favors the boot source property if both 
> are set [3]. That's not what a user expects though, because the user 
> would expect his last override to go through.
>
> The solution I'm proposing is that if a set boot device is mapping to a 
> boot source, then reset the boot mode D-Bus property to default, or vice 
> versa. This way the ipmid code can determine which property is not at 
> the default value. It doesn't break the behavior from an IPMI spec 
> perspective because only one can be set at a point of time anyway, and 
> we'll consume the latest override to the boot device. Other solutions or 
> thoughts?

Do we know the behaviour of other IPMI implementations? My *guess* would
be is that they only track one bit of information and the boot mode will
override the previous request for boot source.

Perhaps the correct behaviour is to reset the temporary boot source when
boot mode is set and vice versa? It kind-of seems like that's the intent
from reading the IPMI spec, but I'd appreciate input and being proven
wrong :)

-- 
Stewart Smith
OPAL Architect, IBM.
