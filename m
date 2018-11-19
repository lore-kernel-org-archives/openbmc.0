Return-Path: <stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42yyZL1n7GzF3PQ
 for <openbmc@lists.ozlabs.org>; Mon, 19 Nov 2018 16:48:58 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAJ5muhi078849
 for <openbmc@lists.ozlabs.org>; Mon, 19 Nov 2018 00:48:56 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2numr9nj1p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Nov 2018 00:48:50 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Mon, 19 Nov 2018 05:48:49 -0000
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 19 Nov 2018 05:48:45 -0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wAJ5migI29360270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 19 Nov 2018 05:48:44 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B7622805C;
 Mon, 19 Nov 2018 05:48:44 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 585792805A;
 Mon, 19 Nov 2018 05:48:44 +0000 (GMT)
Received: from birb.localdomain (unknown [9.185.142.44])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 19 Nov 2018 05:48:44 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 063BB4EC69F; Mon, 19 Nov 2018 16:48:43 +1100 (AEDT)
From: Stewart Smith <stewart@linux.ibm.com>
To: Sai Dasari <sdasari@fb.com>, Oskar Senft <osk@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "bradleyb\@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "gmills\@linux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>
Subject: Re: Submit board schematics to OpenBMC docs repo
In-Reply-To: <2A161BFC-87CF-4FE9-9DC5-FF1712EE955C@fb.com>
References: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
 <BA3510D9-333A-40DB-9D03-43A5A2B2D963@fb.com>
 <CABoTLcTpMY4StimKijR4LmuSuc0dnnfxeTN=hv13WYghsOFcSw@mail.gmail.com>
 <2A161BFC-87CF-4FE9-9DC5-FF1712EE955C@fb.com>
Date: Mon, 19 Nov 2018 16:48:42 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 18111905-0060-0000-0000-000002D50631
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010077; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01119557; UDB=6.00580869; IPR=6.00899679; 
 MB=3.00024223; MTD=3.00000008; XFM=3.00000015; UTC=2018-11-19 05:48:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18111905-0061-0000-0000-0000473E2937
Message-Id: <87ftvxpqh1.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-19_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1811190055
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2018 05:48:58 -0000

Sai Dasari <sdasari@fb.com> writes:
> I guess this is a question of # of small repos vs a single large repo wit=
h a lot of "stuff" in it. I generally prefer fewer (yet larger) repos vs. t=
he overhead of managing multiple small repos.
> May be an example would clarify for my suggestion of embedding details wi=
th the machine. I was referring to having =E2=80=98witherspooon=E2=80=99 sc=
hematics along with the machine layer @ https://github.com/openbmc/openbmc/=
tree/master/meta-ibm/meta-witherspoon. This will provide context for how th=
is machine witherspoon is designed with all the details.(hypothetical assum=
ing  witherspoon schematics can be shared in open)

Your mail client appears broken and is failing to quote replies correctly.

--=20
Stewart Smith
OPAL Architect, IBM.
