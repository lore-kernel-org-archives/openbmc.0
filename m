Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHfxg0RHdzF0cj
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 09:02:30 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0BM2BSf094365
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 17:02:28 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2feaq3ggmg-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 17:02:28 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 11 Jan 2018 15:02:27 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Jan 2018 15:02:26 -0700
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0BM2QSw4850098; Thu, 11 Jan 2018 15:02:26 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42322136043;
 Thu, 11 Jan 2018 15:02:26 -0700 (MST)
Received: from birb.localdomain (unknown [9.102.33.102])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with SMTP id 9625F136040;
 Thu, 11 Jan 2018 15:02:25 -0700 (MST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id D5B3C4EC5EE; Fri, 12 Jan 2018 09:02:21 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Michael.E.Brown@dell.com, openbmc@lists.ozlabs.org
Subject: Re: CLA discussion - James Bottomley's blog post today
In-Reply-To: <1515656775418.74165@Dell.com>
References: <1515656775418.74165@Dell.com>
Date: Fri, 12 Jan 2018 09:02:21 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18011122-0004-0000-0000-000013815F8F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008362; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000245; SDB=6.00973631; UDB=6.00493349; IPR=6.00753576; 
 BA=6.00005773; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018985; XFM=3.00000015;
 UTC=2018-01-11 22:02:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18011122-0005-0000-0000-0000859F7A5B
Message-Id: <87mv1km4uq.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801110294
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
X-List-Received-Date: Thu, 11 Jan 2018 22:02:31 -0000

Michael.E.Brown@dell.com writes:
> https://blog.hansenpartnership.com/gpl-as-the-best-licence-governance-and-philosophy/
>
>
> A very timely article from James Bottomley!? He addresses CLAs and
> provides a very compelling argument against them, rooted in equity.
>
> "Further, the IP rights tend to be a focus for corporations, so simply
> joining the controlling entity (or taking a licence from it) instead
> of actually contributing to the project can become an end goal, thus
> weakening the technical contributions to the project and breaking the
> link with end users."

One of the big arguments is that it increases the amount of work you
have to go through to contribute to a project.

It's probably the same for you, but if for us, if there's a CLA you have
to sign, you get to go speak with legal. *NOBODY* wants to go speak with legal.

> Is there a danger of this happening on this project?

I would dearly hope not. A number of us would actively fight it.

-- 
Stewart Smith
OPAL Architect, IBM.
