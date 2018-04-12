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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40M8gL6r87zDrDT
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 15:32:30 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3C5TUtR002089
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 01:32:26 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ha044akts-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 01:32:26 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Thu, 12 Apr 2018 01:32:25 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 12 Apr 2018 01:32:24 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3C5WNxR54919388; Thu, 12 Apr 2018 05:32:23 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 172AC28041;
 Thu, 12 Apr 2018 01:31:47 -0400 (EDT)
Received: from birb.localdomain (unknown [9.102.48.110])
 by b01ledav001.gho.pok.ibm.com (Postfix) with SMTP id 0D8452803A;
 Thu, 12 Apr 2018 01:31:45 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 061024EC648; Thu, 12 Apr 2018 15:32:18 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org,
 Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: Parse PELs sent by OpenPOWER host firmware
In-Reply-To: <4467ab37-c09e-c09c-306c-3447c651bf7f@yadro.com>
References: <2815fac8-3a1f-d2ed-3c3d-ca7072de9db2@linux.vnet.ibm.com>
 <87vadzo5lj.fsf@linux.vnet.ibm.com>
 <4467ab37-c09e-c09c-306c-3447c651bf7f@yadro.com>
Date: Thu, 12 Apr 2018 15:32:17 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18041205-0024-0000-0000-000003454411
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008841; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000256; SDB=6.01016672; UDB=6.00518490; IPR=6.00795909; 
 MB=3.00020530; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-12 05:32:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041205-0025-0000-0000-000047A0CBA2
Message-Id: <877epdj8gu.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-12_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804120056
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
X-List-Received-Date: Thu, 12 Apr 2018 05:32:31 -0000

Alexander Amelkin <a.amelkin@yadro.com> writes:
> 14.03.2018 03:36, Stewart Smith wrote:
>> Deepak Kodihalli <dkodihal@linux.vnet.ibm.com> writes:
>>> The SELs/eSELs (System Event Log) that OpenBMC receives from 
>>> hostboot/skiboot today are not interpreted, and are dumped as-is in a 
>>> property of the error log D-Bus object. This means that if there's a PEL 
>>> (Platform Event Log) hidden in the eSEL, admins/users of the error log 
>>> need to depend on external tools to parse the PEL to human readable
>>> text.
>> My lack of love for PELs is probably fairly well known, but even if we
>> replace them down the line, I think there's opportunity here for making
>> things better for users (including myself).
>
> Just my 2 cents. The IPMI-standardized SELs are good first of all
> because of IPMI-standardized PEFs and PETs.
>
> Being able to decode the OEM SEL records is not just convenient for the
> users, but will also let them easily attach PEFs to such events if they
> want to. That's of course when PEFs are supported in OpenBMC which is
> currently not true, AFAIK.
>
> As a maintainer of ipmitool I can promise to promptly include the
> OpenPOWER event record decoder into ipmitool upstream code. All I need
> is the information on how to decode those events. So far I'm planning to
> try and deduce this information from hostboot and opal sources.

(Adding in Tim from Raptor as we were talking about this yesterday)

There's opal-elog-parse, which is part of ppc64-diag, and there's
https://github.com/open-power/libopalevents which is a quite
bitrotted attempt to turn parsing it into a shared library rather than
just a binary.

there's also a (internal but in the process of being open sourced)
implementation called 'errl' which is what has shipped on IBM FSP
systems forever (but that for whatever reason we ended up doing
opal-elog-parse rather than open sourcing it back in 2014).

From hostboot, ./src/build/debug/eSEL.pl is the script that extracts
things from the BMC IIRC.

Now, there *is* a spec for the Platfrom Error Log format, which I have
previously tried to get out into the open... so I encourage you to find
all your IBM contacts and bug them about it.

That being said, I'm not convinced PEL is the right thing to continue to
exist. It's Yet Another Custom Binary Format, and there's probably
enough of those in the world as it is.

-- 
Stewart Smith
OPAL Architect, IBM.
