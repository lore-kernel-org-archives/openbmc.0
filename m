Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vBdld3Q9kzDqB6
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 16:50:21 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0U5mZRF131142
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 00:50:17 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 289y2srw6v-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 00:50:17 -0500
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Sun, 29 Jan 2017 22:50:16 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 29 Jan 2017 22:50:13 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 97FD419D801C;
 Sun, 29 Jan 2017 22:49:27 -0700 (MST)
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0U5nuUZ10224026; Sun, 29 Jan 2017 22:50:12 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4853136043;
 Sun, 29 Jan 2017 22:50:12 -0700 (MST)
Received: from birb.localdomain (unknown [9.185.16.210])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 46A4713603C;
 Sun, 29 Jan 2017 22:50:12 -0700 (MST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id C4502229DB26; Mon, 30 Jan 2017 16:50:10 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 "Anton D. Kachalov" <mouse@yandex-team.ru>
Cc: "openbmc\@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Image Management
In-Reply-To: <1EDA4FEC-68CD-4215-AB90-3F087EEF3CA6@linux.vnet.ibm.com>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <101001485427397@webcorp03h.yandex-team.ru>
 <1EDA4FEC-68CD-4215-AB90-3F087EEF3CA6@linux.vnet.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/25.1.1
 (x86_64-redhat-linux-gnu)
Date: Mon, 30 Jan 2017 16:50:10 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17013005-8235-0000-0000-00000AD333EB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006523; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00814588; UDB=6.00397586; IPR=6.00592029; 
 BA=6.00005097; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014100; XFM=3.00000011;
 UTC=2017-01-30 05:50:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17013005-8236-0000-0000-000039275257
Message-Id: <87lgttw0z1.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-30_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
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
X-List-Received-Date: Mon, 30 Jan 2017 05:50:22 -0000

Adriana Kobylak <anoo@linux.vnet.ibm.com> writes:
>>> PNOR:
>>> * Ability to =E2=80=98patch=E2=80=99 by copying a Hostboot image *.bin =
into a designated directory (/usr/local/ for example).
>>=20
>> Would it be good to add support for opkg-based packaging to incrementall=
y (hotfix) system's update? I use it in OpenWRT.
>
> It is a good point, for this we=E2=80=99d need a read-write filesystem to
> contain the code, and be more formal in updating the revision number
> in bitbake for the images (currently is set to 0). But since our
> current use case is about applying temporary (development) patches,
> not permanent fixes, these changes wouldn=E2=80=99t be a priority at the
> moment. Also for PNOR images, we don=E2=80=99t own the packaging process =
(it=E2=80=99s
> done by the hostboot build).

Err... actually by op-build ( https://github.com/open-power/op-build/  )
- and that's *only* for POWER.

--=20
Stewart Smith
OPAL Architect, IBM.
