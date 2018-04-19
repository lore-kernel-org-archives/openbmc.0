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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Rvbw4GmMzF20W
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 09:01:00 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3JMx4Dg007302
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 19:00:57 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2hf42vgnct-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 19:00:57 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Thu, 19 Apr 2018 19:00:56 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 19 Apr 2018 19:00:53 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3JN0rNw3801368; Thu, 19 Apr 2018 23:00:53 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75E8928041;
 Thu, 19 Apr 2018 19:00:16 -0400 (EDT)
Received: from birb.localdomain (unknown [9.102.50.46])
 by b01ledav001.gho.pok.ibm.com (Postfix) with SMTP id AC2782803F;
 Thu, 19 Apr 2018 19:00:15 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 9AA6F4EC649; Fri, 20 Apr 2018 09:00:47 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC v2.2
In-Reply-To: <8E4514F2-2842-487D-B727-2C2D17FFAE7A@fuzziesquirrel.com>
References: <8E4514F2-2842-487D-B727-2C2D17FFAE7A@fuzziesquirrel.com>
Date: Fri, 20 Apr 2018 09:00:47 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 18041923-0044-0000-0000-000004081513
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008885; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01020377; UDB=6.00520637; IPR=6.00799615; 
 MB=3.00020673; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-19 23:00:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041923-0045-0000-0000-0000083A1B8C
Message-Id: <87k1t2hkdc.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-19_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804190205
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
X-List-Received-Date: Thu, 19 Apr 2018 23:01:01 -0000

Brad Bishop <bradleyb@fuzziesquirrel.com> writes:
> There has been lots of cool work in the last couple months and we=E2=80=
=99ve been
> reasonably stable with Yocto 2.4 and Linux 4.13 for some time now so lets
> have a tag!

I echo that feeling - I've been building and running with openbmc master
as of whatever stage it's in at 8am each morning for a while, and
legitimately only hit one decent problem (okay, that was the bmc
bricking itself, no idea why yet because having BMC serial would be
useful, so of course I don't have it).

Thanks to everyone for the efforts in making things more stable.

--=20
Stewart Smith
OPAL Architect, IBM.
