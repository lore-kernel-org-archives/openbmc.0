Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zh4gP6jvMzDr2T
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 14:30:57 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1E3UWLG066720
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 22:30:55 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2g46s7cp2f-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 22:30:54 -0500
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 13 Feb 2018 22:30:53 -0500
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 13 Feb 2018 22:30:52 -0500
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1E3UqnT46989336; Wed, 14 Feb 2018 03:30:52 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04252B2050;
 Tue, 13 Feb 2018 22:27:46 -0500 (EST)
Received: from birb.localdomain (unknown [9.81.201.129])
 by b01ledav003.gho.pok.ibm.com (Postfix) with SMTP id 02171B2046;
 Tue, 13 Feb 2018 22:27:44 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id B7A074EC64C; Wed, 14 Feb 2018 14:30:47 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Patrick Venture <venture@google.com>,
 Alexander Amelkin <a.amelkin@yadro.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Proprietary task references in commit logs
In-Reply-To: <CAO=notw8DrRUP7MiFmDcQ9jqypeFqs6xmwXxPYt_jPf+dtP0DQ@mail.gmail.com>
References: <560ecebf-d449-b7e7-675b-03ec3c6f4212@yadro.com>
 <CAO=notw8DrRUP7MiFmDcQ9jqypeFqs6xmwXxPYt_jPf+dtP0DQ@mail.gmail.com>
Date: Wed, 14 Feb 2018 14:30:47 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18021403-0036-0000-0000-000002BDD228
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008530; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000253; SDB=6.00989410; UDB=6.00502393; IPR=6.00768764; 
 BA=6.00005827; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019541; XFM=3.00000015;
 UTC=2018-02-14 03:30:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18021403-0037-0000-0000-00004353AC4A
Message-Id: <87o9ksfdso.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-14_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802140037
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
X-List-Received-Date: Wed, 14 Feb 2018 03:30:58 -0000

Patrick Venture <venture@google.com> writes:
> Alexander;
>
> So, we've been in a similar boat, in that we have a Google-Bug-Id in
> all our commits.  However, for openbmc we've been trimming them out.
> I think part of the argument is to keep the commit message clean, or
> if necessary file a corresponding bug in the openbmc bug track, and
> then close that bug id.

I've been poked at this for other firmware too, and I tend to dislike
non-public bug tracker IDs in public repositories.

I have an idea of using git-notes to have a local tree of `fixes` (even
added retroactively) that could then be queried/modified that would suit
this kind of use case.

Of course, finding enough time to write the couple of hundred lines of
python to do that has been elusive :)

-- 
Stewart Smith
OPAL Architect, IBM.
