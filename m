Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVrCg0yWhzDqnh
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 13:38:22 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0U2cKxl056107
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 21:38:20 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ftdjfmwhf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 21:38:19 -0500
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 29 Jan 2018 21:38:18 -0500
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 29 Jan 2018 21:38:16 -0500
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0U2cGT941812056; Tue, 30 Jan 2018 02:38:16 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDE54124035;
 Mon, 29 Jan 2018 21:35:04 -0500 (EST)
Received: from birb.localdomain (unknown [9.81.201.128])
 by b01ledav002.gho.pok.ibm.com (Postfix) with SMTP id 03353124037;
 Mon, 29 Jan 2018 21:35:03 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 34FA74F0DAB; Tue, 30 Jan 2018 13:38:12 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Removing Barreleye, Firestone, Garrison
In-Reply-To: <CACPK8XfKMTv+=LJbdoMDOOkQ4izwqq81=vHmM-Z8x6GZ6FyqGA@mail.gmail.com>
References: <CACPK8XfKMTv+=LJbdoMDOOkQ4izwqq81=vHmM-Z8x6GZ6FyqGA@mail.gmail.com>
Date: Tue, 30 Jan 2018 13:38:12 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18013002-0008-0000-0000-000002C8F6AB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008451; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00982315; UDB=6.00498088; IPR=6.00761597; 
 BA=6.00005799; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019278; XFM=3.00000015;
 UTC=2018-01-30 02:38:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18013002-0009-0000-0000-000038160243
Message-Id: <87a7ww136z.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801300030
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jan 2018 02:38:23 -0000

Joel Stanley <joel@jms.id.au> writes:
> I am working on ensuring the boards that we build for are working with
> the dev-4.13 kernel branch. Currently Barreleye, Firestone and
> Garrison systems fail as there has not been a device tree forward
> ported.
>
> Is there an interest in maintaining these platforms?
>
> If not, I will remove them from CI on Friday to unblock the kernel work.
>
> This does not stop someone re-enabling them in the near future should
> interest arise. However, I suggest we create a policy on removing
> abandoned machines when there is no one actively maintaining them, and
> we use this to delete machines once they reach the agreed criteria.

From a primarily consumer of OpenBMC perspective, I think it's okay to
remove them. Booting the host on Firestone/Garrison with OpenBMC has
always been somewhat sketchy.

-- 
Stewart Smith
OPAL Architect, IBM.
