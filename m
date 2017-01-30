Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vBdrl09S2zDqB6
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 16:54:46 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0U5rYd4140524
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 00:54:44 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 289y2ss0kq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 00:54:44 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Sun, 29 Jan 2017 22:54:43 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 29 Jan 2017 22:54:42 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 3900919D801C
 for <openbmc@lists.ozlabs.org>; Sun, 29 Jan 2017 22:53:57 -0700 (MST)
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0U5sgMJ12059120; Sun, 29 Jan 2017 22:54:42 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 566A1C6043;
 Sun, 29 Jan 2017 22:54:42 -0700 (MST)
Received: from birb.localdomain (unknown [9.185.16.210])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id DD4F0C6037;
 Sun, 29 Jan 2017 22:54:41 -0700 (MST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 25296229DB26; Mon, 30 Jan 2017 16:54:40 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: OpenBMC Image Management
In-Reply-To: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/25.1.1
 (x86_64-redhat-linux-gnu)
Date: Mon, 30 Jan 2017 16:54:40 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17013005-0004-0000-0000-0000116BCDB1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006523; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00814589; UDB=6.00397586; IPR=6.00592031; 
 BA=6.00005096; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014100; XFM=3.00000011;
 UTC=2017-01-30 05:54:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17013005-0005-0000-0000-00007C991C2B
Message-Id: <87fuk1w0rj.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-30_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701300064
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
X-List-Received-Date: Mon, 30 Jan 2017 05:54:47 -0000

Adriana Kobylak <anoo@linux.vnet.ibm.com> writes:
> BMC:
> *Save multiple firmware versions, starting with 2, to provide the
> ability to roll-back if needed. If single BMC chip system, save both
> versions there. If two BMC chip system, save other version in 2nd
> chip.

two pnor chip or two bmc chips?

with this, is there a mitiigation for downgrade attacks?

> * Implement various levels of =E2=80=98persistency=E2=80=99, such as dev,=
 factory,
> field. Dev persistency would allow for local patches (/usr/local/ for
> example) that can be cleared before shipping to customers. Factory
> mode could delete the location where user data such as network
> settings resides but preserves the mac address and uuid for
> example. Etc.

patches to what?

--=20
Stewart Smith
OPAL Architect, IBM.
