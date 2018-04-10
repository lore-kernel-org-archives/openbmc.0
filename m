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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40KsKj0l4bzDr3t
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 12:57:44 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3A2s33H034653
 for <openbmc@lists.ozlabs.org>; Mon, 9 Apr 2018 22:57:42 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2h8jpkv9n4-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Apr 2018 22:57:42 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Mon, 9 Apr 2018 22:57:41 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 9 Apr 2018 22:57:38 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3A2vcml58130526; Tue, 10 Apr 2018 02:57:38 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 942A3B2050;
 Mon,  9 Apr 2018 23:59:44 -0400 (EDT)
Received: from birb.localdomain (unknown [9.102.45.79])
 by b01ledav003.gho.pok.ibm.com (Postfix) with SMTP id 8F287B2046;
 Mon,  9 Apr 2018 23:59:43 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 8902A4EC648; Tue, 10 Apr 2018 12:57:33 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, tomjose@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
Subject: Re: Attention users of network IPMI
In-Reply-To: <4333c25f-d5bb-e4b8-f6c4-62deb53362a1@linux.vnet.ibm.com>
References: <d58f47d2-310c-f6cb-1ef0-6f7cae9bf7c0@linux.vnet.ibm.com>
 <4333c25f-d5bb-e4b8-f6c4-62deb53362a1@linux.vnet.ibm.com>
Date: Tue, 10 Apr 2018 12:57:33 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 18041002-0036-0000-0000-000002DEA3F4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008827; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000256; SDB=6.01015661; UDB=6.00517889; IPR=6.00794912; 
 MB=3.00020493; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-10 02:57:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041002-0037-0000-0000-000043ECFCCC
Message-Id: <87in8zn4yq.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-09_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804100029
X-Mailman-Approved-At: Tue, 10 Apr 2018 13:48:16 +1000
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
X-List-Received-Date: Tue, 10 Apr 2018 02:57:45 -0000

Deepak Kodihalli <dkodihal@linux.vnet.ibm.com> writes:
> On 29/03/18 2:53 pm, Tom Joseph wrote:
>> Hello,
>>=20
>> Based on=C2=A0 feedback from the team writing management scripts for Ope=
nBMC.=20
>> There is a suggestion to
>> support the "-U" parameter when running the IPMI over network, to keep=20
>> the script consistent across
>> multiple BMC implementations.
>>=20
>> The support currently in=C2=A0 OpenBMC for the IPMI user accounts is the=
=20
>> nameless account and the -U option
>> is not needed and only the -P option is needed. With the proposed=20
>> change, "-U admin" is needed, for the
>
> This would break current users based on a nameless account. So I suppose=
=20
> that you'd have to still support a nameless account.

For current OpenPOWER systems, it's only IBM FSP machines and OpenBMC
that have a nameless account. Both SuperMicro and AMI BMCs require
usernames, so any scripts targetting OpenPOWER systems need to deal with
both situations.

But maintaining backwards compatibility with existing openbmc ipmi
implementations is also a good thing.

--=20
Stewart Smith
OPAL Architect, IBM.
