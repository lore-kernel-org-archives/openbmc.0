Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vBdnX0WYLzDqB6
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 16:51:59 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0U5maVq013107
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 00:51:58 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 289sqwsee9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 00:51:57 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 30 Jan 2017 00:51:56 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 30 Jan 2017 00:51:55 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id BB40738C8039;
 Mon, 30 Jan 2017 00:51:55 -0500 (EST)
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0U5psS012321150; Mon, 30 Jan 2017 05:51:54 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FE2F2803D;
 Mon, 30 Jan 2017 00:51:54 -0500 (EST)
Received: from birb.localdomain (unknown [9.185.16.210])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 1CED72803A;
 Mon, 30 Jan 2017 00:51:54 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 701F9229DB26; Mon, 30 Jan 2017 16:51:52 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: "Anton D. Kachalov" <mouse@yandex-team.ru>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 "openbmc\@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Image Management
In-Reply-To: <101001485427397@webcorp03h.yandex-team.ru>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <101001485427397@webcorp03h.yandex-team.ru>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/25.1.1
 (x86_64-redhat-linux-gnu)
Date: Mon, 30 Jan 2017 16:51:52 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17013005-0056-0000-0000-0000029B6356
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006523; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00814588; UDB=6.00397586; IPR=6.00592030; 
 BA=6.00005097; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014100; XFM=3.00000011;
 UTC=2017-01-30 05:51:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17013005-0057-0000-0000-000006D0684C
Message-Id: <87inoxw0w7.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-30_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=18
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701300063
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jan 2017 05:52:00 -0000

"Anton D. Kachalov" <mouse@yandex-team.ru> writes:
>> PNOR:
>> * Ability to =E2=80=98patch=E2=80=99 by copying a Hostboot image *.bin i=
nto a designated directory (/usr/local/ for example).
>
> Would it be good to add support for opkg-based packaging to
> incrementally (hotfix) system's update? I use it in OpenWRT.

Since discovering dm-verity, I've hoped that one day the BMC would use
it to verify what it's running, and have no executable code on other
partitions. i.e. everything running on BMC and host has been
cryptographically verified.

I imagine that using opkg based packaging or something else similar
would put a spanner in the works of using dm-verity?

--=20
Stewart Smith
OPAL Architect, IBM.
