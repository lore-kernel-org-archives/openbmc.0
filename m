Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVrkQ272zzDrCf
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 14:01:34 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0U2xURG039941
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 22:01:31 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ftdcbwvc4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 22:01:31 -0500
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 29 Jan 2018 22:01:30 -0500
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 29 Jan 2018 22:01:28 -0500
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0U31So739125120; Tue, 30 Jan 2018 03:01:28 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADE5EAC03A;
 Mon, 29 Jan 2018 22:02:46 -0500 (EST)
Received: from birb.localdomain (unknown [9.81.201.128])
 by b01ledav006.gho.pok.ibm.com (Postfix) with SMTP id E3E1EAC051;
 Mon, 29 Jan 2018 22:02:45 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 018184F0DAB; Tue, 30 Jan 2018 14:01:23 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC 1/29 community telecon - Call for Topics
In-Reply-To: <6DB8F483-15F5-407D-8150-DC66F5E00C53@fuzziesquirrel.com>
References: <9330D13C-79E8-4C49-BBEA-EAB55E9C5974@fuzziesquirrel.com>
 <7F891E7C-D7BE-46B8-AE07-3A900334A6F2@fuzziesquirrel.com>
 <6DB8F483-15F5-407D-8150-DC66F5E00C53@fuzziesquirrel.com>
Date: Tue, 30 Jan 2018 14:01:22 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 18013003-0052-0000-0000-000002AB6DE3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008451; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00982323; UDB=6.00498093; IPR=6.00761605; 
 BA=6.00005799; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019278; XFM=3.00000015;
 UTC=2018-01-30 03:01:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18013003-0053-0000-0000-00005367EA98
Message-Id: <874ln4124d.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801300037
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
X-List-Received-Date: Tue, 30 Jan 2018 03:01:34 -0000

Brad Bishop <bradleyb@fuzziesquirrel.com> writes:
> I=E2=80=99d like to talk about how OpenBMC might support systems with BMC=
 redundancy.
> Please join to discuss if that is interesting to you.

Interesting!

Considering in a past life I worked on high availability clustered
databases, I may be able to contribute some design/design review around
some of these parts.

--=20
Stewart Smith
OPAL Architect, IBM.
